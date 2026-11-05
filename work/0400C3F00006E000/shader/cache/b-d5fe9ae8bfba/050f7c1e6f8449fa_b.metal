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
    float4 m_88 [[user(locn1)]];
    float4 m_100 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_59 [[user(locn13)]];
    float4 m_104 [[user(locn14)]];
    float4 m_84 [[user(locn15)]];
    float4 m_106 [[user(locn16)]];
    float4 m_98 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_90 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_70 [[attribute(3)]];
    float4 m_74 [[attribute(4)]];
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
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3293 = false;
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
    float _139 = as_type<float>(_127);
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
        float _3610 = as_type<float>(_149);
        out.gl_Position.z = _3610;
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
    if (_171)
    {
        float _177 = _175 * 5.0;
        _151 = as_type<int>(_177);
    }
    int _179 = _151;
    float _181 = _131 * _173;
    out.m_59.x = _163;
    float _183 = _181;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3675 = as_type<float>(_179);
        out.gl_Position.z = _3675;
    }
    out.m_53.x = _181;
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
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_217;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _189 * _195;
    float _231 = _189 * _201;
    float _233 = fma(_187, _193, _229);
    float _235 = _189 * _207;
    float _237 = fma(_187, _199, _231);
    float _239 = fma(_191, _197, _233);
    float _241 = fma(_187, _205, _235);
    float _243 = fma(_191, _203, _237);
    float _245 = fma(_191, _209, _241);
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
        _263 = _181;
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
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -_283;
    float _299 = _297 + 1.0;
    float _301 = in.m_72.x;
    float _303 = in.m_72.y;
    bool _305 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_267);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = 1.0 / _291;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _321 = 1.0 / _295;
    float _323 = _271 * _317;
    bool _325 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_267);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = _335 * _299;
    float _347 = -_335;
    float _349 = _347 + 1.0;
    float _351 = _287 * _321;
    float _353 = fma(_339, _323, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = fma(_343, _323, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _357 = _315 * _349;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = -_315;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _371 = _353 * _357;
    float _373 = _355 * _357;
    float _375 = fma(_361, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = fma(_369, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _379 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _383 = fma(_375, _345, _379);
    float _385 = fma(_377, _345, _381);
    float _387 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _389 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].y, _385);
    float _391 = _387 * _301;
    float _393 = _389 * _303;
    bool _395 = !_319;
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
        _411 = _181;
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
    float _461 = _447 * _451;
    float _463 = -_447;
    float _465 = _463 + 1.0;
    float _467 = _419 * _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _469;
    float _473 = fma(_455, _467, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = fma(_471, _467, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _481 = _473 * _461;
    float _483 = fma(_477, _467, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _485 = _479 * _461;
    float _487 = _483 * _461;
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _491 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _493 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _495 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].x, _489);
    float _497 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].y, _491);
    float _499 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].z, _493);
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
        _517 = _181;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _525 = _521 + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _541 = isnan(_521);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _529;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _557 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _559 = isnan(_521);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _571 = 1.0 / _537;
    float _573 = _533 * _551;
    bool _575 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _577 = isnan(_521);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _555;
    float _589 = -_549;
    float _591 = _589 + 1.0;
    float _593 = fma(_573, _525, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _599 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _601 = isnan(_521);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = _585 * _591;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _621 = 1.0 / _597;
    float _623 = -_609;
    float _625 = _623 + 1.0;
    float _627 = _567 * _613;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _629;
    float _633 = _619 * _571;
    float _635 = _549 * _625;
    float _637 = _593 * _627;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _521 + _639;
    float _643 = -_567;
    float _645 = _643 + 1.0;
    bool _647 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _649 = isnan(_521);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _631 * _587;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _667 = _521 + _665;
    float _669 = fma(_633, _641, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _671 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[115].x, _637);
    float _673 = -_657;
    float _675 = _673 + 1.0;
    float _677 = _663 * _621;
    float _679 = fma(_659, _667, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _521 + _681;
    float _685 = fma(_669, _615, _671);
    float _687 = _609 * _675;
    float _689 = fma(_677, _683, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _691 = fma(_679, _635, _685);
    float _693 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _695 = fma(_689, _687, _691);
    float _697 = _495 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _699 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _703 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[119].x, _695);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _709 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _715 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _703 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _725 = !_569;
    if (!_725)
    {
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _729 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _183 = _739;
    }
    float _741 = _183;
    float _743 = in.m_48.x;
    float _745 = in.m_48.y;
    float _747 = in.m_48.z;
    float _749 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _751 = log2(_749);
    float _753 = _163 * 2.0;
    bool _755 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _763 = _759 || _761;
    float _765 = in.m_57.y;
    float _767 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _769 = in.m_68.w;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _773 = int(_771);
    float _775 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _777 = in.m_66.w;
    float _779 = in.m_70.w;
    float _781 = floor(_753);
    float _783 = _751 * _131;
    float _785 = _201 * _745;
    float _787 = _207 * _745;
    float _789 = in.m_57.z;
    float _791 = _195 * _745;
    float _793 = fma(_199, _743, _785);
    float _795 = fma(_205, _743, _787);
    float _797 = exp2(_783);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _801 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _803 = fma(_193, _743, _791);
    float _805 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _807 = fma(_801, -2.0, _799);
    float _809 = fma(_197, _747, _803);
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _815 = int(_813);
    float _817 = fma(_209, _747, _795);
    bool _819 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _821 = isnan(1.0);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _827 = _823 || _825;
    float _829 = -_811;
    float _831 = fma(_805, 2.0, _829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _835 = 1.0 + _833;
    float _837 = _163 + _765;
    float _839 = float(_773);
    float _841 = _765 * 2.0;
    bool _843 = _781 > 0.0;
    float _845 = _765 + _789;
    bool _847 = _781 >= 0.0;
    bool _849 = isnan(_781);
    bool _851 = _847 || _849;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    float _857 = 1.0 / _835;
    float _859 = _837 + (-1.0);
    float _861 = _845 + (-1.0);
    float _863 = fma(_203, _747, _793);
    float _865 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _867 = 1.0 / _839;
    float _869 = _789 * 2.0;
    float _871 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = -_797;
    float _875 = _873 + 1.0;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _879 = float(_815);
    float _881 = -_131;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[76].x, _831);
    float _885 = floor(_841);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _889 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _877);
    float _891 = _763 ? _875 : 0.0;
    float _893 = _879 * _131;
    float _895 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _887);
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _899 = _897 != 0;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _907 = _905 != 0;
    float _909 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _807);
    float _911 = floor(_869);
    float _913 = _867 * _131;
    float _915 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _895);
    float _917 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _889);
    if (_827)
    {
        float _919 = _891 * _857;
        _141 = _919;
    }
    float _921 = _141;
    int _923 = _855 ? 0 : 1;
    float _925 = _863 + _769;
    bool _927 = !_903;
    int _929 = _927 ? 0 : 1;
    float _931 = _809 + _777;
    bool _933 = _885 > 0.0;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _937 = _925 + _935;
    bool _939 = _885 >= 0.0;
    bool _941 = isnan(_885);
    bool _943 = _939 || _941;
    bool _945 = isnan(0.0);
    bool _947 = _943 || _945;
    float _949 = _817 + _779;
    bool _951 = !_899;
    int _953 = _951 ? 0 : 1;
    bool _955 = !_907;
    int _957 = _955 ? 0 : 1;
    bool _959 = _911 >= 0.0;
    bool _961 = isnan(_911);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    int _969 = ~_923;
    int _971 = _969 + 1;
    int _973 = _971 + 1;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _985 = _983 != 0;
    int _987 = _973;
    if (!_843)
    {
        int _989 = ~_923;
        int _991 = _989 + 1;
        _987 = _991;
    }
    int _993 = _987;
    float _995 = in.m_74.x;
    float _997 = in.m_74.y;
    float _999 = in.m_74.z;
    int _1001 = _947 ? 0 : 1;
    bool _1003 = !_981;
    int _1005 = _1003 ? 0 : 1;
    bool _1007 = _911 > 0.0;
    int _1009 = ~_1001;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    int _1015 = abs(_1005);
    bool _1017 = !_977;
    int _1019 = _1017 ? 0 : 1;
    int _1021 = _1013;
    if (!_933)
    {
        int _1023 = ~_1001;
        int _1025 = _1023 + 1;
        _1021 = _1025;
    }
    int _1027 = _1021;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _931 + _1029;
    float _1033 = float(_993);
    float _1035 = _937 * _937;
    int _1037 = _967 ? 0 : 1;
    float _1039 = float(_1015);
    float _1041 = fma(_1031, _1031, _1035);
    int _1043 = abs(_1019);
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1047 = _949 + _1045;
    int _1049 = ~_1037;
    int _1051 = _1049 + 1;
    int _1053 = _1051 + 1;
    float _1055 = _1039 * _1033;
    int _1057 = _1053;
    if (!_1007)
    {
        int _1059 = ~_1037;
        int _1061 = _1059 + 1;
        _1057 = _1061;
    }
    int _1063 = _1057;
    float _1065 = fma(_1047, _1047, _1041);
    float _1067 = _1055 * (-2.0);
    float _1069 = _765 + (-0.5);
    float _1071 = sqrt(_1065);
    float _1073 = float(_1043);
    float _1075 = fma(_1067, _997, _997);
    float _1077 = _163 + _789;
    float _1079 = float(_1063);
    float _1081 = fma(_871, _1067, _871);
    bool _1083 = !_985;
    int _1085 = _1083 ? 0 : 1;
    float _1087 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1075);
    float _1089 = _1077 + (-1.0);
    float _1091 = _1073 * _1079;
    float _1093 = rsqrt(_1065);
    int _1095 = abs(_1085);
    float _1097 = fma(_1081, _921, _1087);
    float _1099 = float(_1027);
    float _1101 = _767 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1103 = float(_1095);
    float _1105 = _1071 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1107 = _1091 * (-2.0);
    float _1109 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1111 = _163 + (-0.5);
    float _1113 = _1103 * _1099;
    float _1115 = precise::min(_1101, _1105);
    float _1117 = fma(_1107, _995, _995);
    float _1119 = fma(_865, _1107, _865);
    float _1121 = _1113 * (-2.0);
    float _1123 = _1097 * 0.15915493667125701904296875;
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1117);
    float _1127 = _1093 * _1115;
    float _1129 = fma(_1109, _1121, _1109);
    float _1131 = fma(_1121, _999, _999);
    float _1133 = _789 + (-0.5);
    float _1135 = _937 * _1127;
    float _1137 = fma(_1119, _921, _1125);
    float _1139 = _1031 * _1127;
    float _1141 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1131);
    float _1143 = -_1135;
    float _1145 = _937 + _1143;
    float _1147 = _1047 * _1127;
    float _1149 = -_1139;
    float _1151 = _1031 + _1149;
    float _1153 = fma(_1129, _921, _1141);
    float _1155 = _1145 * _1145;
    float _1157 = -_1147;
    float _1159 = _1047 + _1157;
    float _1161 = _1137 * 0.15915493667125701904296875;
    float _1163 = _1153 * 0.15915493667125701904296875;
    float _1165 = fma(_1151, _1151, _1155);
    float _1167 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1169 = _925 + _1167;
    float _1171 = _1123 * 6.283185482025146484375;
    float _1173 = sin(_1171);
    float _1175 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1177 = _931 + _1175;
    float _1179 = fma(_1159, _1159, _1165);
    float _1181 = _1169 * _1169;
    float _1183 = sqrt(_1179);
    float _1185 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1187 = fma(_1177, _1177, _1181);
    float _1189 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1191 = _949 + _1189;
    float _1193 = fma(_1191, _1191, _1187);
    float _1195 = _1123 * 6.283185482025146484375;
    float _1197 = cos(_1195);
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _1201 = _1161 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = _1093 * _1183;
    float _1207 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1185);
    float _1209 = _1161 * 6.283185482025146484375;
    float _1211 = sin(_1209);
    float _1213 = _775 * _1205;
    float _1215 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1207);
    float _1217 = _1213 * _1199;
    float _1219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _1221 = _1163 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1203 * _1197;
    float _1227 = _1203 * _1173;
    float _1229 = _767 * _1205;
    float _1231 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1233 = _1231 * 0.5;
    float _1235 = _1229 * _1219;
    float _1237 = _1163 * 6.283185482025146484375;
    float _1239 = sin(_1237);
    float _1241 = _1211 * _1173;
    float _1243 = _1211 * _1197;
    float _1245 = _1203 * _1223;
    float _1247 = sqrt(_1215);
    float _1249 = _1211 * _1223;
    float _1251 = _1197 * _1223;
    float _1253 = _1245 * _1217;
    float _1255 = _1173 * _1223;
    float _1257 = fma(_1239, _1225, _1241);
    float _1259 = -_1227;
    float _1261 = fma(_1239, _1243, _1259);
    float _1263 = -_1243;
    float _1265 = fma(_1239, _1227, _1263);
    float _1267 = -_1217;
    float _1269 = _1239 * _1267;
    float _1271 = fma(_1257, _1235, _1253);
    float _1273 = sqrt(_1193);
    float _1275 = _1249 * _1217;
    float _1277 = fma(_1251, _1235, _1269);
    float _1279 = fma(_1265, _1233, _1271);
    float _1281 = fma(_1239, _1241, _1225);
    float _1283 = fma(_1261, _1235, _1275);
    float _1285 = fma(_1255, _1233, _1277);
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1289 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1291 = fma(_1281, _1233, _1283);
    float _1293 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1295 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1287);
    float _1297 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1289);
    float _1299 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1301 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1295);
    bool _1303 = _1273 < _1293;
    float _1305 = float(_1303);
    float _1307 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1297);
    float _1309 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1299);
    float _1311 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1313 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1309);
    float _1317 = fma(_1311, _1305, _949);
    float _1319 = -_1139;
    float _1321 = _931 + _1319;
    float _1323 = fma(_1313, _1305, _931);
    float _1325 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1329 = _1317 + _1327;
    float _1331 = -_1147;
    float _1333 = _949 + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1337 = _1323 + _1335;
    float _1339 = fma(_1325, _1305, _925);
    float _1341 = _1329 * _1329;
    float _1343 = fma(_1337, _1337, _1341);
    float _1345 = -_1135;
    float _1347 = _925 + _1345;
    float _1349 = sqrt(_1343);
    float _1351 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1351);
    float _1355 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1353);
    bool _1357 = _1349 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1305;
    float _1361 = _1323;
    float _1363 = _1325;
    float _1365 = _1135;
    float _1367 = _1337;
    float _1369 = _1147;
    if (!_1357)
    {
        _1359 = _1323;
    }
    float _1371 = _1359;
    float _1373 = _1371;
    if (!_1357)
    {
        _1361 = _1317;
    }
    float _1375 = _1361;
    float _1377 = _1375;
    if (!_1357)
    {
        _1363 = _1339;
    }
    float _1379 = _1363;
    bool _1381 = !_1357;
    float _1383 = _1379;
    if (!_1381)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1389 = _1349 + _1387;
        float _1391 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1393 = rsqrt(_1343);
        float _1395 = _1389 * _1385;
        float _1397 = _1395 * 0.15915493667125701904296875;
        float _1399 = _1397 * 6.283185482025146484375;
        float _1401 = cos(_1399);
        float _1403 = _1397 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = _1401 + (-1.0);
        float _1409 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = fma(_1405, _1391, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1413 = fma(_1339, _1401, _1409);
        float _1415 = _1393 * _1411;
        float _1417 = fma(_1337, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1419 = fma(_1329, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1383 = _1413;
        _1373 = _1417;
        _1377 = _1419;
    }
    float _1421 = _1383;
    float _1423 = _1373;
    float _1425 = _1377;
    float _1427 = -_925;
    float _1429 = _1427 + _1421;
    float _1431 = -_931;
    float _1433 = _1431 + _1423;
    float _1435 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1437 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1439 = _1429 * _1429;
    float _1441 = -_949;
    float _1443 = _1441 + _1425;
    float _1445 = 1.0 / _1435;
    float _1447 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1437);
    float _1449 = fma(_1433, _1433, _1439);
    float _1451 = -_1139;
    float _1453 = _1451 + _1423;
    float _1455 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1447);
    float _1457 = fma(_1443, _1443, _1449);
    float _1459 = -_1135;
    float _1461 = _1459 + _1421;
    float _1463 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1465 = sqrt(_1457);
    float _1467 = _1463 + _1435;
    float _1469 = -_1147;
    float _1471 = _1469 + _1425;
    float _1473 = _1467 * _1445;
    float _1475 = _1473 * 0.5;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1479 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1477);
    bool _1481 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan(0.5);
    bool _1489 = _1485 || _1487;
    float _1491 = 1.0 / _1479;
    bool _1493 = _1465 > 0.0;
    bool _1495 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.5);
    bool _1503 = _1499 || _1501;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1507 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1509 = _1433;
    float _1511 = _1461;
    float _1513 = _1421;
    if (!_1493)
    {
        _1505 = _1453;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (!_1493)
    {
        _1365 = _1461;
    }
    float _1519 = _1365;
    float _1521 = _1519;
    if (!_1493)
    {
        _1507 = _1471;
    }
    float _1523 = _1507;
    bool _1525 = !_1493;
    float _1527 = _1523;
    float _1529 = _1523;
    if (!_1525)
    {
        float _1531 = _243 * _243;
        float _1533 = fma(_239, _239, _1531);
        float _1535 = fma(_245, _245, _1533);
        float _1537 = rsqrt(_1457);
        float _1539 = sqrt(_1535);
        float _1541 = _1433 * _1537;
        float _1543 = _1429 * _1537;
        float _1545 = _1443 * _1537;
        bool _1547 = _1539 > 0.0;
        float _1549 = _1537;
        float _1551 = _1539;
        _1367 = _1541;
        if (!_1547)
        {
            _1549 = _1453;
        }
        float _1553 = _1549;
        _1517 = _1553;
        if (!_1547)
        {
            _1551 = _1461;
        }
        float _1555 = _1551;
        _1521 = _1555;
        if (!_1547)
        {
            _1527 = _1471;
        }
        float _1557 = _1527;
        bool _1559 = !_1547;
        _1529 = _1557;
        if (!_1559)
        {
            float _1561 = rsqrt(_1535);
            float _1563 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1565 = _243 * _1561;
            float _1567 = _239 * _1561;
            float _1569 = _1543 * _1565;
            float _1571 = _245 * _1561;
            float _1573 = fma(_1541, _1567, _1569);
            float _1575 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1577 = fma(_1545, _1571, _1573);
            float _1579 = _1577 * _1575;
            float _1581 = fma(_239, _1579, _1453);
            float _1583 = fma(_243, _1579, _1461);
            float _1585 = fma(_245, _1579, _1471);
            _1517 = _1581;
            _1521 = _1583;
            _1529 = _1585;
        }
    }
    float _1587 = _1517;
    float _1589 = _1521;
    float _1591 = _1529;
    float _1593 = _1367;
    float _1595 = _1589;
    float _1597 = _1587;
    float _1599 = _1591;
    float _1601 = _1593;
    if (_1489)
    {
        _1509 = 1.0;
    }
    float _1603 = _1509;
    float _1605 = _1603;
    if (!_1503)
    {
        float _1607 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1609 = _1347 + _1607;
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1613 = _1321 + _1611;
        float _1615 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1617 = _1609 * _1609;
        float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1621 = _1333 + _1619;
        float _1623 = fma(_1613, _1613, _1617);
        float _1625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1627 = fma(_1621, _1621, _1623);
        float _1629 = sqrt(_1627);
        float _1631 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = precise::min(_1629, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1635 = _1633 * _1625;
        float _1637 = -_1321;
        float _1639 = _1637 + _1587;
        float _1641 = _1631 * _1635;
        float _1643 = -_1347;
        float _1645 = _1643 + _1589;
        float _1647 = -_1333;
        float _1649 = _1647 + _1591;
        float _1651 = fma(_1639, _1641, _1321);
        float _1653 = fma(_1645, _1641, _1347);
        float _1655 = fma(_1649, _1641, _1333);
        _1511 = _1625;
        _1595 = _1653;
        _1597 = _1651;
        _1599 = _1655;
    }
    float _1657 = _1511;
    float _1659 = _1595;
    float _1661 = _1597;
    float _1663 = _1599;
    float _1665 = _1657;
    if (_1489)
    {
        _1601 = 1.0;
    }
    float _1667 = _1601;
    float _1669 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1671 = _1491 * _1669;
    float _1673 = _1667;
    if (!_1489)
    {
        float _1675 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1677 = _1675 * 0.15915493667125701904296875;
        float _1679 = _1677 * 6.283185482025146484375;
        float _1681 = cos(_1679);
        float _1683 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1685 = _1683 * 0.15915493667125701904296875;
        float _1687 = _1677 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = 1.0 / _1681;
        float _1693 = _1685 * 6.283185482025146484375;
        float _1695 = cos(_1693);
        float _1697 = _1689 * _1691;
        float _1699 = _1685 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1703;
        float _1707 = _1695 * _1697;
        float _1709 = 1.0 / _1705;
        float _1711 = 1.0 / _1707;
        float _1713 = _1701 * _1711;
        float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1717 = fma(_1671, _1713, _1715);
        float _1719 = _1717 * _1709;
        float _1721 = precise::clamp(_1719, 0.0, 1.0);
        _1513 = _1677;
        _1665 = _1697;
        _1605 = _1721;
    }
    float _1723 = _1513;
    float _1725 = _1665;
    float _1727 = _1605;
    float _1729 = _1723;
    float _1731 = _1725;
    if (!_1489)
    {
        float _1733 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = _1735 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1743 = _1741 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1739;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = 1.0 / _1761;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1767 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1765;
        float _1769 = 1.0 / _1767;
        float _1771 = _1759 * _1763;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1775 = fma(_1671, _1771, _1773);
        float _1777 = _1775 * _1769;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        float _1781 = -_1779;
        float _1783 = _1781 + 1.0;
        _1729 = _1739;
        _1731 = _1761;
        _1673 = _1783;
    }
    float _1785 = _1729;
    float _1787 = _1731;
    float _1789 = _1673;
    float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1793 = _1659 + _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1797 = _1661 + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1801 = _1663 + _1799;
    float _1803 = _1793 * _1793;
    float _1805 = fma(_1797, _1797, _1803);
    float _1807 = fma(_1801, _1801, _1805);
    float _1809 = rsqrt(_1807);
    float _1811 = sqrt(_1807);
    float _1813 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1815 = _1797 * _1813;
    float _1817 = _1801 * _1813;
    float _1819 = _1815 * _1815;
    float _1821 = _1817 * _1817;
    float _1823 = _1819 + _1821;
    float _1825 = sqrt(_1823);
    bool _1827 = _1825 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1831 = _1825 + _1829;
    float _1833 = _1801;
    float _1835 = _1785;
    float _1837 = _1831;
    float _1839 = _1813;
    float _1841 = _1787;
    float _1843 = _1823;
    if (_1827)
    {
        float _1845 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1833 = _1845;
    }
    float _1847 = _1833;
    if (_1827)
    {
        float _1849 = rsqrt(_1823);
        _1835 = _1849;
    }
    float _1851 = _1835;
    float _1853 = _1851;
    if (_1827)
    {
        float _1855 = _1831 * _1847;
        _1837 = _1855;
    }
    float _1857 = _1837;
    if (_1827)
    {
        float _1859 = _1857 * 0.15915493667125701904296875;
        _1369 = _1859;
    }
    float _1861 = _1369;
    float _1863 = _1847;
    float _1865 = _1861;
    if (_1827)
    {
        float _1867 = _1861 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        _1863 = _1869;
    }
    float _1871 = _1863;
    float _1873 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1875 = precise::max(0.0, _1873);
    float _1877 = _1803;
    if (_1827)
    {
        float _1879 = _1861 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        _1877 = _1881;
    }
    float _1883 = _1877;
    float _1885 = -_1813;
    float _1887 = -_1875;
    float _1889 = fma(_1793, _1885, _1887);
    if (_1827)
    {
        float _1891 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _1891;
    }
    float _1893 = _1839;
    float _1895 = _1893;
    if (!_1827)
    {
        _1865 = _1821;
    }
    float _1897 = _1865;
    float _1899 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1901 = fma(_1321, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1903 = _1871;
    float _1905 = _1897;
    if (_1827)
    {
        float _1907 = fma(_1871, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1841 = _1907;
    }
    float _1909 = _1841;
    float _1911 = _1909;
    if (!_1827)
    {
        _1903 = _1815;
    }
    float _1913 = _1903;
    float _1915 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1899);
    float _1917 = floor(_1901);
    float _1919 = _1913;
    if (_1827)
    {
        float _1921 = _1883 + (-1.0);
        _1895 = _1921;
    }
    float _1923 = _1895;
    float _1925 = 0.0;
    float _1927 = _1923;
    if (_1827)
    {
        float _1929 = _1851 * _1909;
        _1925 = _1929;
    }
    float _1931 = _1925;
    if (!_1827)
    {
        _1853 = _1889;
    }
    float _1933 = _1853;
    float _1935 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1915);
    float _1937 = _1933;
    if (_1827)
    {
        float _1939 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1843 = _1939;
    }
    float _1941 = _1843;
    if (_1827)
    {
        float _1943 = _1815 * _1931;
        _1919 = _1943;
    }
    float _1945 = _1919;
    if (!_1827)
    {
        _1927 = _1817;
    }
    float _1947 = _1927;
    float _1949 = _1947;
    if (_1827)
    {
        float _1951 = _1817 * _1931;
        _1949 = _1951;
    }
    float _1953 = _1949;
    if (!_1827)
    {
        _1911 = _1819;
    }
    float _1955 = _1911;
    float _1957 = _1955;
    if (_1827)
    {
        float _1959 = fma(_1889, _1883, _1941);
        _1937 = _1959;
    }
    float _1961 = _1937;
    if (_1827)
    {
        float _1963 = _1945 * _1945;
        _1957 = _1963;
    }
    float _1965 = _1957;
    if (_1827)
    {
        float _1967 = _1953 * _1953;
        _1905 = _1967;
    }
    float _1969 = _1905;
    float _1971 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1973 = fma(_1961, _1961, _1965);
    float _1975 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1977 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1971);
    float _1979 = _1973 + _1969;
    float _1981 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1985 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1983);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1975);
    float _1991 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1977);
    float _1993 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1981);
    float _1995 = rsqrt(_1979);
    float _1997 = -_1987;
    float _1999 = _1997 + 1.0;
    float _2001 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1989);
    float _2003 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1993);
    float _2005 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2007 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2009 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2011 = abs(_1999);
    float _2013 = log2(_2011);
    float _2015 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2021 = fma(_1333, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2015);
    float _2025 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2027 = -_2019;
    float _2029 = fma(_2027, _2017, 1.0);
    float _2031 = _1995 * _1945;
    float _2033 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2023);
    float _2035 = _1995 * _1961;
    float _2037 = floor(_2021);
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2041 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2033);
    float _2043 = _1995 * _1953;
    float _2045 = -_1917;
    float _2047 = _1901 + _2045;
    float _2049 = -_2039;
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2049);
    float _2053 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2055 = log2(_2029);
    float _2057 = -_2043;
    float _2059 = fma(_2057, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2051);
    float _2061 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2063 = fma(_1423, 6.2500002968590706586837768554688e-05, 0.5);
    float _2065 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2067 = exp2(_2053);
    float _2069 = fma(_2059, -0.5, 0.5);
    float _2071 = -_2037;
    float _2073 = _2021 + _2071;
    float _2075 = fma(_2059, 0.5, 0.5);
    float _2077 = fma(_1425, 6.2500002968590706586837768554688e-05, 0.5);
    float _2079 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2061);
    float _2081 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2065);
    float _2083 = fma(_2075, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2085 = 1.0 / _2041;
    float _2087 = _2035 + 1.0;
    float _2089 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2079);
    float _2091 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2081);
    float _2093 = fma(_2075, _2083, -0.212114393711090087890625);
    float _2095 = _2055 * 0.693147182464599609375;
    float _2097 = sqrt(_2069);
    float _2099 = -_2035;
    float _2101 = fma(_2067, _2087, _2099);
    float _2103 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2089);
    float _2105 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2091);
    float _2107 = fma(_2075, _2093, 1.570728778839111328125);
    float _2109 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2111 = fma(_2101, 0.5, 0.5);
    float _2113 = _2103 * _2085;
    float _2115 = _2105 * _2085;
    float2 _6676 = float2(_2047, _2073);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6676, float2(0.0), isnan(_6676)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6676, float2(0.0), isnan(_6676)), level(0.0)).x;
    float _2119 = fma(_2115, -0.5, 0.5);
    float _2121 = _2097 * 0.636619746685028076171875;
    float _2123 = fma(_2113, 0.5, 0.5);
    float _2125 = -_2107;
    float _2127 = fma(_2121, _2125, 1.0);
    float3 _6699 = float3(_2123, _2119, _2109);
    float _2129 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6699, float3(0.0), isnan(_6699)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6699, float3(0.0), isnan(_6699)), level(0.0)).x;
    float3 _6710 = float3(_2123, _2119, _2109);
    float4 _2132 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6710, float3(0.0), isnan(_6710)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6710, float3(0.0), isnan(_6710)), level(0.0)).xyzw;
    float _2134 = _2132.x;
    float _2136 = _2132.y;
    float _2138 = _2132.z;
    float _2140 = _2132.w;
    float2 _6726 = float2(_2127, _2111);
    float3 _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6726, float2(0.0), isnan(_6726)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6726, float2(0.0), isnan(_6726)), level(0.0)).xyz;
    float _2146 = _2144.x;
    float _2148 = _2144.y;
    float _2150 = _2144.z;
    float2 _6740 = float2(_2063, _2077);
    float3 _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6740, float2(0.0), isnan(_6740)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6740, float2(0.0), isnan(_6740)), level(0.0)).xyz;
    float _2154 = _2152.x;
    float _2156 = _2152.y;
    float _2158 = _2152.z;
    float _2160 = float(uint(_815));
    float _2162 = trunc(_913);
    int _2164 = int(_2162);
    int _2166 = ~_815;
    int _2168 = _2166 + 1;
    out.m_76.x = _709;
    out.m_76.y = _711;
    out.m_76.z = _715;
    out.m_76.w = _723;
    int _2170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2172 = _2170 != 0;
    float _2174 = -_915;
    float _2176 = _2174 + 1.0;
    float _2178 = -_917;
    float _2180 = _2178 + 1.0;
    bool _2182 = _765 > 0.5;
    float _2184 = 1.0 / _2160;
    int _2186 = ~_815;
    int _2188 = _2186 + 1;
    out.m_78.x = _1321;
    out.m_78.y = _1347;
    out.m_78.z = _1333;
    float _2190 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_80.w = _1115;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2196 = float(uint(_2164));
    float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2200 = _2198 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2204 = _2202 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2206 = float(_2164);
    float _2208 = 1.0 / _2194;
    int _2210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2212 = _2210 != 0;
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2214;
    int _2218 = as_type<int>(_2184) + (-2);
    float _2220 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2222 = _2220 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    out.m_82.x = _1229;
    float _2224 = as_type<float>(_2218) * _2196;
    float _2226 = 1.0 / _2200;
    bool _2228 = _163 > 0.5;
    out.m_84.x = _1661;
    out.m_84.y = _1659;
    out.m_84.z = _1663;
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2234 = abs(_953);
    float _2236 = _2216 * _2208;
    float _2238 = trunc(_2224);
    float _2240 = precise::max(_2238, 0.0);
    uint _2243 = uint(_2240);
    int _2245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2247 = _2245 != 0;
    int _2249 = ~_815;
    int _2251 = _2249 + 1;
    float _2253 = 1.0 / _2204;
    float _2255 = _2222 * _2226;
    int _2257 = _2188 * int(_2243);
    int _2259 = _2257 + _2164;
    float _2261 = 1.0 / _2232;
    float _2263 = float(uint(_2259));
    float _2265 = exp2(_2190);
    float _2267 = as_type<float>(_2218) * _2263;
    bool _2269 = !_2212;
    float _2271 = _2269 ? 7.345489978790283203125 : 1.0;
    float _2273 = _2271 * _163;
    float _2275 = trunc(_2267);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2283 = _2281 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2285 = floor(_2273);
    float _2287 = -_2265;
    float _2289 = _2287 + 1.0;
    float _2291 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2293 = int(_2243) + int(_2279);
    float _2295 = 1.0 / _2283;
    bool _2297 = _2206 >= _879;
    bool _2299 = isnan(_2206);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(_879);
    bool _2305 = _2301 || _2303;
    float _2307 = float(_2305);
    int _2309 = _2168 * _2293;
    int _2311 = _2309 + _2164;
    float _2313 = -_2285;
    float _2315 = _2273 + _2313;
    float _2317 = trunc(_2307);
    int _2319 = int(_2317);
    bool _2321 = uint(_2311) >= uint(_815);
    float _2323 = _2315 * _879;
    float _2325 = _893 * _173;
    float _2327 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2327;
    bool _2331 = !_2321;
    int _2333 = _2331 ? 0 : (-1);
    bool _2335 = _815 == 0;
    float _2337 = _2329 * _2253;
    int _2339 = ~_2293;
    int _2341 = _2339 + _2333;
    int _2343 = _2341 + 1;
    float _2345 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2347 = _2345 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2349 = trunc(_2323);
    int _2351 = int(_2349);
    int _2353 = _815 * _2343;
    int _2355 = _2353 + _2164;
    int _2357 = ~_2319;
    int _2359 = _2357 + 1;
    int _2361 = _2359 + 1;
    float _2363 = _2347 * _2295;
    bool _2365 = !_2247;
    int _2367 = _2365 ? 0 : 1;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2369;
    bool _2373 = !_2335;
    int _2375 = _2373 ? _2355 : (-1);
    float _2377 = trunc(_2325);
    int _2379 = int(_2377);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2383 = _2381 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2385 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2387 = isnan(_741);
    bool _2389 = _2385 || _2387;
    bool _2391 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2393 = _2389 || _2391;
    float _2395 = float(_2393);
    int _2397 = _2375 * _2361;
    int _2399 = abs(_2367);
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2405 = _815 + (-1);
    float _2407 = -_2395;
    float _2409 = _2407 + 1.0;
    int _2411 = abs(_929);
    float _2413 = 1.0 / _2403;
    float _2415 = _2371 * _2261;
    int _2417 = _2319 * _2405;
    int _2419 = _2417 + _2397;
    bool _2421 = !_2172;
    int _2423 = _2421 ? 0 : 1;
    int _2425 = _2351 * _2399;
    int _2427 = _2425 + _2164;
    bool _2429 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2431 = isnan(_741);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    int _2441 = _2419 * _2411;
    int _2443 = abs(_957);
    int _2445 = abs(_2423);
    int _2447 = _2379 * _2234;
    int _2449 = _2447 + _2441;
    bool _2451 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2453 = isnan(_741);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2459 = _2455 || _2457;
    float _2461 = float(_2459);
    float _2463 = _2383 * _2413;
    bool _2465 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2467 = isnan(_741);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2473 = _2469 || _2471;
    float _2475 = float(_2473);
    int _2477 = _2427 * _2443;
    int _2479 = _2477 + _2449;
    bool _2481 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2483 = isnan(_741);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = -_2461;
    float _2495 = _2493 + 1.0;
    float _2497 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2503 = _741 + _2501;
    int _2505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2507 = _2505 != 0;
    float _2509 = _2491 * _2495;
    int _2511 = _2351 * _2445;
    int _2513 = _2511 + _2479;
    float _2515 = -_2491;
    float _2517 = _2515 + 1.0;
    bool _2519 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2521 = isnan(_741);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = -_2439;
    float _2533 = _2531 + 1.0;
    float _2535 = 1.0 / _2499;
    float _2537 = float(uint(_2513));
    float _2539 = _2439 * _2517;
    bool _2541 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2543 = isnan(_741);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2549 = _2545 || _2547;
    float _2551 = float(_2549);
    float _2553 = _2529 * _2533;
    float _2555 = -_2529;
    float _2557 = _2555 + 1.0;
    float _2559 = as_type<float>(_2218) * _2537;
    bool _2561 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2563 = isnan(_741);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    float _2573 = -_2551;
    float _2575 = _2573 + 1.0;
    float _2577 = _2551 * _2557;
    float _2579 = fma(_2236, _2503, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2581 = trunc(_2559);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    float _2587 = _2571 * _2575;
    float _2589 = -_2571;
    float _2591 = _2589 + 1.0;
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2595 = _741 + _2593;
    float _2597 = _2395 * _2591;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2599;
    float _2603 = _2475 * _2409;
    float _2605 = fma(_2255, _2595, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2607 = _2601 * _2535;
    float _2609 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2611 = _741 + _2609;
    float _2613 = _2579 * _2603;
    float _2615 = -_2475;
    float _2617 = _2615 + 1.0;
    float _2619 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2621 = _741 + _2619;
    int _2623 = _2251 * int(_2585);
    int _2625 = _2623 + _2513;
    float _2627 = fma(_2337, _2611, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2629 = fma(_2617, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2613);
    float _2631 = fma(_2363, _2621, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2635 = _741 + _2633;
    float _2637 = float(uint(_2625));
    float _2639 = fma(_2605, _2597, _2629);
    float _2641 = float(uint(_2427));
    float _2643 = fma(_2415, _2635, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2645 = -_223;
    int _2647 = _2228 ? as_type<int>(_2645) : as_type<int>(_223);
    float _2649 = as_type<float>(_2218) * _2637;
    float _2651 = fma(_2627, _2587, _2639);
    float _2653 = as_type<float>(_2218) * _2641;
    bool _2655 = !_2507;
    float _2657 = _2655 ? _223 : as_type<float>(_2647);
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2661 = _741 + _2659;
    float _2663 = fma(_2631, _2577, _2651);
    float _2665 = trunc(_2649);
    float _2667 = precise::max(_2665, 0.0);
    uint _2669 = uint(_2667);
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2673 = _741 + _2671;
    float _2675 = _2657 + 0.5;
    float _2677 = fma(_2643, _2553, _2663);
    float _2679 = _1293 + (-10.0);
    float _2681 = fma(_2607, _2661, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2683 = fma(_2675, (*spvDescriptorSet0.vp_c9)._m0[80].x, _883);
    int _2685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2687 = _2685 != 0;
    float _2689 = trunc(_2653);
    float _2691 = precise::max(_2689, 0.0);
    uint _2693 = uint(_2691);
    float _2695 = -_227;
    int _2697 = _2182 ? as_type<int>(_2695) : as_type<int>(_227);
    float _2699 = fma(_2463, _2673, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2701 = ~_815;
    int _2703 = _2701 + 1;
    float _2705 = -_2176;
    float _2707 = fma(_2657, _2705, _2683);
    float _2709 = precise::max(_1273, _2679);
    float _2711 = fma(_2699, _2539, _2677);
    bool _2713 = !_2687;
    float _2715 = _2713 ? _227 : as_type<float>(_2697);
    float _2717 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2719 = int(_2585) + int(_2669);
    float _2721 = fma(_2681, _2509, _2711);
    float _2723 = precise::min(_1293, _2709);
    float _2725 = _2715 + (-0.5);
    int _2727 = ~_815;
    int _2729 = _2727 + 1;
    int _2731 = _2703 * _2719;
    int _2733 = _2731 + _2513;
    float _2735 = -_2725;
    float _2737 = -_909;
    float _2739 = fma(_2735, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2737);
    float _2741 = -_2679;
    float _2743 = _2741 + _2723;
    int _2745 = _2729 * int(_2693);
    int _2747 = _2745 + _2427;
    bool _2749 = uint(_2733) >= uint(_815);
    float _2751 = fma(_2715, _2180, _2739);
    float _2753 = fma(_2743, -0.100000001490116119384765625, 1.0);
    int _2755 = ~_815;
    int _2757 = _2755 + 1;
    float _2759 = abs(_1671);
    float _2761 = log2(_2759);
    bool _2763 = !_2749;
    int _2765 = _2763 ? 0 : (-1);
    out.m_86.x = _2707;
    out.m_86.y = _2751;
    float _2767 = float(uint(_2747));
    float _2769 = _707 * _2753;
    int _2771 = ~_2719;
    int _2773 = _2771 + _2765;
    int _2775 = _2773 + 1;
    float _2777 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2781 = _2779 != 0;
    float _2783 = as_type<float>(_2218) * _2767;
    out.m_88.x = _717;
    out.m_88.y = _719;
    out.m_88.z = _721;
    out.m_88.w = _2769;
    int _2785 = _815 * _2775;
    int _2787 = _2785 + _2513;
    float _2789 = -_1239;
    float _2791 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2777);
    float _2793 = trunc(_2783);
    float _2795 = precise::max(_2793, 0.0);
    uint _2797 = uint(_2795);
    float _2799 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2801 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2803 = !_2335;
    int _2805 = _2803 ? _2787 : (-1);
    float _2807 = _2761 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2809 = -_1239;
    float _2811 = fma(_2809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2799);
    float _2813 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2815 = _2805 & 3;
    bool _2817 = _2815 != 0;
    float _2819 = fma(_2461, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2721);
    int _2821 = _2805 >> 31;
    float _2823 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2811);
    float _2825 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2827 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2829 = _2821 & 3;
    float _2831 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2791);
    float _2833 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2825);
    int _2835 = int(_2693) + int(_2797);
    float _2837 = _1265 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2839 = _2805 + _2829;
    float _2841 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2843 = exp2(_2807);
    int _2845 = _2757 * _2835;
    int _2847 = _2845 + _2427;
    int _2849 = _2839 >> 2;
    float _2851 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2837);
    float _2853 = _2841 * _2823;
    int _2855 = _2817 ? 0 : 1;
    float _2857 = -_1239;
    float _2859 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2813);
    int _2861 = _2849 << 4;
    int _2863 = _2861 + 368;
    float _2865 = _2841 * _2831;
    bool _2867 = uint(_2847) >= uint(_815);
    float _2869 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2801);
    float _2871 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2827);
    uint _2873 = uint(int(uint(_2863) >> uint(2)));
    uint _2875 = uint(int(uint(int(_2873)) >> uint(2)));
    int _2877 = int(_2873) & 3;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[int(_2875)][_2877];
    int _2881 = int(_2873) + 1;
    uint _2883 = uint(int(uint(_2881) >> uint(2)));
    int _2885 = _2881 & 3;
    float _2887 = (*spvDescriptorSet0.vp_c9)._m0[int(_2883)][_2885];
    float _2889 = _1265 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2891 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2869);
    bool _2893 = !_2867;
    int _2895 = _2893 ? 0 : (-1);
    float _2897 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2859);
    float _2899 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2889);
    int _2901 = _2805 & 3;
    bool _2903 = _2901 != 0;
    float _2905 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2851);
    int _2907 = _2863 + 8;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    uint _2911 = uint(int(uint(int(_2909)) >> uint(2)));
    int _2913 = int(_2909) & 3;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[int(_2911)][_2913];
    int _2917 = int(_2909) + 1;
    uint _2919 = uint(int(uint(_2917) >> uint(2)));
    int _2921 = _2917 & 3;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[int(_2919)][_2921];
    int _2925 = ~_2855;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    float _2931 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2833);
    bool _2933 = uint(_2901) > 1u;
    float _2935 = fma(_2717, _2891, _2853);
    int _2937 = ~_2835;
    int _2939 = _2937 + _2895;
    int _2941 = _2939 + 1;
    float _2943 = in.m_90.x;
    bool _2945 = uint(_2901) >= 2u;
    float _2947 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2899);
    bool _2949 = _1671 <= 8000.0;
    bool _2951 = isnan(_1671);
    bool _2953 = _2949 || _2951;
    bool _2955 = isnan(8000.0);
    bool _2957 = _2953 || _2955;
    float _2959 = float(_2957);
    int _2961 = _815 * _2941;
    int _2963 = _2961 + _2427;
    bool _2965 = !_2903;
    int _2967 = _2965 ? 0 : 1;
    float _2969 = _2841 * _2897;
    bool _2971 = _2901 != 3;
    float _2973 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2871);
    int _2975 = abs(_2967);
    float _2977 = -_2117;
    float _2979 = _2977 + 1.0;
    int _2981 = _2929;
    if (!_2933)
    {
        int _2983 = ~_2855;
        int _2985 = _2983 + 1;
        _2981 = _2985;
    }
    int _2987 = _2981;
    float _2989 = fma(_2717, _2931, _2865);
    bool _2991 = _2901 != 3;
    float _2993 = fma(_2717, _2973, _2969);
    int _2995 = abs(_2987);
    float _2997 = _1265 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2999 = _2945 ? 0 : 1;
    float _3001 = _2291 * _2129;
    int _3003 = ~_2995;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    float _3009 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2997);
    int _3011 = ~_2999;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    out.m_92.x = _2819;
    float _3017 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3009);
    bool _3019 = !_2971;
    int _3021 = _3019 ? 0 : (-1);
    int _3023 = _3015;
    if (_2991)
    {
        int _3025 = ~_2999;
        int _3027 = _3025 + 1;
        _3023 = _3027;
    }
    int _3029 = _3023;
    float _3031 = fma(_2843, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3033 = precise::clamp(_3031, 0.0, 1.0);
    int _3035 = abs(_3021);
    int _3037 = abs(_3029);
    int _3039 = _3007 * as_type<int>(_2887);
    bool _3041 = !_2781;
    int _3043 = _3041 ? 0 : 1;
    int _3045 = ~_2975;
    int _3047 = _3045 + 1;
    int _3049 = _3047 + 1;
    int _3051 = abs(_3043);
    int _3053 = _3049 * as_type<int>(_2879);
    int _3055 = _3053 + _3039;
    float _3057 = fma(_3033, -2.0, 3.0);
    int _3059 = ~_3037;
    int _3061 = _3059 + 1;
    int _3063 = _3061 + 1;
    float _3065 = _3033 * _3033;
    int _3067 = ~_3035;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    int _3073 = _3063 * as_type<int>(_2915);
    int _3075 = _3073 + _3055;
    float _3077 = _3065 * _3057;
    float _3079 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3081 = ~_3051;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    int _3087 = _3071 * as_type<int>(_2923);
    int _3089 = _3087 + _3075;
    float _3091 = -_3077;
    float _3093 = _3091 + 1.0;
    float _3095 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3079);
    bool _3097 = !_2335;
    int _3099 = _3097 ? _2963 : (-1);
    int _3101 = _3089 * _3085;
    float _3103 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3077);
    float _3105 = _2041 * 0.5;
    float _3107 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3095);
    int _3109 = _3099 * _3051;
    int _3111 = _3109 + _3101;
    float _3113 = _2959 * _3103;
    float _3115 = fma(_2105, -0.5, _3105);
    float _3117 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3107);
    float _3119 = _2905 + _2935;
    float _3121 = _2947 + _2989;
    float _3123 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3125 = _3117 + _2041;
    float _3127 = _2103 + _2041;
    float _3129 = _2979 * _3123;
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = float(_3111);
    float _3135 = _3125 * 0.5;
    float _3137 = _3127 * 0.5;
    float _3139 = -_3131;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_94.x = _3133;
    float _3143 = _2150 * _3001;
    float _3145 = _3017 + _2993;
    float _3147 = _3141 * _2943;
    out.m_96.x = _3137;
    out.m_96.y = _3115;
    out.m_96.z = _3135;
    out.m_96.w = _2041;
    float _3149 = fma(_2140, _3143, _2138);
    bool _3151 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3153 = isnan(_1811);
    bool _3155 = _3151 || _3153;
    bool _3157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3159 = _3155 || _3157;
    float _3161 = _3147 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3163 = _2140 * _3001;
    float _3165 = in.m_90.z;
    float _3167 = fma(_2146, _3163, _2134);
    float _3169 = fma(_2148, _3163, _2136);
    out.gl_Position.x = _2103;
    out.gl_Position.y = _2105;
    out.gl_Position.z = _3117;
    out.gl_Position.w = _2041;
    float _3171 = _1727 * _1789;
    float _3173 = -_2291;
    float _3175 = _3173 + 1.0;
    out.m_98.x = _2154;
    out.m_98.y = _2156;
    out.m_98.z = _2158;
    float _3177 = _3171 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3179 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _3181 = _2041;
    float _3183 = _3115;
    float _3185 = _3175;
    float _3187 = _3177;
    if (!_3159)
    {
        _3179 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3189 = _3179;
    float _3191 = _2140 * _3175;
    out.m_100.x = _3161;
    float _3193 = _3189;
    float _3195 = _3189;
    if (!_3159)
    {
        _3181 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3197 = _3181;
    float _3199 = _3197;
    float _3201 = _3197;
    if (!_3159)
    {
        _3183 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3203 = _3183;
    out.m_102.x = _3167;
    out.m_102.y = _3169;
    out.m_102.z = _3149;
    out.m_102.w = _3191;
    float _3205 = _3203;
    float _3207 = _3203;
    if (!_3159)
    {
        _3185 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3209 = _3185;
    out.m_104.x = _3119;
    out.m_104.y = _3121;
    out.m_104.z = _3145;
    float _3211 = _3177 * _3165;
    float _3213 = _3165;
    float _3215 = _3209;
    float _3217 = _3209;
    if (!_3159)
    {
        _3213 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3219 = _3213;
    float _3221 = _3219;
    float _3223 = _3219;
    if (!_3159)
    {
        _3187 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3225 = _3187;
    bool _3227 = !_3159;
    float _3229 = _3225;
    float _3231 = _3225;
    if (!_3227)
    {
        bool _3233 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3235 = isnan(_1811);
        bool _3237 = _3233 || _3235;
        bool _3239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3241 = _3237 || _3239;
        if (!_3241)
        {
            float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3245 = _1811 + _3243;
            float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3249 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3247;
            float _3251 = 1.0 / _3249;
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3267 = _3265 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3271 = _3269 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3273 = _3245 * _3251;
            float _3275 = precise::clamp(_3273, 0.0, 1.0);
            float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3281 = fma(_3275, _3255, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3283 = fma(_3275, _3279, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3285 = fma(_3275, _3259, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3287 = fma(_3275, _3263, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3289 = fma(_3275, _3267, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3291 = fma(_3275, _3271, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3201 = _3283;
            _3217 = _3289;
            _3195 = _3281;
            _3207 = _3287;
            _3223 = _3285;
            _3231 = _3291;
            _3293 = true;
        }
        else
        {
            bool _3295 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3297 = isnan(_1811);
            bool _3299 = _3295 || _3297;
            bool _3301 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3303 = _3299 || _3301;
            if (!_3303)
            {
                _3193 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3305 = _3193;
            _3195 = _3305;
            if (!_3303)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3307 = _3199;
            _3201 = _3307;
            if (!_3303)
            {
                _3221 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3309 = _3221;
            _3223 = _3309;
            if (!_3303)
            {
                _3205 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3311 = _3205;
            _3207 = _3311;
            if (!_3303)
            {
                _3215 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3313 = _3215;
            _3217 = _3313;
            if (!_3303)
            {
                _3229 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3315 = _3229;
            bool _3317 = !_3303;
            _3231 = _3315;
            if (!_3317)
            {
                bool _3319 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3321 = isnan(_1811);
                bool _3323 = _3319 || _3321;
                bool _3325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3327 = _3323 || _3325;
                if (!_3327)
                {
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3331 = _1811 + _3329;
                    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3335 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3333;
                    float _3337 = 1.0 / _3335;
                    float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3341 = _3339 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3349 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3351 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3353 = _3351 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3355 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3357 = _3355 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3359 = _3331 * _3337;
                    float _3361 = precise::clamp(_3359, 0.0, 1.0);
                    float _3363 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3365 = _3363 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3367 = fma(_3361, _3341, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3369 = fma(_3361, _3365, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3371 = fma(_3361, _3345, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3373 = fma(_3361, _3349, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3375 = fma(_3361, _3353, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3377 = fma(_3361, _3357, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3201 = _3369;
                    _3217 = _3375;
                    _3195 = _3367;
                    _3207 = _3373;
                    _3223 = _3371;
                    _3231 = _3377;
                    _3293 = true;
                }
                else
                {
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3217 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3195 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3207 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3223 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3231 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3293 = false;
    float _3379 = _3201;
    float _3381 = _3217;
    float _3383 = _3195;
    float _3385 = _3207;
    float _3387 = _3223;
    float _3389 = _3231;
    float _3391 = _3211 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3393 = fma(_3121, -0.5, 0.5);
    float _3395 = precise::clamp(_3393, 0.0, 1.0);
    float _3397 = -_3379;
    float _3399 = _3397 + _3381;
    float _3401 = -_3383;
    float _3403 = _3401 + _3385;
    out.m_55.x = _3391;
    float _3405 = fma(_3395, _3399, _3379);
    float _3407 = -_3387;
    float _3409 = _3407 + _3389;
    float _3411 = fma(_3395, _3403, _3383);
    float _3413 = _3405 * 0.586610972881317138671875;
    bool _3415 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3417 = fma(_3395, _3409, _3387);
    out.m_106.x = 0.0;
    float _3419 = fma(_3411, 0.298911988735198974609375, _3413);
    bool _3421 = _1727 > 0.0;
    bool _3423 = isnan(_1727);
    bool _3425 = _3421 || _3423;
    bool _3427 = isnan(0.0);
    bool _3429 = _3425 || _3427;
    float _3431 = fma(_3417, 0.114477999508380889892578125, _3419);
    bool _3433 = _1789 <= 0.0;
    bool _3435 = !_3429;
    bool _3437 = _3433 || _3435;
    float _3439 = -_3431;
    float _3441 = _3411 + _3439;
    float _3443 = -_3431;
    float _3445 = _3405 + _3443;
    float _3447 = -_3431;
    float _3449 = _3417 + _3447;
    float _3451 = fma(_3441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3431);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3431);
    float _3455 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3431);
    bool _3457 = !_3415;
    if (!_3457)
    {
        float _3459 = -_1659;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3463 = -_1661;
        float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3467 = -_1663;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3471 = _3461 * _3461;
        float _3473 = fma(_3465, _3465, _3471);
        float _3475 = fma(_3469, _3469, _3473);
        float _3477 = sqrt(_3475);
        float _3479 = rsqrt(_3475);
        float _3481 = -_3477;
        float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3485 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        float _3489 = _3465 * _3479;
        float _3491 = _3461 * _3479;
        float _3493 = abs(_3487);
        float _3495 = log2(_3493);
        float _3497 = _3469 * _3479;
        float _3499 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3501 = _3121 * _3491;
        float _3503 = -_3491;
        float _3505 = -_3499;
        float _3507 = fma(_3503, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3505);
        float _3509 = fma(_3119, _3489, _3501);
        float _3511 = -_3497;
        float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3507);
        float _3515 = fma(_3145, _3497, _3509);
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3521 = _3513 + _3519;
        float _3523 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3525 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = exp2(_3523);
        float _3531 = _3529 * _3527;
        float _3533 = _3517 * _3531;
        float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3537 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3535;
        out.m_106.y = _3537;
        out.m_106.z = _3539;
    }
    out.m_80.x = _3451;
    out.m_80.y = _3453;
    out.m_80.z = _3455;
    if (!_3437)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _3541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3541;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3293 = false;
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
    float _139 = as_type<float>(_127);
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
        float _3610 = as_type<float>(_149);
        out.gl_Position.z = _3610;
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
    if (_171)
    {
        float _177 = _175 * 5.0;
        _151 = as_type<int>(_177);
    }
    int _179 = _151;
    float _181 = _131 * _173;
    out.m_59.x = _163;
    float _183 = _181;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3675 = as_type<float>(_179);
        out.gl_Position.z = _3675;
    }
    out.m_53.x = _181;
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
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_217;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _189 * _195;
    float _231 = _189 * _201;
    float _233 = fma(_187, _193, _229);
    float _235 = _189 * _207;
    float _237 = fma(_187, _199, _231);
    float _239 = fma(_191, _197, _233);
    float _241 = fma(_187, _205, _235);
    float _243 = fma(_191, _203, _237);
    float _245 = fma(_191, _209, _241);
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
        _263 = _181;
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
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -_283;
    float _299 = _297 + 1.0;
    float _301 = in.m_72.x;
    float _303 = in.m_72.y;
    bool _305 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_267);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = 1.0 / _291;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _321 = 1.0 / _295;
    float _323 = _271 * _317;
    bool _325 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_267);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = _335 * _299;
    float _347 = -_335;
    float _349 = _347 + 1.0;
    float _351 = _287 * _321;
    float _353 = fma(_339, _323, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = fma(_343, _323, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _357 = _315 * _349;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = -_315;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _371 = _353 * _357;
    float _373 = _355 * _357;
    float _375 = fma(_361, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = fma(_369, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _379 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _383 = fma(_375, _345, _379);
    float _385 = fma(_377, _345, _381);
    float _387 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _389 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].y, _385);
    float _391 = _387 * _301;
    float _393 = _389 * _303;
    bool _395 = !_319;
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
        _411 = _181;
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
    float _461 = _447 * _451;
    float _463 = -_447;
    float _465 = _463 + 1.0;
    float _467 = _419 * _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _469;
    float _473 = fma(_455, _467, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = fma(_471, _467, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _481 = _473 * _461;
    float _483 = fma(_477, _467, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _485 = _479 * _461;
    float _487 = _483 * _461;
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _491 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _493 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _495 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].x, _489);
    float _497 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].y, _491);
    float _499 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].z, _493);
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
        _517 = _181;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _525 = _521 + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _541 = isnan(_521);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _529;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _557 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _559 = isnan(_521);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _571 = 1.0 / _537;
    float _573 = _533 * _551;
    bool _575 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _577 = isnan(_521);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _555;
    float _589 = -_549;
    float _591 = _589 + 1.0;
    float _593 = fma(_573, _525, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _599 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _601 = isnan(_521);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = _585 * _591;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _621 = 1.0 / _597;
    float _623 = -_609;
    float _625 = _623 + 1.0;
    float _627 = _567 * _613;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _629;
    float _633 = _619 * _571;
    float _635 = _549 * _625;
    float _637 = _593 * _627;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _521 + _639;
    float _643 = -_567;
    float _645 = _643 + 1.0;
    bool _647 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _649 = isnan(_521);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _631 * _587;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _667 = _521 + _665;
    float _669 = fma(_633, _641, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _671 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[115].x, _637);
    float _673 = -_657;
    float _675 = _673 + 1.0;
    float _677 = _663 * _621;
    float _679 = fma(_659, _667, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _521 + _681;
    float _685 = fma(_669, _615, _671);
    float _687 = _609 * _675;
    float _689 = fma(_677, _683, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _691 = fma(_679, _635, _685);
    float _693 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _695 = fma(_689, _687, _691);
    float _697 = _495 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _699 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _703 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[119].x, _695);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _709 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _715 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _703 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _725 = !_569;
    if (!_725)
    {
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _729 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _183 = _739;
    }
    float _741 = _183;
    float _743 = in.m_48.x;
    float _745 = in.m_48.y;
    float _747 = in.m_48.z;
    float _749 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _751 = log2(_749);
    float _753 = _163 * 2.0;
    bool _755 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _763 = _759 || _761;
    float _765 = in.m_57.y;
    float _767 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _769 = in.m_68.w;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _773 = int(_771);
    float _775 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _777 = in.m_66.w;
    float _779 = in.m_70.w;
    float _781 = floor(_753);
    float _783 = _751 * _131;
    float _785 = _201 * _745;
    float _787 = _207 * _745;
    float _789 = in.m_57.z;
    float _791 = _195 * _745;
    float _793 = fma(_199, _743, _785);
    float _795 = fma(_205, _743, _787);
    float _797 = exp2(_783);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _801 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _803 = fma(_193, _743, _791);
    float _805 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _807 = fma(_801, -2.0, _799);
    float _809 = fma(_197, _747, _803);
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _815 = int(_813);
    float _817 = fma(_209, _747, _795);
    bool _819 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _821 = isnan(1.0);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _827 = _823 || _825;
    float _829 = -_811;
    float _831 = fma(_805, 2.0, _829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _835 = 1.0 + _833;
    float _837 = _163 + _765;
    float _839 = float(_773);
    float _841 = _765 * 2.0;
    bool _843 = _781 > 0.0;
    float _845 = _765 + _789;
    bool _847 = _781 >= 0.0;
    bool _849 = isnan(_781);
    bool _851 = _847 || _849;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    float _857 = 1.0 / _835;
    float _859 = _837 + (-1.0);
    float _861 = _845 + (-1.0);
    float _863 = fma(_203, _747, _793);
    float _865 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _867 = 1.0 / _839;
    float _869 = _789 * 2.0;
    float _871 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = -_797;
    float _875 = _873 + 1.0;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _879 = float(_815);
    float _881 = -_131;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[76].x, _831);
    float _885 = floor(_841);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _889 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _877);
    float _891 = _763 ? _875 : 0.0;
    float _893 = _879 * _131;
    float _895 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _887);
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _899 = _897 != 0;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _907 = _905 != 0;
    float _909 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _807);
    float _911 = floor(_869);
    float _913 = _867 * _131;
    float _915 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _895);
    float _917 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _889);
    if (_827)
    {
        float _919 = _891 * _857;
        _141 = _919;
    }
    float _921 = _141;
    int _923 = _855 ? 0 : 1;
    float _925 = _863 + _769;
    bool _927 = !_903;
    int _929 = _927 ? 0 : 1;
    float _931 = _809 + _777;
    bool _933 = _885 > 0.0;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _937 = _925 + _935;
    bool _939 = _885 >= 0.0;
    bool _941 = isnan(_885);
    bool _943 = _939 || _941;
    bool _945 = isnan(0.0);
    bool _947 = _943 || _945;
    float _949 = _817 + _779;
    bool _951 = !_899;
    int _953 = _951 ? 0 : 1;
    bool _955 = !_907;
    int _957 = _955 ? 0 : 1;
    bool _959 = _911 >= 0.0;
    bool _961 = isnan(_911);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    int _969 = ~_923;
    int _971 = _969 + 1;
    int _973 = _971 + 1;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _985 = _983 != 0;
    int _987 = _973;
    if (!_843)
    {
        int _989 = ~_923;
        int _991 = _989 + 1;
        _987 = _991;
    }
    int _993 = _987;
    float _995 = in.m_74.x;
    float _997 = in.m_74.y;
    float _999 = in.m_74.z;
    int _1001 = _947 ? 0 : 1;
    bool _1003 = !_981;
    int _1005 = _1003 ? 0 : 1;
    bool _1007 = _911 > 0.0;
    int _1009 = ~_1001;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    int _1015 = abs(_1005);
    bool _1017 = !_977;
    int _1019 = _1017 ? 0 : 1;
    int _1021 = _1013;
    if (!_933)
    {
        int _1023 = ~_1001;
        int _1025 = _1023 + 1;
        _1021 = _1025;
    }
    int _1027 = _1021;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _931 + _1029;
    float _1033 = float(_993);
    float _1035 = _937 * _937;
    int _1037 = _967 ? 0 : 1;
    float _1039 = float(_1015);
    float _1041 = fma(_1031, _1031, _1035);
    int _1043 = abs(_1019);
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1047 = _949 + _1045;
    int _1049 = ~_1037;
    int _1051 = _1049 + 1;
    int _1053 = _1051 + 1;
    float _1055 = _1039 * _1033;
    int _1057 = _1053;
    if (!_1007)
    {
        int _1059 = ~_1037;
        int _1061 = _1059 + 1;
        _1057 = _1061;
    }
    int _1063 = _1057;
    float _1065 = fma(_1047, _1047, _1041);
    float _1067 = _1055 * (-2.0);
    float _1069 = _765 + (-0.5);
    float _1071 = sqrt(_1065);
    float _1073 = float(_1043);
    float _1075 = fma(_1067, _997, _997);
    float _1077 = _163 + _789;
    float _1079 = float(_1063);
    float _1081 = fma(_871, _1067, _871);
    bool _1083 = !_985;
    int _1085 = _1083 ? 0 : 1;
    float _1087 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1075);
    float _1089 = _1077 + (-1.0);
    float _1091 = _1073 * _1079;
    float _1093 = rsqrt(_1065);
    int _1095 = abs(_1085);
    float _1097 = fma(_1081, _921, _1087);
    float _1099 = float(_1027);
    float _1101 = _767 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1103 = float(_1095);
    float _1105 = _1071 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1107 = _1091 * (-2.0);
    float _1109 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1111 = _163 + (-0.5);
    float _1113 = _1103 * _1099;
    float _1115 = precise::min(_1101, _1105);
    float _1117 = fma(_1107, _995, _995);
    float _1119 = fma(_865, _1107, _865);
    float _1121 = _1113 * (-2.0);
    float _1123 = _1097 * 0.15915493667125701904296875;
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1117);
    float _1127 = _1093 * _1115;
    float _1129 = fma(_1109, _1121, _1109);
    float _1131 = fma(_1121, _999, _999);
    float _1133 = _789 + (-0.5);
    float _1135 = _937 * _1127;
    float _1137 = fma(_1119, _921, _1125);
    float _1139 = _1031 * _1127;
    float _1141 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1131);
    float _1143 = -_1135;
    float _1145 = _937 + _1143;
    float _1147 = _1047 * _1127;
    float _1149 = -_1139;
    float _1151 = _1031 + _1149;
    float _1153 = fma(_1129, _921, _1141);
    float _1155 = _1145 * _1145;
    float _1157 = -_1147;
    float _1159 = _1047 + _1157;
    float _1161 = _1137 * 0.15915493667125701904296875;
    float _1163 = _1153 * 0.15915493667125701904296875;
    float _1165 = fma(_1151, _1151, _1155);
    float _1167 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1169 = _925 + _1167;
    float _1171 = _1123 * 6.283185482025146484375;
    float _1173 = sin(_1171);
    float _1175 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1177 = _931 + _1175;
    float _1179 = fma(_1159, _1159, _1165);
    float _1181 = _1169 * _1169;
    float _1183 = sqrt(_1179);
    float _1185 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1187 = fma(_1177, _1177, _1181);
    float _1189 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1191 = _949 + _1189;
    float _1193 = fma(_1191, _1191, _1187);
    float _1195 = _1123 * 6.283185482025146484375;
    float _1197 = cos(_1195);
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _1201 = _1161 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = _1093 * _1183;
    float _1207 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1185);
    float _1209 = _1161 * 6.283185482025146484375;
    float _1211 = sin(_1209);
    float _1213 = _775 * _1205;
    float _1215 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1207);
    float _1217 = _1213 * _1199;
    float _1219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _1221 = _1163 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1203 * _1197;
    float _1227 = _1203 * _1173;
    float _1229 = _767 * _1205;
    float _1231 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1233 = _1231 * 0.5;
    float _1235 = _1229 * _1219;
    float _1237 = _1163 * 6.283185482025146484375;
    float _1239 = sin(_1237);
    float _1241 = _1211 * _1173;
    float _1243 = _1211 * _1197;
    float _1245 = _1203 * _1223;
    float _1247 = sqrt(_1215);
    float _1249 = _1211 * _1223;
    float _1251 = _1197 * _1223;
    float _1253 = _1245 * _1217;
    float _1255 = _1173 * _1223;
    float _1257 = fma(_1239, _1225, _1241);
    float _1259 = -_1227;
    float _1261 = fma(_1239, _1243, _1259);
    float _1263 = -_1243;
    float _1265 = fma(_1239, _1227, _1263);
    float _1267 = -_1217;
    float _1269 = _1239 * _1267;
    float _1271 = fma(_1257, _1235, _1253);
    float _1273 = sqrt(_1193);
    float _1275 = _1249 * _1217;
    float _1277 = fma(_1251, _1235, _1269);
    float _1279 = fma(_1265, _1233, _1271);
    float _1281 = fma(_1239, _1241, _1225);
    float _1283 = fma(_1261, _1235, _1275);
    float _1285 = fma(_1255, _1233, _1277);
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1289 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1291 = fma(_1281, _1233, _1283);
    float _1293 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1295 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1287);
    float _1297 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1289);
    float _1299 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1301 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1295);
    bool _1303 = _1273 < _1293;
    float _1305 = float(_1303);
    float _1307 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1297);
    float _1309 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1299);
    float _1311 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1313 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1309);
    float _1317 = fma(_1311, _1305, _949);
    float _1319 = -_1139;
    float _1321 = _931 + _1319;
    float _1323 = fma(_1313, _1305, _931);
    float _1325 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1329 = _1317 + _1327;
    float _1331 = -_1147;
    float _1333 = _949 + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1337 = _1323 + _1335;
    float _1339 = fma(_1325, _1305, _925);
    float _1341 = _1329 * _1329;
    float _1343 = fma(_1337, _1337, _1341);
    float _1345 = -_1135;
    float _1347 = _925 + _1345;
    float _1349 = sqrt(_1343);
    float _1351 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1351);
    float _1355 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1353);
    bool _1357 = _1349 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1305;
    float _1361 = _1323;
    float _1363 = _1325;
    float _1365 = _1135;
    float _1367 = _1337;
    float _1369 = _1147;
    if (!_1357)
    {
        _1359 = _1323;
    }
    float _1371 = _1359;
    float _1373 = _1371;
    if (!_1357)
    {
        _1361 = _1317;
    }
    float _1375 = _1361;
    float _1377 = _1375;
    if (!_1357)
    {
        _1363 = _1339;
    }
    float _1379 = _1363;
    bool _1381 = !_1357;
    float _1383 = _1379;
    if (!_1381)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1389 = _1349 + _1387;
        float _1391 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1393 = rsqrt(_1343);
        float _1395 = _1389 * _1385;
        float _1397 = _1395 * 0.15915493667125701904296875;
        float _1399 = _1397 * 6.283185482025146484375;
        float _1401 = cos(_1399);
        float _1403 = _1397 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = _1401 + (-1.0);
        float _1409 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = fma(_1405, _1391, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1413 = fma(_1339, _1401, _1409);
        float _1415 = _1393 * _1411;
        float _1417 = fma(_1337, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1419 = fma(_1329, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1383 = _1413;
        _1373 = _1417;
        _1377 = _1419;
    }
    float _1421 = _1383;
    float _1423 = _1373;
    float _1425 = _1377;
    float _1427 = -_925;
    float _1429 = _1427 + _1421;
    float _1431 = -_931;
    float _1433 = _1431 + _1423;
    float _1435 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1437 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1439 = _1429 * _1429;
    float _1441 = -_949;
    float _1443 = _1441 + _1425;
    float _1445 = 1.0 / _1435;
    float _1447 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1437);
    float _1449 = fma(_1433, _1433, _1439);
    float _1451 = -_1139;
    float _1453 = _1451 + _1423;
    float _1455 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1447);
    float _1457 = fma(_1443, _1443, _1449);
    float _1459 = -_1135;
    float _1461 = _1459 + _1421;
    float _1463 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1465 = sqrt(_1457);
    float _1467 = _1463 + _1435;
    float _1469 = -_1147;
    float _1471 = _1469 + _1425;
    float _1473 = _1467 * _1445;
    float _1475 = _1473 * 0.5;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1479 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1477);
    bool _1481 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan(0.5);
    bool _1489 = _1485 || _1487;
    float _1491 = 1.0 / _1479;
    bool _1493 = _1465 > 0.0;
    bool _1495 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.5);
    bool _1503 = _1499 || _1501;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1507 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1509 = _1433;
    float _1511 = _1461;
    float _1513 = _1421;
    if (!_1493)
    {
        _1505 = _1453;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (!_1493)
    {
        _1365 = _1461;
    }
    float _1519 = _1365;
    float _1521 = _1519;
    if (!_1493)
    {
        _1507 = _1471;
    }
    float _1523 = _1507;
    bool _1525 = !_1493;
    float _1527 = _1523;
    float _1529 = _1523;
    if (!_1525)
    {
        float _1531 = _243 * _243;
        float _1533 = fma(_239, _239, _1531);
        float _1535 = fma(_245, _245, _1533);
        float _1537 = rsqrt(_1457);
        float _1539 = sqrt(_1535);
        float _1541 = _1433 * _1537;
        float _1543 = _1429 * _1537;
        float _1545 = _1443 * _1537;
        bool _1547 = _1539 > 0.0;
        float _1549 = _1537;
        float _1551 = _1539;
        _1367 = _1541;
        if (!_1547)
        {
            _1549 = _1453;
        }
        float _1553 = _1549;
        _1517 = _1553;
        if (!_1547)
        {
            _1551 = _1461;
        }
        float _1555 = _1551;
        _1521 = _1555;
        if (!_1547)
        {
            _1527 = _1471;
        }
        float _1557 = _1527;
        bool _1559 = !_1547;
        _1529 = _1557;
        if (!_1559)
        {
            float _1561 = rsqrt(_1535);
            float _1563 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1565 = _243 * _1561;
            float _1567 = _239 * _1561;
            float _1569 = _1543 * _1565;
            float _1571 = _245 * _1561;
            float _1573 = fma(_1541, _1567, _1569);
            float _1575 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1577 = fma(_1545, _1571, _1573);
            float _1579 = _1577 * _1575;
            float _1581 = fma(_239, _1579, _1453);
            float _1583 = fma(_243, _1579, _1461);
            float _1585 = fma(_245, _1579, _1471);
            _1517 = _1581;
            _1521 = _1583;
            _1529 = _1585;
        }
    }
    float _1587 = _1517;
    float _1589 = _1521;
    float _1591 = _1529;
    float _1593 = _1367;
    float _1595 = _1589;
    float _1597 = _1587;
    float _1599 = _1591;
    float _1601 = _1593;
    if (_1489)
    {
        _1509 = 1.0;
    }
    float _1603 = _1509;
    float _1605 = _1603;
    if (!_1503)
    {
        float _1607 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1609 = _1347 + _1607;
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1613 = _1321 + _1611;
        float _1615 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1617 = _1609 * _1609;
        float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1621 = _1333 + _1619;
        float _1623 = fma(_1613, _1613, _1617);
        float _1625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1627 = fma(_1621, _1621, _1623);
        float _1629 = sqrt(_1627);
        float _1631 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = precise::min(_1629, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1635 = _1633 * _1625;
        float _1637 = -_1321;
        float _1639 = _1637 + _1587;
        float _1641 = _1631 * _1635;
        float _1643 = -_1347;
        float _1645 = _1643 + _1589;
        float _1647 = -_1333;
        float _1649 = _1647 + _1591;
        float _1651 = fma(_1639, _1641, _1321);
        float _1653 = fma(_1645, _1641, _1347);
        float _1655 = fma(_1649, _1641, _1333);
        _1511 = _1625;
        _1595 = _1653;
        _1597 = _1651;
        _1599 = _1655;
    }
    float _1657 = _1511;
    float _1659 = _1595;
    float _1661 = _1597;
    float _1663 = _1599;
    float _1665 = _1657;
    if (_1489)
    {
        _1601 = 1.0;
    }
    float _1667 = _1601;
    float _1669 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1671 = _1491 * _1669;
    float _1673 = _1667;
    if (!_1489)
    {
        float _1675 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1677 = _1675 * 0.15915493667125701904296875;
        float _1679 = _1677 * 6.283185482025146484375;
        float _1681 = cos(_1679);
        float _1683 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1685 = _1683 * 0.15915493667125701904296875;
        float _1687 = _1677 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = 1.0 / _1681;
        float _1693 = _1685 * 6.283185482025146484375;
        float _1695 = cos(_1693);
        float _1697 = _1689 * _1691;
        float _1699 = _1685 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1703;
        float _1707 = _1695 * _1697;
        float _1709 = 1.0 / _1705;
        float _1711 = 1.0 / _1707;
        float _1713 = _1701 * _1711;
        float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1717 = fma(_1671, _1713, _1715);
        float _1719 = _1717 * _1709;
        float _1721 = precise::clamp(_1719, 0.0, 1.0);
        _1513 = _1677;
        _1665 = _1697;
        _1605 = _1721;
    }
    float _1723 = _1513;
    float _1725 = _1665;
    float _1727 = _1605;
    float _1729 = _1723;
    float _1731 = _1725;
    if (!_1489)
    {
        float _1733 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = _1735 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1743 = _1741 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1739;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = 1.0 / _1761;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1767 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1765;
        float _1769 = 1.0 / _1767;
        float _1771 = _1759 * _1763;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1775 = fma(_1671, _1771, _1773);
        float _1777 = _1775 * _1769;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        float _1781 = -_1779;
        float _1783 = _1781 + 1.0;
        _1729 = _1739;
        _1731 = _1761;
        _1673 = _1783;
    }
    float _1785 = _1729;
    float _1787 = _1731;
    float _1789 = _1673;
    float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1793 = _1659 + _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1797 = _1661 + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1801 = _1663 + _1799;
    float _1803 = _1793 * _1793;
    float _1805 = fma(_1797, _1797, _1803);
    float _1807 = fma(_1801, _1801, _1805);
    float _1809 = rsqrt(_1807);
    float _1811 = sqrt(_1807);
    float _1813 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1815 = _1797 * _1813;
    float _1817 = _1801 * _1813;
    float _1819 = _1815 * _1815;
    float _1821 = _1817 * _1817;
    float _1823 = _1819 + _1821;
    float _1825 = sqrt(_1823);
    bool _1827 = _1825 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1831 = _1825 + _1829;
    float _1833 = _1801;
    float _1835 = _1785;
    float _1837 = _1831;
    float _1839 = _1813;
    float _1841 = _1787;
    float _1843 = _1823;
    if (_1827)
    {
        float _1845 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1833 = _1845;
    }
    float _1847 = _1833;
    if (_1827)
    {
        float _1849 = rsqrt(_1823);
        _1835 = _1849;
    }
    float _1851 = _1835;
    float _1853 = _1851;
    if (_1827)
    {
        float _1855 = _1831 * _1847;
        _1837 = _1855;
    }
    float _1857 = _1837;
    if (_1827)
    {
        float _1859 = _1857 * 0.15915493667125701904296875;
        _1369 = _1859;
    }
    float _1861 = _1369;
    float _1863 = _1847;
    float _1865 = _1861;
    if (_1827)
    {
        float _1867 = _1861 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        _1863 = _1869;
    }
    float _1871 = _1863;
    float _1873 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1875 = precise::max(0.0, _1873);
    float _1877 = _1803;
    if (_1827)
    {
        float _1879 = _1861 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        _1877 = _1881;
    }
    float _1883 = _1877;
    float _1885 = -_1813;
    float _1887 = -_1875;
    float _1889 = fma(_1793, _1885, _1887);
    if (_1827)
    {
        float _1891 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _1891;
    }
    float _1893 = _1839;
    float _1895 = _1893;
    if (!_1827)
    {
        _1865 = _1821;
    }
    float _1897 = _1865;
    float _1899 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1901 = fma(_1321, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1903 = _1871;
    float _1905 = _1897;
    if (_1827)
    {
        float _1907 = fma(_1871, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1841 = _1907;
    }
    float _1909 = _1841;
    float _1911 = _1909;
    if (!_1827)
    {
        _1903 = _1815;
    }
    float _1913 = _1903;
    float _1915 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1899);
    float _1917 = floor(_1901);
    float _1919 = _1913;
    if (_1827)
    {
        float _1921 = _1883 + (-1.0);
        _1895 = _1921;
    }
    float _1923 = _1895;
    float _1925 = 0.0;
    float _1927 = _1923;
    if (_1827)
    {
        float _1929 = _1851 * _1909;
        _1925 = _1929;
    }
    float _1931 = _1925;
    if (!_1827)
    {
        _1853 = _1889;
    }
    float _1933 = _1853;
    float _1935 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1915);
    float _1937 = _1933;
    if (_1827)
    {
        float _1939 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1843 = _1939;
    }
    float _1941 = _1843;
    if (_1827)
    {
        float _1943 = _1815 * _1931;
        _1919 = _1943;
    }
    float _1945 = _1919;
    if (!_1827)
    {
        _1927 = _1817;
    }
    float _1947 = _1927;
    float _1949 = _1947;
    if (_1827)
    {
        float _1951 = _1817 * _1931;
        _1949 = _1951;
    }
    float _1953 = _1949;
    if (!_1827)
    {
        _1911 = _1819;
    }
    float _1955 = _1911;
    float _1957 = _1955;
    if (_1827)
    {
        float _1959 = fma(_1889, _1883, _1941);
        _1937 = _1959;
    }
    float _1961 = _1937;
    if (_1827)
    {
        float _1963 = _1945 * _1945;
        _1957 = _1963;
    }
    float _1965 = _1957;
    if (_1827)
    {
        float _1967 = _1953 * _1953;
        _1905 = _1967;
    }
    float _1969 = _1905;
    float _1971 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1973 = fma(_1961, _1961, _1965);
    float _1975 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1977 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1971);
    float _1979 = _1973 + _1969;
    float _1981 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1985 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1983);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1975);
    float _1991 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1977);
    float _1993 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1981);
    float _1995 = rsqrt(_1979);
    float _1997 = -_1987;
    float _1999 = _1997 + 1.0;
    float _2001 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1989);
    float _2003 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1993);
    float _2005 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2007 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2009 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2011 = abs(_1999);
    float _2013 = log2(_2011);
    float _2015 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2021 = fma(_1333, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2015);
    float _2025 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2027 = -_2019;
    float _2029 = fma(_2027, _2017, 1.0);
    float _2031 = _1995 * _1945;
    float _2033 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2023);
    float _2035 = _1995 * _1961;
    float _2037 = floor(_2021);
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2041 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2033);
    float _2043 = _1995 * _1953;
    float _2045 = -_1917;
    float _2047 = _1901 + _2045;
    float _2049 = -_2039;
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2049);
    float _2053 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2055 = log2(_2029);
    float _2057 = -_2043;
    float _2059 = fma(_2057, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2051);
    float _2061 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2063 = fma(_1423, 6.2500002968590706586837768554688e-05, 0.5);
    float _2065 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2067 = exp2(_2053);
    float _2069 = fma(_2059, -0.5, 0.5);
    float _2071 = -_2037;
    float _2073 = _2021 + _2071;
    float _2075 = fma(_2059, 0.5, 0.5);
    float _2077 = fma(_1425, 6.2500002968590706586837768554688e-05, 0.5);
    float _2079 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2061);
    float _2081 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2065);
    float _2083 = fma(_2075, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2085 = 1.0 / _2041;
    float _2087 = _2035 + 1.0;
    float _2089 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2079);
    float _2091 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2081);
    float _2093 = fma(_2075, _2083, -0.212114393711090087890625);
    float _2095 = _2055 * 0.693147182464599609375;
    float _2097 = sqrt(_2069);
    float _2099 = -_2035;
    float _2101 = fma(_2067, _2087, _2099);
    float _2103 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2089);
    float _2105 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2091);
    float _2107 = fma(_2075, _2093, 1.570728778839111328125);
    float _2109 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2111 = fma(_2101, 0.5, 0.5);
    float _2113 = _2103 * _2085;
    float _2115 = _2105 * _2085;
    float2 _6676 = float2(_2047, _2073);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6676, float2(0.0), isnan(_6676)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6676, float2(0.0), isnan(_6676)), level(0.0)).x;
    float _2119 = fma(_2115, -0.5, 0.5);
    float _2121 = _2097 * 0.636619746685028076171875;
    float _2123 = fma(_2113, 0.5, 0.5);
    float _2125 = -_2107;
    float _2127 = fma(_2121, _2125, 1.0);
    float3 _6699 = float3(_2123, _2119, _2109);
    float _2129 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6699, float3(0.0), isnan(_6699)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6699, float3(0.0), isnan(_6699)), level(0.0)).x;
    float3 _6710 = float3(_2123, _2119, _2109);
    float4 _2132 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6710, float3(0.0), isnan(_6710)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6710, float3(0.0), isnan(_6710)), level(0.0)).xyzw;
    float _2134 = _2132.x;
    float _2136 = _2132.y;
    float _2138 = _2132.z;
    float _2140 = _2132.w;
    float2 _6726 = float2(_2127, _2111);
    float3 _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6726, float2(0.0), isnan(_6726)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6726, float2(0.0), isnan(_6726)), level(0.0)).xyz;
    float _2146 = _2144.x;
    float _2148 = _2144.y;
    float _2150 = _2144.z;
    float2 _6740 = float2(_2063, _2077);
    float3 _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6740, float2(0.0), isnan(_6740)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6740, float2(0.0), isnan(_6740)), level(0.0)).xyz;
    float _2154 = _2152.x;
    float _2156 = _2152.y;
    float _2158 = _2152.z;
    float _2160 = float(uint(_815));
    float _2162 = trunc(_913);
    int _2164 = int(_2162);
    int _2166 = ~_815;
    int _2168 = _2166 + 1;
    out.m_76.x = _709;
    out.m_76.y = _711;
    out.m_76.z = _715;
    out.m_76.w = _723;
    int _2170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2172 = _2170 != 0;
    float _2174 = -_915;
    float _2176 = _2174 + 1.0;
    float _2178 = -_917;
    float _2180 = _2178 + 1.0;
    bool _2182 = _765 > 0.5;
    float _2184 = 1.0 / _2160;
    int _2186 = ~_815;
    int _2188 = _2186 + 1;
    out.m_78.x = _1321;
    out.m_78.y = _1347;
    out.m_78.z = _1333;
    float _2190 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_80.w = _1115;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2196 = float(uint(_2164));
    float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2200 = _2198 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2204 = _2202 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2206 = float(_2164);
    float _2208 = 1.0 / _2194;
    int _2210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2212 = _2210 != 0;
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2214;
    int _2218 = as_type<int>(_2184) + (-2);
    float _2220 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2222 = _2220 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    out.m_82.x = _1229;
    float _2224 = as_type<float>(_2218) * _2196;
    float _2226 = 1.0 / _2200;
    bool _2228 = _163 > 0.5;
    out.m_84.x = _1661;
    out.m_84.y = _1659;
    out.m_84.z = _1663;
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2234 = abs(_953);
    float _2236 = _2216 * _2208;
    float _2238 = trunc(_2224);
    float _2240 = precise::max(_2238, 0.0);
    uint _2243 = uint(_2240);
    int _2245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2247 = _2245 != 0;
    int _2249 = ~_815;
    int _2251 = _2249 + 1;
    float _2253 = 1.0 / _2204;
    float _2255 = _2222 * _2226;
    int _2257 = _2188 * int(_2243);
    int _2259 = _2257 + _2164;
    float _2261 = 1.0 / _2232;
    float _2263 = float(uint(_2259));
    float _2265 = exp2(_2190);
    float _2267 = as_type<float>(_2218) * _2263;
    bool _2269 = !_2212;
    float _2271 = _2269 ? 7.345489978790283203125 : 1.0;
    float _2273 = _2271 * _163;
    float _2275 = trunc(_2267);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2283 = _2281 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2285 = floor(_2273);
    float _2287 = -_2265;
    float _2289 = _2287 + 1.0;
    float _2291 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2293 = int(_2243) + int(_2279);
    float _2295 = 1.0 / _2283;
    bool _2297 = _2206 >= _879;
    bool _2299 = isnan(_2206);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(_879);
    bool _2305 = _2301 || _2303;
    float _2307 = float(_2305);
    int _2309 = _2168 * _2293;
    int _2311 = _2309 + _2164;
    float _2313 = -_2285;
    float _2315 = _2273 + _2313;
    float _2317 = trunc(_2307);
    int _2319 = int(_2317);
    bool _2321 = uint(_2311) >= uint(_815);
    float _2323 = _2315 * _879;
    float _2325 = _893 * _173;
    float _2327 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2327;
    bool _2331 = !_2321;
    int _2333 = _2331 ? 0 : (-1);
    bool _2335 = _815 == 0;
    float _2337 = _2329 * _2253;
    int _2339 = ~_2293;
    int _2341 = _2339 + _2333;
    int _2343 = _2341 + 1;
    float _2345 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2347 = _2345 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2349 = trunc(_2323);
    int _2351 = int(_2349);
    int _2353 = _815 * _2343;
    int _2355 = _2353 + _2164;
    int _2357 = ~_2319;
    int _2359 = _2357 + 1;
    int _2361 = _2359 + 1;
    float _2363 = _2347 * _2295;
    bool _2365 = !_2247;
    int _2367 = _2365 ? 0 : 1;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2369;
    bool _2373 = !_2335;
    int _2375 = _2373 ? _2355 : (-1);
    float _2377 = trunc(_2325);
    int _2379 = int(_2377);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2383 = _2381 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2385 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2387 = isnan(_741);
    bool _2389 = _2385 || _2387;
    bool _2391 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2393 = _2389 || _2391;
    float _2395 = float(_2393);
    int _2397 = _2375 * _2361;
    int _2399 = abs(_2367);
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2405 = _815 + (-1);
    float _2407 = -_2395;
    float _2409 = _2407 + 1.0;
    int _2411 = abs(_929);
    float _2413 = 1.0 / _2403;
    float _2415 = _2371 * _2261;
    int _2417 = _2319 * _2405;
    int _2419 = _2417 + _2397;
    bool _2421 = !_2172;
    int _2423 = _2421 ? 0 : 1;
    int _2425 = _2351 * _2399;
    int _2427 = _2425 + _2164;
    bool _2429 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2431 = isnan(_741);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    int _2441 = _2419 * _2411;
    int _2443 = abs(_957);
    int _2445 = abs(_2423);
    int _2447 = _2379 * _2234;
    int _2449 = _2447 + _2441;
    bool _2451 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2453 = isnan(_741);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2459 = _2455 || _2457;
    float _2461 = float(_2459);
    float _2463 = _2383 * _2413;
    bool _2465 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2467 = isnan(_741);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2473 = _2469 || _2471;
    float _2475 = float(_2473);
    int _2477 = _2427 * _2443;
    int _2479 = _2477 + _2449;
    bool _2481 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2483 = isnan(_741);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = -_2461;
    float _2495 = _2493 + 1.0;
    float _2497 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2503 = _741 + _2501;
    int _2505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2507 = _2505 != 0;
    float _2509 = _2491 * _2495;
    int _2511 = _2351 * _2445;
    int _2513 = _2511 + _2479;
    float _2515 = -_2491;
    float _2517 = _2515 + 1.0;
    bool _2519 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2521 = isnan(_741);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = -_2439;
    float _2533 = _2531 + 1.0;
    float _2535 = 1.0 / _2499;
    float _2537 = float(uint(_2513));
    float _2539 = _2439 * _2517;
    bool _2541 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2543 = isnan(_741);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2549 = _2545 || _2547;
    float _2551 = float(_2549);
    float _2553 = _2529 * _2533;
    float _2555 = -_2529;
    float _2557 = _2555 + 1.0;
    float _2559 = as_type<float>(_2218) * _2537;
    bool _2561 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2563 = isnan(_741);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    float _2573 = -_2551;
    float _2575 = _2573 + 1.0;
    float _2577 = _2551 * _2557;
    float _2579 = fma(_2236, _2503, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2581 = trunc(_2559);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    float _2587 = _2571 * _2575;
    float _2589 = -_2571;
    float _2591 = _2589 + 1.0;
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2595 = _741 + _2593;
    float _2597 = _2395 * _2591;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2599;
    float _2603 = _2475 * _2409;
    float _2605 = fma(_2255, _2595, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2607 = _2601 * _2535;
    float _2609 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2611 = _741 + _2609;
    float _2613 = _2579 * _2603;
    float _2615 = -_2475;
    float _2617 = _2615 + 1.0;
    float _2619 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2621 = _741 + _2619;
    int _2623 = _2251 * int(_2585);
    int _2625 = _2623 + _2513;
    float _2627 = fma(_2337, _2611, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2629 = fma(_2617, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2613);
    float _2631 = fma(_2363, _2621, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2635 = _741 + _2633;
    float _2637 = float(uint(_2625));
    float _2639 = fma(_2605, _2597, _2629);
    float _2641 = float(uint(_2427));
    float _2643 = fma(_2415, _2635, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2645 = -_223;
    int _2647 = _2228 ? as_type<int>(_2645) : as_type<int>(_223);
    float _2649 = as_type<float>(_2218) * _2637;
    float _2651 = fma(_2627, _2587, _2639);
    float _2653 = as_type<float>(_2218) * _2641;
    bool _2655 = !_2507;
    float _2657 = _2655 ? _223 : as_type<float>(_2647);
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2661 = _741 + _2659;
    float _2663 = fma(_2631, _2577, _2651);
    float _2665 = trunc(_2649);
    float _2667 = precise::max(_2665, 0.0);
    uint _2669 = uint(_2667);
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2673 = _741 + _2671;
    float _2675 = _2657 + 0.5;
    float _2677 = fma(_2643, _2553, _2663);
    float _2679 = _1293 + (-10.0);
    float _2681 = fma(_2607, _2661, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2683 = fma(_2675, (*spvDescriptorSet0.vp_c9)._m0[80].x, _883);
    int _2685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2687 = _2685 != 0;
    float _2689 = trunc(_2653);
    float _2691 = precise::max(_2689, 0.0);
    uint _2693 = uint(_2691);
    float _2695 = -_227;
    int _2697 = _2182 ? as_type<int>(_2695) : as_type<int>(_227);
    float _2699 = fma(_2463, _2673, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2701 = ~_815;
    int _2703 = _2701 + 1;
    float _2705 = -_2176;
    float _2707 = fma(_2657, _2705, _2683);
    float _2709 = precise::max(_1273, _2679);
    float _2711 = fma(_2699, _2539, _2677);
    bool _2713 = !_2687;
    float _2715 = _2713 ? _227 : as_type<float>(_2697);
    float _2717 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2719 = int(_2585) + int(_2669);
    float _2721 = fma(_2681, _2509, _2711);
    float _2723 = precise::min(_1293, _2709);
    float _2725 = _2715 + (-0.5);
    int _2727 = ~_815;
    int _2729 = _2727 + 1;
    int _2731 = _2703 * _2719;
    int _2733 = _2731 + _2513;
    float _2735 = -_2725;
    float _2737 = -_909;
    float _2739 = fma(_2735, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2737);
    float _2741 = -_2679;
    float _2743 = _2741 + _2723;
    int _2745 = _2729 * int(_2693);
    int _2747 = _2745 + _2427;
    bool _2749 = uint(_2733) >= uint(_815);
    float _2751 = fma(_2715, _2180, _2739);
    float _2753 = fma(_2743, -0.100000001490116119384765625, 1.0);
    int _2755 = ~_815;
    int _2757 = _2755 + 1;
    float _2759 = abs(_1671);
    float _2761 = log2(_2759);
    bool _2763 = !_2749;
    int _2765 = _2763 ? 0 : (-1);
    out.m_86.x = _2707;
    out.m_86.y = _2751;
    float _2767 = float(uint(_2747));
    float _2769 = _707 * _2753;
    int _2771 = ~_2719;
    int _2773 = _2771 + _2765;
    int _2775 = _2773 + 1;
    float _2777 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2781 = _2779 != 0;
    float _2783 = as_type<float>(_2218) * _2767;
    out.m_88.x = _717;
    out.m_88.y = _719;
    out.m_88.z = _721;
    out.m_88.w = _2769;
    int _2785 = _815 * _2775;
    int _2787 = _2785 + _2513;
    float _2789 = -_1239;
    float _2791 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2777);
    float _2793 = trunc(_2783);
    float _2795 = precise::max(_2793, 0.0);
    uint _2797 = uint(_2795);
    float _2799 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2801 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2803 = !_2335;
    int _2805 = _2803 ? _2787 : (-1);
    float _2807 = _2761 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2809 = -_1239;
    float _2811 = fma(_2809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2799);
    float _2813 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2815 = _2805 & 3;
    bool _2817 = _2815 != 0;
    float _2819 = fma(_2461, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2721);
    int _2821 = _2805 >> 31;
    float _2823 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2811);
    float _2825 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2827 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2829 = _2821 & 3;
    float _2831 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2791);
    float _2833 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2825);
    int _2835 = int(_2693) + int(_2797);
    float _2837 = _1265 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2839 = _2805 + _2829;
    float _2841 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2843 = exp2(_2807);
    int _2845 = _2757 * _2835;
    int _2847 = _2845 + _2427;
    int _2849 = _2839 >> 2;
    float _2851 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2837);
    float _2853 = _2841 * _2823;
    int _2855 = _2817 ? 0 : 1;
    float _2857 = -_1239;
    float _2859 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2813);
    int _2861 = _2849 << 4;
    int _2863 = _2861 + 368;
    float _2865 = _2841 * _2831;
    bool _2867 = uint(_2847) >= uint(_815);
    float _2869 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2801);
    float _2871 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2827);
    uint _2873 = uint(int(uint(_2863) >> uint(2)));
    uint _2875 = uint(int(uint(int(_2873)) >> uint(2)));
    int _2877 = int(_2873) & 3;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[int(_2875)][_2877];
    int _2881 = int(_2873) + 1;
    uint _2883 = uint(int(uint(_2881) >> uint(2)));
    int _2885 = _2881 & 3;
    float _2887 = (*spvDescriptorSet0.vp_c9)._m0[int(_2883)][_2885];
    float _2889 = _1265 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2891 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2869);
    bool _2893 = !_2867;
    int _2895 = _2893 ? 0 : (-1);
    float _2897 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2859);
    float _2899 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2889);
    int _2901 = _2805 & 3;
    bool _2903 = _2901 != 0;
    float _2905 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2851);
    int _2907 = _2863 + 8;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    uint _2911 = uint(int(uint(int(_2909)) >> uint(2)));
    int _2913 = int(_2909) & 3;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[int(_2911)][_2913];
    int _2917 = int(_2909) + 1;
    uint _2919 = uint(int(uint(_2917) >> uint(2)));
    int _2921 = _2917 & 3;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[int(_2919)][_2921];
    int _2925 = ~_2855;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    float _2931 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2833);
    bool _2933 = uint(_2901) > 1u;
    float _2935 = fma(_2717, _2891, _2853);
    int _2937 = ~_2835;
    int _2939 = _2937 + _2895;
    int _2941 = _2939 + 1;
    float _2943 = in.m_90.x;
    bool _2945 = uint(_2901) >= 2u;
    float _2947 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2899);
    bool _2949 = _1671 <= 8000.0;
    bool _2951 = isnan(_1671);
    bool _2953 = _2949 || _2951;
    bool _2955 = isnan(8000.0);
    bool _2957 = _2953 || _2955;
    float _2959 = float(_2957);
    int _2961 = _815 * _2941;
    int _2963 = _2961 + _2427;
    bool _2965 = !_2903;
    int _2967 = _2965 ? 0 : 1;
    float _2969 = _2841 * _2897;
    bool _2971 = _2901 != 3;
    float _2973 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2871);
    int _2975 = abs(_2967);
    float _2977 = -_2117;
    float _2979 = _2977 + 1.0;
    int _2981 = _2929;
    if (!_2933)
    {
        int _2983 = ~_2855;
        int _2985 = _2983 + 1;
        _2981 = _2985;
    }
    int _2987 = _2981;
    float _2989 = fma(_2717, _2931, _2865);
    bool _2991 = _2901 != 3;
    float _2993 = fma(_2717, _2973, _2969);
    int _2995 = abs(_2987);
    float _2997 = _1265 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2999 = _2945 ? 0 : 1;
    float _3001 = _2291 * _2129;
    int _3003 = ~_2995;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    float _3009 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2997);
    int _3011 = ~_2999;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    out.m_92.x = _2819;
    float _3017 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3009);
    bool _3019 = !_2971;
    int _3021 = _3019 ? 0 : (-1);
    int _3023 = _3015;
    if (_2991)
    {
        int _3025 = ~_2999;
        int _3027 = _3025 + 1;
        _3023 = _3027;
    }
    int _3029 = _3023;
    float _3031 = fma(_2843, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3033 = precise::clamp(_3031, 0.0, 1.0);
    int _3035 = abs(_3021);
    int _3037 = abs(_3029);
    int _3039 = _3007 * as_type<int>(_2887);
    bool _3041 = !_2781;
    int _3043 = _3041 ? 0 : 1;
    int _3045 = ~_2975;
    int _3047 = _3045 + 1;
    int _3049 = _3047 + 1;
    int _3051 = abs(_3043);
    int _3053 = _3049 * as_type<int>(_2879);
    int _3055 = _3053 + _3039;
    float _3057 = fma(_3033, -2.0, 3.0);
    int _3059 = ~_3037;
    int _3061 = _3059 + 1;
    int _3063 = _3061 + 1;
    float _3065 = _3033 * _3033;
    int _3067 = ~_3035;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    int _3073 = _3063 * as_type<int>(_2915);
    int _3075 = _3073 + _3055;
    float _3077 = _3065 * _3057;
    float _3079 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3081 = ~_3051;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    int _3087 = _3071 * as_type<int>(_2923);
    int _3089 = _3087 + _3075;
    float _3091 = -_3077;
    float _3093 = _3091 + 1.0;
    float _3095 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3079);
    bool _3097 = !_2335;
    int _3099 = _3097 ? _2963 : (-1);
    int _3101 = _3089 * _3085;
    float _3103 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3077);
    float _3105 = _2041 * 0.5;
    float _3107 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3095);
    int _3109 = _3099 * _3051;
    int _3111 = _3109 + _3101;
    float _3113 = _2959 * _3103;
    float _3115 = fma(_2105, -0.5, _3105);
    float _3117 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3107);
    float _3119 = _2905 + _2935;
    float _3121 = _2947 + _2989;
    float _3123 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3125 = _3117 + _2041;
    float _3127 = _2103 + _2041;
    float _3129 = _2979 * _3123;
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = float(_3111);
    float _3135 = _3125 * 0.5;
    float _3137 = _3127 * 0.5;
    float _3139 = -_3131;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_94.x = _3133;
    float _3143 = _2150 * _3001;
    float _3145 = _3017 + _2993;
    float _3147 = _3141 * _2943;
    out.m_96.x = _3137;
    out.m_96.y = _3115;
    out.m_96.z = _3135;
    out.m_96.w = _2041;
    float _3149 = fma(_2140, _3143, _2138);
    bool _3151 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3153 = isnan(_1811);
    bool _3155 = _3151 || _3153;
    bool _3157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3159 = _3155 || _3157;
    float _3161 = _3147 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3163 = _2140 * _3001;
    float _3165 = in.m_90.z;
    float _3167 = fma(_2146, _3163, _2134);
    float _3169 = fma(_2148, _3163, _2136);
    out.gl_Position.x = _2103;
    out.gl_Position.y = _2105;
    out.gl_Position.z = _3117;
    out.gl_Position.w = _2041;
    float _3171 = _1727 * _1789;
    float _3173 = -_2291;
    float _3175 = _3173 + 1.0;
    out.m_98.x = _2154;
    out.m_98.y = _2156;
    out.m_98.z = _2158;
    float _3177 = _3171 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3179 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _3181 = _2041;
    float _3183 = _3115;
    float _3185 = _3175;
    float _3187 = _3177;
    if (!_3159)
    {
        _3179 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3189 = _3179;
    float _3191 = _2140 * _3175;
    out.m_100.x = _3161;
    float _3193 = _3189;
    float _3195 = _3189;
    if (!_3159)
    {
        _3181 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3197 = _3181;
    float _3199 = _3197;
    float _3201 = _3197;
    if (!_3159)
    {
        _3183 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3203 = _3183;
    out.m_102.x = _3167;
    out.m_102.y = _3169;
    out.m_102.z = _3149;
    out.m_102.w = _3191;
    float _3205 = _3203;
    float _3207 = _3203;
    if (!_3159)
    {
        _3185 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3209 = _3185;
    out.m_104.x = _3119;
    out.m_104.y = _3121;
    out.m_104.z = _3145;
    float _3211 = _3177 * _3165;
    float _3213 = _3165;
    float _3215 = _3209;
    float _3217 = _3209;
    if (!_3159)
    {
        _3213 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3219 = _3213;
    float _3221 = _3219;
    float _3223 = _3219;
    if (!_3159)
    {
        _3187 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3225 = _3187;
    bool _3227 = !_3159;
    float _3229 = _3225;
    float _3231 = _3225;
    if (!_3227)
    {
        bool _3233 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3235 = isnan(_1811);
        bool _3237 = _3233 || _3235;
        bool _3239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3241 = _3237 || _3239;
        if (!_3241)
        {
            float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3245 = _1811 + _3243;
            float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3249 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3247;
            float _3251 = 1.0 / _3249;
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3267 = _3265 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3271 = _3269 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3273 = _3245 * _3251;
            float _3275 = precise::clamp(_3273, 0.0, 1.0);
            float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3281 = fma(_3275, _3255, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3283 = fma(_3275, _3279, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3285 = fma(_3275, _3259, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3287 = fma(_3275, _3263, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3289 = fma(_3275, _3267, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3291 = fma(_3275, _3271, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3201 = _3283;
            _3217 = _3289;
            _3195 = _3281;
            _3207 = _3287;
            _3223 = _3285;
            _3231 = _3291;
            _3293 = true;
        }
        else
        {
            bool _3295 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3297 = isnan(_1811);
            bool _3299 = _3295 || _3297;
            bool _3301 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3303 = _3299 || _3301;
            if (!_3303)
            {
                _3193 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3305 = _3193;
            _3195 = _3305;
            if (!_3303)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3307 = _3199;
            _3201 = _3307;
            if (!_3303)
            {
                _3221 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3309 = _3221;
            _3223 = _3309;
            if (!_3303)
            {
                _3205 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3311 = _3205;
            _3207 = _3311;
            if (!_3303)
            {
                _3215 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3313 = _3215;
            _3217 = _3313;
            if (!_3303)
            {
                _3229 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3315 = _3229;
            bool _3317 = !_3303;
            _3231 = _3315;
            if (!_3317)
            {
                bool _3319 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3321 = isnan(_1811);
                bool _3323 = _3319 || _3321;
                bool _3325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3327 = _3323 || _3325;
                if (!_3327)
                {
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3331 = _1811 + _3329;
                    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3335 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3333;
                    float _3337 = 1.0 / _3335;
                    float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3341 = _3339 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3349 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3351 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3353 = _3351 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3355 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3357 = _3355 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3359 = _3331 * _3337;
                    float _3361 = precise::clamp(_3359, 0.0, 1.0);
                    float _3363 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3365 = _3363 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3367 = fma(_3361, _3341, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3369 = fma(_3361, _3365, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3371 = fma(_3361, _3345, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3373 = fma(_3361, _3349, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3375 = fma(_3361, _3353, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3377 = fma(_3361, _3357, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3201 = _3369;
                    _3217 = _3375;
                    _3195 = _3367;
                    _3207 = _3373;
                    _3223 = _3371;
                    _3231 = _3377;
                    _3293 = true;
                }
                else
                {
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3217 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3195 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3207 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3223 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3231 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3293 = false;
    float _3379 = _3201;
    float _3381 = _3217;
    float _3383 = _3195;
    float _3385 = _3207;
    float _3387 = _3223;
    float _3389 = _3231;
    float _3391 = _3211 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3393 = fma(_3121, -0.5, 0.5);
    float _3395 = precise::clamp(_3393, 0.0, 1.0);
    float _3397 = -_3379;
    float _3399 = _3397 + _3381;
    float _3401 = -_3383;
    float _3403 = _3401 + _3385;
    out.m_55.x = _3391;
    float _3405 = fma(_3395, _3399, _3379);
    float _3407 = -_3387;
    float _3409 = _3407 + _3389;
    float _3411 = fma(_3395, _3403, _3383);
    float _3413 = _3405 * 0.586610972881317138671875;
    bool _3415 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3417 = fma(_3395, _3409, _3387);
    out.m_106.x = 0.0;
    float _3419 = fma(_3411, 0.298911988735198974609375, _3413);
    bool _3421 = _1727 > 0.0;
    bool _3423 = isnan(_1727);
    bool _3425 = _3421 || _3423;
    bool _3427 = isnan(0.0);
    bool _3429 = _3425 || _3427;
    float _3431 = fma(_3417, 0.114477999508380889892578125, _3419);
    bool _3433 = _1789 <= 0.0;
    bool _3435 = !_3429;
    bool _3437 = _3433 || _3435;
    float _3439 = -_3431;
    float _3441 = _3411 + _3439;
    float _3443 = -_3431;
    float _3445 = _3405 + _3443;
    float _3447 = -_3431;
    float _3449 = _3417 + _3447;
    float _3451 = fma(_3441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3431);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3431);
    float _3455 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3431);
    bool _3457 = !_3415;
    if (!_3457)
    {
        float _3459 = -_1659;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3463 = -_1661;
        float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3467 = -_1663;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3471 = _3461 * _3461;
        float _3473 = fma(_3465, _3465, _3471);
        float _3475 = fma(_3469, _3469, _3473);
        float _3477 = sqrt(_3475);
        float _3479 = rsqrt(_3475);
        float _3481 = -_3477;
        float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3485 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        float _3489 = _3465 * _3479;
        float _3491 = _3461 * _3479;
        float _3493 = abs(_3487);
        float _3495 = log2(_3493);
        float _3497 = _3469 * _3479;
        float _3499 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3501 = _3121 * _3491;
        float _3503 = -_3491;
        float _3505 = -_3499;
        float _3507 = fma(_3503, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3505);
        float _3509 = fma(_3119, _3489, _3501);
        float _3511 = -_3497;
        float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3507);
        float _3515 = fma(_3145, _3497, _3509);
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3521 = _3513 + _3519;
        float _3523 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3525 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = exp2(_3523);
        float _3531 = _3529 * _3527;
        float _3533 = _3517 * _3531;
        float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3537 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3535;
        out.m_106.y = _3537;
        out.m_106.z = _3539;
    }
    out.m_80.x = _3451;
    out.m_80.y = _3453;
    out.m_80.z = _3455;
    if (!_3437)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _3541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3541;
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
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3293 = false;
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
    float _139 = as_type<float>(_127);
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
        float _3610 = as_type<float>(_149);
        out.gl_Position.z = _3610;
    }
    if (!_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    if (_171)
    {
        float _177 = _175 * 5.0;
        _151 = as_type<int>(_177);
    }
    int _179 = _151;
    float _181 = _131 * _173;
    out.m_59.x = _163;
    float _183 = _181;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3675 = as_type<float>(_179);
        out.gl_Position.z = _3675;
    }
    out.m_53.x = _181;
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_217;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _189 * _195;
    float _231 = _189 * _201;
    float _233 = fma(_187, _193, _229);
    float _235 = _189 * _207;
    float _237 = fma(_187, _199, _231);
    float _239 = fma(_191, _197, _233);
    float _241 = fma(_187, _205, _235);
    float _243 = fma(_191, _203, _237);
    float _245 = fma(_191, _209, _241);
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
        _263 = _181;
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
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -_283;
    float _299 = _297 + 1.0;
    float _301 = in.m_72.x;
    float _303 = in.m_72.y;
    bool _305 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_267);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = 1.0 / _291;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _321 = 1.0 / _295;
    float _323 = _271 * _317;
    bool _325 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_267);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = _335 * _299;
    float _347 = -_335;
    float _349 = _347 + 1.0;
    float _351 = _287 * _321;
    float _353 = fma(_339, _323, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = fma(_343, _323, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _357 = _315 * _349;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = -_315;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _371 = _353 * _357;
    float _373 = _355 * _357;
    float _375 = fma(_361, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = fma(_369, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _379 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _383 = fma(_375, _345, _379);
    float _385 = fma(_377, _345, _381);
    float _387 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _389 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].y, _385);
    float _391 = _387 * _301;
    float _393 = _389 * _303;
    bool _395 = !_319;
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
        _411 = _181;
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
    float _461 = _447 * _451;
    float _463 = -_447;
    float _465 = _463 + 1.0;
    float _467 = _419 * _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _469;
    float _473 = fma(_455, _467, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = fma(_471, _467, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _481 = _473 * _461;
    float _483 = fma(_477, _467, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _485 = _479 * _461;
    float _487 = _483 * _461;
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _491 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[107].y, _487);
    float _493 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _495 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].x, _489);
    float _497 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].y, _491);
    float _499 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[108].z, _493);
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
        _517 = _181;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _525 = _521 + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _541 = isnan(_521);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _529;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _557 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _559 = isnan(_521);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _571 = 1.0 / _537;
    float _573 = _533 * _551;
    bool _575 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _577 = isnan(_521);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _555;
    float _589 = -_549;
    float _591 = _589 + 1.0;
    float _593 = fma(_573, _525, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _599 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _601 = isnan(_521);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = _585 * _591;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _621 = 1.0 / _597;
    float _623 = -_609;
    float _625 = _623 + 1.0;
    float _627 = _567 * _613;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _629;
    float _633 = _619 * _571;
    float _635 = _549 * _625;
    float _637 = _593 * _627;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _521 + _639;
    float _643 = -_567;
    float _645 = _643 + 1.0;
    bool _647 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _649 = isnan(_521);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _631 * _587;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _667 = _521 + _665;
    float _669 = fma(_633, _641, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _671 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[115].x, _637);
    float _673 = -_657;
    float _675 = _673 + 1.0;
    float _677 = _663 * _621;
    float _679 = fma(_659, _667, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _521 + _681;
    float _685 = fma(_669, _615, _671);
    float _687 = _609 * _675;
    float _689 = fma(_677, _683, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _691 = fma(_679, _635, _685);
    float _693 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _695 = fma(_689, _687, _691);
    float _697 = _495 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _699 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _703 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[119].x, _695);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _709 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _715 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _703 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _725 = !_569;
    if (!_725)
    {
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _729 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _183 = _739;
    }
    float _741 = _183;
    float _743 = in.m_48.x;
    float _745 = in.m_48.y;
    float _747 = in.m_48.z;
    float _749 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _751 = log2(_749);
    float _753 = _163 * 2.0;
    bool _755 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _763 = _759 || _761;
    float _765 = in.m_57.y;
    float _767 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _769 = in.m_68.w;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _773 = int(_771);
    float _775 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _777 = in.m_66.w;
    float _779 = in.m_70.w;
    float _781 = floor(_753);
    float _783 = _751 * _131;
    float _785 = _201 * _745;
    float _787 = _207 * _745;
    float _789 = in.m_57.z;
    float _791 = _195 * _745;
    float _793 = fma(_199, _743, _785);
    float _795 = fma(_205, _743, _787);
    float _797 = exp2(_783);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _801 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _803 = fma(_193, _743, _791);
    float _805 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _807 = fma(_801, -2.0, _799);
    float _809 = fma(_197, _747, _803);
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _815 = int(_813);
    float _817 = fma(_209, _747, _795);
    bool _819 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _821 = isnan(1.0);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _827 = _823 || _825;
    float _829 = -_811;
    float _831 = fma(_805, 2.0, _829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _835 = 1.0 + _833;
    float _837 = _163 + _765;
    float _839 = float(_773);
    float _841 = _765 * 2.0;
    bool _843 = _781 > 0.0;
    float _845 = _765 + _789;
    bool _847 = _781 >= 0.0;
    bool _849 = isnan(_781);
    bool _851 = _847 || _849;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    float _857 = 1.0 / _835;
    float _859 = _837 + (-1.0);
    float _861 = _845 + (-1.0);
    float _863 = fma(_203, _747, _793);
    float _865 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _867 = 1.0 / _839;
    float _869 = _789 * 2.0;
    float _871 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = -_797;
    float _875 = _873 + 1.0;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _879 = float(_815);
    float _881 = -_131;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[76].x, _831);
    float _885 = floor(_841);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _889 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _877);
    float _891 = _763 ? _875 : 0.0;
    float _893 = _879 * _131;
    float _895 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _887);
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _899 = _897 != 0;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _907 = _905 != 0;
    float _909 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _807);
    float _911 = floor(_869);
    float _913 = _867 * _131;
    float _915 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _895);
    float _917 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _889);
    if (_827)
    {
        float _919 = _891 * _857;
        _141 = _919;
    }
    float _921 = _141;
    int _923 = _855 ? 0 : 1;
    float _925 = _863 + _769;
    bool _927 = !_903;
    int _929 = _927 ? 0 : 1;
    float _931 = _809 + _777;
    bool _933 = _885 > 0.0;
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _937 = _925 + _935;
    bool _939 = _885 >= 0.0;
    bool _941 = isnan(_885);
    bool _943 = _939 || _941;
    bool _945 = isnan(0.0);
    bool _947 = _943 || _945;
    float _949 = _817 + _779;
    bool _951 = !_899;
    int _953 = _951 ? 0 : 1;
    bool _955 = !_907;
    int _957 = _955 ? 0 : 1;
    bool _959 = _911 >= 0.0;
    bool _961 = isnan(_911);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    int _969 = ~_923;
    int _971 = _969 + 1;
    int _973 = _971 + 1;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _985 = _983 != 0;
    int _987 = _973;
    if (!_843)
    {
        int _989 = ~_923;
        int _991 = _989 + 1;
        _987 = _991;
    }
    int _993 = _987;
    float _995 = in.m_74.x;
    float _997 = in.m_74.y;
    float _999 = in.m_74.z;
    int _1001 = _947 ? 0 : 1;
    bool _1003 = !_981;
    int _1005 = _1003 ? 0 : 1;
    bool _1007 = _911 > 0.0;
    int _1009 = ~_1001;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    int _1015 = abs(_1005);
    bool _1017 = !_977;
    int _1019 = _1017 ? 0 : 1;
    int _1021 = _1013;
    if (!_933)
    {
        int _1023 = ~_1001;
        int _1025 = _1023 + 1;
        _1021 = _1025;
    }
    int _1027 = _1021;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _931 + _1029;
    float _1033 = float(_993);
    float _1035 = _937 * _937;
    int _1037 = _967 ? 0 : 1;
    float _1039 = float(_1015);
    float _1041 = fma(_1031, _1031, _1035);
    int _1043 = abs(_1019);
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1047 = _949 + _1045;
    int _1049 = ~_1037;
    int _1051 = _1049 + 1;
    int _1053 = _1051 + 1;
    float _1055 = _1039 * _1033;
    int _1057 = _1053;
    if (!_1007)
    {
        int _1059 = ~_1037;
        int _1061 = _1059 + 1;
        _1057 = _1061;
    }
    int _1063 = _1057;
    float _1065 = fma(_1047, _1047, _1041);
    float _1067 = _1055 * (-2.0);
    float _1069 = _765 + (-0.5);
    float _1071 = sqrt(_1065);
    float _1073 = float(_1043);
    float _1075 = fma(_1067, _997, _997);
    float _1077 = _163 + _789;
    float _1079 = float(_1063);
    float _1081 = fma(_871, _1067, _871);
    bool _1083 = !_985;
    int _1085 = _1083 ? 0 : 1;
    float _1087 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1075);
    float _1089 = _1077 + (-1.0);
    float _1091 = _1073 * _1079;
    float _1093 = rsqrt(_1065);
    int _1095 = abs(_1085);
    float _1097 = fma(_1081, _921, _1087);
    float _1099 = float(_1027);
    float _1101 = _767 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1103 = float(_1095);
    float _1105 = _1071 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1107 = _1091 * (-2.0);
    float _1109 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1111 = _163 + (-0.5);
    float _1113 = _1103 * _1099;
    float _1115 = precise::min(_1101, _1105);
    float _1117 = fma(_1107, _995, _995);
    float _1119 = fma(_865, _1107, _865);
    float _1121 = _1113 * (-2.0);
    float _1123 = _1097 * 0.15915493667125701904296875;
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1117);
    float _1127 = _1093 * _1115;
    float _1129 = fma(_1109, _1121, _1109);
    float _1131 = fma(_1121, _999, _999);
    float _1133 = _789 + (-0.5);
    float _1135 = _937 * _1127;
    float _1137 = fma(_1119, _921, _1125);
    float _1139 = _1031 * _1127;
    float _1141 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1131);
    float _1143 = -_1135;
    float _1145 = _937 + _1143;
    float _1147 = _1047 * _1127;
    float _1149 = -_1139;
    float _1151 = _1031 + _1149;
    float _1153 = fma(_1129, _921, _1141);
    float _1155 = _1145 * _1145;
    float _1157 = -_1147;
    float _1159 = _1047 + _1157;
    float _1161 = _1137 * 0.15915493667125701904296875;
    float _1163 = _1153 * 0.15915493667125701904296875;
    float _1165 = fma(_1151, _1151, _1155);
    float _1167 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1169 = _925 + _1167;
    float _1171 = _1123 * 6.283185482025146484375;
    float _1173 = sin(_1171);
    float _1175 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1177 = _931 + _1175;
    float _1179 = fma(_1159, _1159, _1165);
    float _1181 = _1169 * _1169;
    float _1183 = sqrt(_1179);
    float _1185 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1187 = fma(_1177, _1177, _1181);
    float _1189 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1191 = _949 + _1189;
    float _1193 = fma(_1191, _1191, _1187);
    float _1195 = _1123 * 6.283185482025146484375;
    float _1197 = cos(_1195);
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _1201 = _1161 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = _1093 * _1183;
    float _1207 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1185);
    float _1209 = _1161 * 6.283185482025146484375;
    float _1211 = sin(_1209);
    float _1213 = _775 * _1205;
    float _1215 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1207);
    float _1217 = _1213 * _1199;
    float _1219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _1221 = _1163 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1203 * _1197;
    float _1227 = _1203 * _1173;
    float _1229 = _767 * _1205;
    float _1231 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1233 = _1231 * 0.5;
    float _1235 = _1229 * _1219;
    float _1237 = _1163 * 6.283185482025146484375;
    float _1239 = sin(_1237);
    float _1241 = _1211 * _1173;
    float _1243 = _1211 * _1197;
    float _1245 = _1203 * _1223;
    float _1247 = sqrt(_1215);
    float _1249 = _1211 * _1223;
    float _1251 = _1197 * _1223;
    float _1253 = _1245 * _1217;
    float _1255 = _1173 * _1223;
    float _1257 = fma(_1239, _1225, _1241);
    float _1259 = -_1227;
    float _1261 = fma(_1239, _1243, _1259);
    float _1263 = -_1243;
    float _1265 = fma(_1239, _1227, _1263);
    float _1267 = -_1217;
    float _1269 = _1239 * _1267;
    float _1271 = fma(_1257, _1235, _1253);
    float _1273 = sqrt(_1193);
    float _1275 = _1249 * _1217;
    float _1277 = fma(_1251, _1235, _1269);
    float _1279 = fma(_1265, _1233, _1271);
    float _1281 = fma(_1239, _1241, _1225);
    float _1283 = fma(_1261, _1235, _1275);
    float _1285 = fma(_1255, _1233, _1277);
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1289 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1291 = fma(_1281, _1233, _1283);
    float _1293 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1295 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1287);
    float _1297 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1289);
    float _1299 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1301 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1295);
    bool _1303 = _1273 < _1293;
    float _1305 = float(_1303);
    float _1307 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1297);
    float _1309 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1299);
    float _1311 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1313 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1309);
    float _1317 = fma(_1311, _1305, _949);
    float _1319 = -_1139;
    float _1321 = _931 + _1319;
    float _1323 = fma(_1313, _1305, _931);
    float _1325 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1329 = _1317 + _1327;
    float _1331 = -_1147;
    float _1333 = _949 + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1337 = _1323 + _1335;
    float _1339 = fma(_1325, _1305, _925);
    float _1341 = _1329 * _1329;
    float _1343 = fma(_1337, _1337, _1341);
    float _1345 = -_1135;
    float _1347 = _925 + _1345;
    float _1349 = sqrt(_1343);
    float _1351 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1353 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1351);
    float _1355 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1353);
    bool _1357 = _1349 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1305;
    float _1361 = _1323;
    float _1363 = _1325;
    float _1365 = _1135;
    float _1367 = _1337;
    float _1369 = _1147;
    if (!_1357)
    {
        _1359 = _1323;
    }
    float _1371 = _1359;
    float _1373 = _1371;
    if (!_1357)
    {
        _1361 = _1317;
    }
    float _1375 = _1361;
    float _1377 = _1375;
    if (!_1357)
    {
        _1363 = _1339;
    }
    float _1379 = _1363;
    bool _1381 = !_1357;
    float _1383 = _1379;
    if (!_1381)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1389 = _1349 + _1387;
        float _1391 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1393 = rsqrt(_1343);
        float _1395 = _1389 * _1385;
        float _1397 = _1395 * 0.15915493667125701904296875;
        float _1399 = _1397 * 6.283185482025146484375;
        float _1401 = cos(_1399);
        float _1403 = _1397 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = _1401 + (-1.0);
        float _1409 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = fma(_1405, _1391, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1413 = fma(_1339, _1401, _1409);
        float _1415 = _1393 * _1411;
        float _1417 = fma(_1337, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1419 = fma(_1329, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1383 = _1413;
        _1373 = _1417;
        _1377 = _1419;
    }
    float _1421 = _1383;
    float _1423 = _1373;
    float _1425 = _1377;
    float _1427 = -_925;
    float _1429 = _1427 + _1421;
    float _1431 = -_931;
    float _1433 = _1431 + _1423;
    float _1435 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1437 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1439 = _1429 * _1429;
    float _1441 = -_949;
    float _1443 = _1441 + _1425;
    float _1445 = 1.0 / _1435;
    float _1447 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1437);
    float _1449 = fma(_1433, _1433, _1439);
    float _1451 = -_1139;
    float _1453 = _1451 + _1423;
    float _1455 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1447);
    float _1457 = fma(_1443, _1443, _1449);
    float _1459 = -_1135;
    float _1461 = _1459 + _1421;
    float _1463 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1465 = sqrt(_1457);
    float _1467 = _1463 + _1435;
    float _1469 = -_1147;
    float _1471 = _1469 + _1425;
    float _1473 = _1467 * _1445;
    float _1475 = _1473 * 0.5;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1479 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1477);
    bool _1481 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan(0.5);
    bool _1489 = _1485 || _1487;
    float _1491 = 1.0 / _1479;
    bool _1493 = _1465 > 0.0;
    bool _1495 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.5);
    bool _1503 = _1499 || _1501;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1507 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1509 = _1433;
    float _1511 = _1461;
    float _1513 = _1421;
    if (!_1493)
    {
        _1505 = _1453;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (!_1493)
    {
        _1365 = _1461;
    }
    float _1519 = _1365;
    float _1521 = _1519;
    if (!_1493)
    {
        _1507 = _1471;
    }
    float _1523 = _1507;
    bool _1525 = !_1493;
    float _1527 = _1523;
    float _1529 = _1523;
    if (!_1525)
    {
        float _1531 = _243 * _243;
        float _1533 = fma(_239, _239, _1531);
        float _1535 = fma(_245, _245, _1533);
        float _1537 = rsqrt(_1457);
        float _1539 = sqrt(_1535);
        float _1541 = _1433 * _1537;
        float _1543 = _1429 * _1537;
        float _1545 = _1443 * _1537;
        bool _1547 = _1539 > 0.0;
        float _1549 = _1537;
        float _1551 = _1539;
        _1367 = _1541;
        if (!_1547)
        {
            _1549 = _1453;
        }
        float _1553 = _1549;
        _1517 = _1553;
        if (!_1547)
        {
            _1551 = _1461;
        }
        float _1555 = _1551;
        _1521 = _1555;
        if (!_1547)
        {
            _1527 = _1471;
        }
        float _1557 = _1527;
        bool _1559 = !_1547;
        _1529 = _1557;
        if (!_1559)
        {
            float _1561 = rsqrt(_1535);
            float _1563 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1565 = _243 * _1561;
            float _1567 = _239 * _1561;
            float _1569 = _1543 * _1565;
            float _1571 = _245 * _1561;
            float _1573 = fma(_1541, _1567, _1569);
            float _1575 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1577 = fma(_1545, _1571, _1573);
            float _1579 = _1577 * _1575;
            float _1581 = fma(_239, _1579, _1453);
            float _1583 = fma(_243, _1579, _1461);
            float _1585 = fma(_245, _1579, _1471);
            _1517 = _1581;
            _1521 = _1583;
            _1529 = _1585;
        }
    }
    float _1587 = _1517;
    float _1589 = _1521;
    float _1591 = _1529;
    float _1593 = _1367;
    float _1595 = _1589;
    float _1597 = _1587;
    float _1599 = _1591;
    float _1601 = _1593;
    if (_1489)
    {
        _1509 = 1.0;
    }
    float _1603 = _1509;
    float _1605 = _1603;
    if (!_1503)
    {
        float _1607 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1609 = _1347 + _1607;
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1613 = _1321 + _1611;
        float _1615 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1617 = _1609 * _1609;
        float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1621 = _1333 + _1619;
        float _1623 = fma(_1613, _1613, _1617);
        float _1625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1627 = fma(_1621, _1621, _1623);
        float _1629 = sqrt(_1627);
        float _1631 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = precise::min(_1629, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1635 = _1633 * _1625;
        float _1637 = -_1321;
        float _1639 = _1637 + _1587;
        float _1641 = _1631 * _1635;
        float _1643 = -_1347;
        float _1645 = _1643 + _1589;
        float _1647 = -_1333;
        float _1649 = _1647 + _1591;
        float _1651 = fma(_1639, _1641, _1321);
        float _1653 = fma(_1645, _1641, _1347);
        float _1655 = fma(_1649, _1641, _1333);
        _1511 = _1625;
        _1595 = _1653;
        _1597 = _1651;
        _1599 = _1655;
    }
    float _1657 = _1511;
    float _1659 = _1595;
    float _1661 = _1597;
    float _1663 = _1599;
    float _1665 = _1657;
    if (_1489)
    {
        _1601 = 1.0;
    }
    float _1667 = _1601;
    float _1669 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1671 = _1491 * _1669;
    float _1673 = _1667;
    if (!_1489)
    {
        float _1675 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1677 = _1675 * 0.15915493667125701904296875;
        float _1679 = _1677 * 6.283185482025146484375;
        float _1681 = cos(_1679);
        float _1683 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1685 = _1683 * 0.15915493667125701904296875;
        float _1687 = _1677 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = 1.0 / _1681;
        float _1693 = _1685 * 6.283185482025146484375;
        float _1695 = cos(_1693);
        float _1697 = _1689 * _1691;
        float _1699 = _1685 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1703;
        float _1707 = _1695 * _1697;
        float _1709 = 1.0 / _1705;
        float _1711 = 1.0 / _1707;
        float _1713 = _1701 * _1711;
        float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1717 = fma(_1671, _1713, _1715);
        float _1719 = _1717 * _1709;
        float _1721 = precise::clamp(_1719, 0.0, 1.0);
        _1513 = _1677;
        _1665 = _1697;
        _1605 = _1721;
    }
    float _1723 = _1513;
    float _1725 = _1665;
    float _1727 = _1605;
    float _1729 = _1723;
    float _1731 = _1725;
    if (!_1489)
    {
        float _1733 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = _1735 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1743 = _1741 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1739;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = 1.0 / _1761;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1767 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1765;
        float _1769 = 1.0 / _1767;
        float _1771 = _1759 * _1763;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1775 = fma(_1671, _1771, _1773);
        float _1777 = _1775 * _1769;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        float _1781 = -_1779;
        float _1783 = _1781 + 1.0;
        _1729 = _1739;
        _1731 = _1761;
        _1673 = _1783;
    }
    float _1785 = _1729;
    float _1787 = _1731;
    float _1789 = _1673;
    float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1793 = _1659 + _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1797 = _1661 + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1801 = _1663 + _1799;
    float _1803 = _1793 * _1793;
    float _1805 = fma(_1797, _1797, _1803);
    float _1807 = fma(_1801, _1801, _1805);
    float _1809 = rsqrt(_1807);
    float _1811 = sqrt(_1807);
    float _1813 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1815 = _1797 * _1813;
    float _1817 = _1801 * _1813;
    float _1819 = _1815 * _1815;
    float _1821 = _1817 * _1817;
    float _1823 = _1819 + _1821;
    float _1825 = sqrt(_1823);
    bool _1827 = _1825 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1831 = _1825 + _1829;
    float _1833 = _1801;
    float _1835 = _1785;
    float _1837 = _1831;
    float _1839 = _1813;
    float _1841 = _1787;
    float _1843 = _1823;
    if (_1827)
    {
        float _1845 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1833 = _1845;
    }
    float _1847 = _1833;
    if (_1827)
    {
        float _1849 = rsqrt(_1823);
        _1835 = _1849;
    }
    float _1851 = _1835;
    float _1853 = _1851;
    if (_1827)
    {
        float _1855 = _1831 * _1847;
        _1837 = _1855;
    }
    float _1857 = _1837;
    if (_1827)
    {
        float _1859 = _1857 * 0.15915493667125701904296875;
        _1369 = _1859;
    }
    float _1861 = _1369;
    float _1863 = _1847;
    float _1865 = _1861;
    if (_1827)
    {
        float _1867 = _1861 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        _1863 = _1869;
    }
    float _1871 = _1863;
    float _1873 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1875 = precise::max(0.0, _1873);
    float _1877 = _1803;
    if (_1827)
    {
        float _1879 = _1861 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        _1877 = _1881;
    }
    float _1883 = _1877;
    float _1885 = -_1813;
    float _1887 = -_1875;
    float _1889 = fma(_1793, _1885, _1887);
    if (_1827)
    {
        float _1891 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _1891;
    }
    float _1893 = _1839;
    float _1895 = _1893;
    if (!_1827)
    {
        _1865 = _1821;
    }
    float _1897 = _1865;
    float _1899 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1901 = fma(_1321, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1903 = _1871;
    float _1905 = _1897;
    if (_1827)
    {
        float _1907 = fma(_1871, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1841 = _1907;
    }
    float _1909 = _1841;
    float _1911 = _1909;
    if (!_1827)
    {
        _1903 = _1815;
    }
    float _1913 = _1903;
    float _1915 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1899);
    float _1917 = floor(_1901);
    float _1919 = _1913;
    if (_1827)
    {
        float _1921 = _1883 + (-1.0);
        _1895 = _1921;
    }
    float _1923 = _1895;
    float _1925 = 0.0;
    float _1927 = _1923;
    if (_1827)
    {
        float _1929 = _1851 * _1909;
        _1925 = _1929;
    }
    float _1931 = _1925;
    if (!_1827)
    {
        _1853 = _1889;
    }
    float _1933 = _1853;
    float _1935 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1915);
    float _1937 = _1933;
    if (_1827)
    {
        float _1939 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1843 = _1939;
    }
    float _1941 = _1843;
    if (_1827)
    {
        float _1943 = _1815 * _1931;
        _1919 = _1943;
    }
    float _1945 = _1919;
    if (!_1827)
    {
        _1927 = _1817;
    }
    float _1947 = _1927;
    float _1949 = _1947;
    if (_1827)
    {
        float _1951 = _1817 * _1931;
        _1949 = _1951;
    }
    float _1953 = _1949;
    if (!_1827)
    {
        _1911 = _1819;
    }
    float _1955 = _1911;
    float _1957 = _1955;
    if (_1827)
    {
        float _1959 = fma(_1889, _1883, _1941);
        _1937 = _1959;
    }
    float _1961 = _1937;
    if (_1827)
    {
        float _1963 = _1945 * _1945;
        _1957 = _1963;
    }
    float _1965 = _1957;
    if (_1827)
    {
        float _1967 = _1953 * _1953;
        _1905 = _1967;
    }
    float _1969 = _1905;
    float _1971 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1973 = fma(_1961, _1961, _1965);
    float _1975 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1977 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1971);
    float _1979 = _1973 + _1969;
    float _1981 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1985 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1983);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1975);
    float _1991 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1977);
    float _1993 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1981);
    float _1995 = rsqrt(_1979);
    float _1997 = -_1987;
    float _1999 = _1997 + 1.0;
    float _2001 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1989);
    float _2003 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1993);
    float _2005 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2007 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2009 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2011 = abs(_1999);
    float _2013 = log2(_2011);
    float _2015 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2021 = fma(_1333, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2015);
    float _2025 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2027 = -_2019;
    float _2029 = fma(_2027, _2017, 1.0);
    float _2031 = _1995 * _1945;
    float _2033 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2023);
    float _2035 = _1995 * _1961;
    float _2037 = floor(_2021);
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2041 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2033);
    float _2043 = _1995 * _1953;
    float _2045 = -_1917;
    float _2047 = _1901 + _2045;
    float _2049 = -_2039;
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2049);
    float _2053 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2055 = log2(_2029);
    float _2057 = -_2043;
    float _2059 = fma(_2057, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2051);
    float _2061 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2063 = fma(_1423, 6.2500002968590706586837768554688e-05, 0.5);
    float _2065 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2067 = exp2(_2053);
    float _2069 = fma(_2059, -0.5, 0.5);
    float _2071 = -_2037;
    float _2073 = _2021 + _2071;
    float _2075 = fma(_2059, 0.5, 0.5);
    float _2077 = fma(_1425, 6.2500002968590706586837768554688e-05, 0.5);
    float _2079 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2061);
    float _2081 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2065);
    float _2083 = fma(_2075, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2085 = 1.0 / _2041;
    float _2087 = _2035 + 1.0;
    float _2089 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2079);
    float _2091 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2081);
    float _2093 = fma(_2075, _2083, -0.212114393711090087890625);
    float _2095 = _2055 * 0.693147182464599609375;
    float _2097 = sqrt(_2069);
    float _2099 = -_2035;
    float _2101 = fma(_2067, _2087, _2099);
    float _2103 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2089);
    float _2105 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2091);
    float _2107 = fma(_2075, _2093, 1.570728778839111328125);
    float _2109 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2111 = fma(_2101, 0.5, 0.5);
    float _2113 = _2103 * _2085;
    float _2115 = _2105 * _2085;
    float2 _6676 = float2(_2047, _2073);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6676, float2(0.0), isnan(_6676)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6676, float2(0.0), isnan(_6676)), level(0.0)).x;
    float _2119 = fma(_2115, -0.5, 0.5);
    float _2121 = _2097 * 0.636619746685028076171875;
    float _2123 = fma(_2113, 0.5, 0.5);
    float _2125 = -_2107;
    float _2127 = fma(_2121, _2125, 1.0);
    float3 _6699 = float3(_2123, _2119, _2109);
    float _2129 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6699, float3(0.0), isnan(_6699)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6699, float3(0.0), isnan(_6699)), level(0.0)).x;
    float3 _6710 = float3(_2123, _2119, _2109);
    float4 _2132 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6710, float3(0.0), isnan(_6710)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6710, float3(0.0), isnan(_6710)), level(0.0)).xyzw;
    float _2134 = _2132.x;
    float _2136 = _2132.y;
    float _2138 = _2132.z;
    float _2140 = _2132.w;
    float2 _6726 = float2(_2127, _2111);
    float3 _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6726, float2(0.0), isnan(_6726)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6726, float2(0.0), isnan(_6726)), level(0.0)).xyz;
    float _2146 = _2144.x;
    float _2148 = _2144.y;
    float _2150 = _2144.z;
    float2 _6740 = float2(_2063, _2077);
    float3 _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6740, float2(0.0), isnan(_6740)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6740, float2(0.0), isnan(_6740)), level(0.0)).xyz;
    float _2154 = _2152.x;
    float _2156 = _2152.y;
    float _2158 = _2152.z;
    float _2160 = float(uint(_815));
    float _2162 = trunc(_913);
    int _2164 = int(_2162);
    int _2166 = ~_815;
    int _2168 = _2166 + 1;
    out.m_76.x = _709;
    out.m_76.y = _711;
    out.m_76.z = _715;
    out.m_76.w = _723;
    int _2170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2172 = _2170 != 0;
    float _2174 = -_915;
    float _2176 = _2174 + 1.0;
    float _2178 = -_917;
    float _2180 = _2178 + 1.0;
    bool _2182 = _765 > 0.5;
    float _2184 = 1.0 / _2160;
    int _2186 = ~_815;
    int _2188 = _2186 + 1;
    out.m_78.x = _1321;
    out.m_78.y = _1347;
    out.m_78.z = _1333;
    float _2190 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_80.w = _1115;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2196 = float(uint(_2164));
    float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2200 = _2198 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2204 = _2202 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2206 = float(_2164);
    float _2208 = 1.0 / _2194;
    int _2210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2212 = _2210 != 0;
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2214;
    int _2218 = as_type<int>(_2184) + (-2);
    float _2220 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2222 = _2220 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    out.m_82.x = _1229;
    float _2224 = as_type<float>(_2218) * _2196;
    float _2226 = 1.0 / _2200;
    bool _2228 = _163 > 0.5;
    out.m_84.x = _1661;
    out.m_84.y = _1659;
    out.m_84.z = _1663;
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2234 = abs(_953);
    float _2236 = _2216 * _2208;
    float _2238 = trunc(_2224);
    float _2240 = precise::max(_2238, 0.0);
    uint _2243 = uint(_2240);
    int _2245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2247 = _2245 != 0;
    int _2249 = ~_815;
    int _2251 = _2249 + 1;
    float _2253 = 1.0 / _2204;
    float _2255 = _2222 * _2226;
    int _2257 = _2188 * int(_2243);
    int _2259 = _2257 + _2164;
    float _2261 = 1.0 / _2232;
    float _2263 = float(uint(_2259));
    float _2265 = exp2(_2190);
    float _2267 = as_type<float>(_2218) * _2263;
    bool _2269 = !_2212;
    float _2271 = _2269 ? 7.345489978790283203125 : 1.0;
    float _2273 = _2271 * _163;
    float _2275 = trunc(_2267);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2283 = _2281 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2285 = floor(_2273);
    float _2287 = -_2265;
    float _2289 = _2287 + 1.0;
    float _2291 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2293 = int(_2243) + int(_2279);
    float _2295 = 1.0 / _2283;
    bool _2297 = _2206 >= _879;
    bool _2299 = isnan(_2206);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(_879);
    bool _2305 = _2301 || _2303;
    float _2307 = float(_2305);
    int _2309 = _2168 * _2293;
    int _2311 = _2309 + _2164;
    float _2313 = -_2285;
    float _2315 = _2273 + _2313;
    float _2317 = trunc(_2307);
    int _2319 = int(_2317);
    bool _2321 = uint(_2311) >= uint(_815);
    float _2323 = _2315 * _879;
    float _2325 = _893 * _173;
    float _2327 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2327;
    bool _2331 = !_2321;
    int _2333 = _2331 ? 0 : (-1);
    bool _2335 = _815 == 0;
    float _2337 = _2329 * _2253;
    int _2339 = ~_2293;
    int _2341 = _2339 + _2333;
    int _2343 = _2341 + 1;
    float _2345 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2347 = _2345 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2349 = trunc(_2323);
    int _2351 = int(_2349);
    int _2353 = _815 * _2343;
    int _2355 = _2353 + _2164;
    int _2357 = ~_2319;
    int _2359 = _2357 + 1;
    int _2361 = _2359 + 1;
    float _2363 = _2347 * _2295;
    bool _2365 = !_2247;
    int _2367 = _2365 ? 0 : 1;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2369;
    bool _2373 = !_2335;
    int _2375 = _2373 ? _2355 : (-1);
    float _2377 = trunc(_2325);
    int _2379 = int(_2377);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2383 = _2381 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2385 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2387 = isnan(_741);
    bool _2389 = _2385 || _2387;
    bool _2391 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2393 = _2389 || _2391;
    float _2395 = float(_2393);
    int _2397 = _2375 * _2361;
    int _2399 = abs(_2367);
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2405 = _815 + (-1);
    float _2407 = -_2395;
    float _2409 = _2407 + 1.0;
    int _2411 = abs(_929);
    float _2413 = 1.0 / _2403;
    float _2415 = _2371 * _2261;
    int _2417 = _2319 * _2405;
    int _2419 = _2417 + _2397;
    bool _2421 = !_2172;
    int _2423 = _2421 ? 0 : 1;
    int _2425 = _2351 * _2399;
    int _2427 = _2425 + _2164;
    bool _2429 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2431 = isnan(_741);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    int _2441 = _2419 * _2411;
    int _2443 = abs(_957);
    int _2445 = abs(_2423);
    int _2447 = _2379 * _2234;
    int _2449 = _2447 + _2441;
    bool _2451 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2453 = isnan(_741);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2459 = _2455 || _2457;
    float _2461 = float(_2459);
    float _2463 = _2383 * _2413;
    bool _2465 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2467 = isnan(_741);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2473 = _2469 || _2471;
    float _2475 = float(_2473);
    int _2477 = _2427 * _2443;
    int _2479 = _2477 + _2449;
    bool _2481 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2483 = isnan(_741);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = -_2461;
    float _2495 = _2493 + 1.0;
    float _2497 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2503 = _741 + _2501;
    int _2505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2507 = _2505 != 0;
    float _2509 = _2491 * _2495;
    int _2511 = _2351 * _2445;
    int _2513 = _2511 + _2479;
    float _2515 = -_2491;
    float _2517 = _2515 + 1.0;
    bool _2519 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2521 = isnan(_741);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = -_2439;
    float _2533 = _2531 + 1.0;
    float _2535 = 1.0 / _2499;
    float _2537 = float(uint(_2513));
    float _2539 = _2439 * _2517;
    bool _2541 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2543 = isnan(_741);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2549 = _2545 || _2547;
    float _2551 = float(_2549);
    float _2553 = _2529 * _2533;
    float _2555 = -_2529;
    float _2557 = _2555 + 1.0;
    float _2559 = as_type<float>(_2218) * _2537;
    bool _2561 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2563 = isnan(_741);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    float _2573 = -_2551;
    float _2575 = _2573 + 1.0;
    float _2577 = _2551 * _2557;
    float _2579 = fma(_2236, _2503, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2581 = trunc(_2559);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    float _2587 = _2571 * _2575;
    float _2589 = -_2571;
    float _2591 = _2589 + 1.0;
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2595 = _741 + _2593;
    float _2597 = _2395 * _2591;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2599;
    float _2603 = _2475 * _2409;
    float _2605 = fma(_2255, _2595, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2607 = _2601 * _2535;
    float _2609 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2611 = _741 + _2609;
    float _2613 = _2579 * _2603;
    float _2615 = -_2475;
    float _2617 = _2615 + 1.0;
    float _2619 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2621 = _741 + _2619;
    int _2623 = _2251 * int(_2585);
    int _2625 = _2623 + _2513;
    float _2627 = fma(_2337, _2611, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2629 = fma(_2617, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2613);
    float _2631 = fma(_2363, _2621, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2635 = _741 + _2633;
    float _2637 = float(uint(_2625));
    float _2639 = fma(_2605, _2597, _2629);
    float _2641 = float(uint(_2427));
    float _2643 = fma(_2415, _2635, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2645 = -_223;
    int _2647 = _2228 ? as_type<int>(_2645) : as_type<int>(_223);
    float _2649 = as_type<float>(_2218) * _2637;
    float _2651 = fma(_2627, _2587, _2639);
    float _2653 = as_type<float>(_2218) * _2641;
    bool _2655 = !_2507;
    float _2657 = _2655 ? _223 : as_type<float>(_2647);
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2661 = _741 + _2659;
    float _2663 = fma(_2631, _2577, _2651);
    float _2665 = trunc(_2649);
    float _2667 = precise::max(_2665, 0.0);
    uint _2669 = uint(_2667);
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2673 = _741 + _2671;
    float _2675 = _2657 + 0.5;
    float _2677 = fma(_2643, _2553, _2663);
    float _2679 = _1293 + (-10.0);
    float _2681 = fma(_2607, _2661, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2683 = fma(_2675, (*spvDescriptorSet0.vp_c9)._m0[80].x, _883);
    int _2685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2687 = _2685 != 0;
    float _2689 = trunc(_2653);
    float _2691 = precise::max(_2689, 0.0);
    uint _2693 = uint(_2691);
    float _2695 = -_227;
    int _2697 = _2182 ? as_type<int>(_2695) : as_type<int>(_227);
    float _2699 = fma(_2463, _2673, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2701 = ~_815;
    int _2703 = _2701 + 1;
    float _2705 = -_2176;
    float _2707 = fma(_2657, _2705, _2683);
    float _2709 = precise::max(_1273, _2679);
    float _2711 = fma(_2699, _2539, _2677);
    bool _2713 = !_2687;
    float _2715 = _2713 ? _227 : as_type<float>(_2697);
    float _2717 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2719 = int(_2585) + int(_2669);
    float _2721 = fma(_2681, _2509, _2711);
    float _2723 = precise::min(_1293, _2709);
    float _2725 = _2715 + (-0.5);
    int _2727 = ~_815;
    int _2729 = _2727 + 1;
    int _2731 = _2703 * _2719;
    int _2733 = _2731 + _2513;
    float _2735 = -_2725;
    float _2737 = -_909;
    float _2739 = fma(_2735, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2737);
    float _2741 = -_2679;
    float _2743 = _2741 + _2723;
    int _2745 = _2729 * int(_2693);
    int _2747 = _2745 + _2427;
    bool _2749 = uint(_2733) >= uint(_815);
    float _2751 = fma(_2715, _2180, _2739);
    float _2753 = fma(_2743, -0.100000001490116119384765625, 1.0);
    int _2755 = ~_815;
    int _2757 = _2755 + 1;
    float _2759 = abs(_1671);
    float _2761 = log2(_2759);
    bool _2763 = !_2749;
    int _2765 = _2763 ? 0 : (-1);
    out.m_86.x = _2707;
    out.m_86.y = _2751;
    float _2767 = float(uint(_2747));
    float _2769 = _707 * _2753;
    int _2771 = ~_2719;
    int _2773 = _2771 + _2765;
    int _2775 = _2773 + 1;
    float _2777 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2781 = _2779 != 0;
    float _2783 = as_type<float>(_2218) * _2767;
    out.m_88.x = _717;
    out.m_88.y = _719;
    out.m_88.z = _721;
    out.m_88.w = _2769;
    int _2785 = _815 * _2775;
    int _2787 = _2785 + _2513;
    float _2789 = -_1239;
    float _2791 = fma(_2789, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2777);
    float _2793 = trunc(_2783);
    float _2795 = precise::max(_2793, 0.0);
    uint _2797 = uint(_2795);
    float _2799 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2801 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2803 = !_2335;
    int _2805 = _2803 ? _2787 : (-1);
    float _2807 = _2761 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2809 = -_1239;
    float _2811 = fma(_2809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2799);
    float _2813 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2815 = _2805 & 3;
    bool _2817 = _2815 != 0;
    float _2819 = fma(_2461, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2721);
    int _2821 = _2805 >> 31;
    float _2823 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2811);
    float _2825 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2827 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2829 = _2821 & 3;
    float _2831 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2791);
    float _2833 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2825);
    int _2835 = int(_2693) + int(_2797);
    float _2837 = _1265 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2839 = _2805 + _2829;
    float _2841 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2843 = exp2(_2807);
    int _2845 = _2757 * _2835;
    int _2847 = _2845 + _2427;
    int _2849 = _2839 >> 2;
    float _2851 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2837);
    float _2853 = _2841 * _2823;
    int _2855 = _2817 ? 0 : 1;
    float _2857 = -_1239;
    float _2859 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2813);
    int _2861 = _2849 << 4;
    int _2863 = _2861 + 368;
    float _2865 = _2841 * _2831;
    bool _2867 = uint(_2847) >= uint(_815);
    float _2869 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2801);
    float _2871 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2827);
    uint _2873 = uint(int(uint(_2863) >> uint(2)));
    uint _2875 = uint(int(uint(int(_2873)) >> uint(2)));
    int _2877 = int(_2873) & 3;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[int(_2875)][_2877];
    int _2881 = int(_2873) + 1;
    uint _2883 = uint(int(uint(_2881) >> uint(2)));
    int _2885 = _2881 & 3;
    float _2887 = (*spvDescriptorSet0.vp_c9)._m0[int(_2883)][_2885];
    float _2889 = _1265 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2891 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2869);
    bool _2893 = !_2867;
    int _2895 = _2893 ? 0 : (-1);
    float _2897 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2859);
    float _2899 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2889);
    int _2901 = _2805 & 3;
    bool _2903 = _2901 != 0;
    float _2905 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2851);
    int _2907 = _2863 + 8;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    uint _2911 = uint(int(uint(int(_2909)) >> uint(2)));
    int _2913 = int(_2909) & 3;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[int(_2911)][_2913];
    int _2917 = int(_2909) + 1;
    uint _2919 = uint(int(uint(_2917) >> uint(2)));
    int _2921 = _2917 & 3;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[int(_2919)][_2921];
    int _2925 = ~_2855;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    float _2931 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2833);
    bool _2933 = uint(_2901) > 1u;
    float _2935 = fma(_2717, _2891, _2853);
    int _2937 = ~_2835;
    int _2939 = _2937 + _2895;
    int _2941 = _2939 + 1;
    float _2943 = in.m_90.x;
    bool _2945 = uint(_2901) >= 2u;
    float _2947 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2899);
    bool _2949 = _1671 <= 8000.0;
    bool _2951 = isnan(_1671);
    bool _2953 = _2949 || _2951;
    bool _2955 = isnan(8000.0);
    bool _2957 = _2953 || _2955;
    float _2959 = float(_2957);
    int _2961 = _815 * _2941;
    int _2963 = _2961 + _2427;
    bool _2965 = !_2903;
    int _2967 = _2965 ? 0 : 1;
    float _2969 = _2841 * _2897;
    bool _2971 = _2901 != 3;
    float _2973 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2871);
    int _2975 = abs(_2967);
    float _2977 = -_2117;
    float _2979 = _2977 + 1.0;
    int _2981 = _2929;
    if (!_2933)
    {
        int _2983 = ~_2855;
        int _2985 = _2983 + 1;
        _2981 = _2985;
    }
    int _2987 = _2981;
    float _2989 = fma(_2717, _2931, _2865);
    bool _2991 = _2901 != 3;
    float _2993 = fma(_2717, _2973, _2969);
    int _2995 = abs(_2987);
    float _2997 = _1265 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2999 = _2945 ? 0 : 1;
    float _3001 = _2291 * _2129;
    int _3003 = ~_2995;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    float _3009 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2997);
    int _3011 = ~_2999;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    out.m_92.x = _2819;
    float _3017 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3009);
    bool _3019 = !_2971;
    int _3021 = _3019 ? 0 : (-1);
    int _3023 = _3015;
    if (_2991)
    {
        int _3025 = ~_2999;
        int _3027 = _3025 + 1;
        _3023 = _3027;
    }
    int _3029 = _3023;
    float _3031 = fma(_2843, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3033 = precise::clamp(_3031, 0.0, 1.0);
    int _3035 = abs(_3021);
    int _3037 = abs(_3029);
    int _3039 = _3007 * as_type<int>(_2887);
    bool _3041 = !_2781;
    int _3043 = _3041 ? 0 : 1;
    int _3045 = ~_2975;
    int _3047 = _3045 + 1;
    int _3049 = _3047 + 1;
    int _3051 = abs(_3043);
    int _3053 = _3049 * as_type<int>(_2879);
    int _3055 = _3053 + _3039;
    float _3057 = fma(_3033, -2.0, 3.0);
    int _3059 = ~_3037;
    int _3061 = _3059 + 1;
    int _3063 = _3061 + 1;
    float _3065 = _3033 * _3033;
    int _3067 = ~_3035;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    int _3073 = _3063 * as_type<int>(_2915);
    int _3075 = _3073 + _3055;
    float _3077 = _3065 * _3057;
    float _3079 = _2005 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3081 = ~_3051;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    int _3087 = _3071 * as_type<int>(_2923);
    int _3089 = _3087 + _3075;
    float _3091 = -_3077;
    float _3093 = _3091 + 1.0;
    float _3095 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3079);
    bool _3097 = !_2335;
    int _3099 = _3097 ? _2963 : (-1);
    int _3101 = _3089 * _3085;
    float _3103 = fma(_3093, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3077);
    float _3105 = _2041 * 0.5;
    float _3107 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3095);
    int _3109 = _3099 * _3051;
    int _3111 = _3109 + _3101;
    float _3113 = _2959 * _3103;
    float _3115 = fma(_2105, -0.5, _3105);
    float _3117 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3107);
    float _3119 = _2905 + _2935;
    float _3121 = _2947 + _2989;
    float _3123 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3125 = _3117 + _2041;
    float _3127 = _2103 + _2041;
    float _3129 = _2979 * _3123;
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = float(_3111);
    float _3135 = _3125 * 0.5;
    float _3137 = _3127 * 0.5;
    float _3139 = -_3131;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_94.x = _3133;
    float _3143 = _2150 * _3001;
    float _3145 = _3017 + _2993;
    float _3147 = _3141 * _2943;
    out.m_96.x = _3137;
    out.m_96.y = _3115;
    out.m_96.z = _3135;
    out.m_96.w = _2041;
    float _3149 = fma(_2140, _3143, _2138);
    bool _3151 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3153 = isnan(_1811);
    bool _3155 = _3151 || _3153;
    bool _3157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3159 = _3155 || _3157;
    float _3161 = _3147 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3163 = _2140 * _3001;
    float _3165 = in.m_90.z;
    float _3167 = fma(_2146, _3163, _2134);
    float _3169 = fma(_2148, _3163, _2136);
    out.gl_Position.x = _2103;
    out.gl_Position.y = _2105;
    out.gl_Position.z = _3117;
    out.gl_Position.w = _2041;
    float _3171 = _1727 * _1789;
    float _3173 = -_2291;
    float _3175 = _3173 + 1.0;
    out.m_98.x = _2154;
    out.m_98.y = _2156;
    out.m_98.z = _2158;
    float _3177 = _3171 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3179 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _3181 = _2041;
    float _3183 = _3115;
    float _3185 = _3175;
    float _3187 = _3177;
    if (!_3159)
    {
        _3179 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3189 = _3179;
    float _3191 = _2140 * _3175;
    out.m_100.x = _3161;
    float _3193 = _3189;
    float _3195 = _3189;
    if (!_3159)
    {
        _3181 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3197 = _3181;
    float _3199 = _3197;
    float _3201 = _3197;
    if (!_3159)
    {
        _3183 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3203 = _3183;
    out.m_102.x = _3167;
    out.m_102.y = _3169;
    out.m_102.z = _3149;
    out.m_102.w = _3191;
    float _3205 = _3203;
    float _3207 = _3203;
    if (!_3159)
    {
        _3185 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3209 = _3185;
    out.m_104.x = _3119;
    out.m_104.y = _3121;
    out.m_104.z = _3145;
    float _3211 = _3177 * _3165;
    float _3213 = _3165;
    float _3215 = _3209;
    float _3217 = _3209;
    if (!_3159)
    {
        _3213 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3219 = _3213;
    float _3221 = _3219;
    float _3223 = _3219;
    if (!_3159)
    {
        _3187 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3225 = _3187;
    bool _3227 = !_3159;
    float _3229 = _3225;
    float _3231 = _3225;
    if (!_3227)
    {
        bool _3233 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3235 = isnan(_1811);
        bool _3237 = _3233 || _3235;
        bool _3239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3241 = _3237 || _3239;
        if (!_3241)
        {
            float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3245 = _1811 + _3243;
            float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3249 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3247;
            float _3251 = 1.0 / _3249;
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3267 = _3265 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3271 = _3269 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3273 = _3245 * _3251;
            float _3275 = precise::clamp(_3273, 0.0, 1.0);
            float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3281 = fma(_3275, _3255, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3283 = fma(_3275, _3279, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3285 = fma(_3275, _3259, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3287 = fma(_3275, _3263, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3289 = fma(_3275, _3267, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3291 = fma(_3275, _3271, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3201 = _3283;
            _3217 = _3289;
            _3195 = _3281;
            _3207 = _3287;
            _3223 = _3285;
            _3231 = _3291;
            _3293 = true;
        }
        else
        {
            bool _3295 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3297 = isnan(_1811);
            bool _3299 = _3295 || _3297;
            bool _3301 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3303 = _3299 || _3301;
            if (!_3303)
            {
                _3193 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3305 = _3193;
            _3195 = _3305;
            if (!_3303)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3307 = _3199;
            _3201 = _3307;
            if (!_3303)
            {
                _3221 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3309 = _3221;
            _3223 = _3309;
            if (!_3303)
            {
                _3205 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3311 = _3205;
            _3207 = _3311;
            if (!_3303)
            {
                _3215 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3313 = _3215;
            _3217 = _3313;
            if (!_3303)
            {
                _3229 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3315 = _3229;
            bool _3317 = !_3303;
            _3231 = _3315;
            if (!_3317)
            {
                bool _3319 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3321 = isnan(_1811);
                bool _3323 = _3319 || _3321;
                bool _3325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3327 = _3323 || _3325;
                if (!_3327)
                {
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3331 = _1811 + _3329;
                    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3335 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3333;
                    float _3337 = 1.0 / _3335;
                    float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3341 = _3339 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3349 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3351 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3353 = _3351 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3355 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3357 = _3355 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3359 = _3331 * _3337;
                    float _3361 = precise::clamp(_3359, 0.0, 1.0);
                    float _3363 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3365 = _3363 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3367 = fma(_3361, _3341, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3369 = fma(_3361, _3365, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3371 = fma(_3361, _3345, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3373 = fma(_3361, _3349, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3375 = fma(_3361, _3353, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3377 = fma(_3361, _3357, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3201 = _3369;
                    _3217 = _3375;
                    _3195 = _3367;
                    _3207 = _3373;
                    _3223 = _3371;
                    _3231 = _3377;
                    _3293 = true;
                }
                else
                {
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3217 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3195 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3207 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3223 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3231 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3293 = false;
    float _3379 = _3201;
    float _3381 = _3217;
    float _3383 = _3195;
    float _3385 = _3207;
    float _3387 = _3223;
    float _3389 = _3231;
    float _3391 = _3211 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3393 = fma(_3121, -0.5, 0.5);
    float _3395 = precise::clamp(_3393, 0.0, 1.0);
    float _3397 = -_3379;
    float _3399 = _3397 + _3381;
    float _3401 = -_3383;
    float _3403 = _3401 + _3385;
    out.m_55.x = _3391;
    float _3405 = fma(_3395, _3399, _3379);
    float _3407 = -_3387;
    float _3409 = _3407 + _3389;
    float _3411 = fma(_3395, _3403, _3383);
    float _3413 = _3405 * 0.586610972881317138671875;
    bool _3415 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3417 = fma(_3395, _3409, _3387);
    out.m_106.x = 0.0;
    float _3419 = fma(_3411, 0.298911988735198974609375, _3413);
    bool _3421 = _1727 > 0.0;
    bool _3423 = isnan(_1727);
    bool _3425 = _3421 || _3423;
    bool _3427 = isnan(0.0);
    bool _3429 = _3425 || _3427;
    float _3431 = fma(_3417, 0.114477999508380889892578125, _3419);
    bool _3433 = _1789 <= 0.0;
    bool _3435 = !_3429;
    bool _3437 = _3433 || _3435;
    float _3439 = -_3431;
    float _3441 = _3411 + _3439;
    float _3443 = -_3431;
    float _3445 = _3405 + _3443;
    float _3447 = -_3431;
    float _3449 = _3417 + _3447;
    float _3451 = fma(_3441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3431);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3431);
    float _3455 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3431);
    bool _3457 = !_3415;
    if (!_3457)
    {
        float _3459 = -_1659;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3463 = -_1661;
        float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3467 = -_1663;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3471 = _3461 * _3461;
        float _3473 = fma(_3465, _3465, _3471);
        float _3475 = fma(_3469, _3469, _3473);
        float _3477 = sqrt(_3475);
        float _3479 = rsqrt(_3475);
        float _3481 = -_3477;
        float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3485 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        float _3489 = _3465 * _3479;
        float _3491 = _3461 * _3479;
        float _3493 = abs(_3487);
        float _3495 = log2(_3493);
        float _3497 = _3469 * _3479;
        float _3499 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3501 = _3121 * _3491;
        float _3503 = -_3491;
        float _3505 = -_3499;
        float _3507 = fma(_3503, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3505);
        float _3509 = fma(_3119, _3489, _3501);
        float _3511 = -_3497;
        float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3507);
        float _3515 = fma(_3145, _3497, _3509);
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3521 = _3513 + _3519;
        float _3523 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3525 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = exp2(_3523);
        float _3531 = _3529 * _3527;
        float _3533 = _3517 * _3531;
        float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3537 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3535;
        out.m_106.y = _3537;
        out.m_106.z = _3539;
    }
    out.m_80.x = _3451;
    out.m_80.y = _3453;
    out.m_80.z = _3455;
    if (!_3437)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _3541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3541;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

