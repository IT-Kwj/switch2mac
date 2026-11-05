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
    float4 m_98 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_104 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_59 [[user(locn13)]];
    float4 m_100 [[user(locn14)]];
    float4 m_84 [[user(locn15)]];
    float4 m_106 [[user(locn16)]];
    float4 m_96 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_92 [[attribute(0)]];
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
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3397 = false;
    bool _689 = false;
    bool _479 = false;
    bool _373 = false;
    bool _271 = false;
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
        float _3714 = as_type<float>(_149);
        out.gl_Position.z = _3714;
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
        float _3779 = as_type<float>(_179);
        out.gl_Position.z = _3779;
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
    float _249 = _245;
    float _251 = _243;
    float _253 = _239;
    float _269;
    if (!_247)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _181;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = in.m_72.x;
    float _281 = in.m_72.y;
    bool _283 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_273);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    bool _299 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_273);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_293;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    float _319 = 1.0 / _297;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _323 = _309 * _313;
    float _325 = -_309;
    float _327 = _325 + 1.0;
    float _329 = _277 * _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_317, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _335 * _323;
    float _341 = _337 * _323;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _345 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _347 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].x, _343);
    float _349 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].y, _345);
    float _351 = _347 * _279;
    float _353 = _349 * _281;
    bool _355 = !_321;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _359 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        _371 = _181;
    }
    _373 = false;
    float _375 = _371;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _379 = _375 + _377;
    bool _381 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _383 = isnan(_375);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _393;
    bool _397 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _399 = isnan(_375);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -_391;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _413;
    float _417 = 1.0 / _395;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = _407 * _411;
    float _423 = -_407;
    float _425 = _423 + 1.0;
    float _427 = _379 * _417;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _429;
    float _433 = fma(_415, _427, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _435;
    float _439 = fma(_431, _427, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _441 = _433 * _421;
    float _443 = fma(_437, _427, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _445 = _439 * _421;
    float _447 = _443 * _421;
    float _449 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[107].x, _441);
    float _451 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[107].y, _447);
    float _453 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[107].z, _445);
    float _455 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[108].x, _449);
    float _457 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[108].y, _451);
    float _459 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[108].z, _453);
    bool _461 = !_419;
    float _477;
    if (!_461)
    {
        float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _465 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _467 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _469 = _467 * _463;
        float _471 = floor(_469);
        float _473 = -_471;
        float _475 = _469 + _473;
        _477 = _475;
        _479 = true;
    }
    else
    {
        _477 = _181;
    }
    _479 = false;
    float _481 = _477;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _481 + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _501 = isnan(_481);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = 1.0 / _489;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _517 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _519 = isnan(_481);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _531 = 1.0 / _497;
    float _533 = _493 * _511;
    bool _535 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _537 = isnan(_481);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = 1.0 / _515;
    float _549 = -_509;
    float _551 = _549 + 1.0;
    float _553 = fma(_533, _485, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _559 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _561 = isnan(_481);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -_545;
    float _573 = _571 + 1.0;
    float _575 = _545 * _551;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _581 = 1.0 / _557;
    float _583 = -_569;
    float _585 = _583 + 1.0;
    float _587 = _527 * _573;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _589;
    float _593 = _579 * _531;
    float _595 = _509 * _585;
    float _597 = _553 * _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _601 = _481 + _599;
    float _603 = -_527;
    float _605 = _603 + 1.0;
    bool _607 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _609 = isnan(_481);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _591 * _547;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _627 = _481 + _625;
    float _629 = fma(_593, _601, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[115].x, _597);
    float _633 = -_617;
    float _635 = _633 + 1.0;
    float _637 = _623 * _581;
    float _639 = fma(_619, _627, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _643 = _481 + _641;
    float _645 = fma(_629, _575, _631);
    float _647 = _569 * _635;
    float _649 = _455 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _651 = fma(_637, _643, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _653 = fma(_639, _595, _645);
    float _655 = _459 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = fma(_651, _647, _653);
    float _659 = _457 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _661 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[119].x, _657);
    float _665 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _671 = !_529;
    float _687;
    if (!_671)
    {
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _675 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _679 = _677 * _673;
        float _681 = floor(_679);
        float _683 = -_681;
        float _685 = _679 + _683;
        _687 = _685;
        _689 = true;
    }
    else
    {
        _687 = _181;
    }
    _689 = false;
    float _691 = _687;
    bool _693 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _695 = isnan(_691);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _709 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _711 = isnan(_691);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _727 = _691 + _725;
    float _729 = -_703;
    float _731 = _729 + 1.0;
    bool _733 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _735 = 1.0 / _707;
    float _737 = _719 * _731;
    float _739 = -_719;
    float _741 = _739 + 1.0;
    float _743 = _723 * _735;
    float _745 = fma(_743, _727, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _749 = _745 * _737;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _753 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[131].x, _749);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _757 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[132].x, _753);
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _757 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _767 = !_733;
    if (!_767)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _771 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _183 = _781;
    }
    float _783 = _183;
    float _785 = in.m_48.x;
    float _787 = in.m_48.y;
    float _789 = in.m_48.z;
    float _791 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _793 = log2(_791);
    float _795 = _163 * 2.0;
    float _797 = in.m_57.y;
    float _799 = _351 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _801 = _353 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _803 = in.m_57.z;
    float _805 = floor(_795);
    float _807 = in.m_68.w;
    float _809 = in.m_66.w;
    float _811 = _793 * _131;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _815 = int(_813);
    float _817 = _195 * _787;
    float _819 = _201 * _787;
    float _821 = _207 * _787;
    float _823 = fma(_193, _785, _817);
    float _825 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _827 = fma(_199, _785, _819);
    float _829 = fma(_205, _785, _821);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _833 = exp2(_811);
    float _835 = _163 + _797;
    float _837 = -_831;
    float _839 = fma(_825, 2.0, _837);
    float _841 = _797 * 2.0;
    float _843 = fma(_197, _789, _823);
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _847 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _849 = floor(_841);
    float _851 = _835 + (-1.0);
    bool _853 = _805 > 0.0;
    float _855 = _163 + _803;
    bool _857 = _805 >= 0.0;
    bool _859 = isnan(_805);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = fma(_847, -2.0, _845);
    float _869 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _873 = _797 + _803;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _877 = _875 != 0;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _881 = _879 != 0;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _885 = _883 != 0;
    float _887 = fma(_203, _789, _827);
    float _889 = _855 + (-1.0);
    float _891 = fma(_209, _789, _829);
    float _893 = float(_815);
    float _895 = _803 * 2.0;
    bool _897 = _849 > 0.0;
    float _899 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _901 = int(_899);
    bool _903 = _849 >= 0.0;
    bool _905 = isnan(_849);
    bool _907 = _903 || _905;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _915 = 1.0 + _913;
    float _917 = _873 + (-1.0);
    float _919 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _921 = !_881;
    int _923 = _921 ? 0 : 1;
    float _925 = -_833;
    float _927 = _925 + 1.0;
    float _929 = 1.0 / _915;
    bool _931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _943 = -_131;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _947 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _867);
    float _949 = _939 ? _927 : 0.0;
    float _951 = floor(_895);
    float _953 = _871 * _131;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _957 = in.m_70.w;
    bool _959 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _961 = isnan(1.0);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _967 = _963 || _965;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _971 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].w, _955);
    float _973 = float(_901);
    float _975 = 1.0 / _893;
    float _977 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _969);
    float _979 = precise::max(0.0, _953);
    float _981 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _971);
    int _983 = _865 ? 0 : 1;
    float _985 = _973 * _131;
    float _987 = precise::min(_979, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _989 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _977);
    float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _993 = _951 >= 0.0;
    bool _995 = isnan(_951);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    float _1003 = _887 + _807;
    bool _1005 = !_877;
    int _1007 = _1005 ? 0 : 1;
    float _1009 = _843 + _809;
    bool _1011 = !_885;
    int _1013 = _1011 ? 0 : 1;
    float _1015 = _803 + (-0.5);
    int _1017 = _1001 ? 0 : 1;
    float _1019 = _975 * _131;
    if (_967)
    {
        float _1021 = _949 * _929;
        _141 = _1021;
    }
    float _1023 = _141;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1027 = _1025 != 0;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1035 = _1033 != 0;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _1003 + _1037;
    float _1041 = _891 + _957;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1045 = _1009 + _1043;
    int _1047 = ~_1017;
    int _1049 = _1047 + 1;
    int _1051 = _1049 + 1;
    float _1053 = _1039 * _1039;
    float _1055 = _987 * _991;
    int _1057 = _911 ? 0 : 1;
    bool _1059 = !_1031;
    int _1061 = _1059 ? 0 : 1;
    float _1063 = fma(_1045, _1045, _1053);
    int _1065 = ~_983;
    int _1067 = _1065 + 1;
    int _1069 = _1067 + 1;
    float _1071 = abs(_1055);
    float _1073 = log2(_1071);
    int _1075 = ~_1057;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1069;
    int _1083 = _1079;
    int _1085 = _1051;
    if (!_853)
    {
        int _1087 = ~_983;
        int _1089 = _1087 + 1;
        _1081 = _1089;
    }
    int _1091 = _1081;
    if (!_897)
    {
        int _1093 = ~_1057;
        int _1095 = _1093 + 1;
        _1083 = _1095;
    }
    int _1097 = _1083;
    bool _1099 = !_1035;
    int _1101 = _1099 ? 0 : 1;
    float _1103 = in.m_74.x;
    float _1105 = in.m_74.y;
    float _1107 = in.m_74.z;
    int _1109 = abs(_1061);
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1113 = _1041 + _1111;
    int _1115 = abs(_1101);
    float _1117 = float(_1091);
    float _1119 = fma(_1113, _1113, _1063);
    bool _1121 = _951 > 0.0;
    float _1123 = sqrt(_1119);
    float _1125 = float(_1109);
    bool _1127 = !_1027;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = float(_1115);
    float _1133 = _1125 * _1117;
    int _1135 = abs(_1129);
    float _1137 = _797 + (-0.5);
    float _1139 = rsqrt(_1119);
    if (!_1121)
    {
        int _1141 = ~_1017;
        int _1143 = _1141 + 1;
        _1085 = _1143;
    }
    int _1145 = _1085;
    float _1147 = _1133 * (-2.0);
    float _1149 = float(_1135);
    float _1151 = _799 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1153 = float(_1145);
    float _1155 = fma(_1147, _1105, _1105);
    float _1157 = _1123 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1159 = float(_1097);
    float _1161 = fma(_941, _1147, _941);
    float _1163 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1155);
    float _1165 = _1149 * _1153;
    float _1167 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1169 = precise::min(_1151, _1157);
    float _1171 = fma(_1161, _1023, _1163);
    float _1173 = _1165 * (-2.0);
    float _1175 = _1131 * _1159;
    float _1177 = _163 + (-0.5);
    float _1179 = _1139 * _1169;
    float _1181 = fma(_1173, _1103, _1103);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1185 = 1.0 + _1183;
    float _1187 = fma(_869, _1173, _869);
    float _1189 = _1039 * _1179;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1181);
    float _1193 = 1.0 / _1185;
    float _1195 = _1045 * _1179;
    float _1197 = precise::max(_953, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1199 = fma(_1187, _1023, _1191);
    float _1201 = (-1.0) + (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _1203 = -_1195;
    float _1205 = _1045 + _1203;
    float _1207 = precise::min(_1197, 1.0);
    float _1209 = _1199 * 0.15915493667125701904296875;
    float _1211 = -_1189;
    float _1213 = _1039 + _1211;
    float _1215 = _1175 * (-2.0);
    float _1217 = exp2(_1167);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1221 = _1207 + _1219;
    float _1223 = _1213 * _1213;
    float _1225 = fma(_919, _1215, _919);
    float _1227 = fma(_1215, _1107, _1107);
    float _1229 = _1113 * _1179;
    float _1231 = fma(_1205, _1205, _1223);
    float _1233 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1235 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    float _1237 = -_1229;
    float _1239 = _1113 + _1237;
    float _1241 = _1221 * _1193;
    float _1243 = fma(_1225, _1023, _1235);
    float _1245 = fma(_1239, _1239, _1231);
    float _1247 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1249 = _1003 + _1247;
    float _1251 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1233);
    float _1253 = sqrt(_1245);
    float _1255 = _1171 * 0.15915493667125701904296875;
    float _1257 = fma(_1241, _1201, 1.0);
    float _1259 = _1243 * 0.15915493667125701904296875;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _1263 = _1261 + 1.0;
    float _1265 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1267 = _1009 + _1265;
    float _1269 = _1249 * _1249;
    float _1271 = _1209 * 6.283185482025146484375;
    float _1273 = sin(_1271);
    float _1275 = fma(_1217, _1263, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _1277 = fma(_1267, _1267, _1269);
    float _1279 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1281 = _1041 + _1279;
    float _1283 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1251);
    float _1285 = _1275 * _1257;
    float _1287 = fma(_1281, _1281, _1277);
    float _1289 = _1255 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    float _1293 = _1139 * _1253;
    float _1295 = _227 * _1285;
    float _1297 = _223 * _1285;
    float _1299 = _801 * _1293;
    float _1301 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1295);
    float _1303 = _799 * _1293;
    float _1305 = _1255 * 6.283185482025146484375;
    float _1307 = cos(_1305);
    float _1309 = _1299 * _1301;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1297);
    float _1313 = _1209 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1273 * _1291;
    float _1319 = _1259 * 6.283185482025146484375;
    float _1321 = cos(_1319);
    float _1323 = _1273 * _1307;
    float _1325 = _1259 * 6.283185482025146484375;
    float _1327 = sin(_1325);
    float _1329 = _1315 * _1307;
    float _1331 = _1315 * _1291;
    float _1333 = _1315 * _1321;
    float _1335 = _1273 * _1321;
    float _1337 = _1307 * _1321;
    float _1339 = _1291 * _1321;
    float _1341 = _1303 * _1311;
    float _1343 = _1333 * _1309;
    float _1345 = sqrt(_1283);
    float _1347 = _1335 * _1309;
    float _1349 = fma(_1327, _1329, _1317);
    float _1351 = -_1331;
    float _1353 = fma(_1327, _1323, _1351);
    float _1355 = -_1323;
    float _1357 = fma(_1327, _1331, _1355);
    float _1359 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1361 = _1359 * 0.5;
    float _1363 = -_1309;
    float _1365 = _1327 * _1363;
    float _1367 = fma(_1349, _1341, _1343);
    float _1369 = sqrt(_1287);
    float _1371 = fma(_1327, _1317, _1329);
    float _1373 = fma(_1337, _1341, _1365);
    float _1375 = fma(_1357, _1361, _1367);
    float _1377 = fma(_1353, _1341, _1347);
    float _1379 = fma(_1339, _1361, _1373);
    float _1381 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1383 = fma(_1371, _1361, _1377);
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1387 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1389 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1381);
    float _1391 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1393 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1385);
    float _1395 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1389);
    bool _1397 = _1369 < _1387;
    float _1399 = float(_1397);
    float _1401 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1393);
    float _1403 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1391);
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1407 = -_1229;
    float _1409 = _1041 + _1407;
    float _1411 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1413 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1403);
    float _1415 = fma(_1405, _1399, _1041);
    float _1417 = fma(_1411, _1399, _1009);
    float _1419 = -_1189;
    float _1421 = _1003 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1425 = _1415 + _1423;
    float _1427 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1431 = _1417 + _1429;
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1435 = _1425 * _1425;
    float _1437 = fma(_1427, _1399, _1003);
    float _1439 = fma(_1431, _1431, _1435);
    float _1441 = -_1195;
    float _1443 = _1009 + _1441;
    float _1445 = sqrt(_1439);
    float _1447 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1433);
    float _1449 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1447);
    bool _1451 = _1445 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1453 = _1447;
    float _1455 = _1427;
    float _1457 = _1383;
    float _1459 = _1425;
    if (!_1451)
    {
        _1453 = _1417;
    }
    float _1461 = _1453;
    float _1463 = _1461;
    if (!_1451)
    {
        _1455 = _1415;
    }
    float _1465 = _1455;
    float _1467 = _1465;
    if (!_1451)
    {
        _1457 = _1437;
    }
    float _1469 = _1457;
    bool _1471 = !_1451;
    float _1473 = _1469;
    if (!_1471)
    {
        float _1475 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1479 = _1445 + _1477;
        float _1481 = _1437 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1483 = _1479 * _1475;
        float _1485 = rsqrt(_1439);
        float _1487 = _1483 * 0.15915493667125701904296875;
        float _1489 = _1487 * 6.283185482025146484375;
        float _1491 = sin(_1489);
        float _1493 = _1487 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = fma(_1491, _1481, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1499 = _1485 * _1497;
        float _1501 = _1495 + (-1.0);
        float _1503 = fma(_1431, _1499, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1505 = fma(_1425, _1499, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1507 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1509 = fma(_1437, _1495, _1507);
        _1473 = _1509;
        _1463 = _1503;
        _1467 = _1505;
    }
    float _1511 = _1473;
    float _1513 = _1463;
    float _1515 = _1467;
    float _1517 = -_1003;
    float _1519 = _1517 + _1511;
    float _1521 = -_1009;
    float _1523 = _1521 + _1513;
    float _1525 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1527 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1529 = _1519 * _1519;
    float _1531 = -_1041;
    float _1533 = _1531 + _1515;
    float _1535 = 1.0 / _1525;
    float _1537 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1527);
    float _1539 = fma(_1523, _1523, _1529);
    float _1541 = -_1195;
    float _1543 = _1541 + _1513;
    float _1545 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1537);
    float _1547 = fma(_1533, _1533, _1539);
    float _1549 = -_1189;
    float _1551 = _1549 + _1511;
    float _1553 = -_1229;
    float _1555 = _1553 + _1515;
    float _1557 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1559 = sqrt(_1547);
    float _1561 = _1557 + _1525;
    float _1563 = _1561 * _1535;
    float _1565 = _1563 * 0.5;
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1569 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1567);
    bool _1571 = _1559 > 0.0;
    float _1573 = 1.0 / _1569;
    bool _1575 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan(0.5);
    bool _1583 = _1579 || _1581;
    bool _1585 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1587 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.5);
    bool _1593 = _1589 || _1591;
    float _1595 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1599 = _1511;
    float _1601 = _1535;
    float _1603 = _1547;
    float _1605 = _1555;
    if (!_1571)
    {
        _1595 = _1543;
    }
    float _1607 = _1595;
    float _1609 = _1607;
    float _1611 = _1607;
    if (!_1571)
    {
        _1597 = _1551;
    }
    float _1613 = _1597;
    float _1615 = _1613;
    if (!_1571)
    {
        _1599 = _1555;
    }
    float _1617 = _1599;
    bool _1619 = !_1571;
    float _1621 = _1617;
    if (!_1619)
    {
        float _1623 = _243 * _243;
        float _1625 = fma(_239, _239, _1623);
        float _1627 = fma(_245, _245, _1625);
        float _1629 = rsqrt(_1547);
        float _1631 = sqrt(_1627);
        float _1633 = _1523 * _1629;
        float _1635 = _1519 * _1629;
        float _1637 = _1533 * _1629;
        bool _1639 = _1631 > 0.0;
        float _1641 = _1631;
        float _1643 = _1629;
        if (!_1639)
        {
            _1609 = _1543;
        }
        float _1645 = _1609;
        _1611 = _1645;
        if (!_1639)
        {
            _1641 = _1551;
        }
        float _1647 = _1641;
        _1615 = _1647;
        if (!_1639)
        {
            _1643 = _1555;
        }
        float _1649 = _1643;
        bool _1651 = !_1639;
        _1621 = _1649;
        if (!_1651)
        {
            float _1653 = rsqrt(_1627);
            float _1655 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1657 = _243 * _1653;
            float _1659 = _239 * _1653;
            float _1661 = _245 * _1653;
            float _1663 = _1635 * _1657;
            float _1665 = fma(_1633, _1659, _1663);
            float _1667 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1669 = fma(_1637, _1661, _1665);
            float _1671 = _1669 * _1667;
            float _1673 = fma(_239, _1671, _1543);
            float _1675 = fma(_243, _1671, _1551);
            float _1677 = fma(_245, _1671, _1555);
            _1611 = _1673;
            _1615 = _1675;
            _1621 = _1677;
            _1601 = _1667;
        }
    }
    float _1679 = _1611;
    float _1681 = _1615;
    float _1683 = _1621;
    float _1685 = _1601;
    float _1687 = _1685;
    if (_1583)
    {
        _1603 = 1.0;
    }
    float _1689 = _1603;
    float _1691 = _1689;
    if (_1593)
    {
        _249 = _1679;
    }
    float _1693 = _249;
    float _1695 = _1693;
    if (_1593)
    {
        _251 = _1681;
    }
    float _1697 = _251;
    float _1699 = _1697;
    if (_1593)
    {
        _253 = _1683;
    }
    float _1701 = _253;
    float _1703 = _1701;
    if (!_1593)
    {
        float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1707 = _1421 + _1705;
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1711 = _1443 + _1709;
        float _1713 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1715 = -_1443;
        float _1717 = _1715 + _1679;
        float _1719 = _1707 * _1707;
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1723 = _1409 + _1721;
        float _1725 = -_1421;
        float _1727 = _1725 + _1681;
        float _1729 = -_1409;
        float _1731 = _1729 + _1683;
        float _1733 = fma(_1711, _1711, _1719);
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1737 = fma(_1723, _1723, _1733);
        float _1739 = sqrt(_1737);
        float _1741 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1743 = precise::min(_1739, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1745 = _1743 * _1735;
        float _1747 = _1741 * _1745;
        float _1749 = fma(_1717, _1747, _1443);
        float _1751 = fma(_1727, _1747, _1421);
        float _1753 = fma(_1731, _1747, _1409);
        _1605 = _1719;
        _1699 = _1751;
        _1695 = _1749;
        _1703 = _1753;
        _1687 = _1735;
    }
    float _1755 = _1605;
    float _1757 = _1699;
    float _1759 = _1695;
    float _1761 = _1703;
    float _1763 = _1687;
    float _1765 = _1755;
    float _1767 = _1763;
    if (_1583)
    {
        _1459 = 1.0;
    }
    float _1769 = _1459;
    float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1773 = _1573 * _1771;
    float _1775 = _1769;
    if (!_1583)
    {
        float _1777 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1779 = _1777 * 0.15915493667125701904296875;
        float _1781 = _1779 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1787 = _1785 * 0.15915493667125701904296875;
        float _1789 = _1779 * 6.283185482025146484375;
        float _1791 = sin(_1789);
        float _1793 = 1.0 / _1783;
        float _1795 = _1787 * 6.283185482025146484375;
        float _1797 = cos(_1795);
        float _1799 = _1791 * _1793;
        float _1801 = _1787 * 6.283185482025146484375;
        float _1803 = sin(_1801);
        float _1805 = _1797 * _1799;
        float _1807 = 1.0 / _1805;
        float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1811 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1809;
        float _1813 = 1.0 / _1811;
        float _1815 = _1803 * _1807;
        float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1819 = fma(_1773, _1815, _1817);
        float _1821 = _1819 * _1813;
        float _1823 = precise::clamp(_1821, 0.0, 1.0);
        _1765 = _1787;
        _1767 = _1819;
        _1691 = _1823;
    }
    float _1825 = _1765;
    float _1827 = _1767;
    float _1829 = _1691;
    float _1831 = _1825;
    float _1833 = _1827;
    if (!_1583)
    {
        float _1835 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1837 = _1835 * 0.15915493667125701904296875;
        float _1839 = _1837 * 6.283185482025146484375;
        float _1841 = cos(_1839);
        float _1843 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1845 = _1843 * 0.15915493667125701904296875;
        float _1847 = _1837 * 6.283185482025146484375;
        float _1849 = sin(_1847);
        float _1851 = 1.0 / _1841;
        float _1853 = _1845 * 6.283185482025146484375;
        float _1855 = cos(_1853);
        float _1857 = _1849 * _1851;
        float _1859 = _1845 * 6.283185482025146484375;
        float _1861 = sin(_1859);
        float _1863 = _1855 * _1857;
        float _1865 = 1.0 / _1863;
        float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1869 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1867;
        float _1871 = 1.0 / _1869;
        float _1873 = _1861 * _1865;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1877 = fma(_1773, _1873, _1875);
        float _1879 = _1877 * _1871;
        float _1881 = precise::clamp(_1879, 0.0, 1.0);
        float _1883 = -_1881;
        float _1885 = _1883 + 1.0;
        _1831 = _1851;
        _1833 = _1873;
        _1775 = _1885;
    }
    float _1887 = _1831;
    float _1889 = _1833;
    float _1891 = _1775;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1895 = _1757 + _1893;
    float _1897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1899 = _1759 + _1897;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1903 = _1761 + _1901;
    float _1905 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1907 = _1895 * _1895;
    float _1909 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1911 = fma(_1899, _1899, _1907);
    float _1913 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1909);
    float _1915 = fma(_1903, _1903, _1911);
    float _1917 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1919 = rsqrt(_1915);
    float _1921 = sqrt(_1915);
    float _1923 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1925 = _1899 * _1923;
    float _1927 = _1903 * _1923;
    float _1929 = _1925 * _1925;
    float _1931 = _1927 * _1927;
    float _1933 = _1929 + _1931;
    float _1935 = sqrt(_1933);
    bool _1937 = _1935 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1941 = _1935 + _1939;
    float _1943 = _1919;
    float _1945 = _1889;
    float _1947 = _1941;
    float _1949 = _1887;
    float _1951 = _1933;
    if (_1937)
    {
        float _1953 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1943 = _1953;
    }
    float _1955 = _1943;
    if (_1937)
    {
        float _1957 = rsqrt(_1933);
        _1945 = _1957;
    }
    float _1959 = _1945;
    float _1961 = _1955;
    float _1963 = _1959;
    if (_1937)
    {
        float _1965 = _1941 * _1955;
        _1947 = _1965;
    }
    float _1967 = _1947;
    if (_1937)
    {
        float _1969 = _1967 * 0.15915493667125701904296875;
        _1949 = _1969;
    }
    float _1971 = _1949;
    float _1973 = _1903;
    float _1975 = _1971;
    if (_1937)
    {
        float _1977 = _1971 * 6.283185482025146484375;
        float _1979 = sin(_1977);
        _1973 = _1979;
    }
    float _1981 = _1973;
    float _1983 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1985 = precise::max(0.0, _1983);
    float _1987 = _1551;
    if (_1937)
    {
        float _1989 = _1971 * 6.283185482025146484375;
        float _1991 = cos(_1989);
        _1987 = _1991;
    }
    float _1993 = _1987;
    float _1995 = -_1923;
    float _1997 = -_1985;
    float _1999 = fma(_1895, _1995, _1997);
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1937)
    {
        float _2003 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1961 = _2003;
    }
    float _2005 = _1961;
    float _2007 = _2005;
    if (!_1937)
    {
        _1975 = _1929;
    }
    float _2009 = _1975;
    float _2011 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2013 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2015 = _2009;
    if (_1937)
    {
        float _2017 = fma(_1981, _2005, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2001 = _2017;
    }
    float _2019 = _2001;
    float _2021 = floor(_2011);
    float _2023 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2013);
    float _2025 = _2019;
    float _2027 = _1993;
    if (_1937)
    {
        float _2029 = _1993 + (-1.0);
        _2007 = _2029;
    }
    float _2031 = _2007;
    float _2033 = 0.0;
    float _2035 = _2031;
    if (_1937)
    {
        float _2037 = _1959 * _2019;
        _2033 = _2037;
    }
    float _2039 = _2033;
    if (!_1937)
    {
        _2025 = _1925;
    }
    float _2041 = _2025;
    float _2043 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2023);
    float _2045 = _2041;
    if (_1937)
    {
        float _2047 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1951 = _2047;
    }
    float _2049 = _1951;
    if (_1937)
    {
        float _2051 = _1925 * _2039;
        _2045 = _2051;
    }
    float _2053 = _2045;
    if (!_1937)
    {
        _2035 = _1927;
    }
    float _2055 = _2035;
    float _2057 = _2055;
    if (_1937)
    {
        float _2059 = _1927 * _2039;
        _2057 = _2059;
    }
    float _2061 = _2057;
    if (!_1937)
    {
        _1963 = _1999;
    }
    float _2063 = _1963;
    float _2065 = _2063;
    if (_1937)
    {
        float _2067 = fma(_1999, _1993, _2049);
        _2065 = _2067;
    }
    float _2069 = _2065;
    if (_1937)
    {
        float _2071 = _2053 * _2053;
        _2015 = _2071;
    }
    float _2073 = _2015;
    float _2075 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1937)
    {
        _2027 = _1931;
    }
    float _2077 = _2027;
    float _2079 = fma(_2069, _2069, _2073);
    float _2081 = _2077;
    if (_1937)
    {
        float _2083 = _2061 * _2061;
        _2081 = _2083;
    }
    float _2085 = _2081;
    float _2087 = fma(_1409, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2089 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = _2079 + _2085;
    float _2093 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2095 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2093);
    float _2105 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2095);
    float _2107 = rsqrt(_2091);
    float _2109 = -_2101;
    float _2111 = _2109 + 1.0;
    float _2113 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2103);
    float _2115 = _2105 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2117 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2119 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2121 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2123 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2125 = abs(_2111);
    float _2127 = log2(_2125);
    float _2129 = -_2119;
    float _2131 = fma(_2129, _2117, 1.0);
    float _2133 = -_2021;
    float _2135 = _2011 + _2133;
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2123);
    float _2139 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2137);
    float _2141 = _2107 * _2053;
    float _2143 = floor(_2087);
    float _2145 = _2107 * _2061;
    float _2147 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2139);
    float _2149 = _2107 * _2069;
    float _2151 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2153 = fma(_1513, 6.2500002968590706586837768554688e-05, 0.5);
    float _2155 = fma(_1515, 6.2500002968590706586837768554688e-05, 0.5);
    float _2157 = _2149 + 1.0;
    float _2159 = -_2151;
    float _2161 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2159);
    float _2163 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2165 = log2(_2131);
    float _2167 = -_2145;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2161);
    float _2171 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2173 = -_2143;
    float _2175 = _2087 + _2173;
    float _2177 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2179 = exp2(_2163);
    float _2181 = fma(_2169, -0.5, 0.5);
    float _2183 = fma(_2169, 0.5, 0.5);
    float _2185 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2171);
    float _2187 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2177);
    float _2189 = fma(_2183, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2191 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2185);
    float _2193 = 1.0 / _2147;
    float _2195 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2187);
    float _2197 = fma(_2183, _2189, -0.212114393711090087890625);
    float _2199 = _2165 * 0.693147182464599609375;
    float _2201 = fma(_2183, _2197, 1.570728778839111328125);
    float _2203 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2205 = sqrt(_2181);
    float _2207 = -_2149;
    float _2209 = fma(_2179, _2157, _2207);
    float _2211 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2191);
    float _2213 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2195);
    float _2215 = fma(_2209, 0.5, 0.5);
    float _2217 = _2211 * _2193;
    float _2219 = _2213 * _2193;
    float2 _6926 = float2(_2135, _2175);
    float _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6926, float2(0.0), isnan(_6926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6926, float2(0.0), isnan(_6926)), level(0.0)).x;
    float _2223 = fma(_2219, -0.5, 0.5);
    float _2225 = _2205 * 0.636619746685028076171875;
    float _2227 = fma(_2217, 0.5, 0.5);
    float _2229 = -_2201;
    float _2231 = fma(_2225, _2229, 1.0);
    float3 _6949 = float3(_2227, _2223, _2203);
    float _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6949, float3(0.0), isnan(_6949)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6949, float3(0.0), isnan(_6949)), level(0.0)).x;
    float3 _6960 = float3(_2227, _2223, _2203);
    float4 _2236 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6960, float3(0.0), isnan(_6960)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6960, float3(0.0), isnan(_6960)), level(0.0)).xyzw;
    float _2238 = _2236.x;
    float _2240 = _2236.y;
    float _2242 = _2236.z;
    float _2244 = _2236.w;
    float2 _6976 = float2(_2231, _2215);
    float3 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6976, float2(0.0), isnan(_6976)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6976, float2(0.0), isnan(_6976)), level(0.0)).xyz;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float2 _6990 = float2(_2153, _2155);
    float3 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6990, float2(0.0), isnan(_6990)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6990, float2(0.0), isnan(_6990)), level(0.0)).xyz;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    float _2264 = float(uint(_901));
    float _2266 = trunc(_1019);
    int _2268 = int(_2266);
    int _2270 = ~_901;
    int _2272 = _2270 + 1;
    out.m_76.x = _661;
    out.m_76.y = _665;
    out.m_76.z = _667;
    out.m_76.w = _669;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2276 = _2274 != 0;
    float _2278 = -_989;
    float _2280 = _2278 + 1.0;
    int _2282 = ~_901;
    int _2284 = _2282 + 1;
    float _2286 = -_981;
    float _2288 = _2286 + 1.0;
    float _2290 = 1.0 / _2264;
    out.m_78.x = _1443;
    out.m_78.y = _1421;
    out.m_78.z = _1409;
    float _2292 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2294 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_80.w = _1169;
    float _2296 = float(uint(_2268));
    float _2298 = _985 * _173;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2302 = _2300 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2304 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2306 = exp2(_2294);
    out.m_82.x = _1303;
    int _2308 = as_type<int>(_2290) + (-2);
    float _2310 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2304);
    out.m_84.x = _1759;
    out.m_84.y = _1757;
    out.m_84.z = _1761;
    float _2312 = as_type<float>(_2308) * _2296;
    float _2314 = trunc(_2298);
    int _2316 = int(_2314);
    float _2318 = trunc(_2312);
    float _2320 = precise::max(_2318, 0.0);
    uint _2323 = uint(_2320);
    float _2325 = -_2306;
    float _2327 = _2325 + 1.0;
    float _2329 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2331 = _2284 * int(_2323);
    int _2333 = _2331 + _2268;
    float _2335 = float(uint(_2333));
    float _2337 = as_type<float>(_2308) * _2335;
    int _2339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2341 = _2339 != 0;
    float _2343 = trunc(_2337);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    bool _2349 = !_2341;
    float _2351 = _2349 ? 7.345489978790283203125 : 1.0;
    bool _2353 = _163 > 0.5;
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2359 = _2351 * _163;
    float _2361 = float(_2268);
    float _2363 = -_223;
    int _2365 = _2353 ? as_type<int>(_2363) : as_type<int>(_223);
    float _2367 = 1.0 / _2357;
    bool _2369 = _2361 >= _973;
    bool _2371 = isnan(_2361);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(_973);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    int _2381 = int(_2323) + int(_2347);
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2385 = _2383 != 0;
    float _2387 = trunc(_2379);
    int _2389 = int(_2387);
    bool _2391 = _901 == 0;
    int _2393 = _2272 * _2381;
    int _2395 = _2393 + _2268;
    bool _2397 = !_2385;
    float _2399 = _2397 ? _223 : as_type<float>(_2365);
    bool _2401 = uint(_2395) >= uint(_901);
    float _2403 = floor(_2359);
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2407 = _2405 != 0;
    bool _2409 = !_2401;
    int _2411 = _2409 ? 0 : (-1);
    bool _2413 = _797 > 0.5;
    float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2417 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2415;
    int _2419 = ~_2381;
    int _2421 = _2419 + _2411;
    int _2423 = _2421 + 1;
    float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2427 = _2425 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2429 = ~_2389;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = _2417 * _2367;
    int _2437 = _901 + (-1);
    int _2439 = _901 * _2423;
    int _2441 = _2439 + _2268;
    float _2443 = 1.0 / _2427;
    int _2445 = abs(_1007);
    float _2447 = -_2403;
    float _2449 = _2359 + _2447;
    bool _2451 = !_2391;
    int _2453 = _2451 ? _2441 : (-1);
    float _2455 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2457 = _2455 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2459 = abs(_923);
    float _2461 = _2449 * _973;
    int _2463 = _2453 * _2433;
    float _2465 = 1.0 / _2302;
    float _2467 = -_227;
    int _2469 = _2413 ? as_type<int>(_2467) : as_type<int>(_227);
    int _2471 = _2389 * _2437;
    int _2473 = _2471 + _2463;
    bool _2475 = !_2407;
    int _2477 = _2475 ? 0 : 1;
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2483 = _2473 * _2459;
    float _2485 = trunc(_2461);
    int _2487 = int(_2485);
    int _2489 = abs(_2477);
    float _2491 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2493 = _2491 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2495 = 1.0 / _2481;
    float _2497 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2497;
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2503 = _2501 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2505 = _2457 * _2465;
    float _2507 = _2499 * _2443;
    bool _2509 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2511 = isnan(_783);
    bool _2513 = _2509 || _2511;
    bool _2515 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2517 = _2513 || _2515;
    float _2519 = float(_2517);
    float _2521 = 1.0 / _2493;
    int _2523 = _2487 * _2489;
    int _2525 = _2523 + _2268;
    int _2527 = abs(_1013);
    int _2529 = _2316 * _2445;
    int _2531 = _2529 + _2483;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2537 = !_2276;
    int _2539 = _2537 ? 0 : 1;
    int _2541 = _2525 * _2527;
    int _2543 = _2541 + _2531;
    float _2545 = _2503 * _2495;
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2547;
    int _2551 = abs(_2539);
    float _2553 = 1.0 / _2535;
    float _2555 = -_2519;
    float _2557 = _2555 + 1.0;
    bool _2559 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2561 = isnan(_783);
    bool _2563 = _2559 || _2561;
    bool _2565 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2567 = _2563 || _2565;
    float _2569 = float(_2567);
    float _2571 = _2549 * _2521;
    int _2573 = _2487 * _2551;
    int _2575 = _2573 + _2543;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2581 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2583 = isnan(_783);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    float _2593 = -_2569;
    float _2595 = _2593 + 1.0;
    bool _2597 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2599 = isnan(_783);
    bool _2601 = _2597 || _2599;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2605 = _2601 || _2603;
    float _2607 = float(_2605);
    float _2609 = 1.0 / _2579;
    float _2611 = float(uint(_2575));
    float _2613 = _2591 * _2595;
    float _2615 = -_2591;
    float _2617 = _2615 + 1.0;
    float _2619 = -_2607;
    float _2621 = _2619 + 1.0;
    bool _2623 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2625 = isnan(_783);
    bool _2627 = _2623 || _2625;
    bool _2629 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2631 = _2627 || _2629;
    float _2633 = float(_2631);
    float _2635 = _2607 * _2617;
    float _2637 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2639 = _2637 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2641 = as_type<float>(_2308) * _2611;
    float _2643 = _2633 * _2621;
    float _2645 = -_2633;
    float _2647 = _2645 + 1.0;
    bool _2649 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2651 = isnan(_783);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2657 = _2653 || _2655;
    float _2659 = float(_2657);
    float _2661 = _2639 * _2553;
    float _2663 = trunc(_2641);
    float _2665 = precise::max(_2663, 0.0);
    uint _2667 = uint(_2665);
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2669;
    bool _2673 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2675 = isnan(_783);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = _2519 * _2647;
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2689 = _783 + _2687;
    float _2691 = _2671 * _2609;
    int _2693 = ~_901;
    int _2695 = _2693 + 1;
    float _2697 = _2659 * _2557;
    float _2699 = -_2659;
    float _2701 = _2699 + 1.0;
    bool _2703 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2705 = isnan(_783);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = -_2683;
    float _2717 = _2715 + 1.0;
    float _2719 = fma(_2435, _2689, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2721 = _2683 * _2701;
    float _2723 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2725 = _783 + _2723;
    float _2727 = _2713 * _2717;
    float _2729 = -_2713;
    float _2731 = _2729 + 1.0;
    int _2733 = _2695 * int(_2667);
    int _2735 = _2733 + _2575;
    float _2737 = fma(_2505, _2725, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2739 = _2719 * _2727;
    float _2741 = float(uint(_2525));
    float _2743 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2745 = _783 + _2743;
    float _2747 = float(uint(_2735));
    float _2749 = fma(_2731, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2739);
    int _2751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2753 = _2751 != 0;
    float _2755 = as_type<float>(_2308) * _2741;
    float _2757 = fma(_2507, _2745, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2759 = as_type<float>(_2308) * _2747;
    float _2761 = fma(_2737, _2721, _2749);
    bool _2763 = !_2753;
    float _2765 = _2763 ? _227 : as_type<float>(_2469);
    float _2767 = trunc(_2755);
    float _2769 = precise::max(_2767, 0.0);
    uint _2771 = uint(_2769);
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2775 = _783 + _2773;
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2779 = _783 + _2777;
    float _2781 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2783 = _783 + _2781;
    float _2785 = _2399 + 0.5;
    float _2787 = fma(_2661, _2775, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2789 = fma(_2545, _2779, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2791 = ~_901;
    int _2793 = _2791 + 1;
    float _2795 = trunc(_2759);
    float _2797 = precise::max(_2795, 0.0);
    uint _2799 = uint(_2797);
    float _2801 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2803 = _783 + _2801;
    float _2805 = fma(_2757, _2697, _2761);
    float _2807 = fma(_2691, _2783, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2809 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[80].x, _945);
    float _2811 = fma(_2571, _2803, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2813 = fma(_2789, _2685, _2805);
    float _2815 = _1387 + (-10.0);
    float _2817 = _2765 + (-0.5);
    int _2819 = _2793 * int(_2771);
    int _2821 = _2819 + _2525;
    float _2823 = fma(_2811, _2643, _2813);
    int _2825 = ~_901;
    int _2827 = _2825 + 1;
    float _2829 = -_2817;
    float _2831 = -_947;
    float _2833 = fma(_2829, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2831);
    float _2835 = precise::max(_1369, _2815);
    float _2837 = fma(_2787, _2635, _2823);
    int _2839 = int(_2667) + int(_2799);
    float _2841 = -_2280;
    float _2843 = fma(_2399, _2841, _2809);
    float _2845 = float(uint(_2821));
    float _2847 = fma(_2807, _2613, _2837);
    float _2849 = precise::min(_1387, _2835);
    int _2851 = _2827 * _2839;
    int _2853 = _2851 + _2575;
    float _2855 = fma(_2765, _2288, _2833);
    float _2857 = as_type<float>(_2308) * _2845;
    float _2859 = fma(_2569, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2847);
    float _2861 = -_2815;
    float _2863 = _2861 + _2849;
    bool _2865 = uint(_2853) >= uint(_901);
    float _2867 = trunc(_2857);
    float _2869 = precise::max(_2867, 0.0);
    uint _2871 = uint(_2869);
    out.m_86.x = _2843;
    out.m_86.y = _2855;
    bool _2873 = !_2865;
    int _2875 = _2873 ? 0 : (-1);
    int _2877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2879 = _2877 != 0;
    float _2881 = fma(_2863, -0.100000001490116119384765625, 1.0);
    int _2883 = ~_2839;
    int _2885 = _2883 + _2875;
    int _2887 = _2885 + 1;
    float _2889 = abs(_1773);
    float _2891 = log2(_2889);
    int _2893 = ~_901;
    int _2895 = _2893 + 1;
    float _2897 = _765 * _2881;
    float _2899 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2901 = _901 * _2887;
    int _2903 = _2901 + _2575;
    float _2905 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2907 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_88.x = _759;
    out.m_88.y = _761;
    out.m_88.z = _763;
    out.m_88.w = _2897;
    int _2909 = int(_2771) + int(_2871);
    float _2911 = -_1327;
    float _2913 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2905);
    bool _2915 = !_2391;
    int _2917 = _2915 ? _2903 : (-1);
    out.m_90.x = _2859;
    bool _2919 = _1773 <= 8000.0;
    bool _2921 = isnan(_1773);
    bool _2923 = _2919 || _2921;
    bool _2925 = isnan(8000.0);
    bool _2927 = _2923 || _2925;
    float _2929 = float(_2927);
    int _2931 = _2917 >> 31;
    int _2933 = _2917 & 3;
    bool _2935 = _2933 != 0;
    float _2937 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2939 = _2931 & 3;
    int _2941 = _2895 * _2909;
    int _2943 = _2941 + _2525;
    int _2945 = _2917 + _2939;
    float _2947 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2913);
    float _2949 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2951 = -_1327;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2899);
    int _2955 = _2945 >> 2;
    float _2957 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2959 = uint(_2943) >= uint(_901);
    float _2961 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2963 = _2955 << 4;
    int _2965 = _2963 + 368;
    float _2967 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2949);
    float _2969 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2953);
    float _2971 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2961);
    uint _2973 = uint(int(uint(_2965) >> uint(2)));
    uint _2975 = uint(int(uint(int(_2973)) >> uint(2)));
    int _2977 = int(_2973) & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    int _2981 = int(_2973) + 1;
    uint _2983 = uint(int(uint(_2981) >> uint(2)));
    int _2985 = _2981 & 3;
    float _2987 = (*spvDescriptorSet0.vp_c9)._m0[int(_2983)][_2985];
    float _2989 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2991 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2957);
    float _2993 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2971);
    bool _2995 = !_2959;
    int _2997 = _2995 ? 0 : (-1);
    float _2999 = _2989 * _2947;
    float _3001 = _2989 * _2969;
    int _3003 = _2917 & 3;
    bool _3005 = _3003 != 0;
    int _3007 = _2965 + 8;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    uint _3011 = uint(int(uint(int(_3009)) >> uint(2)));
    int _3013 = int(_3009) & 3;
    float _3015 = (*spvDescriptorSet0.vp_c9)._m0[int(_3011)][_3013];
    int _3017 = int(_3009) + 1;
    uint _3019 = uint(int(uint(_3017) >> uint(2)));
    int _3021 = _3017 & 3;
    float _3023 = (*spvDescriptorSet0.vp_c9)._m0[int(_3019)][_3021];
    float _3025 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2310);
    int _3027 = _2935 ? 0 : 1;
    float _3029 = exp2(_2937);
    bool _3031 = uint(_3003) > 1u;
    float _3033 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2967);
    int _3035 = ~_3027;
    int _3037 = _3035 + 1;
    int _3039 = _3037 + 1;
    float _3041 = -_1327;
    float _3043 = fma(_3041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2907);
    int _3045 = ~_2909;
    int _3047 = _3045 + _2997;
    int _3049 = _3047 + 1;
    float _3051 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3053 = uint(_3003) >= 2u;
    float _3055 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3043);
    float _3057 = fma(_2292, _2993, _2999);
    int _3059 = _901 * _3049;
    int _3061 = _3059 + _2525;
    bool _3063 = !_3005;
    int _3065 = _3063 ? 0 : 1;
    float _3067 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3051);
    int _3069 = _3053 ? 0 : 1;
    float _3071 = _2989 * _3055;
    int _3073 = _3039;
    if (!_3031)
    {
        int _3075 = ~_3027;
        int _3077 = _3075 + 1;
        _3073 = _3077;
    }
    int _3079 = _3073;
    float _3081 = fma(_2292, _3033, _3001);
    bool _3083 = _3003 != 3;
    float _3085 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3067);
    int _3087 = abs(_3079);
    float _3089 = -_2221;
    float _3091 = _3089 + 1.0;
    int _3093 = abs(_3065);
    float _3095 = fma(_2292, _3085, _3071);
    int _3097 = ~_3069;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    float _3103 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3105 = _3003 != 3;
    float _3107 = _2329 * _2233;
    int _3109 = ~_3087;
    int _3111 = _3109 + 1;
    int _3113 = _3111 + 1;
    float _3115 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3103);
    float _3117 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2991);
    int _3119 = _3101;
    float _3121 = _3117;
    if (_3083)
    {
        int _3123 = ~_3069;
        int _3125 = _3123 + 1;
        _3119 = _3125;
    }
    int _3127 = _3119;
    float _3129 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3115);
    bool _3131 = !_3105;
    int _3133 = _3131 ? 0 : (-1);
    int _3135 = abs(_3127);
    int _3137 = _3113 * as_type<int>(_2987);
    int _3139 = ~_3093;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    bool _3145 = !_2879;
    int _3147 = _3145 ? 0 : 1;
    float _3149 = fma(_3029, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    int _3153 = abs(_3133);
    int _3155 = _3143 * as_type<int>(_2979);
    int _3157 = _3155 + _3137;
    int _3159 = abs(_3147);
    int _3161 = ~_3135;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    float _3167 = fma(_3151, -2.0, 3.0);
    int _3169 = ~_3153;
    int _3171 = _3169 + 1;
    int _3173 = _3171 + 1;
    float _3175 = _3151 * _3151;
    float _3177 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3179 = _3165 * as_type<int>(_3015);
    int _3181 = _3179 + _3157;
    int _3183 = ~_3159;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    float _3189 = _3175 * _3167;
    float _3191 = in.m_92.x;
    int _3193 = _3173 * as_type<int>(_3023);
    int _3195 = _3193 + _3181;
    bool _3197 = !_2391;
    int _3199 = _3197 ? _3061 : (-1);
    float _3201 = -_3189;
    float _3203 = _3201 + 1.0;
    float _3205 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3177);
    int _3207 = _3195 * _3187;
    float _3209 = _2211 + _2147;
    float _3211 = fma(_3203, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3189);
    float _3213 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3205);
    int _3215 = _3199 * _3159;
    int _3217 = _3215 + _3207;
    float _3219 = _2929 * _3211;
    float _3221 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3213);
    float _3223 = _3209 * 0.5;
    float _3225 = float(_3217);
    float _3227 = _2147 * 0.5;
    float _3229 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3231 = _3221 + _2147;
    float _3233 = _2254 * _3107;
    float _3235 = fma(_2213, -0.5, _3227);
    float _3237 = _3025 + _3057;
    float _3239 = _3091 * _3229;
    float _3241 = precise::clamp(_3239, 0.0, 1.0);
    float _3243 = _3231 * 0.5;
    float _3245 = _3117 + _3081;
    float _3247 = _3129 + _3095;
    float _3249 = -_3241;
    float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3253 = _2244 * _3107;
    out.m_94.x = _3223;
    out.m_94.y = _3235;
    out.m_94.z = _3243;
    out.m_94.w = _2147;
    float _3255 = fma(_2244, _3233, _2242);
    float _3257 = _3251 * _3191;
    float _3259 = fma(_2250, _3253, _2238);
    float _3261 = in.m_92.z;
    float _3263 = fma(_2252, _3253, _2240);
    float _3265 = _3257 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _3267 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3269 = isnan(_1921);
    bool _3271 = _3267 || _3269;
    bool _3273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3275 = _3271 || _3273;
    out.gl_Position.x = _2211;
    out.gl_Position.y = _2213;
    out.gl_Position.z = _3221;
    out.gl_Position.w = _2147;
    float _3277 = _1829 * _1891;
    out.m_96.x = _2258;
    out.m_96.y = _2260;
    out.m_96.z = _2262;
    float _3279 = _3277 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3281 = -_2329;
    float _3283 = _3281 + 1.0;
    out.m_98.x = _3265;
    float _3285 = _2244 * _3283;
    out.m_100.x = _3237;
    out.m_100.y = _3245;
    out.m_100.z = _3247;
    float _3287 = _2147;
    float _3289 = _3235;
    float _3291 = _3283;
    float _3293 = _3279;
    if (!_3275)
    {
        _3121 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3295 = _3121;
    float _3297 = _3295;
    float _3299 = _3295;
    if (!_3275)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3301 = _3287;
    out.m_102.x = _3259;
    out.m_102.y = _3263;
    out.m_102.z = _3255;
    out.m_102.w = _3285;
    float _3303 = _3301;
    float _3305 = _3301;
    if (!_3275)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3307 = _3289;
    float _3309 = _3307;
    float _3311 = _3307;
    if (!_3275)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3313 = _3291;
    out.m_104.x = _3225;
    float _3315 = _3279 * _3261;
    float _3317 = _3261;
    float _3319 = _3313;
    float _3321 = _3313;
    if (!_3275)
    {
        _3317 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3323 = _3317;
    float _3325 = _3323;
    float _3327 = _3323;
    if (!_3275)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3329 = _3293;
    bool _3331 = !_3275;
    float _3333 = _3329;
    float _3335 = _3329;
    if (!_3331)
    {
        bool _3337 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3339 = isnan(_1921);
        bool _3341 = _3337 || _3339;
        bool _3343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3345 = _3341 || _3343;
        if (!_3345)
        {
            float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3349 = _1921 + _3347;
            float _3351 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3353 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3351;
            float _3355 = 1.0 / _3353;
            float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3377 = _3349 * _3355;
            float _3379 = precise::clamp(_3377, 0.0, 1.0);
            float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3385 = fma(_3379, _3359, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3387 = fma(_3379, _3383, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3389 = fma(_3379, _3363, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3391 = fma(_3379, _3367, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3393 = fma(_3379, _3371, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3395 = fma(_3379, _3375, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3305 = _3387;
            _3321 = _3393;
            _3299 = _3385;
            _3311 = _3391;
            _3327 = _3389;
            _3335 = _3395;
            _3397 = true;
        }
        else
        {
            bool _3399 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3401 = isnan(_1921);
            bool _3403 = _3399 || _3401;
            bool _3405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3407 = _3403 || _3405;
            if (!_3407)
            {
                _3297 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3409 = _3297;
            _3299 = _3409;
            if (!_3407)
            {
                _3303 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3411 = _3303;
            _3305 = _3411;
            if (!_3407)
            {
                _3325 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3413 = _3325;
            _3327 = _3413;
            if (!_3407)
            {
                _3309 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3415 = _3309;
            _3311 = _3415;
            if (!_3407)
            {
                _3319 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3417 = _3319;
            _3321 = _3417;
            if (!_3407)
            {
                _3333 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3419 = _3333;
            bool _3421 = !_3407;
            _3335 = _3419;
            if (!_3421)
            {
                bool _3423 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3425 = isnan(_1921);
                bool _3427 = _3423 || _3425;
                bool _3429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3431 = _3427 || _3429;
                if (!_3431)
                {
                    float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3435 = _1921 + _3433;
                    float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3439 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3437;
                    float _3441 = 1.0 / _3439;
                    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3445 = _3443 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3463 = _3435 * _3441;
                    float _3465 = precise::clamp(_3463, 0.0, 1.0);
                    float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3471 = fma(_3465, _3445, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3473 = fma(_3465, _3469, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3475 = fma(_3465, _3449, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3477 = fma(_3465, _3453, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3479 = fma(_3465, _3457, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3481 = fma(_3465, _3461, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3305 = _3473;
                    _3321 = _3479;
                    _3299 = _3471;
                    _3311 = _3477;
                    _3327 = _3475;
                    _3335 = _3481;
                    _3397 = true;
                }
                else
                {
                    _3305 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3321 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3299 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3311 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3327 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3335 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3397 = false;
    float _3483 = _3305;
    float _3485 = _3321;
    float _3487 = _3299;
    float _3489 = _3311;
    float _3491 = _3327;
    float _3493 = _3335;
    float _3495 = _3315 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3497 = fma(_3245, -0.5, 0.5);
    float _3499 = precise::clamp(_3497, 0.0, 1.0);
    float _3501 = -_3483;
    float _3503 = _3501 + _3485;
    float _3505 = -_3487;
    float _3507 = _3505 + _3489;
    out.m_55.x = _3495;
    float _3509 = fma(_3499, _3503, _3483);
    float _3511 = -_3491;
    float _3513 = _3511 + _3493;
    float _3515 = fma(_3499, _3507, _3487);
    float _3517 = _3509 * 0.586610972881317138671875;
    bool _3519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3521 = fma(_3499, _3513, _3491);
    out.m_106.x = 0.0;
    float _3523 = fma(_3515, 0.298911988735198974609375, _3517);
    bool _3525 = _1829 > 0.0;
    bool _3527 = isnan(_1829);
    bool _3529 = _3525 || _3527;
    bool _3531 = isnan(0.0);
    bool _3533 = _3529 || _3531;
    float _3535 = fma(_3521, 0.114477999508380889892578125, _3523);
    bool _3537 = _1891 <= 0.0;
    bool _3539 = !_3533;
    bool _3541 = _3537 || _3539;
    float _3543 = -_3535;
    float _3545 = _3515 + _3543;
    float _3547 = -_3535;
    float _3549 = _3509 + _3547;
    float _3551 = -_3535;
    float _3553 = _3521 + _3551;
    float _3555 = fma(_3545, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3535);
    float _3557 = fma(_3549, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3535);
    float _3559 = fma(_3553, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3535);
    bool _3561 = !_3519;
    if (!_3561)
    {
        float _3563 = -_1757;
        float _3565 = _3563 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3567 = -_1759;
        float _3569 = _3567 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3571 = -_1761;
        float _3573 = _3571 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3575 = _3565 * _3565;
        float _3577 = fma(_3569, _3569, _3575);
        float _3579 = fma(_3573, _3573, _3577);
        float _3581 = sqrt(_3579);
        float _3583 = rsqrt(_3579);
        float _3585 = -_3581;
        float _3587 = _3585 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3589 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3591 = precise::clamp(_3589, 0.0, 1.0);
        float _3593 = _3569 * _3583;
        float _3595 = _3565 * _3583;
        float _3597 = abs(_3591);
        float _3599 = log2(_3597);
        float _3601 = _3573 * _3583;
        float _3603 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3605 = _3245 * _3595;
        float _3607 = -_3595;
        float _3609 = -_3603;
        float _3611 = fma(_3607, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3609);
        float _3613 = fma(_3237, _3593, _3605);
        float _3615 = -_3601;
        float _3617 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3611);
        float _3619 = fma(_3247, _3601, _3613);
        float _3621 = precise::clamp(_3619, 0.0, 1.0);
        float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3625 = _3617 + _3623;
        float _3627 = _3599 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3629 = _3625 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3631 = precise::clamp(_3629, 0.0, 1.0);
        float _3633 = exp2(_3627);
        float _3635 = _3633 * _3631;
        float _3637 = _3621 * _3635;
        float _3639 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3641 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3643 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3639;
        out.m_106.y = _3641;
        out.m_106.z = _3643;
    }
    out.m_80.x = _3555;
    out.m_80.y = _3557;
    out.m_80.z = _3559;
    if (!_3541)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _3645 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3645;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3397 = false;
    bool _689 = false;
    bool _479 = false;
    bool _373 = false;
    bool _271 = false;
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
        float _3714 = as_type<float>(_149);
        out.gl_Position.z = _3714;
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
        float _3779 = as_type<float>(_179);
        out.gl_Position.z = _3779;
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
    float _249 = _245;
    float _251 = _243;
    float _253 = _239;
    float _269;
    if (!_247)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _181;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = in.m_72.x;
    float _281 = in.m_72.y;
    bool _283 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_273);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    bool _299 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_273);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_293;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    float _319 = 1.0 / _297;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _323 = _309 * _313;
    float _325 = -_309;
    float _327 = _325 + 1.0;
    float _329 = _277 * _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_317, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _335 * _323;
    float _341 = _337 * _323;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _345 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _347 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].x, _343);
    float _349 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].y, _345);
    float _351 = _347 * _279;
    float _353 = _349 * _281;
    bool _355 = !_321;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _359 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        _371 = _181;
    }
    _373 = false;
    float _375 = _371;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _379 = _375 + _377;
    bool _381 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _383 = isnan(_375);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _393;
    bool _397 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _399 = isnan(_375);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -_391;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _413;
    float _417 = 1.0 / _395;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = _407 * _411;
    float _423 = -_407;
    float _425 = _423 + 1.0;
    float _427 = _379 * _417;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _429;
    float _433 = fma(_415, _427, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _435;
    float _439 = fma(_431, _427, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _441 = _433 * _421;
    float _443 = fma(_437, _427, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _445 = _439 * _421;
    float _447 = _443 * _421;
    float _449 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[107].x, _441);
    float _451 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[107].y, _447);
    float _453 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[107].z, _445);
    float _455 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[108].x, _449);
    float _457 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[108].y, _451);
    float _459 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[108].z, _453);
    bool _461 = !_419;
    float _477;
    if (!_461)
    {
        float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _465 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _467 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _469 = _467 * _463;
        float _471 = floor(_469);
        float _473 = -_471;
        float _475 = _469 + _473;
        _477 = _475;
        _479 = true;
    }
    else
    {
        _477 = _181;
    }
    _479 = false;
    float _481 = _477;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _481 + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _501 = isnan(_481);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = 1.0 / _489;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _517 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _519 = isnan(_481);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _531 = 1.0 / _497;
    float _533 = _493 * _511;
    bool _535 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _537 = isnan(_481);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = 1.0 / _515;
    float _549 = -_509;
    float _551 = _549 + 1.0;
    float _553 = fma(_533, _485, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _559 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _561 = isnan(_481);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -_545;
    float _573 = _571 + 1.0;
    float _575 = _545 * _551;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _581 = 1.0 / _557;
    float _583 = -_569;
    float _585 = _583 + 1.0;
    float _587 = _527 * _573;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _589;
    float _593 = _579 * _531;
    float _595 = _509 * _585;
    float _597 = _553 * _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _601 = _481 + _599;
    float _603 = -_527;
    float _605 = _603 + 1.0;
    bool _607 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _609 = isnan(_481);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _591 * _547;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _627 = _481 + _625;
    float _629 = fma(_593, _601, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[115].x, _597);
    float _633 = -_617;
    float _635 = _633 + 1.0;
    float _637 = _623 * _581;
    float _639 = fma(_619, _627, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _643 = _481 + _641;
    float _645 = fma(_629, _575, _631);
    float _647 = _569 * _635;
    float _649 = _455 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _651 = fma(_637, _643, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _653 = fma(_639, _595, _645);
    float _655 = _459 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = fma(_651, _647, _653);
    float _659 = _457 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _661 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[119].x, _657);
    float _665 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _671 = !_529;
    float _687;
    if (!_671)
    {
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _675 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _679 = _677 * _673;
        float _681 = floor(_679);
        float _683 = -_681;
        float _685 = _679 + _683;
        _687 = _685;
        _689 = true;
    }
    else
    {
        _687 = _181;
    }
    _689 = false;
    float _691 = _687;
    bool _693 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _695 = isnan(_691);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _709 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _711 = isnan(_691);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _727 = _691 + _725;
    float _729 = -_703;
    float _731 = _729 + 1.0;
    bool _733 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _735 = 1.0 / _707;
    float _737 = _719 * _731;
    float _739 = -_719;
    float _741 = _739 + 1.0;
    float _743 = _723 * _735;
    float _745 = fma(_743, _727, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _749 = _745 * _737;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _753 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[131].x, _749);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _757 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[132].x, _753);
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _757 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _767 = !_733;
    if (!_767)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _771 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _183 = _781;
    }
    float _783 = _183;
    float _785 = in.m_48.x;
    float _787 = in.m_48.y;
    float _789 = in.m_48.z;
    float _791 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _793 = log2(_791);
    float _795 = _163 * 2.0;
    float _797 = in.m_57.y;
    float _799 = _351 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _801 = _353 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _803 = in.m_57.z;
    float _805 = floor(_795);
    float _807 = in.m_68.w;
    float _809 = in.m_66.w;
    float _811 = _793 * _131;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _815 = int(_813);
    float _817 = _195 * _787;
    float _819 = _201 * _787;
    float _821 = _207 * _787;
    float _823 = fma(_193, _785, _817);
    float _825 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _827 = fma(_199, _785, _819);
    float _829 = fma(_205, _785, _821);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _833 = exp2(_811);
    float _835 = _163 + _797;
    float _837 = -_831;
    float _839 = fma(_825, 2.0, _837);
    float _841 = _797 * 2.0;
    float _843 = fma(_197, _789, _823);
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _847 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _849 = floor(_841);
    float _851 = _835 + (-1.0);
    bool _853 = _805 > 0.0;
    float _855 = _163 + _803;
    bool _857 = _805 >= 0.0;
    bool _859 = isnan(_805);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = fma(_847, -2.0, _845);
    float _869 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _873 = _797 + _803;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _877 = _875 != 0;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _881 = _879 != 0;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _885 = _883 != 0;
    float _887 = fma(_203, _789, _827);
    float _889 = _855 + (-1.0);
    float _891 = fma(_209, _789, _829);
    float _893 = float(_815);
    float _895 = _803 * 2.0;
    bool _897 = _849 > 0.0;
    float _899 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _901 = int(_899);
    bool _903 = _849 >= 0.0;
    bool _905 = isnan(_849);
    bool _907 = _903 || _905;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _915 = 1.0 + _913;
    float _917 = _873 + (-1.0);
    float _919 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _921 = !_881;
    int _923 = _921 ? 0 : 1;
    float _925 = -_833;
    float _927 = _925 + 1.0;
    float _929 = 1.0 / _915;
    bool _931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _943 = -_131;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _947 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _867);
    float _949 = _939 ? _927 : 0.0;
    float _951 = floor(_895);
    float _953 = _871 * _131;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _957 = in.m_70.w;
    bool _959 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _961 = isnan(1.0);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _967 = _963 || _965;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _971 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].w, _955);
    float _973 = float(_901);
    float _975 = 1.0 / _893;
    float _977 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _969);
    float _979 = precise::max(0.0, _953);
    float _981 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _971);
    int _983 = _865 ? 0 : 1;
    float _985 = _973 * _131;
    float _987 = precise::min(_979, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _989 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _977);
    float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _993 = _951 >= 0.0;
    bool _995 = isnan(_951);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    float _1003 = _887 + _807;
    bool _1005 = !_877;
    int _1007 = _1005 ? 0 : 1;
    float _1009 = _843 + _809;
    bool _1011 = !_885;
    int _1013 = _1011 ? 0 : 1;
    float _1015 = _803 + (-0.5);
    int _1017 = _1001 ? 0 : 1;
    float _1019 = _975 * _131;
    if (_967)
    {
        float _1021 = _949 * _929;
        _141 = _1021;
    }
    float _1023 = _141;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1027 = _1025 != 0;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1035 = _1033 != 0;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _1003 + _1037;
    float _1041 = _891 + _957;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1045 = _1009 + _1043;
    int _1047 = ~_1017;
    int _1049 = _1047 + 1;
    int _1051 = _1049 + 1;
    float _1053 = _1039 * _1039;
    float _1055 = _987 * _991;
    int _1057 = _911 ? 0 : 1;
    bool _1059 = !_1031;
    int _1061 = _1059 ? 0 : 1;
    float _1063 = fma(_1045, _1045, _1053);
    int _1065 = ~_983;
    int _1067 = _1065 + 1;
    int _1069 = _1067 + 1;
    float _1071 = abs(_1055);
    float _1073 = log2(_1071);
    int _1075 = ~_1057;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1069;
    int _1083 = _1079;
    int _1085 = _1051;
    if (!_853)
    {
        int _1087 = ~_983;
        int _1089 = _1087 + 1;
        _1081 = _1089;
    }
    int _1091 = _1081;
    if (!_897)
    {
        int _1093 = ~_1057;
        int _1095 = _1093 + 1;
        _1083 = _1095;
    }
    int _1097 = _1083;
    bool _1099 = !_1035;
    int _1101 = _1099 ? 0 : 1;
    float _1103 = in.m_74.x;
    float _1105 = in.m_74.y;
    float _1107 = in.m_74.z;
    int _1109 = abs(_1061);
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1113 = _1041 + _1111;
    int _1115 = abs(_1101);
    float _1117 = float(_1091);
    float _1119 = fma(_1113, _1113, _1063);
    bool _1121 = _951 > 0.0;
    float _1123 = sqrt(_1119);
    float _1125 = float(_1109);
    bool _1127 = !_1027;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = float(_1115);
    float _1133 = _1125 * _1117;
    int _1135 = abs(_1129);
    float _1137 = _797 + (-0.5);
    float _1139 = rsqrt(_1119);
    if (!_1121)
    {
        int _1141 = ~_1017;
        int _1143 = _1141 + 1;
        _1085 = _1143;
    }
    int _1145 = _1085;
    float _1147 = _1133 * (-2.0);
    float _1149 = float(_1135);
    float _1151 = _799 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1153 = float(_1145);
    float _1155 = fma(_1147, _1105, _1105);
    float _1157 = _1123 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1159 = float(_1097);
    float _1161 = fma(_941, _1147, _941);
    float _1163 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1155);
    float _1165 = _1149 * _1153;
    float _1167 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1169 = precise::min(_1151, _1157);
    float _1171 = fma(_1161, _1023, _1163);
    float _1173 = _1165 * (-2.0);
    float _1175 = _1131 * _1159;
    float _1177 = _163 + (-0.5);
    float _1179 = _1139 * _1169;
    float _1181 = fma(_1173, _1103, _1103);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1185 = 1.0 + _1183;
    float _1187 = fma(_869, _1173, _869);
    float _1189 = _1039 * _1179;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1181);
    float _1193 = 1.0 / _1185;
    float _1195 = _1045 * _1179;
    float _1197 = precise::max(_953, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1199 = fma(_1187, _1023, _1191);
    float _1201 = (-1.0) + (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _1203 = -_1195;
    float _1205 = _1045 + _1203;
    float _1207 = precise::min(_1197, 1.0);
    float _1209 = _1199 * 0.15915493667125701904296875;
    float _1211 = -_1189;
    float _1213 = _1039 + _1211;
    float _1215 = _1175 * (-2.0);
    float _1217 = exp2(_1167);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1221 = _1207 + _1219;
    float _1223 = _1213 * _1213;
    float _1225 = fma(_919, _1215, _919);
    float _1227 = fma(_1215, _1107, _1107);
    float _1229 = _1113 * _1179;
    float _1231 = fma(_1205, _1205, _1223);
    float _1233 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1235 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    float _1237 = -_1229;
    float _1239 = _1113 + _1237;
    float _1241 = _1221 * _1193;
    float _1243 = fma(_1225, _1023, _1235);
    float _1245 = fma(_1239, _1239, _1231);
    float _1247 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1249 = _1003 + _1247;
    float _1251 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1233);
    float _1253 = sqrt(_1245);
    float _1255 = _1171 * 0.15915493667125701904296875;
    float _1257 = fma(_1241, _1201, 1.0);
    float _1259 = _1243 * 0.15915493667125701904296875;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _1263 = _1261 + 1.0;
    float _1265 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1267 = _1009 + _1265;
    float _1269 = _1249 * _1249;
    float _1271 = _1209 * 6.283185482025146484375;
    float _1273 = sin(_1271);
    float _1275 = fma(_1217, _1263, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _1277 = fma(_1267, _1267, _1269);
    float _1279 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1281 = _1041 + _1279;
    float _1283 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1251);
    float _1285 = _1275 * _1257;
    float _1287 = fma(_1281, _1281, _1277);
    float _1289 = _1255 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    float _1293 = _1139 * _1253;
    float _1295 = _227 * _1285;
    float _1297 = _223 * _1285;
    float _1299 = _801 * _1293;
    float _1301 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1295);
    float _1303 = _799 * _1293;
    float _1305 = _1255 * 6.283185482025146484375;
    float _1307 = cos(_1305);
    float _1309 = _1299 * _1301;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1297);
    float _1313 = _1209 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1273 * _1291;
    float _1319 = _1259 * 6.283185482025146484375;
    float _1321 = cos(_1319);
    float _1323 = _1273 * _1307;
    float _1325 = _1259 * 6.283185482025146484375;
    float _1327 = sin(_1325);
    float _1329 = _1315 * _1307;
    float _1331 = _1315 * _1291;
    float _1333 = _1315 * _1321;
    float _1335 = _1273 * _1321;
    float _1337 = _1307 * _1321;
    float _1339 = _1291 * _1321;
    float _1341 = _1303 * _1311;
    float _1343 = _1333 * _1309;
    float _1345 = sqrt(_1283);
    float _1347 = _1335 * _1309;
    float _1349 = fma(_1327, _1329, _1317);
    float _1351 = -_1331;
    float _1353 = fma(_1327, _1323, _1351);
    float _1355 = -_1323;
    float _1357 = fma(_1327, _1331, _1355);
    float _1359 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1361 = _1359 * 0.5;
    float _1363 = -_1309;
    float _1365 = _1327 * _1363;
    float _1367 = fma(_1349, _1341, _1343);
    float _1369 = sqrt(_1287);
    float _1371 = fma(_1327, _1317, _1329);
    float _1373 = fma(_1337, _1341, _1365);
    float _1375 = fma(_1357, _1361, _1367);
    float _1377 = fma(_1353, _1341, _1347);
    float _1379 = fma(_1339, _1361, _1373);
    float _1381 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1383 = fma(_1371, _1361, _1377);
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1387 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1389 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1381);
    float _1391 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1393 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1385);
    float _1395 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1389);
    bool _1397 = _1369 < _1387;
    float _1399 = float(_1397);
    float _1401 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1393);
    float _1403 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1391);
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1407 = -_1229;
    float _1409 = _1041 + _1407;
    float _1411 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1413 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1403);
    float _1415 = fma(_1405, _1399, _1041);
    float _1417 = fma(_1411, _1399, _1009);
    float _1419 = -_1189;
    float _1421 = _1003 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1425 = _1415 + _1423;
    float _1427 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1431 = _1417 + _1429;
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1435 = _1425 * _1425;
    float _1437 = fma(_1427, _1399, _1003);
    float _1439 = fma(_1431, _1431, _1435);
    float _1441 = -_1195;
    float _1443 = _1009 + _1441;
    float _1445 = sqrt(_1439);
    float _1447 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1433);
    float _1449 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1447);
    bool _1451 = _1445 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1453 = _1447;
    float _1455 = _1427;
    float _1457 = _1383;
    float _1459 = _1425;
    if (!_1451)
    {
        _1453 = _1417;
    }
    float _1461 = _1453;
    float _1463 = _1461;
    if (!_1451)
    {
        _1455 = _1415;
    }
    float _1465 = _1455;
    float _1467 = _1465;
    if (!_1451)
    {
        _1457 = _1437;
    }
    float _1469 = _1457;
    bool _1471 = !_1451;
    float _1473 = _1469;
    if (!_1471)
    {
        float _1475 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1479 = _1445 + _1477;
        float _1481 = _1437 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1483 = _1479 * _1475;
        float _1485 = rsqrt(_1439);
        float _1487 = _1483 * 0.15915493667125701904296875;
        float _1489 = _1487 * 6.283185482025146484375;
        float _1491 = sin(_1489);
        float _1493 = _1487 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = fma(_1491, _1481, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1499 = _1485 * _1497;
        float _1501 = _1495 + (-1.0);
        float _1503 = fma(_1431, _1499, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1505 = fma(_1425, _1499, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1507 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1509 = fma(_1437, _1495, _1507);
        _1473 = _1509;
        _1463 = _1503;
        _1467 = _1505;
    }
    float _1511 = _1473;
    float _1513 = _1463;
    float _1515 = _1467;
    float _1517 = -_1003;
    float _1519 = _1517 + _1511;
    float _1521 = -_1009;
    float _1523 = _1521 + _1513;
    float _1525 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1527 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1529 = _1519 * _1519;
    float _1531 = -_1041;
    float _1533 = _1531 + _1515;
    float _1535 = 1.0 / _1525;
    float _1537 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1527);
    float _1539 = fma(_1523, _1523, _1529);
    float _1541 = -_1195;
    float _1543 = _1541 + _1513;
    float _1545 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1537);
    float _1547 = fma(_1533, _1533, _1539);
    float _1549 = -_1189;
    float _1551 = _1549 + _1511;
    float _1553 = -_1229;
    float _1555 = _1553 + _1515;
    float _1557 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1559 = sqrt(_1547);
    float _1561 = _1557 + _1525;
    float _1563 = _1561 * _1535;
    float _1565 = _1563 * 0.5;
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1569 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1567);
    bool _1571 = _1559 > 0.0;
    float _1573 = 1.0 / _1569;
    bool _1575 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan(0.5);
    bool _1583 = _1579 || _1581;
    bool _1585 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1587 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.5);
    bool _1593 = _1589 || _1591;
    float _1595 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1599 = _1511;
    float _1601 = _1535;
    float _1603 = _1547;
    float _1605 = _1555;
    if (!_1571)
    {
        _1595 = _1543;
    }
    float _1607 = _1595;
    float _1609 = _1607;
    float _1611 = _1607;
    if (!_1571)
    {
        _1597 = _1551;
    }
    float _1613 = _1597;
    float _1615 = _1613;
    if (!_1571)
    {
        _1599 = _1555;
    }
    float _1617 = _1599;
    bool _1619 = !_1571;
    float _1621 = _1617;
    if (!_1619)
    {
        float _1623 = _243 * _243;
        float _1625 = fma(_239, _239, _1623);
        float _1627 = fma(_245, _245, _1625);
        float _1629 = rsqrt(_1547);
        float _1631 = sqrt(_1627);
        float _1633 = _1523 * _1629;
        float _1635 = _1519 * _1629;
        float _1637 = _1533 * _1629;
        bool _1639 = _1631 > 0.0;
        float _1641 = _1631;
        float _1643 = _1629;
        if (!_1639)
        {
            _1609 = _1543;
        }
        float _1645 = _1609;
        _1611 = _1645;
        if (!_1639)
        {
            _1641 = _1551;
        }
        float _1647 = _1641;
        _1615 = _1647;
        if (!_1639)
        {
            _1643 = _1555;
        }
        float _1649 = _1643;
        bool _1651 = !_1639;
        _1621 = _1649;
        if (!_1651)
        {
            float _1653 = rsqrt(_1627);
            float _1655 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1657 = _243 * _1653;
            float _1659 = _239 * _1653;
            float _1661 = _245 * _1653;
            float _1663 = _1635 * _1657;
            float _1665 = fma(_1633, _1659, _1663);
            float _1667 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1669 = fma(_1637, _1661, _1665);
            float _1671 = _1669 * _1667;
            float _1673 = fma(_239, _1671, _1543);
            float _1675 = fma(_243, _1671, _1551);
            float _1677 = fma(_245, _1671, _1555);
            _1611 = _1673;
            _1615 = _1675;
            _1621 = _1677;
            _1601 = _1667;
        }
    }
    float _1679 = _1611;
    float _1681 = _1615;
    float _1683 = _1621;
    float _1685 = _1601;
    float _1687 = _1685;
    if (_1583)
    {
        _1603 = 1.0;
    }
    float _1689 = _1603;
    float _1691 = _1689;
    if (_1593)
    {
        _249 = _1679;
    }
    float _1693 = _249;
    float _1695 = _1693;
    if (_1593)
    {
        _251 = _1681;
    }
    float _1697 = _251;
    float _1699 = _1697;
    if (_1593)
    {
        _253 = _1683;
    }
    float _1701 = _253;
    float _1703 = _1701;
    if (!_1593)
    {
        float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1707 = _1421 + _1705;
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1711 = _1443 + _1709;
        float _1713 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1715 = -_1443;
        float _1717 = _1715 + _1679;
        float _1719 = _1707 * _1707;
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1723 = _1409 + _1721;
        float _1725 = -_1421;
        float _1727 = _1725 + _1681;
        float _1729 = -_1409;
        float _1731 = _1729 + _1683;
        float _1733 = fma(_1711, _1711, _1719);
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1737 = fma(_1723, _1723, _1733);
        float _1739 = sqrt(_1737);
        float _1741 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1743 = precise::min(_1739, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1745 = _1743 * _1735;
        float _1747 = _1741 * _1745;
        float _1749 = fma(_1717, _1747, _1443);
        float _1751 = fma(_1727, _1747, _1421);
        float _1753 = fma(_1731, _1747, _1409);
        _1605 = _1719;
        _1699 = _1751;
        _1695 = _1749;
        _1703 = _1753;
        _1687 = _1735;
    }
    float _1755 = _1605;
    float _1757 = _1699;
    float _1759 = _1695;
    float _1761 = _1703;
    float _1763 = _1687;
    float _1765 = _1755;
    float _1767 = _1763;
    if (_1583)
    {
        _1459 = 1.0;
    }
    float _1769 = _1459;
    float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1773 = _1573 * _1771;
    float _1775 = _1769;
    if (!_1583)
    {
        float _1777 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1779 = _1777 * 0.15915493667125701904296875;
        float _1781 = _1779 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1787 = _1785 * 0.15915493667125701904296875;
        float _1789 = _1779 * 6.283185482025146484375;
        float _1791 = sin(_1789);
        float _1793 = 1.0 / _1783;
        float _1795 = _1787 * 6.283185482025146484375;
        float _1797 = cos(_1795);
        float _1799 = _1791 * _1793;
        float _1801 = _1787 * 6.283185482025146484375;
        float _1803 = sin(_1801);
        float _1805 = _1797 * _1799;
        float _1807 = 1.0 / _1805;
        float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1811 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1809;
        float _1813 = 1.0 / _1811;
        float _1815 = _1803 * _1807;
        float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1819 = fma(_1773, _1815, _1817);
        float _1821 = _1819 * _1813;
        float _1823 = precise::clamp(_1821, 0.0, 1.0);
        _1765 = _1787;
        _1767 = _1819;
        _1691 = _1823;
    }
    float _1825 = _1765;
    float _1827 = _1767;
    float _1829 = _1691;
    float _1831 = _1825;
    float _1833 = _1827;
    if (!_1583)
    {
        float _1835 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1837 = _1835 * 0.15915493667125701904296875;
        float _1839 = _1837 * 6.283185482025146484375;
        float _1841 = cos(_1839);
        float _1843 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1845 = _1843 * 0.15915493667125701904296875;
        float _1847 = _1837 * 6.283185482025146484375;
        float _1849 = sin(_1847);
        float _1851 = 1.0 / _1841;
        float _1853 = _1845 * 6.283185482025146484375;
        float _1855 = cos(_1853);
        float _1857 = _1849 * _1851;
        float _1859 = _1845 * 6.283185482025146484375;
        float _1861 = sin(_1859);
        float _1863 = _1855 * _1857;
        float _1865 = 1.0 / _1863;
        float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1869 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1867;
        float _1871 = 1.0 / _1869;
        float _1873 = _1861 * _1865;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1877 = fma(_1773, _1873, _1875);
        float _1879 = _1877 * _1871;
        float _1881 = precise::clamp(_1879, 0.0, 1.0);
        float _1883 = -_1881;
        float _1885 = _1883 + 1.0;
        _1831 = _1851;
        _1833 = _1873;
        _1775 = _1885;
    }
    float _1887 = _1831;
    float _1889 = _1833;
    float _1891 = _1775;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1895 = _1757 + _1893;
    float _1897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1899 = _1759 + _1897;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1903 = _1761 + _1901;
    float _1905 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1907 = _1895 * _1895;
    float _1909 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1911 = fma(_1899, _1899, _1907);
    float _1913 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1909);
    float _1915 = fma(_1903, _1903, _1911);
    float _1917 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1919 = rsqrt(_1915);
    float _1921 = sqrt(_1915);
    float _1923 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1925 = _1899 * _1923;
    float _1927 = _1903 * _1923;
    float _1929 = _1925 * _1925;
    float _1931 = _1927 * _1927;
    float _1933 = _1929 + _1931;
    float _1935 = sqrt(_1933);
    bool _1937 = _1935 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1941 = _1935 + _1939;
    float _1943 = _1919;
    float _1945 = _1889;
    float _1947 = _1941;
    float _1949 = _1887;
    float _1951 = _1933;
    if (_1937)
    {
        float _1953 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1943 = _1953;
    }
    float _1955 = _1943;
    if (_1937)
    {
        float _1957 = rsqrt(_1933);
        _1945 = _1957;
    }
    float _1959 = _1945;
    float _1961 = _1955;
    float _1963 = _1959;
    if (_1937)
    {
        float _1965 = _1941 * _1955;
        _1947 = _1965;
    }
    float _1967 = _1947;
    if (_1937)
    {
        float _1969 = _1967 * 0.15915493667125701904296875;
        _1949 = _1969;
    }
    float _1971 = _1949;
    float _1973 = _1903;
    float _1975 = _1971;
    if (_1937)
    {
        float _1977 = _1971 * 6.283185482025146484375;
        float _1979 = sin(_1977);
        _1973 = _1979;
    }
    float _1981 = _1973;
    float _1983 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1985 = precise::max(0.0, _1983);
    float _1987 = _1551;
    if (_1937)
    {
        float _1989 = _1971 * 6.283185482025146484375;
        float _1991 = cos(_1989);
        _1987 = _1991;
    }
    float _1993 = _1987;
    float _1995 = -_1923;
    float _1997 = -_1985;
    float _1999 = fma(_1895, _1995, _1997);
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1937)
    {
        float _2003 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1961 = _2003;
    }
    float _2005 = _1961;
    float _2007 = _2005;
    if (!_1937)
    {
        _1975 = _1929;
    }
    float _2009 = _1975;
    float _2011 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2013 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2015 = _2009;
    if (_1937)
    {
        float _2017 = fma(_1981, _2005, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2001 = _2017;
    }
    float _2019 = _2001;
    float _2021 = floor(_2011);
    float _2023 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2013);
    float _2025 = _2019;
    float _2027 = _1993;
    if (_1937)
    {
        float _2029 = _1993 + (-1.0);
        _2007 = _2029;
    }
    float _2031 = _2007;
    float _2033 = 0.0;
    float _2035 = _2031;
    if (_1937)
    {
        float _2037 = _1959 * _2019;
        _2033 = _2037;
    }
    float _2039 = _2033;
    if (!_1937)
    {
        _2025 = _1925;
    }
    float _2041 = _2025;
    float _2043 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2023);
    float _2045 = _2041;
    if (_1937)
    {
        float _2047 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1951 = _2047;
    }
    float _2049 = _1951;
    if (_1937)
    {
        float _2051 = _1925 * _2039;
        _2045 = _2051;
    }
    float _2053 = _2045;
    if (!_1937)
    {
        _2035 = _1927;
    }
    float _2055 = _2035;
    float _2057 = _2055;
    if (_1937)
    {
        float _2059 = _1927 * _2039;
        _2057 = _2059;
    }
    float _2061 = _2057;
    if (!_1937)
    {
        _1963 = _1999;
    }
    float _2063 = _1963;
    float _2065 = _2063;
    if (_1937)
    {
        float _2067 = fma(_1999, _1993, _2049);
        _2065 = _2067;
    }
    float _2069 = _2065;
    if (_1937)
    {
        float _2071 = _2053 * _2053;
        _2015 = _2071;
    }
    float _2073 = _2015;
    float _2075 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1937)
    {
        _2027 = _1931;
    }
    float _2077 = _2027;
    float _2079 = fma(_2069, _2069, _2073);
    float _2081 = _2077;
    if (_1937)
    {
        float _2083 = _2061 * _2061;
        _2081 = _2083;
    }
    float _2085 = _2081;
    float _2087 = fma(_1409, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2089 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = _2079 + _2085;
    float _2093 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2095 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2093);
    float _2105 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2095);
    float _2107 = rsqrt(_2091);
    float _2109 = -_2101;
    float _2111 = _2109 + 1.0;
    float _2113 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2103);
    float _2115 = _2105 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2117 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2119 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2121 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2123 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2125 = abs(_2111);
    float _2127 = log2(_2125);
    float _2129 = -_2119;
    float _2131 = fma(_2129, _2117, 1.0);
    float _2133 = -_2021;
    float _2135 = _2011 + _2133;
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2123);
    float _2139 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2137);
    float _2141 = _2107 * _2053;
    float _2143 = floor(_2087);
    float _2145 = _2107 * _2061;
    float _2147 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2139);
    float _2149 = _2107 * _2069;
    float _2151 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2153 = fma(_1513, 6.2500002968590706586837768554688e-05, 0.5);
    float _2155 = fma(_1515, 6.2500002968590706586837768554688e-05, 0.5);
    float _2157 = _2149 + 1.0;
    float _2159 = -_2151;
    float _2161 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2159);
    float _2163 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2165 = log2(_2131);
    float _2167 = -_2145;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2161);
    float _2171 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2173 = -_2143;
    float _2175 = _2087 + _2173;
    float _2177 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2179 = exp2(_2163);
    float _2181 = fma(_2169, -0.5, 0.5);
    float _2183 = fma(_2169, 0.5, 0.5);
    float _2185 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2171);
    float _2187 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2177);
    float _2189 = fma(_2183, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2191 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2185);
    float _2193 = 1.0 / _2147;
    float _2195 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2187);
    float _2197 = fma(_2183, _2189, -0.212114393711090087890625);
    float _2199 = _2165 * 0.693147182464599609375;
    float _2201 = fma(_2183, _2197, 1.570728778839111328125);
    float _2203 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2205 = sqrt(_2181);
    float _2207 = -_2149;
    float _2209 = fma(_2179, _2157, _2207);
    float _2211 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2191);
    float _2213 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2195);
    float _2215 = fma(_2209, 0.5, 0.5);
    float _2217 = _2211 * _2193;
    float _2219 = _2213 * _2193;
    float2 _6926 = float2(_2135, _2175);
    float _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6926, float2(0.0), isnan(_6926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6926, float2(0.0), isnan(_6926)), level(0.0)).x;
    float _2223 = fma(_2219, -0.5, 0.5);
    float _2225 = _2205 * 0.636619746685028076171875;
    float _2227 = fma(_2217, 0.5, 0.5);
    float _2229 = -_2201;
    float _2231 = fma(_2225, _2229, 1.0);
    float3 _6949 = float3(_2227, _2223, _2203);
    float _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6949, float3(0.0), isnan(_6949)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6949, float3(0.0), isnan(_6949)), level(0.0)).x;
    float3 _6960 = float3(_2227, _2223, _2203);
    float4 _2236 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6960, float3(0.0), isnan(_6960)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6960, float3(0.0), isnan(_6960)), level(0.0)).xyzw;
    float _2238 = _2236.x;
    float _2240 = _2236.y;
    float _2242 = _2236.z;
    float _2244 = _2236.w;
    float2 _6976 = float2(_2231, _2215);
    float3 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6976, float2(0.0), isnan(_6976)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6976, float2(0.0), isnan(_6976)), level(0.0)).xyz;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float2 _6990 = float2(_2153, _2155);
    float3 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6990, float2(0.0), isnan(_6990)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6990, float2(0.0), isnan(_6990)), level(0.0)).xyz;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    float _2264 = float(uint(_901));
    float _2266 = trunc(_1019);
    int _2268 = int(_2266);
    int _2270 = ~_901;
    int _2272 = _2270 + 1;
    out.m_76.x = _661;
    out.m_76.y = _665;
    out.m_76.z = _667;
    out.m_76.w = _669;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2276 = _2274 != 0;
    float _2278 = -_989;
    float _2280 = _2278 + 1.0;
    int _2282 = ~_901;
    int _2284 = _2282 + 1;
    float _2286 = -_981;
    float _2288 = _2286 + 1.0;
    float _2290 = 1.0 / _2264;
    out.m_78.x = _1443;
    out.m_78.y = _1421;
    out.m_78.z = _1409;
    float _2292 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2294 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_80.w = _1169;
    float _2296 = float(uint(_2268));
    float _2298 = _985 * _173;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2302 = _2300 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2304 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2306 = exp2(_2294);
    out.m_82.x = _1303;
    int _2308 = as_type<int>(_2290) + (-2);
    float _2310 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2304);
    out.m_84.x = _1759;
    out.m_84.y = _1757;
    out.m_84.z = _1761;
    float _2312 = as_type<float>(_2308) * _2296;
    float _2314 = trunc(_2298);
    int _2316 = int(_2314);
    float _2318 = trunc(_2312);
    float _2320 = precise::max(_2318, 0.0);
    uint _2323 = uint(_2320);
    float _2325 = -_2306;
    float _2327 = _2325 + 1.0;
    float _2329 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2331 = _2284 * int(_2323);
    int _2333 = _2331 + _2268;
    float _2335 = float(uint(_2333));
    float _2337 = as_type<float>(_2308) * _2335;
    int _2339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2341 = _2339 != 0;
    float _2343 = trunc(_2337);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    bool _2349 = !_2341;
    float _2351 = _2349 ? 7.345489978790283203125 : 1.0;
    bool _2353 = _163 > 0.5;
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2359 = _2351 * _163;
    float _2361 = float(_2268);
    float _2363 = -_223;
    int _2365 = _2353 ? as_type<int>(_2363) : as_type<int>(_223);
    float _2367 = 1.0 / _2357;
    bool _2369 = _2361 >= _973;
    bool _2371 = isnan(_2361);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(_973);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    int _2381 = int(_2323) + int(_2347);
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2385 = _2383 != 0;
    float _2387 = trunc(_2379);
    int _2389 = int(_2387);
    bool _2391 = _901 == 0;
    int _2393 = _2272 * _2381;
    int _2395 = _2393 + _2268;
    bool _2397 = !_2385;
    float _2399 = _2397 ? _223 : as_type<float>(_2365);
    bool _2401 = uint(_2395) >= uint(_901);
    float _2403 = floor(_2359);
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2407 = _2405 != 0;
    bool _2409 = !_2401;
    int _2411 = _2409 ? 0 : (-1);
    bool _2413 = _797 > 0.5;
    float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2417 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2415;
    int _2419 = ~_2381;
    int _2421 = _2419 + _2411;
    int _2423 = _2421 + 1;
    float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2427 = _2425 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2429 = ~_2389;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = _2417 * _2367;
    int _2437 = _901 + (-1);
    int _2439 = _901 * _2423;
    int _2441 = _2439 + _2268;
    float _2443 = 1.0 / _2427;
    int _2445 = abs(_1007);
    float _2447 = -_2403;
    float _2449 = _2359 + _2447;
    bool _2451 = !_2391;
    int _2453 = _2451 ? _2441 : (-1);
    float _2455 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2457 = _2455 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2459 = abs(_923);
    float _2461 = _2449 * _973;
    int _2463 = _2453 * _2433;
    float _2465 = 1.0 / _2302;
    float _2467 = -_227;
    int _2469 = _2413 ? as_type<int>(_2467) : as_type<int>(_227);
    int _2471 = _2389 * _2437;
    int _2473 = _2471 + _2463;
    bool _2475 = !_2407;
    int _2477 = _2475 ? 0 : 1;
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2483 = _2473 * _2459;
    float _2485 = trunc(_2461);
    int _2487 = int(_2485);
    int _2489 = abs(_2477);
    float _2491 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2493 = _2491 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2495 = 1.0 / _2481;
    float _2497 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2497;
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2503 = _2501 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2505 = _2457 * _2465;
    float _2507 = _2499 * _2443;
    bool _2509 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2511 = isnan(_783);
    bool _2513 = _2509 || _2511;
    bool _2515 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2517 = _2513 || _2515;
    float _2519 = float(_2517);
    float _2521 = 1.0 / _2493;
    int _2523 = _2487 * _2489;
    int _2525 = _2523 + _2268;
    int _2527 = abs(_1013);
    int _2529 = _2316 * _2445;
    int _2531 = _2529 + _2483;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2537 = !_2276;
    int _2539 = _2537 ? 0 : 1;
    int _2541 = _2525 * _2527;
    int _2543 = _2541 + _2531;
    float _2545 = _2503 * _2495;
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2547;
    int _2551 = abs(_2539);
    float _2553 = 1.0 / _2535;
    float _2555 = -_2519;
    float _2557 = _2555 + 1.0;
    bool _2559 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2561 = isnan(_783);
    bool _2563 = _2559 || _2561;
    bool _2565 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2567 = _2563 || _2565;
    float _2569 = float(_2567);
    float _2571 = _2549 * _2521;
    int _2573 = _2487 * _2551;
    int _2575 = _2573 + _2543;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2581 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2583 = isnan(_783);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    float _2593 = -_2569;
    float _2595 = _2593 + 1.0;
    bool _2597 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2599 = isnan(_783);
    bool _2601 = _2597 || _2599;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2605 = _2601 || _2603;
    float _2607 = float(_2605);
    float _2609 = 1.0 / _2579;
    float _2611 = float(uint(_2575));
    float _2613 = _2591 * _2595;
    float _2615 = -_2591;
    float _2617 = _2615 + 1.0;
    float _2619 = -_2607;
    float _2621 = _2619 + 1.0;
    bool _2623 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2625 = isnan(_783);
    bool _2627 = _2623 || _2625;
    bool _2629 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2631 = _2627 || _2629;
    float _2633 = float(_2631);
    float _2635 = _2607 * _2617;
    float _2637 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2639 = _2637 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2641 = as_type<float>(_2308) * _2611;
    float _2643 = _2633 * _2621;
    float _2645 = -_2633;
    float _2647 = _2645 + 1.0;
    bool _2649 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2651 = isnan(_783);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2657 = _2653 || _2655;
    float _2659 = float(_2657);
    float _2661 = _2639 * _2553;
    float _2663 = trunc(_2641);
    float _2665 = precise::max(_2663, 0.0);
    uint _2667 = uint(_2665);
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2669;
    bool _2673 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2675 = isnan(_783);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = _2519 * _2647;
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2689 = _783 + _2687;
    float _2691 = _2671 * _2609;
    int _2693 = ~_901;
    int _2695 = _2693 + 1;
    float _2697 = _2659 * _2557;
    float _2699 = -_2659;
    float _2701 = _2699 + 1.0;
    bool _2703 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2705 = isnan(_783);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = -_2683;
    float _2717 = _2715 + 1.0;
    float _2719 = fma(_2435, _2689, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2721 = _2683 * _2701;
    float _2723 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2725 = _783 + _2723;
    float _2727 = _2713 * _2717;
    float _2729 = -_2713;
    float _2731 = _2729 + 1.0;
    int _2733 = _2695 * int(_2667);
    int _2735 = _2733 + _2575;
    float _2737 = fma(_2505, _2725, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2739 = _2719 * _2727;
    float _2741 = float(uint(_2525));
    float _2743 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2745 = _783 + _2743;
    float _2747 = float(uint(_2735));
    float _2749 = fma(_2731, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2739);
    int _2751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2753 = _2751 != 0;
    float _2755 = as_type<float>(_2308) * _2741;
    float _2757 = fma(_2507, _2745, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2759 = as_type<float>(_2308) * _2747;
    float _2761 = fma(_2737, _2721, _2749);
    bool _2763 = !_2753;
    float _2765 = _2763 ? _227 : as_type<float>(_2469);
    float _2767 = trunc(_2755);
    float _2769 = precise::max(_2767, 0.0);
    uint _2771 = uint(_2769);
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2775 = _783 + _2773;
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2779 = _783 + _2777;
    float _2781 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2783 = _783 + _2781;
    float _2785 = _2399 + 0.5;
    float _2787 = fma(_2661, _2775, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2789 = fma(_2545, _2779, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2791 = ~_901;
    int _2793 = _2791 + 1;
    float _2795 = trunc(_2759);
    float _2797 = precise::max(_2795, 0.0);
    uint _2799 = uint(_2797);
    float _2801 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2803 = _783 + _2801;
    float _2805 = fma(_2757, _2697, _2761);
    float _2807 = fma(_2691, _2783, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2809 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[80].x, _945);
    float _2811 = fma(_2571, _2803, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2813 = fma(_2789, _2685, _2805);
    float _2815 = _1387 + (-10.0);
    float _2817 = _2765 + (-0.5);
    int _2819 = _2793 * int(_2771);
    int _2821 = _2819 + _2525;
    float _2823 = fma(_2811, _2643, _2813);
    int _2825 = ~_901;
    int _2827 = _2825 + 1;
    float _2829 = -_2817;
    float _2831 = -_947;
    float _2833 = fma(_2829, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2831);
    float _2835 = precise::max(_1369, _2815);
    float _2837 = fma(_2787, _2635, _2823);
    int _2839 = int(_2667) + int(_2799);
    float _2841 = -_2280;
    float _2843 = fma(_2399, _2841, _2809);
    float _2845 = float(uint(_2821));
    float _2847 = fma(_2807, _2613, _2837);
    float _2849 = precise::min(_1387, _2835);
    int _2851 = _2827 * _2839;
    int _2853 = _2851 + _2575;
    float _2855 = fma(_2765, _2288, _2833);
    float _2857 = as_type<float>(_2308) * _2845;
    float _2859 = fma(_2569, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2847);
    float _2861 = -_2815;
    float _2863 = _2861 + _2849;
    bool _2865 = uint(_2853) >= uint(_901);
    float _2867 = trunc(_2857);
    float _2869 = precise::max(_2867, 0.0);
    uint _2871 = uint(_2869);
    out.m_86.x = _2843;
    out.m_86.y = _2855;
    bool _2873 = !_2865;
    int _2875 = _2873 ? 0 : (-1);
    int _2877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2879 = _2877 != 0;
    float _2881 = fma(_2863, -0.100000001490116119384765625, 1.0);
    int _2883 = ~_2839;
    int _2885 = _2883 + _2875;
    int _2887 = _2885 + 1;
    float _2889 = abs(_1773);
    float _2891 = log2(_2889);
    int _2893 = ~_901;
    int _2895 = _2893 + 1;
    float _2897 = _765 * _2881;
    float _2899 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2901 = _901 * _2887;
    int _2903 = _2901 + _2575;
    float _2905 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2907 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_88.x = _759;
    out.m_88.y = _761;
    out.m_88.z = _763;
    out.m_88.w = _2897;
    int _2909 = int(_2771) + int(_2871);
    float _2911 = -_1327;
    float _2913 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2905);
    bool _2915 = !_2391;
    int _2917 = _2915 ? _2903 : (-1);
    out.m_90.x = _2859;
    bool _2919 = _1773 <= 8000.0;
    bool _2921 = isnan(_1773);
    bool _2923 = _2919 || _2921;
    bool _2925 = isnan(8000.0);
    bool _2927 = _2923 || _2925;
    float _2929 = float(_2927);
    int _2931 = _2917 >> 31;
    int _2933 = _2917 & 3;
    bool _2935 = _2933 != 0;
    float _2937 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2939 = _2931 & 3;
    int _2941 = _2895 * _2909;
    int _2943 = _2941 + _2525;
    int _2945 = _2917 + _2939;
    float _2947 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2913);
    float _2949 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2951 = -_1327;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2899);
    int _2955 = _2945 >> 2;
    float _2957 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2959 = uint(_2943) >= uint(_901);
    float _2961 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2963 = _2955 << 4;
    int _2965 = _2963 + 368;
    float _2967 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2949);
    float _2969 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2953);
    float _2971 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2961);
    uint _2973 = uint(int(uint(_2965) >> uint(2)));
    uint _2975 = uint(int(uint(int(_2973)) >> uint(2)));
    int _2977 = int(_2973) & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    int _2981 = int(_2973) + 1;
    uint _2983 = uint(int(uint(_2981) >> uint(2)));
    int _2985 = _2981 & 3;
    float _2987 = (*spvDescriptorSet0.vp_c9)._m0[int(_2983)][_2985];
    float _2989 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2991 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2957);
    float _2993 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2971);
    bool _2995 = !_2959;
    int _2997 = _2995 ? 0 : (-1);
    float _2999 = _2989 * _2947;
    float _3001 = _2989 * _2969;
    int _3003 = _2917 & 3;
    bool _3005 = _3003 != 0;
    int _3007 = _2965 + 8;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    uint _3011 = uint(int(uint(int(_3009)) >> uint(2)));
    int _3013 = int(_3009) & 3;
    float _3015 = (*spvDescriptorSet0.vp_c9)._m0[int(_3011)][_3013];
    int _3017 = int(_3009) + 1;
    uint _3019 = uint(int(uint(_3017) >> uint(2)));
    int _3021 = _3017 & 3;
    float _3023 = (*spvDescriptorSet0.vp_c9)._m0[int(_3019)][_3021];
    float _3025 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2310);
    int _3027 = _2935 ? 0 : 1;
    float _3029 = exp2(_2937);
    bool _3031 = uint(_3003) > 1u;
    float _3033 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2967);
    int _3035 = ~_3027;
    int _3037 = _3035 + 1;
    int _3039 = _3037 + 1;
    float _3041 = -_1327;
    float _3043 = fma(_3041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2907);
    int _3045 = ~_2909;
    int _3047 = _3045 + _2997;
    int _3049 = _3047 + 1;
    float _3051 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3053 = uint(_3003) >= 2u;
    float _3055 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3043);
    float _3057 = fma(_2292, _2993, _2999);
    int _3059 = _901 * _3049;
    int _3061 = _3059 + _2525;
    bool _3063 = !_3005;
    int _3065 = _3063 ? 0 : 1;
    float _3067 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3051);
    int _3069 = _3053 ? 0 : 1;
    float _3071 = _2989 * _3055;
    int _3073 = _3039;
    if (!_3031)
    {
        int _3075 = ~_3027;
        int _3077 = _3075 + 1;
        _3073 = _3077;
    }
    int _3079 = _3073;
    float _3081 = fma(_2292, _3033, _3001);
    bool _3083 = _3003 != 3;
    float _3085 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3067);
    int _3087 = abs(_3079);
    float _3089 = -_2221;
    float _3091 = _3089 + 1.0;
    int _3093 = abs(_3065);
    float _3095 = fma(_2292, _3085, _3071);
    int _3097 = ~_3069;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    float _3103 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3105 = _3003 != 3;
    float _3107 = _2329 * _2233;
    int _3109 = ~_3087;
    int _3111 = _3109 + 1;
    int _3113 = _3111 + 1;
    float _3115 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3103);
    float _3117 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2991);
    int _3119 = _3101;
    float _3121 = _3117;
    if (_3083)
    {
        int _3123 = ~_3069;
        int _3125 = _3123 + 1;
        _3119 = _3125;
    }
    int _3127 = _3119;
    float _3129 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3115);
    bool _3131 = !_3105;
    int _3133 = _3131 ? 0 : (-1);
    int _3135 = abs(_3127);
    int _3137 = _3113 * as_type<int>(_2987);
    int _3139 = ~_3093;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    bool _3145 = !_2879;
    int _3147 = _3145 ? 0 : 1;
    float _3149 = fma(_3029, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    int _3153 = abs(_3133);
    int _3155 = _3143 * as_type<int>(_2979);
    int _3157 = _3155 + _3137;
    int _3159 = abs(_3147);
    int _3161 = ~_3135;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    float _3167 = fma(_3151, -2.0, 3.0);
    int _3169 = ~_3153;
    int _3171 = _3169 + 1;
    int _3173 = _3171 + 1;
    float _3175 = _3151 * _3151;
    float _3177 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3179 = _3165 * as_type<int>(_3015);
    int _3181 = _3179 + _3157;
    int _3183 = ~_3159;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    float _3189 = _3175 * _3167;
    float _3191 = in.m_92.x;
    int _3193 = _3173 * as_type<int>(_3023);
    int _3195 = _3193 + _3181;
    bool _3197 = !_2391;
    int _3199 = _3197 ? _3061 : (-1);
    float _3201 = -_3189;
    float _3203 = _3201 + 1.0;
    float _3205 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3177);
    int _3207 = _3195 * _3187;
    float _3209 = _2211 + _2147;
    float _3211 = fma(_3203, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3189);
    float _3213 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3205);
    int _3215 = _3199 * _3159;
    int _3217 = _3215 + _3207;
    float _3219 = _2929 * _3211;
    float _3221 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3213);
    float _3223 = _3209 * 0.5;
    float _3225 = float(_3217);
    float _3227 = _2147 * 0.5;
    float _3229 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3231 = _3221 + _2147;
    float _3233 = _2254 * _3107;
    float _3235 = fma(_2213, -0.5, _3227);
    float _3237 = _3025 + _3057;
    float _3239 = _3091 * _3229;
    float _3241 = precise::clamp(_3239, 0.0, 1.0);
    float _3243 = _3231 * 0.5;
    float _3245 = _3117 + _3081;
    float _3247 = _3129 + _3095;
    float _3249 = -_3241;
    float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3253 = _2244 * _3107;
    out.m_94.x = _3223;
    out.m_94.y = _3235;
    out.m_94.z = _3243;
    out.m_94.w = _2147;
    float _3255 = fma(_2244, _3233, _2242);
    float _3257 = _3251 * _3191;
    float _3259 = fma(_2250, _3253, _2238);
    float _3261 = in.m_92.z;
    float _3263 = fma(_2252, _3253, _2240);
    float _3265 = _3257 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _3267 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3269 = isnan(_1921);
    bool _3271 = _3267 || _3269;
    bool _3273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3275 = _3271 || _3273;
    out.gl_Position.x = _2211;
    out.gl_Position.y = _2213;
    out.gl_Position.z = _3221;
    out.gl_Position.w = _2147;
    float _3277 = _1829 * _1891;
    out.m_96.x = _2258;
    out.m_96.y = _2260;
    out.m_96.z = _2262;
    float _3279 = _3277 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3281 = -_2329;
    float _3283 = _3281 + 1.0;
    out.m_98.x = _3265;
    float _3285 = _2244 * _3283;
    out.m_100.x = _3237;
    out.m_100.y = _3245;
    out.m_100.z = _3247;
    float _3287 = _2147;
    float _3289 = _3235;
    float _3291 = _3283;
    float _3293 = _3279;
    if (!_3275)
    {
        _3121 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3295 = _3121;
    float _3297 = _3295;
    float _3299 = _3295;
    if (!_3275)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3301 = _3287;
    out.m_102.x = _3259;
    out.m_102.y = _3263;
    out.m_102.z = _3255;
    out.m_102.w = _3285;
    float _3303 = _3301;
    float _3305 = _3301;
    if (!_3275)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3307 = _3289;
    float _3309 = _3307;
    float _3311 = _3307;
    if (!_3275)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3313 = _3291;
    out.m_104.x = _3225;
    float _3315 = _3279 * _3261;
    float _3317 = _3261;
    float _3319 = _3313;
    float _3321 = _3313;
    if (!_3275)
    {
        _3317 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3323 = _3317;
    float _3325 = _3323;
    float _3327 = _3323;
    if (!_3275)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3329 = _3293;
    bool _3331 = !_3275;
    float _3333 = _3329;
    float _3335 = _3329;
    if (!_3331)
    {
        bool _3337 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3339 = isnan(_1921);
        bool _3341 = _3337 || _3339;
        bool _3343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3345 = _3341 || _3343;
        if (!_3345)
        {
            float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3349 = _1921 + _3347;
            float _3351 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3353 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3351;
            float _3355 = 1.0 / _3353;
            float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3377 = _3349 * _3355;
            float _3379 = precise::clamp(_3377, 0.0, 1.0);
            float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3385 = fma(_3379, _3359, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3387 = fma(_3379, _3383, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3389 = fma(_3379, _3363, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3391 = fma(_3379, _3367, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3393 = fma(_3379, _3371, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3395 = fma(_3379, _3375, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3305 = _3387;
            _3321 = _3393;
            _3299 = _3385;
            _3311 = _3391;
            _3327 = _3389;
            _3335 = _3395;
            _3397 = true;
        }
        else
        {
            bool _3399 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3401 = isnan(_1921);
            bool _3403 = _3399 || _3401;
            bool _3405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3407 = _3403 || _3405;
            if (!_3407)
            {
                _3297 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3409 = _3297;
            _3299 = _3409;
            if (!_3407)
            {
                _3303 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3411 = _3303;
            _3305 = _3411;
            if (!_3407)
            {
                _3325 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3413 = _3325;
            _3327 = _3413;
            if (!_3407)
            {
                _3309 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3415 = _3309;
            _3311 = _3415;
            if (!_3407)
            {
                _3319 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3417 = _3319;
            _3321 = _3417;
            if (!_3407)
            {
                _3333 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3419 = _3333;
            bool _3421 = !_3407;
            _3335 = _3419;
            if (!_3421)
            {
                bool _3423 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3425 = isnan(_1921);
                bool _3427 = _3423 || _3425;
                bool _3429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3431 = _3427 || _3429;
                if (!_3431)
                {
                    float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3435 = _1921 + _3433;
                    float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3439 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3437;
                    float _3441 = 1.0 / _3439;
                    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3445 = _3443 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3463 = _3435 * _3441;
                    float _3465 = precise::clamp(_3463, 0.0, 1.0);
                    float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3471 = fma(_3465, _3445, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3473 = fma(_3465, _3469, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3475 = fma(_3465, _3449, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3477 = fma(_3465, _3453, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3479 = fma(_3465, _3457, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3481 = fma(_3465, _3461, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3305 = _3473;
                    _3321 = _3479;
                    _3299 = _3471;
                    _3311 = _3477;
                    _3327 = _3475;
                    _3335 = _3481;
                    _3397 = true;
                }
                else
                {
                    _3305 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3321 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3299 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3311 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3327 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3335 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3397 = false;
    float _3483 = _3305;
    float _3485 = _3321;
    float _3487 = _3299;
    float _3489 = _3311;
    float _3491 = _3327;
    float _3493 = _3335;
    float _3495 = _3315 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3497 = fma(_3245, -0.5, 0.5);
    float _3499 = precise::clamp(_3497, 0.0, 1.0);
    float _3501 = -_3483;
    float _3503 = _3501 + _3485;
    float _3505 = -_3487;
    float _3507 = _3505 + _3489;
    out.m_55.x = _3495;
    float _3509 = fma(_3499, _3503, _3483);
    float _3511 = -_3491;
    float _3513 = _3511 + _3493;
    float _3515 = fma(_3499, _3507, _3487);
    float _3517 = _3509 * 0.586610972881317138671875;
    bool _3519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3521 = fma(_3499, _3513, _3491);
    out.m_106.x = 0.0;
    float _3523 = fma(_3515, 0.298911988735198974609375, _3517);
    bool _3525 = _1829 > 0.0;
    bool _3527 = isnan(_1829);
    bool _3529 = _3525 || _3527;
    bool _3531 = isnan(0.0);
    bool _3533 = _3529 || _3531;
    float _3535 = fma(_3521, 0.114477999508380889892578125, _3523);
    bool _3537 = _1891 <= 0.0;
    bool _3539 = !_3533;
    bool _3541 = _3537 || _3539;
    float _3543 = -_3535;
    float _3545 = _3515 + _3543;
    float _3547 = -_3535;
    float _3549 = _3509 + _3547;
    float _3551 = -_3535;
    float _3553 = _3521 + _3551;
    float _3555 = fma(_3545, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3535);
    float _3557 = fma(_3549, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3535);
    float _3559 = fma(_3553, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3535);
    bool _3561 = !_3519;
    if (!_3561)
    {
        float _3563 = -_1757;
        float _3565 = _3563 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3567 = -_1759;
        float _3569 = _3567 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3571 = -_1761;
        float _3573 = _3571 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3575 = _3565 * _3565;
        float _3577 = fma(_3569, _3569, _3575);
        float _3579 = fma(_3573, _3573, _3577);
        float _3581 = sqrt(_3579);
        float _3583 = rsqrt(_3579);
        float _3585 = -_3581;
        float _3587 = _3585 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3589 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3591 = precise::clamp(_3589, 0.0, 1.0);
        float _3593 = _3569 * _3583;
        float _3595 = _3565 * _3583;
        float _3597 = abs(_3591);
        float _3599 = log2(_3597);
        float _3601 = _3573 * _3583;
        float _3603 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3605 = _3245 * _3595;
        float _3607 = -_3595;
        float _3609 = -_3603;
        float _3611 = fma(_3607, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3609);
        float _3613 = fma(_3237, _3593, _3605);
        float _3615 = -_3601;
        float _3617 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3611);
        float _3619 = fma(_3247, _3601, _3613);
        float _3621 = precise::clamp(_3619, 0.0, 1.0);
        float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3625 = _3617 + _3623;
        float _3627 = _3599 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3629 = _3625 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3631 = precise::clamp(_3629, 0.0, 1.0);
        float _3633 = exp2(_3627);
        float _3635 = _3633 * _3631;
        float _3637 = _3621 * _3635;
        float _3639 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3641 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3643 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3639;
        out.m_106.y = _3641;
        out.m_106.z = _3643;
    }
    out.m_80.x = _3555;
    out.m_80.y = _3557;
    out.m_80.z = _3559;
    if (!_3541)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _3645 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3645;
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
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3397 = false;
    bool _689 = false;
    bool _479 = false;
    bool _373 = false;
    bool _271 = false;
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
        float _3714 = as_type<float>(_149);
        out.gl_Position.z = _3714;
    }
    if (!_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3779 = as_type<float>(_179);
        out.gl_Position.z = _3779;
    }
    out.m_53.x = _181;
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _249 = _245;
    float _251 = _243;
    float _253 = _239;
    float _269;
    if (!_247)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _181;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = in.m_72.x;
    float _281 = in.m_72.y;
    bool _283 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_273);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    bool _299 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_273);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_293;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    float _319 = 1.0 / _297;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _323 = _309 * _313;
    float _325 = -_309;
    float _327 = _325 + 1.0;
    float _329 = _277 * _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_317, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _335 * _323;
    float _341 = _337 * _323;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _345 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _347 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].x, _343);
    float _349 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].y, _345);
    float _351 = _347 * _279;
    float _353 = _349 * _281;
    bool _355 = !_321;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _359 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        _371 = _181;
    }
    _373 = false;
    float _375 = _371;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _379 = _375 + _377;
    bool _381 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _383 = isnan(_375);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _393;
    bool _397 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _399 = isnan(_375);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -_391;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _413;
    float _417 = 1.0 / _395;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = _407 * _411;
    float _423 = -_407;
    float _425 = _423 + 1.0;
    float _427 = _379 * _417;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _429;
    float _433 = fma(_415, _427, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _435;
    float _439 = fma(_431, _427, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _441 = _433 * _421;
    float _443 = fma(_437, _427, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _445 = _439 * _421;
    float _447 = _443 * _421;
    float _449 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[107].x, _441);
    float _451 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[107].y, _447);
    float _453 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[107].z, _445);
    float _455 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[108].x, _449);
    float _457 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[108].y, _451);
    float _459 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[108].z, _453);
    bool _461 = !_419;
    float _477;
    if (!_461)
    {
        float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _465 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _467 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _469 = _467 * _463;
        float _471 = floor(_469);
        float _473 = -_471;
        float _475 = _469 + _473;
        _477 = _475;
        _479 = true;
    }
    else
    {
        _477 = _181;
    }
    _479 = false;
    float _481 = _477;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _481 + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _501 = isnan(_481);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = 1.0 / _489;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _517 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _519 = isnan(_481);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _531 = 1.0 / _497;
    float _533 = _493 * _511;
    bool _535 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _537 = isnan(_481);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = 1.0 / _515;
    float _549 = -_509;
    float _551 = _549 + 1.0;
    float _553 = fma(_533, _485, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _559 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _561 = isnan(_481);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -_545;
    float _573 = _571 + 1.0;
    float _575 = _545 * _551;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _581 = 1.0 / _557;
    float _583 = -_569;
    float _585 = _583 + 1.0;
    float _587 = _527 * _573;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _589;
    float _593 = _579 * _531;
    float _595 = _509 * _585;
    float _597 = _553 * _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _601 = _481 + _599;
    float _603 = -_527;
    float _605 = _603 + 1.0;
    bool _607 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _609 = isnan(_481);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _591 * _547;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _627 = _481 + _625;
    float _629 = fma(_593, _601, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[115].x, _597);
    float _633 = -_617;
    float _635 = _633 + 1.0;
    float _637 = _623 * _581;
    float _639 = fma(_619, _627, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _643 = _481 + _641;
    float _645 = fma(_629, _575, _631);
    float _647 = _569 * _635;
    float _649 = _455 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _651 = fma(_637, _643, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _653 = fma(_639, _595, _645);
    float _655 = _459 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = fma(_651, _647, _653);
    float _659 = _457 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _661 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[119].x, _657);
    float _665 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _671 = !_529;
    float _687;
    if (!_671)
    {
        float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _675 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _679 = _677 * _673;
        float _681 = floor(_679);
        float _683 = -_681;
        float _685 = _679 + _683;
        _687 = _685;
        _689 = true;
    }
    else
    {
        _687 = _181;
    }
    _689 = false;
    float _691 = _687;
    bool _693 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _695 = isnan(_691);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _709 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _711 = isnan(_691);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _727 = _691 + _725;
    float _729 = -_703;
    float _731 = _729 + 1.0;
    bool _733 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _735 = 1.0 / _707;
    float _737 = _719 * _731;
    float _739 = -_719;
    float _741 = _739 + 1.0;
    float _743 = _723 * _735;
    float _745 = fma(_743, _727, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _749 = _745 * _737;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _753 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[131].x, _749);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _757 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[132].x, _753);
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _757 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _767 = !_733;
    if (!_767)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _771 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _183 = _781;
    }
    float _783 = _183;
    float _785 = in.m_48.x;
    float _787 = in.m_48.y;
    float _789 = in.m_48.z;
    float _791 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _793 = log2(_791);
    float _795 = _163 * 2.0;
    float _797 = in.m_57.y;
    float _799 = _351 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _801 = _353 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _803 = in.m_57.z;
    float _805 = floor(_795);
    float _807 = in.m_68.w;
    float _809 = in.m_66.w;
    float _811 = _793 * _131;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _815 = int(_813);
    float _817 = _195 * _787;
    float _819 = _201 * _787;
    float _821 = _207 * _787;
    float _823 = fma(_193, _785, _817);
    float _825 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _827 = fma(_199, _785, _819);
    float _829 = fma(_205, _785, _821);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _833 = exp2(_811);
    float _835 = _163 + _797;
    float _837 = -_831;
    float _839 = fma(_825, 2.0, _837);
    float _841 = _797 * 2.0;
    float _843 = fma(_197, _789, _823);
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _847 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _849 = floor(_841);
    float _851 = _835 + (-1.0);
    bool _853 = _805 > 0.0;
    float _855 = _163 + _803;
    bool _857 = _805 >= 0.0;
    bool _859 = isnan(_805);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = fma(_847, -2.0, _845);
    float _869 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _873 = _797 + _803;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _877 = _875 != 0;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _881 = _879 != 0;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _885 = _883 != 0;
    float _887 = fma(_203, _789, _827);
    float _889 = _855 + (-1.0);
    float _891 = fma(_209, _789, _829);
    float _893 = float(_815);
    float _895 = _803 * 2.0;
    bool _897 = _849 > 0.0;
    float _899 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _901 = int(_899);
    bool _903 = _849 >= 0.0;
    bool _905 = isnan(_849);
    bool _907 = _903 || _905;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _915 = 1.0 + _913;
    float _917 = _873 + (-1.0);
    float _919 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _921 = !_881;
    int _923 = _921 ? 0 : 1;
    float _925 = -_833;
    float _927 = _925 + 1.0;
    float _929 = 1.0 / _915;
    bool _931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _943 = -_131;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _947 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _867);
    float _949 = _939 ? _927 : 0.0;
    float _951 = floor(_895);
    float _953 = _871 * _131;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _957 = in.m_70.w;
    bool _959 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _961 = isnan(1.0);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _967 = _963 || _965;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _971 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].w, _955);
    float _973 = float(_901);
    float _975 = 1.0 / _893;
    float _977 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _969);
    float _979 = precise::max(0.0, _953);
    float _981 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _971);
    int _983 = _865 ? 0 : 1;
    float _985 = _973 * _131;
    float _987 = precise::min(_979, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _989 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _977);
    float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _993 = _951 >= 0.0;
    bool _995 = isnan(_951);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    float _1003 = _887 + _807;
    bool _1005 = !_877;
    int _1007 = _1005 ? 0 : 1;
    float _1009 = _843 + _809;
    bool _1011 = !_885;
    int _1013 = _1011 ? 0 : 1;
    float _1015 = _803 + (-0.5);
    int _1017 = _1001 ? 0 : 1;
    float _1019 = _975 * _131;
    if (_967)
    {
        float _1021 = _949 * _929;
        _141 = _1021;
    }
    float _1023 = _141;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1027 = _1025 != 0;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1035 = _1033 != 0;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _1003 + _1037;
    float _1041 = _891 + _957;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1045 = _1009 + _1043;
    int _1047 = ~_1017;
    int _1049 = _1047 + 1;
    int _1051 = _1049 + 1;
    float _1053 = _1039 * _1039;
    float _1055 = _987 * _991;
    int _1057 = _911 ? 0 : 1;
    bool _1059 = !_1031;
    int _1061 = _1059 ? 0 : 1;
    float _1063 = fma(_1045, _1045, _1053);
    int _1065 = ~_983;
    int _1067 = _1065 + 1;
    int _1069 = _1067 + 1;
    float _1071 = abs(_1055);
    float _1073 = log2(_1071);
    int _1075 = ~_1057;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1069;
    int _1083 = _1079;
    int _1085 = _1051;
    if (!_853)
    {
        int _1087 = ~_983;
        int _1089 = _1087 + 1;
        _1081 = _1089;
    }
    int _1091 = _1081;
    if (!_897)
    {
        int _1093 = ~_1057;
        int _1095 = _1093 + 1;
        _1083 = _1095;
    }
    int _1097 = _1083;
    bool _1099 = !_1035;
    int _1101 = _1099 ? 0 : 1;
    float _1103 = in.m_74.x;
    float _1105 = in.m_74.y;
    float _1107 = in.m_74.z;
    int _1109 = abs(_1061);
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1113 = _1041 + _1111;
    int _1115 = abs(_1101);
    float _1117 = float(_1091);
    float _1119 = fma(_1113, _1113, _1063);
    bool _1121 = _951 > 0.0;
    float _1123 = sqrt(_1119);
    float _1125 = float(_1109);
    bool _1127 = !_1027;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = float(_1115);
    float _1133 = _1125 * _1117;
    int _1135 = abs(_1129);
    float _1137 = _797 + (-0.5);
    float _1139 = rsqrt(_1119);
    if (!_1121)
    {
        int _1141 = ~_1017;
        int _1143 = _1141 + 1;
        _1085 = _1143;
    }
    int _1145 = _1085;
    float _1147 = _1133 * (-2.0);
    float _1149 = float(_1135);
    float _1151 = _799 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1153 = float(_1145);
    float _1155 = fma(_1147, _1105, _1105);
    float _1157 = _1123 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1159 = float(_1097);
    float _1161 = fma(_941, _1147, _941);
    float _1163 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1155);
    float _1165 = _1149 * _1153;
    float _1167 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1169 = precise::min(_1151, _1157);
    float _1171 = fma(_1161, _1023, _1163);
    float _1173 = _1165 * (-2.0);
    float _1175 = _1131 * _1159;
    float _1177 = _163 + (-0.5);
    float _1179 = _1139 * _1169;
    float _1181 = fma(_1173, _1103, _1103);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1185 = 1.0 + _1183;
    float _1187 = fma(_869, _1173, _869);
    float _1189 = _1039 * _1179;
    float _1191 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1181);
    float _1193 = 1.0 / _1185;
    float _1195 = _1045 * _1179;
    float _1197 = precise::max(_953, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1199 = fma(_1187, _1023, _1191);
    float _1201 = (-1.0) + (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _1203 = -_1195;
    float _1205 = _1045 + _1203;
    float _1207 = precise::min(_1197, 1.0);
    float _1209 = _1199 * 0.15915493667125701904296875;
    float _1211 = -_1189;
    float _1213 = _1039 + _1211;
    float _1215 = _1175 * (-2.0);
    float _1217 = exp2(_1167);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1221 = _1207 + _1219;
    float _1223 = _1213 * _1213;
    float _1225 = fma(_919, _1215, _919);
    float _1227 = fma(_1215, _1107, _1107);
    float _1229 = _1113 * _1179;
    float _1231 = fma(_1205, _1205, _1223);
    float _1233 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1235 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    float _1237 = -_1229;
    float _1239 = _1113 + _1237;
    float _1241 = _1221 * _1193;
    float _1243 = fma(_1225, _1023, _1235);
    float _1245 = fma(_1239, _1239, _1231);
    float _1247 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1249 = _1003 + _1247;
    float _1251 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1233);
    float _1253 = sqrt(_1245);
    float _1255 = _1171 * 0.15915493667125701904296875;
    float _1257 = fma(_1241, _1201, 1.0);
    float _1259 = _1243 * 0.15915493667125701904296875;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _1263 = _1261 + 1.0;
    float _1265 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1267 = _1009 + _1265;
    float _1269 = _1249 * _1249;
    float _1271 = _1209 * 6.283185482025146484375;
    float _1273 = sin(_1271);
    float _1275 = fma(_1217, _1263, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _1277 = fma(_1267, _1267, _1269);
    float _1279 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1281 = _1041 + _1279;
    float _1283 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1251);
    float _1285 = _1275 * _1257;
    float _1287 = fma(_1281, _1281, _1277);
    float _1289 = _1255 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    float _1293 = _1139 * _1253;
    float _1295 = _227 * _1285;
    float _1297 = _223 * _1285;
    float _1299 = _801 * _1293;
    float _1301 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1295);
    float _1303 = _799 * _1293;
    float _1305 = _1255 * 6.283185482025146484375;
    float _1307 = cos(_1305);
    float _1309 = _1299 * _1301;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1297);
    float _1313 = _1209 * 6.283185482025146484375;
    float _1315 = cos(_1313);
    float _1317 = _1273 * _1291;
    float _1319 = _1259 * 6.283185482025146484375;
    float _1321 = cos(_1319);
    float _1323 = _1273 * _1307;
    float _1325 = _1259 * 6.283185482025146484375;
    float _1327 = sin(_1325);
    float _1329 = _1315 * _1307;
    float _1331 = _1315 * _1291;
    float _1333 = _1315 * _1321;
    float _1335 = _1273 * _1321;
    float _1337 = _1307 * _1321;
    float _1339 = _1291 * _1321;
    float _1341 = _1303 * _1311;
    float _1343 = _1333 * _1309;
    float _1345 = sqrt(_1283);
    float _1347 = _1335 * _1309;
    float _1349 = fma(_1327, _1329, _1317);
    float _1351 = -_1331;
    float _1353 = fma(_1327, _1323, _1351);
    float _1355 = -_1323;
    float _1357 = fma(_1327, _1331, _1355);
    float _1359 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1361 = _1359 * 0.5;
    float _1363 = -_1309;
    float _1365 = _1327 * _1363;
    float _1367 = fma(_1349, _1341, _1343);
    float _1369 = sqrt(_1287);
    float _1371 = fma(_1327, _1317, _1329);
    float _1373 = fma(_1337, _1341, _1365);
    float _1375 = fma(_1357, _1361, _1367);
    float _1377 = fma(_1353, _1341, _1347);
    float _1379 = fma(_1339, _1361, _1373);
    float _1381 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1383 = fma(_1371, _1361, _1377);
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1387 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1389 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1381);
    float _1391 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1393 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1385);
    float _1395 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1389);
    bool _1397 = _1369 < _1387;
    float _1399 = float(_1397);
    float _1401 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1393);
    float _1403 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1391);
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1407 = -_1229;
    float _1409 = _1041 + _1407;
    float _1411 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1413 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1403);
    float _1415 = fma(_1405, _1399, _1041);
    float _1417 = fma(_1411, _1399, _1009);
    float _1419 = -_1189;
    float _1421 = _1003 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1425 = _1415 + _1423;
    float _1427 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1431 = _1417 + _1429;
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1435 = _1425 * _1425;
    float _1437 = fma(_1427, _1399, _1003);
    float _1439 = fma(_1431, _1431, _1435);
    float _1441 = -_1195;
    float _1443 = _1009 + _1441;
    float _1445 = sqrt(_1439);
    float _1447 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1433);
    float _1449 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1447);
    bool _1451 = _1445 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1453 = _1447;
    float _1455 = _1427;
    float _1457 = _1383;
    float _1459 = _1425;
    if (!_1451)
    {
        _1453 = _1417;
    }
    float _1461 = _1453;
    float _1463 = _1461;
    if (!_1451)
    {
        _1455 = _1415;
    }
    float _1465 = _1455;
    float _1467 = _1465;
    if (!_1451)
    {
        _1457 = _1437;
    }
    float _1469 = _1457;
    bool _1471 = !_1451;
    float _1473 = _1469;
    if (!_1471)
    {
        float _1475 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1479 = _1445 + _1477;
        float _1481 = _1437 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1483 = _1479 * _1475;
        float _1485 = rsqrt(_1439);
        float _1487 = _1483 * 0.15915493667125701904296875;
        float _1489 = _1487 * 6.283185482025146484375;
        float _1491 = sin(_1489);
        float _1493 = _1487 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = fma(_1491, _1481, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1499 = _1485 * _1497;
        float _1501 = _1495 + (-1.0);
        float _1503 = fma(_1431, _1499, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1505 = fma(_1425, _1499, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1507 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1509 = fma(_1437, _1495, _1507);
        _1473 = _1509;
        _1463 = _1503;
        _1467 = _1505;
    }
    float _1511 = _1473;
    float _1513 = _1463;
    float _1515 = _1467;
    float _1517 = -_1003;
    float _1519 = _1517 + _1511;
    float _1521 = -_1009;
    float _1523 = _1521 + _1513;
    float _1525 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1527 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1529 = _1519 * _1519;
    float _1531 = -_1041;
    float _1533 = _1531 + _1515;
    float _1535 = 1.0 / _1525;
    float _1537 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1527);
    float _1539 = fma(_1523, _1523, _1529);
    float _1541 = -_1195;
    float _1543 = _1541 + _1513;
    float _1545 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1537);
    float _1547 = fma(_1533, _1533, _1539);
    float _1549 = -_1189;
    float _1551 = _1549 + _1511;
    float _1553 = -_1229;
    float _1555 = _1553 + _1515;
    float _1557 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1559 = sqrt(_1547);
    float _1561 = _1557 + _1525;
    float _1563 = _1561 * _1535;
    float _1565 = _1563 * 0.5;
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1569 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1567);
    bool _1571 = _1559 > 0.0;
    float _1573 = 1.0 / _1569;
    bool _1575 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan(0.5);
    bool _1583 = _1579 || _1581;
    bool _1585 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1587 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.5);
    bool _1593 = _1589 || _1591;
    float _1595 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1599 = _1511;
    float _1601 = _1535;
    float _1603 = _1547;
    float _1605 = _1555;
    if (!_1571)
    {
        _1595 = _1543;
    }
    float _1607 = _1595;
    float _1609 = _1607;
    float _1611 = _1607;
    if (!_1571)
    {
        _1597 = _1551;
    }
    float _1613 = _1597;
    float _1615 = _1613;
    if (!_1571)
    {
        _1599 = _1555;
    }
    float _1617 = _1599;
    bool _1619 = !_1571;
    float _1621 = _1617;
    if (!_1619)
    {
        float _1623 = _243 * _243;
        float _1625 = fma(_239, _239, _1623);
        float _1627 = fma(_245, _245, _1625);
        float _1629 = rsqrt(_1547);
        float _1631 = sqrt(_1627);
        float _1633 = _1523 * _1629;
        float _1635 = _1519 * _1629;
        float _1637 = _1533 * _1629;
        bool _1639 = _1631 > 0.0;
        float _1641 = _1631;
        float _1643 = _1629;
        if (!_1639)
        {
            _1609 = _1543;
        }
        float _1645 = _1609;
        _1611 = _1645;
        if (!_1639)
        {
            _1641 = _1551;
        }
        float _1647 = _1641;
        _1615 = _1647;
        if (!_1639)
        {
            _1643 = _1555;
        }
        float _1649 = _1643;
        bool _1651 = !_1639;
        _1621 = _1649;
        if (!_1651)
        {
            float _1653 = rsqrt(_1627);
            float _1655 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1657 = _243 * _1653;
            float _1659 = _239 * _1653;
            float _1661 = _245 * _1653;
            float _1663 = _1635 * _1657;
            float _1665 = fma(_1633, _1659, _1663);
            float _1667 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1669 = fma(_1637, _1661, _1665);
            float _1671 = _1669 * _1667;
            float _1673 = fma(_239, _1671, _1543);
            float _1675 = fma(_243, _1671, _1551);
            float _1677 = fma(_245, _1671, _1555);
            _1611 = _1673;
            _1615 = _1675;
            _1621 = _1677;
            _1601 = _1667;
        }
    }
    float _1679 = _1611;
    float _1681 = _1615;
    float _1683 = _1621;
    float _1685 = _1601;
    float _1687 = _1685;
    if (_1583)
    {
        _1603 = 1.0;
    }
    float _1689 = _1603;
    float _1691 = _1689;
    if (_1593)
    {
        _249 = _1679;
    }
    float _1693 = _249;
    float _1695 = _1693;
    if (_1593)
    {
        _251 = _1681;
    }
    float _1697 = _251;
    float _1699 = _1697;
    if (_1593)
    {
        _253 = _1683;
    }
    float _1701 = _253;
    float _1703 = _1701;
    if (!_1593)
    {
        float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1707 = _1421 + _1705;
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1711 = _1443 + _1709;
        float _1713 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1715 = -_1443;
        float _1717 = _1715 + _1679;
        float _1719 = _1707 * _1707;
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1723 = _1409 + _1721;
        float _1725 = -_1421;
        float _1727 = _1725 + _1681;
        float _1729 = -_1409;
        float _1731 = _1729 + _1683;
        float _1733 = fma(_1711, _1711, _1719);
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1737 = fma(_1723, _1723, _1733);
        float _1739 = sqrt(_1737);
        float _1741 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1743 = precise::min(_1739, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1745 = _1743 * _1735;
        float _1747 = _1741 * _1745;
        float _1749 = fma(_1717, _1747, _1443);
        float _1751 = fma(_1727, _1747, _1421);
        float _1753 = fma(_1731, _1747, _1409);
        _1605 = _1719;
        _1699 = _1751;
        _1695 = _1749;
        _1703 = _1753;
        _1687 = _1735;
    }
    float _1755 = _1605;
    float _1757 = _1699;
    float _1759 = _1695;
    float _1761 = _1703;
    float _1763 = _1687;
    float _1765 = _1755;
    float _1767 = _1763;
    if (_1583)
    {
        _1459 = 1.0;
    }
    float _1769 = _1459;
    float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1773 = _1573 * _1771;
    float _1775 = _1769;
    if (!_1583)
    {
        float _1777 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1779 = _1777 * 0.15915493667125701904296875;
        float _1781 = _1779 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1787 = _1785 * 0.15915493667125701904296875;
        float _1789 = _1779 * 6.283185482025146484375;
        float _1791 = sin(_1789);
        float _1793 = 1.0 / _1783;
        float _1795 = _1787 * 6.283185482025146484375;
        float _1797 = cos(_1795);
        float _1799 = _1791 * _1793;
        float _1801 = _1787 * 6.283185482025146484375;
        float _1803 = sin(_1801);
        float _1805 = _1797 * _1799;
        float _1807 = 1.0 / _1805;
        float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1811 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1809;
        float _1813 = 1.0 / _1811;
        float _1815 = _1803 * _1807;
        float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1819 = fma(_1773, _1815, _1817);
        float _1821 = _1819 * _1813;
        float _1823 = precise::clamp(_1821, 0.0, 1.0);
        _1765 = _1787;
        _1767 = _1819;
        _1691 = _1823;
    }
    float _1825 = _1765;
    float _1827 = _1767;
    float _1829 = _1691;
    float _1831 = _1825;
    float _1833 = _1827;
    if (!_1583)
    {
        float _1835 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1837 = _1835 * 0.15915493667125701904296875;
        float _1839 = _1837 * 6.283185482025146484375;
        float _1841 = cos(_1839);
        float _1843 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1845 = _1843 * 0.15915493667125701904296875;
        float _1847 = _1837 * 6.283185482025146484375;
        float _1849 = sin(_1847);
        float _1851 = 1.0 / _1841;
        float _1853 = _1845 * 6.283185482025146484375;
        float _1855 = cos(_1853);
        float _1857 = _1849 * _1851;
        float _1859 = _1845 * 6.283185482025146484375;
        float _1861 = sin(_1859);
        float _1863 = _1855 * _1857;
        float _1865 = 1.0 / _1863;
        float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1869 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1867;
        float _1871 = 1.0 / _1869;
        float _1873 = _1861 * _1865;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1877 = fma(_1773, _1873, _1875);
        float _1879 = _1877 * _1871;
        float _1881 = precise::clamp(_1879, 0.0, 1.0);
        float _1883 = -_1881;
        float _1885 = _1883 + 1.0;
        _1831 = _1851;
        _1833 = _1873;
        _1775 = _1885;
    }
    float _1887 = _1831;
    float _1889 = _1833;
    float _1891 = _1775;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1895 = _1757 + _1893;
    float _1897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1899 = _1759 + _1897;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1903 = _1761 + _1901;
    float _1905 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1907 = _1895 * _1895;
    float _1909 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1911 = fma(_1899, _1899, _1907);
    float _1913 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1909);
    float _1915 = fma(_1903, _1903, _1911);
    float _1917 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1919 = rsqrt(_1915);
    float _1921 = sqrt(_1915);
    float _1923 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1925 = _1899 * _1923;
    float _1927 = _1903 * _1923;
    float _1929 = _1925 * _1925;
    float _1931 = _1927 * _1927;
    float _1933 = _1929 + _1931;
    float _1935 = sqrt(_1933);
    bool _1937 = _1935 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1941 = _1935 + _1939;
    float _1943 = _1919;
    float _1945 = _1889;
    float _1947 = _1941;
    float _1949 = _1887;
    float _1951 = _1933;
    if (_1937)
    {
        float _1953 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1943 = _1953;
    }
    float _1955 = _1943;
    if (_1937)
    {
        float _1957 = rsqrt(_1933);
        _1945 = _1957;
    }
    float _1959 = _1945;
    float _1961 = _1955;
    float _1963 = _1959;
    if (_1937)
    {
        float _1965 = _1941 * _1955;
        _1947 = _1965;
    }
    float _1967 = _1947;
    if (_1937)
    {
        float _1969 = _1967 * 0.15915493667125701904296875;
        _1949 = _1969;
    }
    float _1971 = _1949;
    float _1973 = _1903;
    float _1975 = _1971;
    if (_1937)
    {
        float _1977 = _1971 * 6.283185482025146484375;
        float _1979 = sin(_1977);
        _1973 = _1979;
    }
    float _1981 = _1973;
    float _1983 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1985 = precise::max(0.0, _1983);
    float _1987 = _1551;
    if (_1937)
    {
        float _1989 = _1971 * 6.283185482025146484375;
        float _1991 = cos(_1989);
        _1987 = _1991;
    }
    float _1993 = _1987;
    float _1995 = -_1923;
    float _1997 = -_1985;
    float _1999 = fma(_1895, _1995, _1997);
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1937)
    {
        float _2003 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1961 = _2003;
    }
    float _2005 = _1961;
    float _2007 = _2005;
    if (!_1937)
    {
        _1975 = _1929;
    }
    float _2009 = _1975;
    float _2011 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2013 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2015 = _2009;
    if (_1937)
    {
        float _2017 = fma(_1981, _2005, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2001 = _2017;
    }
    float _2019 = _2001;
    float _2021 = floor(_2011);
    float _2023 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2013);
    float _2025 = _2019;
    float _2027 = _1993;
    if (_1937)
    {
        float _2029 = _1993 + (-1.0);
        _2007 = _2029;
    }
    float _2031 = _2007;
    float _2033 = 0.0;
    float _2035 = _2031;
    if (_1937)
    {
        float _2037 = _1959 * _2019;
        _2033 = _2037;
    }
    float _2039 = _2033;
    if (!_1937)
    {
        _2025 = _1925;
    }
    float _2041 = _2025;
    float _2043 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2023);
    float _2045 = _2041;
    if (_1937)
    {
        float _2047 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1951 = _2047;
    }
    float _2049 = _1951;
    if (_1937)
    {
        float _2051 = _1925 * _2039;
        _2045 = _2051;
    }
    float _2053 = _2045;
    if (!_1937)
    {
        _2035 = _1927;
    }
    float _2055 = _2035;
    float _2057 = _2055;
    if (_1937)
    {
        float _2059 = _1927 * _2039;
        _2057 = _2059;
    }
    float _2061 = _2057;
    if (!_1937)
    {
        _1963 = _1999;
    }
    float _2063 = _1963;
    float _2065 = _2063;
    if (_1937)
    {
        float _2067 = fma(_1999, _1993, _2049);
        _2065 = _2067;
    }
    float _2069 = _2065;
    if (_1937)
    {
        float _2071 = _2053 * _2053;
        _2015 = _2071;
    }
    float _2073 = _2015;
    float _2075 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1937)
    {
        _2027 = _1931;
    }
    float _2077 = _2027;
    float _2079 = fma(_2069, _2069, _2073);
    float _2081 = _2077;
    if (_1937)
    {
        float _2083 = _2061 * _2061;
        _2081 = _2083;
    }
    float _2085 = _2081;
    float _2087 = fma(_1409, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2089 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = _2079 + _2085;
    float _2093 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2095 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2093);
    float _2105 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2095);
    float _2107 = rsqrt(_2091);
    float _2109 = -_2101;
    float _2111 = _2109 + 1.0;
    float _2113 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2103);
    float _2115 = _2105 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2117 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2119 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2121 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2123 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2125 = abs(_2111);
    float _2127 = log2(_2125);
    float _2129 = -_2119;
    float _2131 = fma(_2129, _2117, 1.0);
    float _2133 = -_2021;
    float _2135 = _2011 + _2133;
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2123);
    float _2139 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2137);
    float _2141 = _2107 * _2053;
    float _2143 = floor(_2087);
    float _2145 = _2107 * _2061;
    float _2147 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2139);
    float _2149 = _2107 * _2069;
    float _2151 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2153 = fma(_1513, 6.2500002968590706586837768554688e-05, 0.5);
    float _2155 = fma(_1515, 6.2500002968590706586837768554688e-05, 0.5);
    float _2157 = _2149 + 1.0;
    float _2159 = -_2151;
    float _2161 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2159);
    float _2163 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2165 = log2(_2131);
    float _2167 = -_2145;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2161);
    float _2171 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2173 = -_2143;
    float _2175 = _2087 + _2173;
    float _2177 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2179 = exp2(_2163);
    float _2181 = fma(_2169, -0.5, 0.5);
    float _2183 = fma(_2169, 0.5, 0.5);
    float _2185 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2171);
    float _2187 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2177);
    float _2189 = fma(_2183, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2191 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2185);
    float _2193 = 1.0 / _2147;
    float _2195 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2187);
    float _2197 = fma(_2183, _2189, -0.212114393711090087890625);
    float _2199 = _2165 * 0.693147182464599609375;
    float _2201 = fma(_2183, _2197, 1.570728778839111328125);
    float _2203 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2205 = sqrt(_2181);
    float _2207 = -_2149;
    float _2209 = fma(_2179, _2157, _2207);
    float _2211 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2191);
    float _2213 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2195);
    float _2215 = fma(_2209, 0.5, 0.5);
    float _2217 = _2211 * _2193;
    float _2219 = _2213 * _2193;
    float2 _6926 = float2(_2135, _2175);
    float _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6926, float2(0.0), isnan(_6926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6926, float2(0.0), isnan(_6926)), level(0.0)).x;
    float _2223 = fma(_2219, -0.5, 0.5);
    float _2225 = _2205 * 0.636619746685028076171875;
    float _2227 = fma(_2217, 0.5, 0.5);
    float _2229 = -_2201;
    float _2231 = fma(_2225, _2229, 1.0);
    float3 _6949 = float3(_2227, _2223, _2203);
    float _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6949, float3(0.0), isnan(_6949)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6949, float3(0.0), isnan(_6949)), level(0.0)).x;
    float3 _6960 = float3(_2227, _2223, _2203);
    float4 _2236 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6960, float3(0.0), isnan(_6960)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6960, float3(0.0), isnan(_6960)), level(0.0)).xyzw;
    float _2238 = _2236.x;
    float _2240 = _2236.y;
    float _2242 = _2236.z;
    float _2244 = _2236.w;
    float2 _6976 = float2(_2231, _2215);
    float3 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6976, float2(0.0), isnan(_6976)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6976, float2(0.0), isnan(_6976)), level(0.0)).xyz;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float2 _6990 = float2(_2153, _2155);
    float3 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6990, float2(0.0), isnan(_6990)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6990, float2(0.0), isnan(_6990)), level(0.0)).xyz;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    float _2264 = float(uint(_901));
    float _2266 = trunc(_1019);
    int _2268 = int(_2266);
    int _2270 = ~_901;
    int _2272 = _2270 + 1;
    out.m_76.x = _661;
    out.m_76.y = _665;
    out.m_76.z = _667;
    out.m_76.w = _669;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2276 = _2274 != 0;
    float _2278 = -_989;
    float _2280 = _2278 + 1.0;
    int _2282 = ~_901;
    int _2284 = _2282 + 1;
    float _2286 = -_981;
    float _2288 = _2286 + 1.0;
    float _2290 = 1.0 / _2264;
    out.m_78.x = _1443;
    out.m_78.y = _1421;
    out.m_78.z = _1409;
    float _2292 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2294 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_80.w = _1169;
    float _2296 = float(uint(_2268));
    float _2298 = _985 * _173;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2302 = _2300 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2304 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2306 = exp2(_2294);
    out.m_82.x = _1303;
    int _2308 = as_type<int>(_2290) + (-2);
    float _2310 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2304);
    out.m_84.x = _1759;
    out.m_84.y = _1757;
    out.m_84.z = _1761;
    float _2312 = as_type<float>(_2308) * _2296;
    float _2314 = trunc(_2298);
    int _2316 = int(_2314);
    float _2318 = trunc(_2312);
    float _2320 = precise::max(_2318, 0.0);
    uint _2323 = uint(_2320);
    float _2325 = -_2306;
    float _2327 = _2325 + 1.0;
    float _2329 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2331 = _2284 * int(_2323);
    int _2333 = _2331 + _2268;
    float _2335 = float(uint(_2333));
    float _2337 = as_type<float>(_2308) * _2335;
    int _2339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2341 = _2339 != 0;
    float _2343 = trunc(_2337);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    bool _2349 = !_2341;
    float _2351 = _2349 ? 7.345489978790283203125 : 1.0;
    bool _2353 = _163 > 0.5;
    float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2359 = _2351 * _163;
    float _2361 = float(_2268);
    float _2363 = -_223;
    int _2365 = _2353 ? as_type<int>(_2363) : as_type<int>(_223);
    float _2367 = 1.0 / _2357;
    bool _2369 = _2361 >= _973;
    bool _2371 = isnan(_2361);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(_973);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    int _2381 = int(_2323) + int(_2347);
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2385 = _2383 != 0;
    float _2387 = trunc(_2379);
    int _2389 = int(_2387);
    bool _2391 = _901 == 0;
    int _2393 = _2272 * _2381;
    int _2395 = _2393 + _2268;
    bool _2397 = !_2385;
    float _2399 = _2397 ? _223 : as_type<float>(_2365);
    bool _2401 = uint(_2395) >= uint(_901);
    float _2403 = floor(_2359);
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2407 = _2405 != 0;
    bool _2409 = !_2401;
    int _2411 = _2409 ? 0 : (-1);
    bool _2413 = _797 > 0.5;
    float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2417 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2415;
    int _2419 = ~_2381;
    int _2421 = _2419 + _2411;
    int _2423 = _2421 + 1;
    float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2427 = _2425 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2429 = ~_2389;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = _2417 * _2367;
    int _2437 = _901 + (-1);
    int _2439 = _901 * _2423;
    int _2441 = _2439 + _2268;
    float _2443 = 1.0 / _2427;
    int _2445 = abs(_1007);
    float _2447 = -_2403;
    float _2449 = _2359 + _2447;
    bool _2451 = !_2391;
    int _2453 = _2451 ? _2441 : (-1);
    float _2455 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2457 = _2455 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2459 = abs(_923);
    float _2461 = _2449 * _973;
    int _2463 = _2453 * _2433;
    float _2465 = 1.0 / _2302;
    float _2467 = -_227;
    int _2469 = _2413 ? as_type<int>(_2467) : as_type<int>(_227);
    int _2471 = _2389 * _2437;
    int _2473 = _2471 + _2463;
    bool _2475 = !_2407;
    int _2477 = _2475 ? 0 : 1;
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2483 = _2473 * _2459;
    float _2485 = trunc(_2461);
    int _2487 = int(_2485);
    int _2489 = abs(_2477);
    float _2491 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2493 = _2491 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2495 = 1.0 / _2481;
    float _2497 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2497;
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2503 = _2501 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2505 = _2457 * _2465;
    float _2507 = _2499 * _2443;
    bool _2509 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2511 = isnan(_783);
    bool _2513 = _2509 || _2511;
    bool _2515 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2517 = _2513 || _2515;
    float _2519 = float(_2517);
    float _2521 = 1.0 / _2493;
    int _2523 = _2487 * _2489;
    int _2525 = _2523 + _2268;
    int _2527 = abs(_1013);
    int _2529 = _2316 * _2445;
    int _2531 = _2529 + _2483;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2537 = !_2276;
    int _2539 = _2537 ? 0 : 1;
    int _2541 = _2525 * _2527;
    int _2543 = _2541 + _2531;
    float _2545 = _2503 * _2495;
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2547;
    int _2551 = abs(_2539);
    float _2553 = 1.0 / _2535;
    float _2555 = -_2519;
    float _2557 = _2555 + 1.0;
    bool _2559 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2561 = isnan(_783);
    bool _2563 = _2559 || _2561;
    bool _2565 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2567 = _2563 || _2565;
    float _2569 = float(_2567);
    float _2571 = _2549 * _2521;
    int _2573 = _2487 * _2551;
    int _2575 = _2573 + _2543;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2581 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2583 = isnan(_783);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    float _2593 = -_2569;
    float _2595 = _2593 + 1.0;
    bool _2597 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2599 = isnan(_783);
    bool _2601 = _2597 || _2599;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2605 = _2601 || _2603;
    float _2607 = float(_2605);
    float _2609 = 1.0 / _2579;
    float _2611 = float(uint(_2575));
    float _2613 = _2591 * _2595;
    float _2615 = -_2591;
    float _2617 = _2615 + 1.0;
    float _2619 = -_2607;
    float _2621 = _2619 + 1.0;
    bool _2623 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2625 = isnan(_783);
    bool _2627 = _2623 || _2625;
    bool _2629 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2631 = _2627 || _2629;
    float _2633 = float(_2631);
    float _2635 = _2607 * _2617;
    float _2637 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2639 = _2637 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2641 = as_type<float>(_2308) * _2611;
    float _2643 = _2633 * _2621;
    float _2645 = -_2633;
    float _2647 = _2645 + 1.0;
    bool _2649 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2651 = isnan(_783);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2657 = _2653 || _2655;
    float _2659 = float(_2657);
    float _2661 = _2639 * _2553;
    float _2663 = trunc(_2641);
    float _2665 = precise::max(_2663, 0.0);
    uint _2667 = uint(_2665);
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2669;
    bool _2673 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2675 = isnan(_783);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = _2519 * _2647;
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2689 = _783 + _2687;
    float _2691 = _2671 * _2609;
    int _2693 = ~_901;
    int _2695 = _2693 + 1;
    float _2697 = _2659 * _2557;
    float _2699 = -_2659;
    float _2701 = _2699 + 1.0;
    bool _2703 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2705 = isnan(_783);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = -_2683;
    float _2717 = _2715 + 1.0;
    float _2719 = fma(_2435, _2689, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2721 = _2683 * _2701;
    float _2723 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2725 = _783 + _2723;
    float _2727 = _2713 * _2717;
    float _2729 = -_2713;
    float _2731 = _2729 + 1.0;
    int _2733 = _2695 * int(_2667);
    int _2735 = _2733 + _2575;
    float _2737 = fma(_2505, _2725, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2739 = _2719 * _2727;
    float _2741 = float(uint(_2525));
    float _2743 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2745 = _783 + _2743;
    float _2747 = float(uint(_2735));
    float _2749 = fma(_2731, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2739);
    int _2751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2753 = _2751 != 0;
    float _2755 = as_type<float>(_2308) * _2741;
    float _2757 = fma(_2507, _2745, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2759 = as_type<float>(_2308) * _2747;
    float _2761 = fma(_2737, _2721, _2749);
    bool _2763 = !_2753;
    float _2765 = _2763 ? _227 : as_type<float>(_2469);
    float _2767 = trunc(_2755);
    float _2769 = precise::max(_2767, 0.0);
    uint _2771 = uint(_2769);
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2775 = _783 + _2773;
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2779 = _783 + _2777;
    float _2781 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2783 = _783 + _2781;
    float _2785 = _2399 + 0.5;
    float _2787 = fma(_2661, _2775, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2789 = fma(_2545, _2779, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2791 = ~_901;
    int _2793 = _2791 + 1;
    float _2795 = trunc(_2759);
    float _2797 = precise::max(_2795, 0.0);
    uint _2799 = uint(_2797);
    float _2801 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2803 = _783 + _2801;
    float _2805 = fma(_2757, _2697, _2761);
    float _2807 = fma(_2691, _2783, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2809 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[80].x, _945);
    float _2811 = fma(_2571, _2803, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2813 = fma(_2789, _2685, _2805);
    float _2815 = _1387 + (-10.0);
    float _2817 = _2765 + (-0.5);
    int _2819 = _2793 * int(_2771);
    int _2821 = _2819 + _2525;
    float _2823 = fma(_2811, _2643, _2813);
    int _2825 = ~_901;
    int _2827 = _2825 + 1;
    float _2829 = -_2817;
    float _2831 = -_947;
    float _2833 = fma(_2829, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2831);
    float _2835 = precise::max(_1369, _2815);
    float _2837 = fma(_2787, _2635, _2823);
    int _2839 = int(_2667) + int(_2799);
    float _2841 = -_2280;
    float _2843 = fma(_2399, _2841, _2809);
    float _2845 = float(uint(_2821));
    float _2847 = fma(_2807, _2613, _2837);
    float _2849 = precise::min(_1387, _2835);
    int _2851 = _2827 * _2839;
    int _2853 = _2851 + _2575;
    float _2855 = fma(_2765, _2288, _2833);
    float _2857 = as_type<float>(_2308) * _2845;
    float _2859 = fma(_2569, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2847);
    float _2861 = -_2815;
    float _2863 = _2861 + _2849;
    bool _2865 = uint(_2853) >= uint(_901);
    float _2867 = trunc(_2857);
    float _2869 = precise::max(_2867, 0.0);
    uint _2871 = uint(_2869);
    out.m_86.x = _2843;
    out.m_86.y = _2855;
    bool _2873 = !_2865;
    int _2875 = _2873 ? 0 : (-1);
    int _2877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2879 = _2877 != 0;
    float _2881 = fma(_2863, -0.100000001490116119384765625, 1.0);
    int _2883 = ~_2839;
    int _2885 = _2883 + _2875;
    int _2887 = _2885 + 1;
    float _2889 = abs(_1773);
    float _2891 = log2(_2889);
    int _2893 = ~_901;
    int _2895 = _2893 + 1;
    float _2897 = _765 * _2881;
    float _2899 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2901 = _901 * _2887;
    int _2903 = _2901 + _2575;
    float _2905 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2907 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_88.x = _759;
    out.m_88.y = _761;
    out.m_88.z = _763;
    out.m_88.w = _2897;
    int _2909 = int(_2771) + int(_2871);
    float _2911 = -_1327;
    float _2913 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2905);
    bool _2915 = !_2391;
    int _2917 = _2915 ? _2903 : (-1);
    out.m_90.x = _2859;
    bool _2919 = _1773 <= 8000.0;
    bool _2921 = isnan(_1773);
    bool _2923 = _2919 || _2921;
    bool _2925 = isnan(8000.0);
    bool _2927 = _2923 || _2925;
    float _2929 = float(_2927);
    int _2931 = _2917 >> 31;
    int _2933 = _2917 & 3;
    bool _2935 = _2933 != 0;
    float _2937 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2939 = _2931 & 3;
    int _2941 = _2895 * _2909;
    int _2943 = _2941 + _2525;
    int _2945 = _2917 + _2939;
    float _2947 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2913);
    float _2949 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2951 = -_1327;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2899);
    int _2955 = _2945 >> 2;
    float _2957 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2959 = uint(_2943) >= uint(_901);
    float _2961 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2963 = _2955 << 4;
    int _2965 = _2963 + 368;
    float _2967 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2949);
    float _2969 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2953);
    float _2971 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2961);
    uint _2973 = uint(int(uint(_2965) >> uint(2)));
    uint _2975 = uint(int(uint(int(_2973)) >> uint(2)));
    int _2977 = int(_2973) & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    int _2981 = int(_2973) + 1;
    uint _2983 = uint(int(uint(_2981) >> uint(2)));
    int _2985 = _2981 & 3;
    float _2987 = (*spvDescriptorSet0.vp_c9)._m0[int(_2983)][_2985];
    float _2989 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2991 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2957);
    float _2993 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2971);
    bool _2995 = !_2959;
    int _2997 = _2995 ? 0 : (-1);
    float _2999 = _2989 * _2947;
    float _3001 = _2989 * _2969;
    int _3003 = _2917 & 3;
    bool _3005 = _3003 != 0;
    int _3007 = _2965 + 8;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    uint _3011 = uint(int(uint(int(_3009)) >> uint(2)));
    int _3013 = int(_3009) & 3;
    float _3015 = (*spvDescriptorSet0.vp_c9)._m0[int(_3011)][_3013];
    int _3017 = int(_3009) + 1;
    uint _3019 = uint(int(uint(_3017) >> uint(2)));
    int _3021 = _3017 & 3;
    float _3023 = (*spvDescriptorSet0.vp_c9)._m0[int(_3019)][_3021];
    float _3025 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2310);
    int _3027 = _2935 ? 0 : 1;
    float _3029 = exp2(_2937);
    bool _3031 = uint(_3003) > 1u;
    float _3033 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2967);
    int _3035 = ~_3027;
    int _3037 = _3035 + 1;
    int _3039 = _3037 + 1;
    float _3041 = -_1327;
    float _3043 = fma(_3041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2907);
    int _3045 = ~_2909;
    int _3047 = _3045 + _2997;
    int _3049 = _3047 + 1;
    float _3051 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3053 = uint(_3003) >= 2u;
    float _3055 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3043);
    float _3057 = fma(_2292, _2993, _2999);
    int _3059 = _901 * _3049;
    int _3061 = _3059 + _2525;
    bool _3063 = !_3005;
    int _3065 = _3063 ? 0 : 1;
    float _3067 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3051);
    int _3069 = _3053 ? 0 : 1;
    float _3071 = _2989 * _3055;
    int _3073 = _3039;
    if (!_3031)
    {
        int _3075 = ~_3027;
        int _3077 = _3075 + 1;
        _3073 = _3077;
    }
    int _3079 = _3073;
    float _3081 = fma(_2292, _3033, _3001);
    bool _3083 = _3003 != 3;
    float _3085 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3067);
    int _3087 = abs(_3079);
    float _3089 = -_2221;
    float _3091 = _3089 + 1.0;
    int _3093 = abs(_3065);
    float _3095 = fma(_2292, _3085, _3071);
    int _3097 = ~_3069;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    float _3103 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3105 = _3003 != 3;
    float _3107 = _2329 * _2233;
    int _3109 = ~_3087;
    int _3111 = _3109 + 1;
    int _3113 = _3111 + 1;
    float _3115 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3103);
    float _3117 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2991);
    int _3119 = _3101;
    float _3121 = _3117;
    if (_3083)
    {
        int _3123 = ~_3069;
        int _3125 = _3123 + 1;
        _3119 = _3125;
    }
    int _3127 = _3119;
    float _3129 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3115);
    bool _3131 = !_3105;
    int _3133 = _3131 ? 0 : (-1);
    int _3135 = abs(_3127);
    int _3137 = _3113 * as_type<int>(_2987);
    int _3139 = ~_3093;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    bool _3145 = !_2879;
    int _3147 = _3145 ? 0 : 1;
    float _3149 = fma(_3029, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    int _3153 = abs(_3133);
    int _3155 = _3143 * as_type<int>(_2979);
    int _3157 = _3155 + _3137;
    int _3159 = abs(_3147);
    int _3161 = ~_3135;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    float _3167 = fma(_3151, -2.0, 3.0);
    int _3169 = ~_3153;
    int _3171 = _3169 + 1;
    int _3173 = _3171 + 1;
    float _3175 = _3151 * _3151;
    float _3177 = _2115 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3179 = _3165 * as_type<int>(_3015);
    int _3181 = _3179 + _3157;
    int _3183 = ~_3159;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    float _3189 = _3175 * _3167;
    float _3191 = in.m_92.x;
    int _3193 = _3173 * as_type<int>(_3023);
    int _3195 = _3193 + _3181;
    bool _3197 = !_2391;
    int _3199 = _3197 ? _3061 : (-1);
    float _3201 = -_3189;
    float _3203 = _3201 + 1.0;
    float _3205 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3177);
    int _3207 = _3195 * _3187;
    float _3209 = _2211 + _2147;
    float _3211 = fma(_3203, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3189);
    float _3213 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3205);
    int _3215 = _3199 * _3159;
    int _3217 = _3215 + _3207;
    float _3219 = _2929 * _3211;
    float _3221 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3213);
    float _3223 = _3209 * 0.5;
    float _3225 = float(_3217);
    float _3227 = _2147 * 0.5;
    float _3229 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3231 = _3221 + _2147;
    float _3233 = _2254 * _3107;
    float _3235 = fma(_2213, -0.5, _3227);
    float _3237 = _3025 + _3057;
    float _3239 = _3091 * _3229;
    float _3241 = precise::clamp(_3239, 0.0, 1.0);
    float _3243 = _3231 * 0.5;
    float _3245 = _3117 + _3081;
    float _3247 = _3129 + _3095;
    float _3249 = -_3241;
    float _3251 = fma(_3249, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3253 = _2244 * _3107;
    out.m_94.x = _3223;
    out.m_94.y = _3235;
    out.m_94.z = _3243;
    out.m_94.w = _2147;
    float _3255 = fma(_2244, _3233, _2242);
    float _3257 = _3251 * _3191;
    float _3259 = fma(_2250, _3253, _2238);
    float _3261 = in.m_92.z;
    float _3263 = fma(_2252, _3253, _2240);
    float _3265 = _3257 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _3267 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3269 = isnan(_1921);
    bool _3271 = _3267 || _3269;
    bool _3273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3275 = _3271 || _3273;
    out.gl_Position.x = _2211;
    out.gl_Position.y = _2213;
    out.gl_Position.z = _3221;
    out.gl_Position.w = _2147;
    float _3277 = _1829 * _1891;
    out.m_96.x = _2258;
    out.m_96.y = _2260;
    out.m_96.z = _2262;
    float _3279 = _3277 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3281 = -_2329;
    float _3283 = _3281 + 1.0;
    out.m_98.x = _3265;
    float _3285 = _2244 * _3283;
    out.m_100.x = _3237;
    out.m_100.y = _3245;
    out.m_100.z = _3247;
    float _3287 = _2147;
    float _3289 = _3235;
    float _3291 = _3283;
    float _3293 = _3279;
    if (!_3275)
    {
        _3121 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3295 = _3121;
    float _3297 = _3295;
    float _3299 = _3295;
    if (!_3275)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3301 = _3287;
    out.m_102.x = _3259;
    out.m_102.y = _3263;
    out.m_102.z = _3255;
    out.m_102.w = _3285;
    float _3303 = _3301;
    float _3305 = _3301;
    if (!_3275)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3307 = _3289;
    float _3309 = _3307;
    float _3311 = _3307;
    if (!_3275)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3313 = _3291;
    out.m_104.x = _3225;
    float _3315 = _3279 * _3261;
    float _3317 = _3261;
    float _3319 = _3313;
    float _3321 = _3313;
    if (!_3275)
    {
        _3317 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3323 = _3317;
    float _3325 = _3323;
    float _3327 = _3323;
    if (!_3275)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3329 = _3293;
    bool _3331 = !_3275;
    float _3333 = _3329;
    float _3335 = _3329;
    if (!_3331)
    {
        bool _3337 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3339 = isnan(_1921);
        bool _3341 = _3337 || _3339;
        bool _3343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3345 = _3341 || _3343;
        if (!_3345)
        {
            float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3349 = _1921 + _3347;
            float _3351 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3353 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3351;
            float _3355 = 1.0 / _3353;
            float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3377 = _3349 * _3355;
            float _3379 = precise::clamp(_3377, 0.0, 1.0);
            float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3385 = fma(_3379, _3359, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3387 = fma(_3379, _3383, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3389 = fma(_3379, _3363, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3391 = fma(_3379, _3367, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3393 = fma(_3379, _3371, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3395 = fma(_3379, _3375, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3305 = _3387;
            _3321 = _3393;
            _3299 = _3385;
            _3311 = _3391;
            _3327 = _3389;
            _3335 = _3395;
            _3397 = true;
        }
        else
        {
            bool _3399 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3401 = isnan(_1921);
            bool _3403 = _3399 || _3401;
            bool _3405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3407 = _3403 || _3405;
            if (!_3407)
            {
                _3297 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3409 = _3297;
            _3299 = _3409;
            if (!_3407)
            {
                _3303 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3411 = _3303;
            _3305 = _3411;
            if (!_3407)
            {
                _3325 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3413 = _3325;
            _3327 = _3413;
            if (!_3407)
            {
                _3309 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3415 = _3309;
            _3311 = _3415;
            if (!_3407)
            {
                _3319 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3417 = _3319;
            _3321 = _3417;
            if (!_3407)
            {
                _3333 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3419 = _3333;
            bool _3421 = !_3407;
            _3335 = _3419;
            if (!_3421)
            {
                bool _3423 = _1921 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3425 = isnan(_1921);
                bool _3427 = _3423 || _3425;
                bool _3429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3431 = _3427 || _3429;
                if (!_3431)
                {
                    float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3435 = _1921 + _3433;
                    float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3439 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3437;
                    float _3441 = 1.0 / _3439;
                    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3445 = _3443 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3463 = _3435 * _3441;
                    float _3465 = precise::clamp(_3463, 0.0, 1.0);
                    float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3471 = fma(_3465, _3445, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3473 = fma(_3465, _3469, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3475 = fma(_3465, _3449, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3477 = fma(_3465, _3453, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3479 = fma(_3465, _3457, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3481 = fma(_3465, _3461, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3305 = _3473;
                    _3321 = _3479;
                    _3299 = _3471;
                    _3311 = _3477;
                    _3327 = _3475;
                    _3335 = _3481;
                    _3397 = true;
                }
                else
                {
                    _3305 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3321 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3299 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3311 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3327 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3335 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3397 = false;
    float _3483 = _3305;
    float _3485 = _3321;
    float _3487 = _3299;
    float _3489 = _3311;
    float _3491 = _3327;
    float _3493 = _3335;
    float _3495 = _3315 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3497 = fma(_3245, -0.5, 0.5);
    float _3499 = precise::clamp(_3497, 0.0, 1.0);
    float _3501 = -_3483;
    float _3503 = _3501 + _3485;
    float _3505 = -_3487;
    float _3507 = _3505 + _3489;
    out.m_55.x = _3495;
    float _3509 = fma(_3499, _3503, _3483);
    float _3511 = -_3491;
    float _3513 = _3511 + _3493;
    float _3515 = fma(_3499, _3507, _3487);
    float _3517 = _3509 * 0.586610972881317138671875;
    bool _3519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3521 = fma(_3499, _3513, _3491);
    out.m_106.x = 0.0;
    float _3523 = fma(_3515, 0.298911988735198974609375, _3517);
    bool _3525 = _1829 > 0.0;
    bool _3527 = isnan(_1829);
    bool _3529 = _3525 || _3527;
    bool _3531 = isnan(0.0);
    bool _3533 = _3529 || _3531;
    float _3535 = fma(_3521, 0.114477999508380889892578125, _3523);
    bool _3537 = _1891 <= 0.0;
    bool _3539 = !_3533;
    bool _3541 = _3537 || _3539;
    float _3543 = -_3535;
    float _3545 = _3515 + _3543;
    float _3547 = -_3535;
    float _3549 = _3509 + _3547;
    float _3551 = -_3535;
    float _3553 = _3521 + _3551;
    float _3555 = fma(_3545, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3535);
    float _3557 = fma(_3549, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3535);
    float _3559 = fma(_3553, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3535);
    bool _3561 = !_3519;
    if (!_3561)
    {
        float _3563 = -_1757;
        float _3565 = _3563 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3567 = -_1759;
        float _3569 = _3567 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3571 = -_1761;
        float _3573 = _3571 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3575 = _3565 * _3565;
        float _3577 = fma(_3569, _3569, _3575);
        float _3579 = fma(_3573, _3573, _3577);
        float _3581 = sqrt(_3579);
        float _3583 = rsqrt(_3579);
        float _3585 = -_3581;
        float _3587 = _3585 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3589 = _3587 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3591 = precise::clamp(_3589, 0.0, 1.0);
        float _3593 = _3569 * _3583;
        float _3595 = _3565 * _3583;
        float _3597 = abs(_3591);
        float _3599 = log2(_3597);
        float _3601 = _3573 * _3583;
        float _3603 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3605 = _3245 * _3595;
        float _3607 = -_3595;
        float _3609 = -_3603;
        float _3611 = fma(_3607, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3609);
        float _3613 = fma(_3237, _3593, _3605);
        float _3615 = -_3601;
        float _3617 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3611);
        float _3619 = fma(_3247, _3601, _3613);
        float _3621 = precise::clamp(_3619, 0.0, 1.0);
        float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3625 = _3617 + _3623;
        float _3627 = _3599 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3629 = _3625 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3631 = precise::clamp(_3629, 0.0, 1.0);
        float _3633 = exp2(_3627);
        float _3635 = _3633 * _3631;
        float _3637 = _3621 * _3635;
        float _3639 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3641 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3643 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3639;
        out.m_106.y = _3641;
        out.m_106.z = _3643;
    }
    out.m_80.x = _3555;
    out.m_80.y = _3557;
    out.m_80.z = _3559;
    if (!_3541)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _3645 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3645;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

