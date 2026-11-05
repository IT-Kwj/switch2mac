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
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1010 = false;
    bool _445 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_91)
    {
        float _99 = _95 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1613 = as_type<float>(_101);
        out.gl_Position.z = _1613;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_87);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1682 = as_type<float>(_139);
        out.gl_Position.z = _1682;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = in.m_54.x;
    float _145 = in.m_54.y;
    float _147 = in.m_54.z;
    int _149 = as_type<int>(_141) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_141) & 2;
    bool _155 = _153 != 0;
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _159 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _163 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _165 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    float _167 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _161);
    float _169 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _163);
    float _171 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _165);
    float _173 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _167);
    float _175 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _169);
    bool _177 = !_151;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_155;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_157;
    float _203;
    if (!_185)
    {
        float _187 = in.m_56.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_87);
        float _209 = 1.0 / _207;
        float _211 = _119 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _213 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _213 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _243 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _245 = isnan(_213);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _229;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _259 = 1.0 / _233;
    float _261 = 1.0 / _237;
    float _263 = _217 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _267 = _213 + _265;
    float _269 = 1.0 / _241;
    float _271 = _221 * _259;
    bool _273 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _275 = isnan(_213);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    bool _285 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_213);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _225 * _261;
    float _299 = -_253;
    float _301 = _299 + 1.0;
    float _303 = -_283;
    float _305 = _303 + 1.0;
    float _307 = _283 * _301;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = _267 * _269;
    float _315 = _295 * _305;
    bool _317 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_213);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_295;
    float _331 = _329 + 1.0;
    float _333 = fma(_311, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    bool _339 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_213);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = fma(_337, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _361 = _327 * _331;
    float _363 = -_327;
    float _365 = _363 + 1.0;
    float _367 = -_349;
    float _369 = _367 + 1.0;
    float _371 = fma(_357, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_353, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = _349 * _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = _359 * _375;
    float _387 = _333 * _375;
    float _389 = fma(_379, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _391 = fma(_383, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _395 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _405 = fma(_371, _361, _393);
    float _407 = fma(_373, _361, _395);
    float _409 = fma(_399, _313, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _411 = fma(_403, _313, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _413 = fma(_389, _315, _405);
    float _415 = fma(_391, _315, _407);
    float _417 = fma(_409, _307, _413);
    float _419 = fma(_411, _307, _415);
    float _421 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[147].x, _417);
    float _423 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[147].y, _419);
    bool _425 = !_257;
    float _443;
    if (!_425)
    {
        float _427 = in.m_56.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_87);
        float _449 = 1.0 / _447;
        float _451 = _119 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = in.m_56.x;
    float _457 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _461 = in.m_44.x;
    float _463 = in.m_44.y;
    float _465 = in.m_44.z;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _469 = _467 != 0;
    float _471 = in.m_56.y;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _475 = _473 != 0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _479 = _453 + _477;
    float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _483 = _457 * _455;
    bool _485 = _455 > 0.5;
    float _487 = _463 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _489 = _463 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _491;
    float _495 = trunc(_483);
    int _497 = int(_495);
    float _499 = _463 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _501 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].x, _487);
    float _503 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].x, _489);
    bool _505 = _471 > 0.5;
    float _507 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].x, _499);
    float _509 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].z, _501);
    float _511 = 1.0 / _493;
    float _513 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].z, _507);
    float _515 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].z, _503);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _517;
    float _521 = _515 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _523 = _509 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _525 = _497 << 4;
    int _527 = _525 + 1968;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _533;
    float _537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _539 = _521 + _537;
    uint _542 = uint(int(uint(_527) >> uint(2)));
    uint _544 = uint(int(uint(int(_542)) >> uint(2)));
    int _546 = int(_542) & 3;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[int(_544)][_546];
    int _550 = int(_542) + 1;
    uint _552 = uint(int(uint(_550) >> uint(2)));
    int _554 = _550 & 3;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[int(_552)][_554];
    float _558 = _513 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _562 = _523 + _560;
    float _564 = _539 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _566 = _479 * _511;
    bool _568 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _570 = isnan(_453);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _582 = _558 + _580;
    bool _584 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _586 = isnan(_453);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = fma(_519, _566, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    int _598 = _527 + 8;
    uint _600 = uint(int(uint(_598) >> uint(2)));
    uint _602 = uint(int(uint(int(_600)) >> uint(2)));
    int _604 = int(_600) & 3;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[int(_602)][_604];
    float _608 = -_578;
    float _610 = _608 + 1.0;
    float _612 = fma(_531, _566, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _614 = fma(_535, _566, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _616 = -_179;
    int _618 = _485 ? as_type<int>(_616) : as_type<int>(_179);
    float _620 = _594 * _610;
    float _622 = -_594;
    float _624 = _622 + 1.0;
    float _626 = -_183;
    int _628 = _505 ? as_type<int>(_626) : as_type<int>(_183);
    float _630 = _596 * _620;
    float _632 = _612 * _620;
    float _634 = _614 * _620;
    bool _636 = !_469;
    float _638 = _636 ? _179 : as_type<float>(_618);
    float _640 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].x, _630);
    float _642 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[28].x, _564);
    float _644 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].y, _632);
    bool _646 = !_475;
    float _648 = _646 ? _183 : as_type<float>(_628);
    float _650 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].z, _634);
    float _652 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[28].z, _642);
    float _654 = _638 + 0.5;
    float _656 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[108].x, _640);
    float _658 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[108].z, _650);
    float _660 = -_648;
    float _662 = _660 + 0.5;
    float _664 = _539 * _539;
    bool _666 = _652 >= 0.0;
    float _668 = _654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _670 = _662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _672 = fma(_562, _562, _664);
    float _674 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[108].y, _644);
    float _676 = _670 * _459;
    float _678 = fma(_582, _582, _672);
    float _680 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _684 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = rsqrt(_678);
    float _688 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    int _692 = as_type<int>(_684);
    if (_666)
    {
        _690 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _694 = _690;
    float _696 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _548 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _700 = _556 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _702 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _668 * _481;
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_666)
    {
        float _712 = _694 * 5.0;
        _692 = as_type<int>(_712);
    }
    int _714 = _692;
    float _716 = _606 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_58.x = _704;
    out.m_58.y = _676;
    float _718 = _539 * _686;
    float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _696;
    out.m_60.y = _702;
    out.m_60.z = _710;
    out.m_60.w = _682;
    float _722 = _562 * _686;
    out.m_62.x = _706;
    out.m_62.y = _708;
    out.m_62.z = _720;
    if (_666)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2684 = as_type<float>(_714);
        out.gl_Position.z = _2684;
    }
    if (_666)
    {
        out.m_47.x = 0.0;
    }
    if (_666)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _724 = -_718;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _521);
    float _728 = _582 * _686;
    float _730 = -_722;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _734 = -_718;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _539);
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _740 = _726 + _738;
    float _742 = -_728;
    float _744 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = _732 + _746;
    float _750 = -_722;
    float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _754 = _740 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _758 = _744 + _756;
    float _760 = _736 * _736;
    float _762 = in.m_64.x;
    float _764 = in.m_64.y;
    float _766 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[28].x, _754);
    float _768 = -_728;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _582);
    float _772 = fma(_752, _752, _760);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[28].z, _766);
    float _776 = fma(_770, _770, _772);
    bool _778 = _774 >= 0.0;
    float _780 = sqrt(_776);
    float _782 = _758;
    if (_778)
    {
        _782 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _784 = _782;
    int _786 = as_type<int>(_784);
    if (_778)
    {
        out.m_47.x = 0.0;
    }
    float _788 = _421 * _762;
    float _790 = _423 * _764;
    float _792 = _686 * _780;
    if (_778)
    {
        float _794 = _784 * 5.0;
        _786 = as_type<int>(_794);
    }
    int _796 = _786;
    if (_778)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2826 = as_type<float>(_796);
        out.gl_Position.z = _2826;
    }
    if (_778)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _800 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _806 = _798 * _792;
    float _808 = _800 * _792;
    float _810 = _792 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _812 = _810 * 0.5;
    float _814 = _802 * _806;
    float _816 = _804 * _808;
    float _818 = _814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _820 = _814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _822 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[24].x, _818);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[26].x, _820);
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _822);
    float _828 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _824);
    float _830 = _826 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _832 = _828 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _834 = _814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _836 = _523 + _830;
    float _838 = _558 + _832;
    float _840 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _834);
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _844 = _836 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _848 = _838 + _846;
    float _850 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _840);
    float _852 = _844 * _844;
    float _854 = _848 * _848;
    float _856 = _850 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _858 = _852 + _854;
    float _860 = _521 + _856;
    float _862 = sqrt(_858);
    bool _864 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _866 = _816;
    float _868 = _856;
    float _870 = _812;
    float _872 = _838;
    float _874 = _854;
    float _876 = _852;
    if (!_864)
    {
        _866 = _838;
    }
    float _878 = _866;
    float _880 = _878;
    if (!_864)
    {
        _868 = _852;
    }
    float _882 = _868;
    float _884 = _882;
    if (!_864)
    {
        _870 = _836;
    }
    float _886 = _870;
    float _888 = _886;
    if (!_864)
    {
        _872 = _860;
    }
    float _890 = _872;
    bool _892 = !_864;
    float _894 = _890;
    if (!_892)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _900 = _862 + _898;
        float _902 = rsqrt(_858);
        float _904 = _900 * _896;
        float _906 = _860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = _904 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = sin(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = fma(_912, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _920 = _902 * _918;
        float _922 = _916 + (-1.0);
        float _924 = fma(_844, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _926 = fma(_848, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _928 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _932 = _924 + _930;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _936 = _926 + _934;
        float _938 = fma(_860, _916, _928);
        float _940 = _932 * _932;
        float _942 = _936 * _936;
        _894 = _938;
        _884 = _940;
        _874 = _942;
        _888 = _924;
        _880 = _926;
    }
    float _944 = _894;
    float _946 = _884;
    float _948 = _874;
    float _950 = _888;
    float _952 = _880;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _956 = _944 + _954;
    float _958 = fma(_956, _956, _946);
    float _960 = _958 + _948;
    float _962 = sqrt(_960);
    bool _964 = _962 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _966 = isnan(_962);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _972 = _968 || _970;
    float _974 = _946;
    if (!_972)
    {
        _974 = 1.0;
    }
    float _976 = _974;
    bool _978 = !_972;
    float _980 = _976;
    if (!_978)
    {
        bool _982 = _962 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _984 = isnan(_962);
        bool _986 = _982 || _984;
        bool _988 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _990 = _986 || _988;
        if (!_990)
        {
            float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _994 = _962 + _992;
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _998 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _996;
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1002 = _1000 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1004 = 1.0 / _998;
            float _1006 = _994 * _1004;
            float _1008 = fma(_1006, _1002, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _980 = _1008;
            _1010 = true;
        }
        else
        {
            bool _1012 = _962 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1014 = isnan(_962);
            bool _1016 = _1012 || _1014;
            bool _1018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1020 = _1016 || _1018;
            if (!_1020)
            {
                float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1024 = _962 + _1022;
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1028 = _1026 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1032 = _1030 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1034 = 1.0 / _1028;
                float _1036 = _1024 * _1034;
                float _1038 = fma(_1036, _1032, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _980 = _1038;
                _1010 = true;
            }
            else
            {
                _980 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1010 = false;
    float _1040 = _980;
    float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1044 = _944 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1048 = _950 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1052 = _952 + _1050;
    float _1054 = fma(_1044, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1056 = fma(_1048, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1058 = fma(_1052, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1060 = -_521;
    float _1062 = _1060 + _1054;
    float _1064 = -_523;
    float _1066 = _1064 + _1056;
    float _1068 = -_558;
    float _1070 = _1068 + _1058;
    float _1072 = _1062 * _1062;
    float _1074 = fma(_1066, _1066, _1072);
    float _1076 = fma(_1070, _1070, _1074);
    float _1078 = sqrt(_1076);
    bool _1080 = _1078 > 0.0;
    float _1082 = _1078;
    float _1084 = _1048;
    float _1086 = _1052;
    float _1088 = _1054;
    float _1090 = _1066;
    if (!_1080)
    {
        _1082 = _1056;
    }
    float _1092 = _1082;
    float _1094 = _1092;
    if (!_1080)
    {
        _1084 = _1054;
    }
    float _1096 = _1084;
    float _1098 = _1096;
    float _1100 = _1096;
    if (!_1080)
    {
        _1086 = _1058;
    }
    float _1102 = _1086;
    bool _1104 = !_1080;
    float _1106 = _1102;
    if (!_1104)
    {
        float _1108 = _173 * _173;
        float _1110 = fma(_171, _171, _1108);
        float _1112 = fma(_175, _175, _1110);
        float _1114 = rsqrt(_1076);
        float _1116 = sqrt(_1112);
        float _1118 = _1066 * _1114;
        float _1120 = _1062 * _1114;
        float _1122 = _1070 * _1114;
        bool _1124 = _1116 > 0.0;
        float _1126 = _1114;
        float _1128 = _1116;
        _876 = _1120;
        if (!_1124)
        {
            _1126 = _1056;
        }
        float _1130 = _1126;
        _1094 = _1130;
        if (!_1124)
        {
            _1098 = _1054;
        }
        float _1132 = _1098;
        _1100 = _1132;
        if (!_1124)
        {
            _1128 = _1058;
        }
        float _1134 = _1128;
        bool _1136 = !_1124;
        _1106 = _1134;
        if (!_1136)
        {
            float _1138 = rsqrt(_1112);
            float _1140 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1142 = _173 * _1138;
            float _1144 = _171 * _1138;
            float _1146 = _1120 * _1142;
            float _1148 = _175 * _1138;
            float _1150 = fma(_1118, _1144, _1146);
            float _1152 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1154 = fma(_1122, _1148, _1150);
            float _1156 = _1154 * _1152;
            float _1158 = fma(_171, _1156, _1056);
            float _1160 = fma(_173, _1156, _1054);
            float _1162 = fma(_175, _1156, _1058);
            _1100 = _1160;
            _1094 = _1158;
            _1106 = _1162;
        }
    }
    float _1164 = _1100;
    float _1166 = _1094;
    float _1168 = _1106;
    float _1170 = _876;
    float _1172 = -_718;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1164);
    float _1176 = -_722;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1166);
    float _1180 = -_728;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1168);
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1186 = _1174 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1190 = _1178 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1194 = _1182 + _1192;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1190, _1190, _1196);
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = rsqrt(_1200);
    float _1204 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1206 = _1190 * _1204;
    float _1208 = _1194 * _1204;
    float _1210 = _1206 * _1206;
    float _1212 = _1208 * _1208;
    float _1214 = _1210 + _1212;
    float _1216 = sqrt(_1214);
    bool _1218 = _1216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = _1216 + _1220;
    float _1224 = _1194;
    float _1226 = _1222;
    float _1228 = _1186;
    float _1230 = _1170;
    float _1232 = _1206;
    if (_1218)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1224 = _1234;
    }
    float _1236 = _1224;
    if (_1218)
    {
        float _1238 = rsqrt(_1214);
        _1088 = _1238;
    }
    float _1240 = _1088;
    float _1242 = _1240;
    if (_1218)
    {
        float _1244 = _1222 * _1236;
        _1226 = _1244;
    }
    float _1246 = _1226;
    if (_1218)
    {
        float _1248 = _1246 * 0.15915493667125701904296875;
        _1090 = _1248;
    }
    float _1250 = _1090;
    float _1252 = _1202;
    if (_1218)
    {
        float _1254 = _1250 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        _1252 = _1256;
    }
    float _1258 = _1252;
    float _1260 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1262 = precise::max(0.0, _1260);
    float _1264 = _1198;
    float _1266 = _1260;
    float _1268 = _1262;
    if (_1218)
    {
        float _1270 = _1250 * 6.283185482025146484375;
        float _1272 = cos(_1270);
        _1264 = _1272;
    }
    float _1274 = _1264;
    float _1276 = -_1204;
    float _1278 = -_1262;
    float _1280 = fma(_1186, _1276, _1278);
    if (_1218)
    {
        float _1282 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1282;
    }
    float _1284 = _1266;
    float _1286 = _1258;
    float _1288 = _1284;
    if (_1218)
    {
        float _1290 = fma(_1258, _1284, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1228 = _1290;
    }
    float _1292 = _1228;
    if (!_1218)
    {
        _1286 = _1208;
    }
    float _1294 = _1286;
    float _1296 = _1294;
    if (_1218)
    {
        float _1298 = _1274 + (-1.0);
        _1288 = _1298;
    }
    float _1300 = _1288;
    float _1302 = _1300;
    if (_1218)
    {
        float _1304 = _1240 * _1292;
        _1230 = _1304;
    }
    float _1306 = _1230;
    if (!_1218)
    {
        _1242 = _1280;
    }
    float _1308 = _1242;
    float _1310 = sqrt(_1200);
    float _1312 = _1308;
    if (_1218)
    {
        float _1314 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1314;
    }
    float _1316 = _1268;
    float _1318 = _1316;
    if (_1218)
    {
        float _1320 = _1206 * _1306;
        _1232 = _1320;
    }
    float _1322 = _1232;
    if (!_1218)
    {
        _1302 = _1210;
    }
    float _1324 = _1302;
    float _1326 = _1324;
    if (_1218)
    {
        float _1328 = _1208 * _1306;
        _1296 = _1328;
    }
    float _1330 = _1296;
    if (_1218)
    {
        float _1332 = fma(_1280, _1274, _1316);
        _1312 = _1332;
    }
    float _1334 = _1312;
    if (_1218)
    {
        float _1336 = _1322 * _1322;
        _1326 = _1336;
    }
    float _1338 = _1326;
    if (!_1218)
    {
        _1318 = _1212;
    }
    float _1340 = _1318;
    float _1342 = _1340;
    if (_1218)
    {
        float _1344 = _1330 * _1330;
        _1342 = _1344;
    }
    float _1346 = _1342;
    float _1348 = fma(_1334, _1334, _1338);
    float _1350 = _1348 + _1346;
    float _1352 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1356 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1354);
    float _1358 = precise::clamp(_1356, 0.0, 1.0);
    float _1360 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1362 = rsqrt(_1350);
    float _1364 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1352);
    float _1366 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1368 = -_1358;
    float _1370 = _1368 + 1.0;
    float _1372 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1374 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1364);
    float _1376 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1366);
    float _1378 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1380 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1372);
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1384 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1376);
    float _1386 = abs(_1370);
    float _1388 = log2(_1386);
    float _1390 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1378);
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1394 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1380);
    float _1396 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1398 = _1362 * _1322;
    float _1400 = -_1392;
    float _1402 = fma(_1400, _1360, 1.0);
    float _1404 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1390);
    float _1406 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1410 = _1362 * _1334;
    float _1412 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1414 = _1362 * _1330;
    float _1416 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1408);
    float _1418 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1420 = -_1412;
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1420);
    float _1424 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1426 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1416);
    float _1428 = log2(_1402);
    float _1430 = -_1414;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1422);
    float _1434 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1426);
    float _1438 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1440 = fma(_1432, -0.5, 0.5);
    float _1442 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1434);
    float _1444 = fma(_1432, 0.5, 0.5);
    float _1446 = exp2(_1424);
    float _1448 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1438);
    float _1450 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1442);
    float _1452 = _1410 + 1.0;
    float _1454 = fma(_1444, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1456 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1448);
    float _1458 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1450);
    float _1460 = 1.0 / _1436;
    float _1462 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1456);
    float _1464 = fma(_1444, _1454, -0.212114393711090087890625);
    float _1466 = _1428 * 0.693147182464599609375;
    float _1468 = fma(_1444, _1464, 1.570728778839111328125);
    float _1470 = sqrt(_1440);
    float _1472 = -_1410;
    float _1474 = fma(_1446, _1452, _1472);
    float _1476 = fma(_1474, 0.5, 0.5);
    float _1478 = _1458 * _1460;
    float _1480 = _1462 * _1460;
    float _1482 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1484 = fma(_1478, 0.5, 0.5);
    float _1486 = fma(_1480, -0.5, 0.5);
    float _1488 = _1470 * 0.636619746685028076171875;
    float3 _3971 = float3(_1484, _1486, _1482);
    float _1490 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3971, float3(0.0), isnan(_3971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3971, float3(0.0), isnan(_3971)), level(0.0)).x;
    float3 _3982 = float3(_1484, _1486, _1482);
    float4 _1493 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3982, float3(0.0), isnan(_3982)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3982, float3(0.0), isnan(_3982)), level(0.0)).xyzw;
    float _1495 = _1493.x;
    float _1497 = _1493.y;
    float _1499 = _1493.z;
    float _1501 = _1493.w;
    float _1503 = -_1468;
    float _1505 = fma(_1488, _1503, 1.0);
    float2 _4004 = float2(_1505, _1476);
    float3 _1509 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4004, float2(0.0), isnan(_4004)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4004, float2(0.0), isnan(_4004)), level(0.0)).xyz;
    float _1511 = _1509.x;
    float _1513 = _1509.y;
    float _1515 = _1509.z;
    float _1517 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1519 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1521 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1519);
    float _1523 = exp2(_1517);
    float _1525 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1521);
    float _1527 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1525);
    float _1529 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1531 = _1527 + _1436;
    out.gl_Position.x = _1458;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _1527;
    out.gl_Position.w = _1436;
    float _1533 = _1531 * 0.5;
    float _1535 = -_1523;
    float _1537 = _1535 + 1.0;
    out.m_47.x = _1529;
    float _1539 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _1533;
    out.m_66.w = _1436;
    float _1541 = _1539 * _1490;
    float _1543 = -_1539;
    float _1545 = _1543 + 1.0;
    float _1547 = _1501 * _1541;
    float _1549 = _1515 * _1541;
    float _1551 = fma(_1511, _1547, _1495);
    float _1553 = fma(_1513, _1547, _1497);
    float _1555 = _1501 * _1545;
    float _1557 = fma(_1501, _1549, _1499);
    out.m_68.x = _1551;
    out.m_68.y = _1553;
    out.m_68.z = _1557;
    out.m_68.w = _1555;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1010 = false;
    bool _445 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_91)
    {
        float _99 = _95 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1613 = as_type<float>(_101);
        out.gl_Position.z = _1613;
    }
    if (!_91)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_87);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1682 = as_type<float>(_139);
        out.gl_Position.z = _1682;
    }
    if (_131)
    {
        return out;
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = in.m_54.x;
    float _145 = in.m_54.y;
    float _147 = in.m_54.z;
    int _149 = as_type<int>(_141) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_141) & 2;
    bool _155 = _153 != 0;
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _159 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _163 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _165 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    float _167 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _161);
    float _169 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _163);
    float _171 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _165);
    float _173 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _167);
    float _175 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _169);
    bool _177 = !_151;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_155;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_157;
    float _203;
    if (!_185)
    {
        float _187 = in.m_56.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_87);
        float _209 = 1.0 / _207;
        float _211 = _119 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _213 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _213 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _243 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _245 = isnan(_213);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _229;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _259 = 1.0 / _233;
    float _261 = 1.0 / _237;
    float _263 = _217 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _267 = _213 + _265;
    float _269 = 1.0 / _241;
    float _271 = _221 * _259;
    bool _273 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _275 = isnan(_213);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    bool _285 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_213);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _225 * _261;
    float _299 = -_253;
    float _301 = _299 + 1.0;
    float _303 = -_283;
    float _305 = _303 + 1.0;
    float _307 = _283 * _301;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = _267 * _269;
    float _315 = _295 * _305;
    bool _317 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_213);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_295;
    float _331 = _329 + 1.0;
    float _333 = fma(_311, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    bool _339 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_213);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = fma(_337, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _361 = _327 * _331;
    float _363 = -_327;
    float _365 = _363 + 1.0;
    float _367 = -_349;
    float _369 = _367 + 1.0;
    float _371 = fma(_357, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_353, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = _349 * _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = _359 * _375;
    float _387 = _333 * _375;
    float _389 = fma(_379, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _391 = fma(_383, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _395 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _405 = fma(_371, _361, _393);
    float _407 = fma(_373, _361, _395);
    float _409 = fma(_399, _313, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _411 = fma(_403, _313, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _413 = fma(_389, _315, _405);
    float _415 = fma(_391, _315, _407);
    float _417 = fma(_409, _307, _413);
    float _419 = fma(_411, _307, _415);
    float _421 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[147].x, _417);
    float _423 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[147].y, _419);
    bool _425 = !_257;
    float _443;
    if (!_425)
    {
        float _427 = in.m_56.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_87);
        float _449 = 1.0 / _447;
        float _451 = _119 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = in.m_56.x;
    float _457 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _461 = in.m_44.x;
    float _463 = in.m_44.y;
    float _465 = in.m_44.z;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _469 = _467 != 0;
    float _471 = in.m_56.y;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _475 = _473 != 0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _479 = _453 + _477;
    float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _483 = _457 * _455;
    bool _485 = _455 > 0.5;
    float _487 = _463 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _489 = _463 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _491;
    float _495 = trunc(_483);
    int _497 = int(_495);
    float _499 = _463 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _501 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].x, _487);
    float _503 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].x, _489);
    bool _505 = _471 > 0.5;
    float _507 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].x, _499);
    float _509 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].z, _501);
    float _511 = 1.0 / _493;
    float _513 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].z, _507);
    float _515 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].z, _503);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _517;
    float _521 = _515 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _523 = _509 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _525 = _497 << 4;
    int _527 = _525 + 1968;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _533;
    float _537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _539 = _521 + _537;
    uint _542 = uint(int(uint(_527) >> uint(2)));
    uint _544 = uint(int(uint(int(_542)) >> uint(2)));
    int _546 = int(_542) & 3;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[int(_544)][_546];
    int _550 = int(_542) + 1;
    uint _552 = uint(int(uint(_550) >> uint(2)));
    int _554 = _550 & 3;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[int(_552)][_554];
    float _558 = _513 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _562 = _523 + _560;
    float _564 = _539 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _566 = _479 * _511;
    bool _568 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _570 = isnan(_453);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _582 = _558 + _580;
    bool _584 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _586 = isnan(_453);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = fma(_519, _566, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    int _598 = _527 + 8;
    uint _600 = uint(int(uint(_598) >> uint(2)));
    uint _602 = uint(int(uint(int(_600)) >> uint(2)));
    int _604 = int(_600) & 3;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[int(_602)][_604];
    float _608 = -_578;
    float _610 = _608 + 1.0;
    float _612 = fma(_531, _566, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _614 = fma(_535, _566, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _616 = -_179;
    int _618 = _485 ? as_type<int>(_616) : as_type<int>(_179);
    float _620 = _594 * _610;
    float _622 = -_594;
    float _624 = _622 + 1.0;
    float _626 = -_183;
    int _628 = _505 ? as_type<int>(_626) : as_type<int>(_183);
    float _630 = _596 * _620;
    float _632 = _612 * _620;
    float _634 = _614 * _620;
    bool _636 = !_469;
    float _638 = _636 ? _179 : as_type<float>(_618);
    float _640 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].x, _630);
    float _642 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[28].x, _564);
    float _644 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].y, _632);
    bool _646 = !_475;
    float _648 = _646 ? _183 : as_type<float>(_628);
    float _650 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].z, _634);
    float _652 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[28].z, _642);
    float _654 = _638 + 0.5;
    float _656 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[108].x, _640);
    float _658 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[108].z, _650);
    float _660 = -_648;
    float _662 = _660 + 0.5;
    float _664 = _539 * _539;
    bool _666 = _652 >= 0.0;
    float _668 = _654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _670 = _662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _672 = fma(_562, _562, _664);
    float _674 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[108].y, _644);
    float _676 = _670 * _459;
    float _678 = fma(_582, _582, _672);
    float _680 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _684 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = rsqrt(_678);
    float _688 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    int _692 = as_type<int>(_684);
    if (_666)
    {
        _690 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _694 = _690;
    float _696 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _548 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _700 = _556 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _702 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _668 * _481;
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_666)
    {
        float _712 = _694 * 5.0;
        _692 = as_type<int>(_712);
    }
    int _714 = _692;
    float _716 = _606 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_58.x = _704;
    out.m_58.y = _676;
    float _718 = _539 * _686;
    float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _696;
    out.m_60.y = _702;
    out.m_60.z = _710;
    out.m_60.w = _682;
    float _722 = _562 * _686;
    out.m_62.x = _706;
    out.m_62.y = _708;
    out.m_62.z = _720;
    if (_666)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2684 = as_type<float>(_714);
        out.gl_Position.z = _2684;
    }
    if (_666)
    {
        out.m_47.x = 0.0;
    }
    if (_666)
    {
        return out;
    }
    float _724 = -_718;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _521);
    float _728 = _582 * _686;
    float _730 = -_722;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _734 = -_718;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _539);
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _740 = _726 + _738;
    float _742 = -_728;
    float _744 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = _732 + _746;
    float _750 = -_722;
    float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _754 = _740 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _758 = _744 + _756;
    float _760 = _736 * _736;
    float _762 = in.m_64.x;
    float _764 = in.m_64.y;
    float _766 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[28].x, _754);
    float _768 = -_728;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _582);
    float _772 = fma(_752, _752, _760);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[28].z, _766);
    float _776 = fma(_770, _770, _772);
    bool _778 = _774 >= 0.0;
    float _780 = sqrt(_776);
    float _782 = _758;
    if (_778)
    {
        _782 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _784 = _782;
    int _786 = as_type<int>(_784);
    if (_778)
    {
        out.m_47.x = 0.0;
    }
    float _788 = _421 * _762;
    float _790 = _423 * _764;
    float _792 = _686 * _780;
    if (_778)
    {
        float _794 = _784 * 5.0;
        _786 = as_type<int>(_794);
    }
    int _796 = _786;
    if (_778)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2826 = as_type<float>(_796);
        out.gl_Position.z = _2826;
    }
    if (_778)
    {
        return out;
    }
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _800 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _806 = _798 * _792;
    float _808 = _800 * _792;
    float _810 = _792 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _812 = _810 * 0.5;
    float _814 = _802 * _806;
    float _816 = _804 * _808;
    float _818 = _814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _820 = _814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _822 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[24].x, _818);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[26].x, _820);
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _822);
    float _828 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _824);
    float _830 = _826 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _832 = _828 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _834 = _814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _836 = _523 + _830;
    float _838 = _558 + _832;
    float _840 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _834);
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _844 = _836 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _848 = _838 + _846;
    float _850 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _840);
    float _852 = _844 * _844;
    float _854 = _848 * _848;
    float _856 = _850 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _858 = _852 + _854;
    float _860 = _521 + _856;
    float _862 = sqrt(_858);
    bool _864 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _866 = _816;
    float _868 = _856;
    float _870 = _812;
    float _872 = _838;
    float _874 = _854;
    float _876 = _852;
    if (!_864)
    {
        _866 = _838;
    }
    float _878 = _866;
    float _880 = _878;
    if (!_864)
    {
        _868 = _852;
    }
    float _882 = _868;
    float _884 = _882;
    if (!_864)
    {
        _870 = _836;
    }
    float _886 = _870;
    float _888 = _886;
    if (!_864)
    {
        _872 = _860;
    }
    float _890 = _872;
    bool _892 = !_864;
    float _894 = _890;
    if (!_892)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _900 = _862 + _898;
        float _902 = rsqrt(_858);
        float _904 = _900 * _896;
        float _906 = _860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = _904 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = sin(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = fma(_912, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _920 = _902 * _918;
        float _922 = _916 + (-1.0);
        float _924 = fma(_844, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _926 = fma(_848, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _928 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _932 = _924 + _930;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _936 = _926 + _934;
        float _938 = fma(_860, _916, _928);
        float _940 = _932 * _932;
        float _942 = _936 * _936;
        _894 = _938;
        _884 = _940;
        _874 = _942;
        _888 = _924;
        _880 = _926;
    }
    float _944 = _894;
    float _946 = _884;
    float _948 = _874;
    float _950 = _888;
    float _952 = _880;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _956 = _944 + _954;
    float _958 = fma(_956, _956, _946);
    float _960 = _958 + _948;
    float _962 = sqrt(_960);
    bool _964 = _962 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _966 = isnan(_962);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _972 = _968 || _970;
    float _974 = _946;
    if (!_972)
    {
        _974 = 1.0;
    }
    float _976 = _974;
    bool _978 = !_972;
    float _980 = _976;
    if (!_978)
    {
        bool _982 = _962 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _984 = isnan(_962);
        bool _986 = _982 || _984;
        bool _988 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _990 = _986 || _988;
        if (!_990)
        {
            float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _994 = _962 + _992;
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _998 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _996;
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1002 = _1000 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1004 = 1.0 / _998;
            float _1006 = _994 * _1004;
            float _1008 = fma(_1006, _1002, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _980 = _1008;
            _1010 = true;
        }
        else
        {
            bool _1012 = _962 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1014 = isnan(_962);
            bool _1016 = _1012 || _1014;
            bool _1018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1020 = _1016 || _1018;
            if (!_1020)
            {
                float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1024 = _962 + _1022;
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1028 = _1026 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1032 = _1030 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1034 = 1.0 / _1028;
                float _1036 = _1024 * _1034;
                float _1038 = fma(_1036, _1032, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _980 = _1038;
                _1010 = true;
            }
            else
            {
                _980 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1010 = false;
    float _1040 = _980;
    float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1044 = _944 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1048 = _950 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1052 = _952 + _1050;
    float _1054 = fma(_1044, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1056 = fma(_1048, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1058 = fma(_1052, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1060 = -_521;
    float _1062 = _1060 + _1054;
    float _1064 = -_523;
    float _1066 = _1064 + _1056;
    float _1068 = -_558;
    float _1070 = _1068 + _1058;
    float _1072 = _1062 * _1062;
    float _1074 = fma(_1066, _1066, _1072);
    float _1076 = fma(_1070, _1070, _1074);
    float _1078 = sqrt(_1076);
    bool _1080 = _1078 > 0.0;
    float _1082 = _1078;
    float _1084 = _1048;
    float _1086 = _1052;
    float _1088 = _1054;
    float _1090 = _1066;
    if (!_1080)
    {
        _1082 = _1056;
    }
    float _1092 = _1082;
    float _1094 = _1092;
    if (!_1080)
    {
        _1084 = _1054;
    }
    float _1096 = _1084;
    float _1098 = _1096;
    float _1100 = _1096;
    if (!_1080)
    {
        _1086 = _1058;
    }
    float _1102 = _1086;
    bool _1104 = !_1080;
    float _1106 = _1102;
    if (!_1104)
    {
        float _1108 = _173 * _173;
        float _1110 = fma(_171, _171, _1108);
        float _1112 = fma(_175, _175, _1110);
        float _1114 = rsqrt(_1076);
        float _1116 = sqrt(_1112);
        float _1118 = _1066 * _1114;
        float _1120 = _1062 * _1114;
        float _1122 = _1070 * _1114;
        bool _1124 = _1116 > 0.0;
        float _1126 = _1114;
        float _1128 = _1116;
        _876 = _1120;
        if (!_1124)
        {
            _1126 = _1056;
        }
        float _1130 = _1126;
        _1094 = _1130;
        if (!_1124)
        {
            _1098 = _1054;
        }
        float _1132 = _1098;
        _1100 = _1132;
        if (!_1124)
        {
            _1128 = _1058;
        }
        float _1134 = _1128;
        bool _1136 = !_1124;
        _1106 = _1134;
        if (!_1136)
        {
            float _1138 = rsqrt(_1112);
            float _1140 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1142 = _173 * _1138;
            float _1144 = _171 * _1138;
            float _1146 = _1120 * _1142;
            float _1148 = _175 * _1138;
            float _1150 = fma(_1118, _1144, _1146);
            float _1152 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1154 = fma(_1122, _1148, _1150);
            float _1156 = _1154 * _1152;
            float _1158 = fma(_171, _1156, _1056);
            float _1160 = fma(_173, _1156, _1054);
            float _1162 = fma(_175, _1156, _1058);
            _1100 = _1160;
            _1094 = _1158;
            _1106 = _1162;
        }
    }
    float _1164 = _1100;
    float _1166 = _1094;
    float _1168 = _1106;
    float _1170 = _876;
    float _1172 = -_718;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1164);
    float _1176 = -_722;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1166);
    float _1180 = -_728;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1168);
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1186 = _1174 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1190 = _1178 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1194 = _1182 + _1192;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1190, _1190, _1196);
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = rsqrt(_1200);
    float _1204 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1206 = _1190 * _1204;
    float _1208 = _1194 * _1204;
    float _1210 = _1206 * _1206;
    float _1212 = _1208 * _1208;
    float _1214 = _1210 + _1212;
    float _1216 = sqrt(_1214);
    bool _1218 = _1216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = _1216 + _1220;
    float _1224 = _1194;
    float _1226 = _1222;
    float _1228 = _1186;
    float _1230 = _1170;
    float _1232 = _1206;
    if (_1218)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1224 = _1234;
    }
    float _1236 = _1224;
    if (_1218)
    {
        float _1238 = rsqrt(_1214);
        _1088 = _1238;
    }
    float _1240 = _1088;
    float _1242 = _1240;
    if (_1218)
    {
        float _1244 = _1222 * _1236;
        _1226 = _1244;
    }
    float _1246 = _1226;
    if (_1218)
    {
        float _1248 = _1246 * 0.15915493667125701904296875;
        _1090 = _1248;
    }
    float _1250 = _1090;
    float _1252 = _1202;
    if (_1218)
    {
        float _1254 = _1250 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        _1252 = _1256;
    }
    float _1258 = _1252;
    float _1260 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1262 = precise::max(0.0, _1260);
    float _1264 = _1198;
    float _1266 = _1260;
    float _1268 = _1262;
    if (_1218)
    {
        float _1270 = _1250 * 6.283185482025146484375;
        float _1272 = cos(_1270);
        _1264 = _1272;
    }
    float _1274 = _1264;
    float _1276 = -_1204;
    float _1278 = -_1262;
    float _1280 = fma(_1186, _1276, _1278);
    if (_1218)
    {
        float _1282 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1282;
    }
    float _1284 = _1266;
    float _1286 = _1258;
    float _1288 = _1284;
    if (_1218)
    {
        float _1290 = fma(_1258, _1284, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1228 = _1290;
    }
    float _1292 = _1228;
    if (!_1218)
    {
        _1286 = _1208;
    }
    float _1294 = _1286;
    float _1296 = _1294;
    if (_1218)
    {
        float _1298 = _1274 + (-1.0);
        _1288 = _1298;
    }
    float _1300 = _1288;
    float _1302 = _1300;
    if (_1218)
    {
        float _1304 = _1240 * _1292;
        _1230 = _1304;
    }
    float _1306 = _1230;
    if (!_1218)
    {
        _1242 = _1280;
    }
    float _1308 = _1242;
    float _1310 = sqrt(_1200);
    float _1312 = _1308;
    if (_1218)
    {
        float _1314 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1314;
    }
    float _1316 = _1268;
    float _1318 = _1316;
    if (_1218)
    {
        float _1320 = _1206 * _1306;
        _1232 = _1320;
    }
    float _1322 = _1232;
    if (!_1218)
    {
        _1302 = _1210;
    }
    float _1324 = _1302;
    float _1326 = _1324;
    if (_1218)
    {
        float _1328 = _1208 * _1306;
        _1296 = _1328;
    }
    float _1330 = _1296;
    if (_1218)
    {
        float _1332 = fma(_1280, _1274, _1316);
        _1312 = _1332;
    }
    float _1334 = _1312;
    if (_1218)
    {
        float _1336 = _1322 * _1322;
        _1326 = _1336;
    }
    float _1338 = _1326;
    if (!_1218)
    {
        _1318 = _1212;
    }
    float _1340 = _1318;
    float _1342 = _1340;
    if (_1218)
    {
        float _1344 = _1330 * _1330;
        _1342 = _1344;
    }
    float _1346 = _1342;
    float _1348 = fma(_1334, _1334, _1338);
    float _1350 = _1348 + _1346;
    float _1352 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1356 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1354);
    float _1358 = precise::clamp(_1356, 0.0, 1.0);
    float _1360 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1362 = rsqrt(_1350);
    float _1364 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1352);
    float _1366 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1368 = -_1358;
    float _1370 = _1368 + 1.0;
    float _1372 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1374 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1364);
    float _1376 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1366);
    float _1378 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1380 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1372);
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1384 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1376);
    float _1386 = abs(_1370);
    float _1388 = log2(_1386);
    float _1390 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1378);
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1394 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1380);
    float _1396 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1398 = _1362 * _1322;
    float _1400 = -_1392;
    float _1402 = fma(_1400, _1360, 1.0);
    float _1404 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1390);
    float _1406 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1410 = _1362 * _1334;
    float _1412 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1414 = _1362 * _1330;
    float _1416 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1408);
    float _1418 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1420 = -_1412;
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1420);
    float _1424 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1426 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1416);
    float _1428 = log2(_1402);
    float _1430 = -_1414;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1422);
    float _1434 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1426);
    float _1438 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1440 = fma(_1432, -0.5, 0.5);
    float _1442 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1434);
    float _1444 = fma(_1432, 0.5, 0.5);
    float _1446 = exp2(_1424);
    float _1448 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1438);
    float _1450 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1442);
    float _1452 = _1410 + 1.0;
    float _1454 = fma(_1444, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1456 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1448);
    float _1458 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1450);
    float _1460 = 1.0 / _1436;
    float _1462 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1456);
    float _1464 = fma(_1444, _1454, -0.212114393711090087890625);
    float _1466 = _1428 * 0.693147182464599609375;
    float _1468 = fma(_1444, _1464, 1.570728778839111328125);
    float _1470 = sqrt(_1440);
    float _1472 = -_1410;
    float _1474 = fma(_1446, _1452, _1472);
    float _1476 = fma(_1474, 0.5, 0.5);
    float _1478 = _1458 * _1460;
    float _1480 = _1462 * _1460;
    float _1482 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1484 = fma(_1478, 0.5, 0.5);
    float _1486 = fma(_1480, -0.5, 0.5);
    float _1488 = _1470 * 0.636619746685028076171875;
    float3 _3971 = float3(_1484, _1486, _1482);
    float _1490 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3971, float3(0.0), isnan(_3971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3971, float3(0.0), isnan(_3971)), level(0.0)).x;
    float3 _3982 = float3(_1484, _1486, _1482);
    float4 _1493 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3982, float3(0.0), isnan(_3982)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3982, float3(0.0), isnan(_3982)), level(0.0)).xyzw;
    float _1495 = _1493.x;
    float _1497 = _1493.y;
    float _1499 = _1493.z;
    float _1501 = _1493.w;
    float _1503 = -_1468;
    float _1505 = fma(_1488, _1503, 1.0);
    float2 _4004 = float2(_1505, _1476);
    float3 _1509 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4004, float2(0.0), isnan(_4004)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4004, float2(0.0), isnan(_4004)), level(0.0)).xyz;
    float _1511 = _1509.x;
    float _1513 = _1509.y;
    float _1515 = _1509.z;
    float _1517 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1519 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1521 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1519);
    float _1523 = exp2(_1517);
    float _1525 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1521);
    float _1527 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1525);
    float _1529 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1531 = _1527 + _1436;
    out.gl_Position.x = _1458;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _1527;
    out.gl_Position.w = _1436;
    float _1533 = _1531 * 0.5;
    float _1535 = -_1523;
    float _1537 = _1535 + 1.0;
    out.m_47.x = _1529;
    float _1539 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _1533;
    out.m_66.w = _1436;
    float _1541 = _1539 * _1490;
    float _1543 = -_1539;
    float _1545 = _1543 + 1.0;
    float _1547 = _1501 * _1541;
    float _1549 = _1515 * _1541;
    float _1551 = fma(_1511, _1547, _1495);
    float _1553 = fma(_1513, _1547, _1497);
    float _1555 = _1501 * _1545;
    float _1557 = fma(_1501, _1549, _1499);
    out.m_68.x = _1551;
    out.m_68.y = _1553;
    out.m_68.z = _1557;
    out.m_68.w = _1555;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1010 = false;
    bool _445 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_91)
    {
        float _99 = _95 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1613 = as_type<float>(_101);
        out.gl_Position.z = _1613;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_87);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1682 = as_type<float>(_139);
        out.gl_Position.z = _1682;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = in.m_54.x;
    float _145 = in.m_54.y;
    float _147 = in.m_54.z;
    int _149 = as_type<int>(_141) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_141) & 2;
    bool _155 = _153 != 0;
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _159 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _163 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _165 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    float _167 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _161);
    float _169 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _163);
    float _171 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _165);
    float _173 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _167);
    float _175 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _169);
    bool _177 = !_151;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_155;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_157;
    float _203;
    if (!_185)
    {
        float _187 = in.m_56.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_87);
        float _209 = 1.0 / _207;
        float _211 = _119 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _213 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _213 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _243 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _245 = isnan(_213);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _229;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _259 = 1.0 / _233;
    float _261 = 1.0 / _237;
    float _263 = _217 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _267 = _213 + _265;
    float _269 = 1.0 / _241;
    float _271 = _221 * _259;
    bool _273 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _275 = isnan(_213);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    bool _285 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_213);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _225 * _261;
    float _299 = -_253;
    float _301 = _299 + 1.0;
    float _303 = -_283;
    float _305 = _303 + 1.0;
    float _307 = _283 * _301;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = _267 * _269;
    float _315 = _295 * _305;
    bool _317 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_213);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_295;
    float _331 = _329 + 1.0;
    float _333 = fma(_311, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    bool _339 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_213);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = fma(_337, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _361 = _327 * _331;
    float _363 = -_327;
    float _365 = _363 + 1.0;
    float _367 = -_349;
    float _369 = _367 + 1.0;
    float _371 = fma(_357, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_353, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = _349 * _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = _359 * _375;
    float _387 = _333 * _375;
    float _389 = fma(_379, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _391 = fma(_383, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _395 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _405 = fma(_371, _361, _393);
    float _407 = fma(_373, _361, _395);
    float _409 = fma(_399, _313, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _411 = fma(_403, _313, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _413 = fma(_389, _315, _405);
    float _415 = fma(_391, _315, _407);
    float _417 = fma(_409, _307, _413);
    float _419 = fma(_411, _307, _415);
    float _421 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[147].x, _417);
    float _423 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[147].y, _419);
    bool _425 = !_257;
    float _443;
    if (!_425)
    {
        float _427 = in.m_56.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_87);
        float _449 = 1.0 / _447;
        float _451 = _119 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = in.m_56.x;
    float _457 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _461 = in.m_44.x;
    float _463 = in.m_44.y;
    float _465 = in.m_44.z;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _469 = _467 != 0;
    float _471 = in.m_56.y;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _475 = _473 != 0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _479 = _453 + _477;
    float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _483 = _457 * _455;
    bool _485 = _455 > 0.5;
    float _487 = _463 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _489 = _463 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _491;
    float _495 = trunc(_483);
    int _497 = int(_495);
    float _499 = _463 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _501 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].x, _487);
    float _503 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].x, _489);
    bool _505 = _471 > 0.5;
    float _507 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].x, _499);
    float _509 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].z, _501);
    float _511 = 1.0 / _493;
    float _513 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].z, _507);
    float _515 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].z, _503);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _517;
    float _521 = _515 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _523 = _509 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _525 = _497 << 4;
    int _527 = _525 + 1968;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _533;
    float _537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _539 = _521 + _537;
    uint _542 = uint(int(uint(_527) >> uint(2)));
    uint _544 = uint(int(uint(int(_542)) >> uint(2)));
    int _546 = int(_542) & 3;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[int(_544)][_546];
    int _550 = int(_542) + 1;
    uint _552 = uint(int(uint(_550) >> uint(2)));
    int _554 = _550 & 3;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[int(_552)][_554];
    float _558 = _513 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _562 = _523 + _560;
    float _564 = _539 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _566 = _479 * _511;
    bool _568 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _570 = isnan(_453);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _582 = _558 + _580;
    bool _584 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _586 = isnan(_453);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = fma(_519, _566, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    int _598 = _527 + 8;
    uint _600 = uint(int(uint(_598) >> uint(2)));
    uint _602 = uint(int(uint(int(_600)) >> uint(2)));
    int _604 = int(_600) & 3;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[int(_602)][_604];
    float _608 = -_578;
    float _610 = _608 + 1.0;
    float _612 = fma(_531, _566, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _614 = fma(_535, _566, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _616 = -_179;
    int _618 = _485 ? as_type<int>(_616) : as_type<int>(_179);
    float _620 = _594 * _610;
    float _622 = -_594;
    float _624 = _622 + 1.0;
    float _626 = -_183;
    int _628 = _505 ? as_type<int>(_626) : as_type<int>(_183);
    float _630 = _596 * _620;
    float _632 = _612 * _620;
    float _634 = _614 * _620;
    bool _636 = !_469;
    float _638 = _636 ? _179 : as_type<float>(_618);
    float _640 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].x, _630);
    float _642 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[28].x, _564);
    float _644 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].y, _632);
    bool _646 = !_475;
    float _648 = _646 ? _183 : as_type<float>(_628);
    float _650 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[107].z, _634);
    float _652 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[28].z, _642);
    float _654 = _638 + 0.5;
    float _656 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[108].x, _640);
    float _658 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[108].z, _650);
    float _660 = -_648;
    float _662 = _660 + 0.5;
    float _664 = _539 * _539;
    bool _666 = _652 >= 0.0;
    float _668 = _654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _670 = _662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _672 = fma(_562, _562, _664);
    float _674 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[108].y, _644);
    float _676 = _670 * _459;
    float _678 = fma(_582, _582, _672);
    float _680 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _684 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = rsqrt(_678);
    float _688 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    int _692 = as_type<int>(_684);
    if (_666)
    {
        _690 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _694 = _690;
    float _696 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _548 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _700 = _556 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _702 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = _668 * _481;
    float _706 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_666)
    {
        float _712 = _694 * 5.0;
        _692 = as_type<int>(_712);
    }
    int _714 = _692;
    float _716 = _606 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_58.x = _704;
    out.m_58.y = _676;
    float _718 = _539 * _686;
    float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _696;
    out.m_60.y = _702;
    out.m_60.z = _710;
    out.m_60.w = _682;
    float _722 = _562 * _686;
    out.m_62.x = _706;
    out.m_62.y = _708;
    out.m_62.z = _720;
    if (_666)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2684 = as_type<float>(_714);
        out.gl_Position.z = _2684;
    }
    if (_666)
    {
        out.m_47.x = 0.0;
    }
    if (_666)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _724 = -_718;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _521);
    float _728 = _582 * _686;
    float _730 = -_722;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _734 = -_718;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _539);
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _740 = _726 + _738;
    float _742 = -_728;
    float _744 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = _732 + _746;
    float _750 = -_722;
    float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _754 = _740 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _758 = _744 + _756;
    float _760 = _736 * _736;
    float _762 = in.m_64.x;
    float _764 = in.m_64.y;
    float _766 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[28].x, _754);
    float _768 = -_728;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _582);
    float _772 = fma(_752, _752, _760);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[28].z, _766);
    float _776 = fma(_770, _770, _772);
    bool _778 = _774 >= 0.0;
    float _780 = sqrt(_776);
    float _782 = _758;
    if (_778)
    {
        _782 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _784 = _782;
    int _786 = as_type<int>(_784);
    if (_778)
    {
        out.m_47.x = 0.0;
    }
    float _788 = _421 * _762;
    float _790 = _423 * _764;
    float _792 = _686 * _780;
    if (_778)
    {
        float _794 = _784 * 5.0;
        _786 = as_type<int>(_794);
    }
    int _796 = _786;
    if (_778)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2826 = as_type<float>(_796);
        out.gl_Position.z = _2826;
    }
    if (_778)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _800 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _806 = _798 * _792;
    float _808 = _800 * _792;
    float _810 = _792 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _812 = _810 * 0.5;
    float _814 = _802 * _806;
    float _816 = _804 * _808;
    float _818 = _814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _820 = _814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _822 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[24].x, _818);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[26].x, _820);
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _822);
    float _828 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _824);
    float _830 = _826 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _832 = _828 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _834 = _814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _836 = _523 + _830;
    float _838 = _558 + _832;
    float _840 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _834);
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _844 = _836 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _848 = _838 + _846;
    float _850 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _840);
    float _852 = _844 * _844;
    float _854 = _848 * _848;
    float _856 = _850 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _858 = _852 + _854;
    float _860 = _521 + _856;
    float _862 = sqrt(_858);
    bool _864 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _866 = _816;
    float _868 = _856;
    float _870 = _812;
    float _872 = _838;
    float _874 = _854;
    float _876 = _852;
    if (!_864)
    {
        _866 = _838;
    }
    float _878 = _866;
    float _880 = _878;
    if (!_864)
    {
        _868 = _852;
    }
    float _882 = _868;
    float _884 = _882;
    if (!_864)
    {
        _870 = _836;
    }
    float _886 = _870;
    float _888 = _886;
    if (!_864)
    {
        _872 = _860;
    }
    float _890 = _872;
    bool _892 = !_864;
    float _894 = _890;
    if (!_892)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _900 = _862 + _898;
        float _902 = rsqrt(_858);
        float _904 = _900 * _896;
        float _906 = _860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = _904 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = sin(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = fma(_912, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _920 = _902 * _918;
        float _922 = _916 + (-1.0);
        float _924 = fma(_844, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _926 = fma(_848, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _928 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _932 = _924 + _930;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _936 = _926 + _934;
        float _938 = fma(_860, _916, _928);
        float _940 = _932 * _932;
        float _942 = _936 * _936;
        _894 = _938;
        _884 = _940;
        _874 = _942;
        _888 = _924;
        _880 = _926;
    }
    float _944 = _894;
    float _946 = _884;
    float _948 = _874;
    float _950 = _888;
    float _952 = _880;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _956 = _944 + _954;
    float _958 = fma(_956, _956, _946);
    float _960 = _958 + _948;
    float _962 = sqrt(_960);
    bool _964 = _962 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _966 = isnan(_962);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _972 = _968 || _970;
    float _974 = _946;
    if (!_972)
    {
        _974 = 1.0;
    }
    float _976 = _974;
    bool _978 = !_972;
    float _980 = _976;
    if (!_978)
    {
        bool _982 = _962 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _984 = isnan(_962);
        bool _986 = _982 || _984;
        bool _988 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _990 = _986 || _988;
        if (!_990)
        {
            float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _994 = _962 + _992;
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _998 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _996;
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1002 = _1000 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1004 = 1.0 / _998;
            float _1006 = _994 * _1004;
            float _1008 = fma(_1006, _1002, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _980 = _1008;
            _1010 = true;
        }
        else
        {
            bool _1012 = _962 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1014 = isnan(_962);
            bool _1016 = _1012 || _1014;
            bool _1018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1020 = _1016 || _1018;
            if (!_1020)
            {
                float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1024 = _962 + _1022;
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1028 = _1026 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1032 = _1030 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1034 = 1.0 / _1028;
                float _1036 = _1024 * _1034;
                float _1038 = fma(_1036, _1032, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _980 = _1038;
                _1010 = true;
            }
            else
            {
                _980 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1010 = false;
    float _1040 = _980;
    float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1044 = _944 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1048 = _950 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1052 = _952 + _1050;
    float _1054 = fma(_1044, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1056 = fma(_1048, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1058 = fma(_1052, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1060 = -_521;
    float _1062 = _1060 + _1054;
    float _1064 = -_523;
    float _1066 = _1064 + _1056;
    float _1068 = -_558;
    float _1070 = _1068 + _1058;
    float _1072 = _1062 * _1062;
    float _1074 = fma(_1066, _1066, _1072);
    float _1076 = fma(_1070, _1070, _1074);
    float _1078 = sqrt(_1076);
    bool _1080 = _1078 > 0.0;
    float _1082 = _1078;
    float _1084 = _1048;
    float _1086 = _1052;
    float _1088 = _1054;
    float _1090 = _1066;
    if (!_1080)
    {
        _1082 = _1056;
    }
    float _1092 = _1082;
    float _1094 = _1092;
    if (!_1080)
    {
        _1084 = _1054;
    }
    float _1096 = _1084;
    float _1098 = _1096;
    float _1100 = _1096;
    if (!_1080)
    {
        _1086 = _1058;
    }
    float _1102 = _1086;
    bool _1104 = !_1080;
    float _1106 = _1102;
    if (!_1104)
    {
        float _1108 = _173 * _173;
        float _1110 = fma(_171, _171, _1108);
        float _1112 = fma(_175, _175, _1110);
        float _1114 = rsqrt(_1076);
        float _1116 = sqrt(_1112);
        float _1118 = _1066 * _1114;
        float _1120 = _1062 * _1114;
        float _1122 = _1070 * _1114;
        bool _1124 = _1116 > 0.0;
        float _1126 = _1114;
        float _1128 = _1116;
        _876 = _1120;
        if (!_1124)
        {
            _1126 = _1056;
        }
        float _1130 = _1126;
        _1094 = _1130;
        if (!_1124)
        {
            _1098 = _1054;
        }
        float _1132 = _1098;
        _1100 = _1132;
        if (!_1124)
        {
            _1128 = _1058;
        }
        float _1134 = _1128;
        bool _1136 = !_1124;
        _1106 = _1134;
        if (!_1136)
        {
            float _1138 = rsqrt(_1112);
            float _1140 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1142 = _173 * _1138;
            float _1144 = _171 * _1138;
            float _1146 = _1120 * _1142;
            float _1148 = _175 * _1138;
            float _1150 = fma(_1118, _1144, _1146);
            float _1152 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1154 = fma(_1122, _1148, _1150);
            float _1156 = _1154 * _1152;
            float _1158 = fma(_171, _1156, _1056);
            float _1160 = fma(_173, _1156, _1054);
            float _1162 = fma(_175, _1156, _1058);
            _1100 = _1160;
            _1094 = _1158;
            _1106 = _1162;
        }
    }
    float _1164 = _1100;
    float _1166 = _1094;
    float _1168 = _1106;
    float _1170 = _876;
    float _1172 = -_718;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1164);
    float _1176 = -_722;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1166);
    float _1180 = -_728;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1168);
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1186 = _1174 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1190 = _1178 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1194 = _1182 + _1192;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1190, _1190, _1196);
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = rsqrt(_1200);
    float _1204 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1206 = _1190 * _1204;
    float _1208 = _1194 * _1204;
    float _1210 = _1206 * _1206;
    float _1212 = _1208 * _1208;
    float _1214 = _1210 + _1212;
    float _1216 = sqrt(_1214);
    bool _1218 = _1216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = _1216 + _1220;
    float _1224 = _1194;
    float _1226 = _1222;
    float _1228 = _1186;
    float _1230 = _1170;
    float _1232 = _1206;
    if (_1218)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1224 = _1234;
    }
    float _1236 = _1224;
    if (_1218)
    {
        float _1238 = rsqrt(_1214);
        _1088 = _1238;
    }
    float _1240 = _1088;
    float _1242 = _1240;
    if (_1218)
    {
        float _1244 = _1222 * _1236;
        _1226 = _1244;
    }
    float _1246 = _1226;
    if (_1218)
    {
        float _1248 = _1246 * 0.15915493667125701904296875;
        _1090 = _1248;
    }
    float _1250 = _1090;
    float _1252 = _1202;
    if (_1218)
    {
        float _1254 = _1250 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        _1252 = _1256;
    }
    float _1258 = _1252;
    float _1260 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1262 = precise::max(0.0, _1260);
    float _1264 = _1198;
    float _1266 = _1260;
    float _1268 = _1262;
    if (_1218)
    {
        float _1270 = _1250 * 6.283185482025146484375;
        float _1272 = cos(_1270);
        _1264 = _1272;
    }
    float _1274 = _1264;
    float _1276 = -_1204;
    float _1278 = -_1262;
    float _1280 = fma(_1186, _1276, _1278);
    if (_1218)
    {
        float _1282 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1282;
    }
    float _1284 = _1266;
    float _1286 = _1258;
    float _1288 = _1284;
    if (_1218)
    {
        float _1290 = fma(_1258, _1284, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1228 = _1290;
    }
    float _1292 = _1228;
    if (!_1218)
    {
        _1286 = _1208;
    }
    float _1294 = _1286;
    float _1296 = _1294;
    if (_1218)
    {
        float _1298 = _1274 + (-1.0);
        _1288 = _1298;
    }
    float _1300 = _1288;
    float _1302 = _1300;
    if (_1218)
    {
        float _1304 = _1240 * _1292;
        _1230 = _1304;
    }
    float _1306 = _1230;
    if (!_1218)
    {
        _1242 = _1280;
    }
    float _1308 = _1242;
    float _1310 = sqrt(_1200);
    float _1312 = _1308;
    if (_1218)
    {
        float _1314 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1314;
    }
    float _1316 = _1268;
    float _1318 = _1316;
    if (_1218)
    {
        float _1320 = _1206 * _1306;
        _1232 = _1320;
    }
    float _1322 = _1232;
    if (!_1218)
    {
        _1302 = _1210;
    }
    float _1324 = _1302;
    float _1326 = _1324;
    if (_1218)
    {
        float _1328 = _1208 * _1306;
        _1296 = _1328;
    }
    float _1330 = _1296;
    if (_1218)
    {
        float _1332 = fma(_1280, _1274, _1316);
        _1312 = _1332;
    }
    float _1334 = _1312;
    if (_1218)
    {
        float _1336 = _1322 * _1322;
        _1326 = _1336;
    }
    float _1338 = _1326;
    if (!_1218)
    {
        _1318 = _1212;
    }
    float _1340 = _1318;
    float _1342 = _1340;
    if (_1218)
    {
        float _1344 = _1330 * _1330;
        _1342 = _1344;
    }
    float _1346 = _1342;
    float _1348 = fma(_1334, _1334, _1338);
    float _1350 = _1348 + _1346;
    float _1352 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1356 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1354);
    float _1358 = precise::clamp(_1356, 0.0, 1.0);
    float _1360 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1362 = rsqrt(_1350);
    float _1364 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1352);
    float _1366 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1368 = -_1358;
    float _1370 = _1368 + 1.0;
    float _1372 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1374 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1364);
    float _1376 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1366);
    float _1378 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1380 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1372);
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1384 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1376);
    float _1386 = abs(_1370);
    float _1388 = log2(_1386);
    float _1390 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1378);
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1394 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1380);
    float _1396 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1398 = _1362 * _1322;
    float _1400 = -_1392;
    float _1402 = fma(_1400, _1360, 1.0);
    float _1404 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1390);
    float _1406 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1410 = _1362 * _1334;
    float _1412 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1414 = _1362 * _1330;
    float _1416 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1408);
    float _1418 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1420 = -_1412;
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1420);
    float _1424 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1426 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1416);
    float _1428 = log2(_1402);
    float _1430 = -_1414;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1422);
    float _1434 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1436 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1426);
    float _1438 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1440 = fma(_1432, -0.5, 0.5);
    float _1442 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1434);
    float _1444 = fma(_1432, 0.5, 0.5);
    float _1446 = exp2(_1424);
    float _1448 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1438);
    float _1450 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1442);
    float _1452 = _1410 + 1.0;
    float _1454 = fma(_1444, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1456 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1448);
    float _1458 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1450);
    float _1460 = 1.0 / _1436;
    float _1462 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1456);
    float _1464 = fma(_1444, _1454, -0.212114393711090087890625);
    float _1466 = _1428 * 0.693147182464599609375;
    float _1468 = fma(_1444, _1464, 1.570728778839111328125);
    float _1470 = sqrt(_1440);
    float _1472 = -_1410;
    float _1474 = fma(_1446, _1452, _1472);
    float _1476 = fma(_1474, 0.5, 0.5);
    float _1478 = _1458 * _1460;
    float _1480 = _1462 * _1460;
    float _1482 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1484 = fma(_1478, 0.5, 0.5);
    float _1486 = fma(_1480, -0.5, 0.5);
    float _1488 = _1470 * 0.636619746685028076171875;
    float3 _3971 = float3(_1484, _1486, _1482);
    float _1490 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3971, float3(0.0), isnan(_3971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3971, float3(0.0), isnan(_3971)), level(0.0)).x;
    float3 _3982 = float3(_1484, _1486, _1482);
    float4 _1493 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3982, float3(0.0), isnan(_3982)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3982, float3(0.0), isnan(_3982)), level(0.0)).xyzw;
    float _1495 = _1493.x;
    float _1497 = _1493.y;
    float _1499 = _1493.z;
    float _1501 = _1493.w;
    float _1503 = -_1468;
    float _1505 = fma(_1488, _1503, 1.0);
    float2 _4004 = float2(_1505, _1476);
    float3 _1509 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4004, float2(0.0), isnan(_4004)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4004, float2(0.0), isnan(_4004)), level(0.0)).xyz;
    float _1511 = _1509.x;
    float _1513 = _1509.y;
    float _1515 = _1509.z;
    float _1517 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1519 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1521 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1519);
    float _1523 = exp2(_1517);
    float _1525 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1521);
    float _1527 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1525);
    float _1529 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1531 = _1527 + _1436;
    out.gl_Position.x = _1458;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _1527;
    out.gl_Position.w = _1436;
    float _1533 = _1531 * 0.5;
    float _1535 = -_1523;
    float _1537 = _1535 + 1.0;
    out.m_47.x = _1529;
    float _1539 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _1533;
    out.m_66.w = _1436;
    float _1541 = _1539 * _1490;
    float _1543 = -_1539;
    float _1545 = _1543 + 1.0;
    float _1547 = _1501 * _1541;
    float _1549 = _1515 * _1541;
    float _1551 = fma(_1511, _1547, _1495);
    float _1553 = fma(_1513, _1547, _1497);
    float _1555 = _1501 * _1545;
    float _1557 = fma(_1501, _1549, _1499);
    out.m_68.x = _1551;
    out.m_68.y = _1553;
    out.m_68.z = _1557;
    out.m_68.w = _1555;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

