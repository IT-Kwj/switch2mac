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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_70 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_52 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _637 = false;
    bool _403 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2293 = as_type<float>(_105);
        out.gl_Position.z = _2293;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2362 = as_type<float>(_143);
        out.gl_Position.z = _2362;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.x;
    float _149 = in.m_52.y;
    float _151 = in.m_52.z;
    int _153 = as_type<int>(_145) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_145) & 2;
    bool _159 = _157 != 0;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _169 = !_155;
    float _171 = _169 ? (-0.5) : 0.5;
    float _173 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _175 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _177 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _167);
    bool _179 = !_159;
    float _181 = _179 ? (-0.5) : 0.5;
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _173);
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _175);
    float _187 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _177);
    bool _189 = !_161;
    float _207;
    if (!_189)
    {
        float _191 = in.m_54.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_89);
        float _213 = 1.0 / _211;
        float _215 = _123 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = 1.0 / _233;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = 1.0 / _241;
    bool _249 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _251 = isnan(_217);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = 1.0 / _237;
    float _263 = _221 * _243;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = _225 * _247;
    bool _279 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_217);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_259;
    float _293 = _291 + 1.0;
    float _295 = _289 * _293;
    float _297 = -_289;
    float _299 = _297 + 1.0;
    float _301 = _229 * _261;
    float _303 = -_275;
    float _305 = _303 + 1.0;
    bool _307 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_217);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _327 = _259 * _305;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = fma(_321, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = _317 * _299;
    float _341 = fma(_331, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = fma(_325, _301, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = fma(_335, _301, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = -_317;
    float _349 = _347 + 1.0;
    float _351 = _337 * _339;
    float _353 = _341 * _339;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _355;
    float _359 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _361;
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _367 = fma(_357, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _369 = fma(_343, _295, _359);
    float _371 = fma(_363, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _373 = fma(_345, _295, _365);
    float _375 = fma(_367, _327, _369);
    float _377 = fma(_371, _327, _373);
    float _379 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[146].x, _375);
    float _381 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[146].y, _377);
    bool _383 = !_245;
    float _401;
    if (!_383)
    {
        float _385 = in.m_54.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _389 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_89);
        float _407 = 1.0 / _405;
        float _409 = _123 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_56.x;
    float _415 = in.m_56.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _419 = _411 + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _423 = _411 + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _433;
    bool _437 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _439 = isnan(_411);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = _411 + _449;
    float _453 = 1.0 / _427;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _457 = 1.0 / _431;
    float _459 = _381 * _415;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _461;
    float _465 = 1.0 / _435;
    float _467 = _451 * _453;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _473;
    float _477 = fma(_463, _467, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = fma(_471, _467, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _481 = fma(_475, _467, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _483 = _419 * _457;
    bool _485 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _487 = isnan(_411);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    bool _497 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _499 = isnan(_411);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _423 * _465;
    float _511 = -_447;
    float _513 = _511 + 1.0;
    float _515 = -_507;
    float _517 = _515 + 1.0;
    float _519 = _495 * _513;
    bool _521 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _523 = isnan(_411);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -_495;
    float _535 = _533 + 1.0;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _541 = _531 * _517;
    float _543 = _507 * _535;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _549 = -_531;
    float _551 = _549 + 1.0;
    float _553 = _477 * _541;
    float _555 = _479 * _541;
    float _557 = _481 * _541;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _563 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].x, _553);
    float _565 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].y, _555);
    float _567 = fma(_539, _483, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = fma(_547, _483, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _575;
    float _579 = fma(_561, _483, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _581 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].z, _557);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _583;
    float _587 = fma(_567, _543, _563);
    float _589 = fma(_573, _509, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _591 = fma(_577, _509, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _593 = fma(_569, _543, _565);
    float _595 = fma(_585, _509, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _597 = fma(_579, _543, _581);
    float _599 = fma(_589, _519, _587);
    float _601 = fma(_591, _519, _593);
    float _603 = _379 * _413;
    float _605 = fma(_595, _519, _597);
    float _607 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[110].x, _599);
    float _609 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[110].y, _601);
    float _611 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[110].z, _605);
    bool _613 = !_455;
    float _615 = _519;
    float _617 = _605;
    float _635;
    if (!_613)
    {
        float _619 = in.m_54.x;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _623 = _619 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _635 = _633;
        _637 = true;
    }
    else
    {
        float _639 = float(_89);
        float _641 = 1.0 / _639;
        float _643 = _123 * _641;
        _635 = _643;
    }
    _637 = false;
    float _645 = _635;
    float _647 = in.m_54.z;
    float _649 = in.m_54.w;
    float _651 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _655 = _653 != 0;
    float _657 = in.m_54.x;
    float _659 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _663 = _661 != 0;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _671 = _669 != 0;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _677 = _581;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_655)
    {
        float _683 = in.m_54.y;
        _677 = _683;
    }
    float _685 = _677;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_655)
    {
        float _691 = in.m_54.z;
        _679 = _691;
    }
    float _693 = _679;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _697 = _647 * 2.0;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _701 = _693;
    if (_655)
    {
        _681 = _657;
    }
    float _703 = _681;
    float _705 = floor(_697);
    float _707 = _703;
    if (!_655)
    {
        _707 = _647;
    }
    float _709 = _707;
    float _711 = _709 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _713 = _657 * 2.0;
    if (!_655)
    {
        _615 = _685;
    }
    float _715 = _615;
    float _717 = -_673;
    float _719 = fma(_711, 2.0, _717);
    float _721 = _715;
    if (!_655)
    {
        _617 = _715;
    }
    float _723 = _617;
    float _725 = -_123;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[86].x, _719);
    bool _729 = _705 > 0.0;
    bool _731 = _705 >= 0.0;
    bool _733 = isnan(_705);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _723;
    float _743 = _685;
    if (_655)
    {
        float _745 = in.m_54.x;
        float _747 = in.m_54.y;
        _741 = _745;
        _743 = _747;
    }
    float _749 = _741;
    float _751 = _743;
    float _753 = floor(_713);
    int _755 = _739 ? 0 : 1;
    int _757 = ~_755;
    int _759 = _757 + 1;
    int _761 = _759 + 1;
    int _763 = _761;
    if (!_729)
    {
        int _765 = ~_755;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = float(_769);
    bool _773 = _753 > 0.0;
    bool _775 = _753 >= 0.0;
    bool _777 = isnan(_753);
    bool _779 = _775 || _777;
    bool _781 = isnan(0.0);
    bool _783 = _779 || _781;
    float _785 = _749 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _787 = _785;
    if (_655)
    {
        _721 = _751;
    }
    float _789 = _721;
    float _791 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[83].z, _687);
    float _793 = _751 * 2.0;
    float _795 = -_675;
    float _797 = fma(_785, 2.0, _795);
    float _799 = _793;
    if (!_655)
    {
        _787 = _693;
    }
    float _801 = _787;
    float _803 = _751 + _657;
    float _805 = _801;
    if (_655)
    {
        _701 = _789;
    }
    float _807 = _701;
    float _809 = floor(_793);
    if (_655)
    {
        _805 = _789;
    }
    float _811 = _805;
    float _813 = _803 + (-1.0);
    float _815 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _791);
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[83].w, _689);
    bool _819 = !_663;
    int _821 = _819 ? 0 : 1;
    float _823 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _825 = _811 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _827 = -_123;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[81].x, _797);
    if (_655)
    {
        _799 = _789;
    }
    float _831 = _799;
    float _833 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _835 = log2(_833);
    int _837 = abs(_821);
    float _839 = fma(_825, -2.0, _695);
    float _841 = in.m_58.x;
    float _843 = in.m_58.y;
    float _845 = in.m_58.z;
    float _847 = _831;
    if (!_655)
    {
        _847 = _657;
    }
    float _849 = _847;
    float _851 = float(_837);
    bool _853 = _809 > 0.0;
    bool _855 = _809 >= 0.0;
    bool _857 = isnan(_809);
    bool _859 = _855 || _857;
    bool _861 = isnan(0.0);
    bool _863 = _859 || _861;
    float _865 = _851 * _771;
    float _867 = _849 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _869 = _783 ? 0 : 1;
    float _871 = _865 * (-2.0);
    float _873 = _835 * _123;
    float _875 = fma(_867, -2.0, _699);
    int _877 = ~_869;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = fma(_823, _871, _823);
    int _885 = _881;
    if (!_773)
    {
        int _887 = ~_869;
        int _889 = _887 + 1;
        _885 = _889;
    }
    int _891 = _885;
    float _893 = exp2(_873);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _897 = 1.0 + _895;
    int _899 = _863 ? 0 : 1;
    float _901 = fma(_871, _841, _841);
    float _903 = _657 + (-0.5);
    int _905 = ~_899;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = 1.0 / _897;
    int _913 = _909;
    if (!_853)
    {
        int _915 = ~_899;
        int _917 = _915 + 1;
        _913 = _917;
    }
    int _919 = _913;
    float _921 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[196].x, _901);
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _925 = !_667;
    int _927 = _925 ? 0 : 1;
    float _929 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[88].w, _923);
    float _931 = -_893;
    float _933 = _931 + 1.0;
    bool _935 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _943 = _939 || _941;
    float _945 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _875);
    bool _947 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(1.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _959 = abs(_927);
    float _961 = _943 ? _933 : 0.0;
    float _963 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _929);
    bool _965 = !_671;
    int _967 = _965 ? 0 : 1;
    float _969 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[88].z, _957);
    float _971 = float(_959);
    float _973 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _817);
    float _975 = float(_891);
    float _977 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _969);
    int _979 = abs(_967);
    float _981 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _839);
    if (_955)
    {
        float _983 = _961 * _911;
        _127 = _983;
    }
    float _985 = _127;
    float _987 = _971 * _975;
    float _989 = _647 + _751;
    float _991 = fma(_883, _985, _921);
    float _993 = _989 + (-1.0);
    float _995 = float(_979);
    float _997 = _987 * (-2.0);
    float _999 = float(_919);
    float _1001 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1003 = _647 + _657;
    float _1005 = _991 * 0.15915493667125701904296875;
    float _1007 = fma(_997, _843, _843);
    float _1009 = _995 * _999;
    float _1011 = fma(_1001, _997, _1001);
    float _1013 = _1003 + (-1.0);
    float _1015 = _1009 * (-2.0);
    float _1017 = _751 + (-0.5);
    float _1019 = _1005 * 6.283185482025146484375;
    float _1021 = sin(_1019);
    float _1023 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1025 = fma(_1015, _845, _845);
    float _1027 = _647 + (-0.5);
    float _1029 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1007);
    float _1031 = fma(_1023, _1015, _1023);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _1035 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1025);
    float _1037 = fma(_1011, _985, _1029);
    float _1039 = _1005 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = fma(_1031, _985, _1035);
    float _1045 = _1037 * 0.15915493667125701904296875;
    float _1047 = _651 * _1033;
    float _1049 = _1043 * 0.15915493667125701904296875;
    float _1051 = in.m_42.x;
    float _1053 = in.m_42.y;
    float _1055 = in.m_42.z;
    float _1057 = _1045 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1063 = _1045 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1049 * 6.283185482025146484375;
    float _1069 = cos(_1067);
    float _1071 = _659 * _1061;
    float _1073 = _1041 * _1059;
    float _1075 = _1021 * _1059;
    float _1077 = _1049 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1021 * _1065;
    float _1083 = _1041 * _1065;
    float _1085 = _1065 * _1069;
    float _1087 = _1069 * _1071;
    float _1089 = _1041 * _1087;
    float _1091 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1093 = _1021 * _1087;
    float _1095 = -_1073;
    float _1097 = fma(_1079, _1081, _1095);
    float _1099 = -_1081;
    float _1101 = fma(_1079, _1073, _1099);
    float _1103 = _1059 * _1069;
    float _1105 = fma(_1079, _1083, _1075);
    float _1107 = -_1071;
    float _1109 = _1079 * _1107;
    float _1111 = fma(_1079, _1075, _1083);
    float _1113 = fma(_1097, _1047, _1093);
    float _1115 = fma(_1105, _1047, _1089);
    float _1117 = fma(_1085, _1047, _1109);
    float _1119 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1121 = fma(_1111, _1091, _1113);
    float _1123 = fma(_1101, _1091, _1115);
    float _1125 = fma(_1103, _1091, _1117);
    float _1127 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1129 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1119);
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1133 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1135 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1127);
    float _1137 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1129);
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1131);
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1133);
    float _1143 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1135);
    float _1145 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1147 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1139);
    float _1149 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1153 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1155 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1159 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1153);
    float _1161 = _1145 + _1155;
    float _1163 = _1151 + _1157;
    float _1165 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1167 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1159);
    float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1171 = _1161 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1175 = _1163 + _1173;
    float _1177 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1165);
    float _1179 = _1167 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1181 = _1171 * _1171;
    float _1183 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1177);
    float _1185 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1187 = fma(_1175, _1175, _1181);
    float _1189 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1191 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1185);
    float _1193 = sqrt(_1187);
    float _1195 = _1179 + _1189;
    float _1197 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1191);
    bool _1199 = _1193 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = _1189;
    float _1203 = _1185;
    float _1205 = _1191;
    float _1207 = _1145;
    float _1209 = _1087;
    if (!_1199)
    {
        _1201 = _1163;
    }
    float _1211 = _1201;
    float _1213 = _1211;
    if (!_1199)
    {
        _1203 = _1161;
    }
    float _1215 = _1203;
    float _1217 = _1215;
    if (!_1199)
    {
        _1205 = _1195;
    }
    float _1219 = _1205;
    bool _1221 = !_1199;
    float _1223 = _1219;
    if (!_1221)
    {
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1229 = _1193 + _1227;
        float _1231 = rsqrt(_1187);
        float _1233 = _1229 * _1225;
        float _1235 = _1195 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = _1233 * 0.15915493667125701904296875;
        float _1239 = _1237 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1237 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = fma(_1241, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1249 = _1231 * _1247;
        float _1251 = _1245 + (-1.0);
        float _1253 = fma(_1175, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1255 = fma(_1171, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1257 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = fma(_1195, _1245, _1257);
        _1223 = _1259;
        _1213 = _1253;
        _1217 = _1255;
    }
    float _1261 = _1223;
    float _1263 = _1213;
    float _1265 = _1217;
    float _1267 = -_1179;
    float _1269 = _1267 + _1261;
    float _1271 = -_1151;
    float _1273 = _1271 + _1263;
    float _1275 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1277 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1279 = _1269 * _1269;
    float _1281 = -_1145;
    float _1283 = _1281 + _1265;
    float _1285 = 1.0 / _1275;
    float _1287 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1277);
    float _1289 = fma(_1273, _1273, _1279);
    bool _1291 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1293 = isnan(0.5);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1299 = _1295 || _1297;
    float _1301 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1287);
    float _1303 = fma(_1283, _1283, _1289);
    float _1305 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1307 = sqrt(_1303);
    float _1309 = _1305 + _1275;
    float _1311 = _1309 * _1285;
    float _1313 = _1311 * 0.5;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1317 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1315);
    float _1319 = _1313;
    float _1321 = _1277;
    float _1323 = _1273;
    float _1325 = _1265;
    float _1327 = _1317;
    if (_1299)
    {
        _1319 = 1.0;
    }
    float _1329 = _1319;
    float _1331 = 1.0 / _1317;
    bool _1333 = _1307 > 0.0;
    float _1335 = _1307;
    float _1337 = _1329;
    if (!_1333)
    {
        _1207 = _1263;
    }
    float _1339 = _1207;
    float _1341 = _1339;
    if (!_1333)
    {
        _1335 = _1261;
    }
    float _1343 = _1335;
    bool _1345 = !_1333;
    float _1347 = _1343;
    if (!_1345)
    {
        float _1349 = _185 * _185;
        float _1351 = fma(_183, _183, _1349);
        float _1353 = fma(_187, _187, _1351);
        float _1355 = rsqrt(_1303);
        float _1357 = sqrt(_1353);
        float _1359 = _1273 * _1355;
        float _1361 = _1269 * _1355;
        float _1363 = _1283 * _1355;
        bool _1365 = _1357 > 0.0;
        float _1367 = _1355;
        float _1369 = _1357;
        _1323 = _1361;
        _1327 = _1353;
        if (!_1365)
        {
            _1367 = _1263;
        }
        float _1371 = _1367;
        _1341 = _1371;
        if (!_1365)
        {
            _1369 = _1261;
        }
        float _1373 = _1369;
        bool _1375 = !_1365;
        _1347 = _1373;
        if (!_1375)
        {
            float _1377 = rsqrt(_1353);
            float _1379 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1381 = _185 * _1377;
            float _1383 = _183 * _1377;
            float _1385 = _187 * _1377;
            float _1387 = _1361 * _1381;
            float _1389 = fma(_1359, _1383, _1387);
            float _1391 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1393 = fma(_1363, _1385, _1389);
            float _1395 = _1393 * _1391;
            float _1397 = fma(_183, _1395, _1263);
            float _1399 = fma(_185, _1395, _1261);
            float _1401 = fma(_187, _1395, _1265);
            _1321 = _1381;
            _1323 = _1395;
            _1347 = _1399;
            _1341 = _1397;
            _1325 = _1401;
        }
    }
    float _1403 = _1321;
    float _1405 = _1323;
    float _1407 = _1347;
    float _1409 = _1341;
    float _1411 = _1325;
    float _1413 = _1327;
    float _1415 = _1403;
    float _1417 = _1405;
    float _1419 = _1413;
    if (_1299)
    {
        _1415 = 1.0;
    }
    float _1421 = _1415;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1425 = _1331 * _1423;
    float _1427 = _1421;
    if (!_1299)
    {
        float _1429 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1431 = _1429 * 0.15915493667125701904296875;
        float _1433 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1435;
        float _1439 = _1431 * 6.283185482025146484375;
        float _1441 = cos(_1439);
        float _1443 = _1433 * 0.15915493667125701904296875;
        float _1445 = _1431 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = 1.0 / _1441;
        float _1451 = _1443 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        float _1455 = _1447 * _1449;
        float _1457 = _1443 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = _1453 * _1455;
        float _1463 = 1.0 / _1437;
        float _1465 = 1.0 / _1461;
        float _1467 = _1459 * _1465;
        float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1471 = fma(_1425, _1467, _1469);
        float _1473 = _1471 * _1463;
        float _1475 = precise::clamp(_1473, 0.0, 1.0);
        _1417 = _1431;
        _1419 = _1437;
        _1337 = _1475;
    }
    float _1477 = _1417;
    float _1479 = _1419;
    float _1481 = _1337;
    float _1483 = _1477;
    float _1485 = _1479;
    if (!_1299)
    {
        float _1487 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1489 = _1487 * 0.15915493667125701904296875;
        float _1491 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1493 = _1489 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = _1491 * 0.15915493667125701904296875;
        float _1499 = _1489 * 6.283185482025146484375;
        float _1501 = sin(_1499);
        float _1503 = 1.0 / _1495;
        float _1505 = _1497 * 6.283185482025146484375;
        float _1507 = cos(_1505);
        float _1509 = _1501 * _1503;
        float _1511 = _1497 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = _1507 * _1509;
        float _1517 = 1.0 / _1515;
        float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1521 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1519;
        float _1523 = 1.0 / _1521;
        float _1525 = _1513 * _1517;
        float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1529 = fma(_1425, _1525, _1527);
        float _1531 = _1529 * _1523;
        float _1533 = precise::clamp(_1531, 0.0, 1.0);
        float _1535 = -_1533;
        float _1537 = _1535 + 1.0;
        _1483 = _1503;
        _1485 = _1517;
        _1427 = _1537;
    }
    float _1539 = _1483;
    float _1541 = _1485;
    float _1543 = _1427;
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1407 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1551 = _1409 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1555 = _1411 + _1553;
    float _1557 = _1547 * _1547;
    float _1559 = fma(_1551, _1551, _1557);
    float _1561 = fma(_1555, _1555, _1559);
    float _1563 = rsqrt(_1561);
    float _1565 = sqrt(_1561);
    float _1567 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1569 = _1551 * _1567;
    float _1571 = _1555 * _1567;
    float _1573 = _1569 * _1569;
    float _1575 = _1571 * _1571;
    float _1577 = _1573 + _1575;
    float _1579 = sqrt(_1577);
    bool _1581 = _1579 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1585 = _1579 + _1583;
    float _1587 = _1555;
    float _1589 = _1559;
    float _1591 = _1585;
    float _1593 = _1539;
    float _1595 = _1547;
    if (_1581)
    {
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1587 = _1597;
    }
    float _1599 = _1587;
    if (_1581)
    {
        float _1601 = rsqrt(_1577);
        _1589 = _1601;
    }
    float _1603 = _1589;
    float _1605 = _1603;
    if (_1581)
    {
        float _1607 = _1585 * _1599;
        _1591 = _1607;
    }
    float _1609 = _1591;
    if (_1581)
    {
        float _1611 = _1609 * 0.15915493667125701904296875;
        _1593 = _1611;
    }
    float _1613 = _1593;
    float _1615 = _1563;
    if (_1581)
    {
        float _1617 = _1613 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        _1615 = _1619;
    }
    float _1621 = _1615;
    float _1623 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1625 = precise::max(0.0, _1623);
    float _1627 = _1541;
    float _1629 = _1625;
    float _1631 = _1623;
    if (_1581)
    {
        float _1633 = _1613 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        _1627 = _1635;
    }
    float _1637 = _1627;
    float _1639 = -_1567;
    float _1641 = -_1625;
    float _1643 = fma(_1547, _1639, _1641);
    if (!_1581)
    {
        _1629 = _1571;
    }
    float _1645 = _1629;
    float _1647 = _1645;
    if (_1581)
    {
        float _1649 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1631 = _1649;
    }
    float _1651 = _1631;
    float _1653 = _1621;
    float _1655 = _1651;
    if (_1581)
    {
        float _1657 = fma(_1621, _1651, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1653 = _1657;
    }
    float _1659 = _1653;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1663 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1661);
    float _1665 = precise::clamp(_1663, 0.0, 1.0);
    float _1667 = _1659;
    if (_1581)
    {
        float _1669 = _1637 + (-1.0);
        _1655 = _1669;
    }
    float _1671 = _1655;
    float _1673 = _1671;
    if (_1581)
    {
        float _1675 = _1603 * _1659;
        _1209 = _1675;
    }
    float _1677 = _1209;
    if (!_1581)
    {
        _1605 = _1569;
    }
    float _1679 = _1605;
    float _1681 = _1679;
    if (_1581)
    {
        float _1683 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1683;
    }
    float _1685 = _1595;
    float _1687 = _1685;
    if (_1581)
    {
        float _1689 = _1569 * _1677;
        _1681 = _1689;
    }
    float _1691 = _1681;
    if (!_1581)
    {
        _1667 = _1643;
    }
    float _1693 = _1667;
    float _1695 = _1693;
    if (_1581)
    {
        float _1697 = _1571 * _1677;
        _1647 = _1697;
    }
    float _1699 = _1647;
    if (!_1581)
    {
        _1673 = _1573;
    }
    float _1701 = _1673;
    float _1703 = _1701;
    if (_1581)
    {
        float _1705 = fma(_1643, _1637, _1685);
        _1695 = _1705;
    }
    float _1707 = _1695;
    if (_1581)
    {
        float _1709 = _1691 * _1691;
        _1703 = _1709;
    }
    float _1711 = _1703;
    if (!_1581)
    {
        _1687 = _1575;
    }
    float _1713 = _1687;
    float _1715 = _1713;
    if (_1581)
    {
        float _1717 = _1699 * _1699;
        _1715 = _1717;
    }
    float _1719 = _1715;
    float _1721 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1723 = fma(_1707, _1707, _1711);
    float _1725 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1727 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1729 = -_1665;
    float _1731 = _1729 + 1.0;
    float _1733 = _1723 + _1719;
    float _1735 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1725);
    float _1737 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1739 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1727);
    float _1741 = rsqrt(_1733);
    float _1743 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1735);
    float _1745 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1737);
    float _1747 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1749 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1739);
    float _1751 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1753 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1745);
    float _1755 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1747);
    float _1757 = abs(_1731);
    float _1759 = log2(_1757);
    float _1761 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1763 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1765 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1767 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1755);
    float _1769 = -_1761;
    float _1771 = fma(_1769, _1721, 1.0);
    float _1773 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1775 = _1741 * _1691;
    float _1777 = _1741 * _1707;
    float _1779 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1773);
    float _1781 = _1741 * _1699;
    float _1783 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1785 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1787 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1779);
    float _1789 = log2(_1771);
    float _1791 = -_1783;
    float _1793 = fma(_1777, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1791);
    float _1795 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1797 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1787);
    float _1799 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1801 = -_1781;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1793);
    float _1805 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1807 = 1.0 / _1797;
    float _1809 = fma(_1803, -0.5, 0.5);
    float _1811 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1799);
    float _1813 = fma(_1803, 0.5, 0.5);
    float _1815 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1805);
    float _1817 = _1777 + 1.0;
    float _1819 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1811);
    float _1821 = fma(_1813, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1823 = exp2(_1795);
    float _1825 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1815);
    float _1827 = _1789 * 0.693147182464599609375;
    float _1829 = fma(_1813, _1821, -0.212114393711090087890625);
    float _1831 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1833 = fma(_1813, _1829, 1.570728778839111328125);
    float _1835 = sqrt(_1809);
    float _1837 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1819);
    float _1839 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1825);
    float _1841 = _1837 * _1807;
    float _1843 = _1839 * _1807;
    float _1845 = -_1777;
    float _1847 = fma(_1823, _1817, _1845);
    float _1849 = fma(_1841, 0.5, 0.5);
    float _1851 = fma(_1843, -0.5, 0.5);
    float _1853 = fma(_1847, 0.5, 0.5);
    float _1855 = _1835 * 0.636619746685028076171875;
    float3 _5061 = float3(_1849, _1851, _1831);
    float _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5061, float3(0.0), isnan(_5061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5061, float3(0.0), isnan(_5061)), level(0.0)).x;
    float3 _5072 = float3(_1849, _1851, _1831);
    float4 _1860 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5072, float3(0.0), isnan(_5072)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5072, float3(0.0), isnan(_5072)), level(0.0)).xyzw;
    float _1862 = _1860.x;
    float _1864 = _1860.y;
    float _1866 = _1860.z;
    float _1868 = _1860.w;
    float _1870 = -_1833;
    float _1872 = fma(_1855, _1870, 1.0);
    float2 _5094 = float2(_1872, _1853);
    float3 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5094, float2(0.0), isnan(_5094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5094, float2(0.0), isnan(_5094)), level(0.0)).xyz;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1886 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1888 = _649 > 0.5;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1898 = _647 > 0.5;
    float _1900 = 1.0 / _1892;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1902;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1910 = -_181;
    int _1912 = _1888 ? as_type<int>(_1910) : as_type<int>(_181);
    float _1914 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1886);
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1918 = _1916 != 0;
    float _1920 = -_815;
    float _1922 = _1920 + 1.0;
    float _1924 = 1.0 / _1896;
    bool _1926 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1928 = isnan(_645);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1934 = _1930 || _1932;
    float _1936 = float(_1934);
    float _1938 = -_973;
    float _1940 = _1938 + 1.0;
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1944 = _1942 != 0;
    float _1946 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1914);
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1950 = _1948 != 0;
    float _1952 = -_977;
    float _1954 = _1952 + 1.0;
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1958 = _1956 != 0;
    float _1960 = _1908 * _1900;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1964 = _645 + _1962;
    bool _1966 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1968 = isnan(_645);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = -_963;
    float _1980 = _1978 + 1.0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1984 = _1982 != 0;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1988 = _1986 != 0;
    float _1990 = _1904 * _1924;
    float _1992 = -_1936;
    float _1994 = _1992 + 1.0;
    bool _1996 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1998 = isnan(_645);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2010 = _645 + _2008;
    float _2012 = fma(_1990, _1964, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2014 = _1976 * _1994;
    float _2016 = -_2006;
    float _2018 = _2016 + 1.0;
    float _2020 = fma(_1960, _2010, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2022 = -_171;
    int _2024 = _1898 ? as_type<int>(_2022) : as_type<int>(_171);
    float _2026 = _2012 * _2014;
    float _2028 = -_1976;
    float _2030 = _2028 + 1.0;
    float _2032 = _1936 * _2018;
    bool _2034 = !_1950;
    float _2036 = _2034 ? _171 : as_type<float>(_2024);
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2040 = _657 > 0.5;
    float _2042 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2026);
    float _2044 = fma(_2020, _2032, _2042);
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2050 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2044);
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2054 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2058 = _2048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2060 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2062 = -_181;
    int _2064 = _1898 ? as_type<int>(_2062) : as_type<int>(_181);
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2068 = _751 > 0.5;
    float _2070 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_60.x = _2054;
    out.m_60.y = _2058;
    out.m_60.z = _2060;
    out.m_60.w = _2056;
    float _2072 = -_171;
    int _2074 = _2040 ? as_type<int>(_2072) : as_type<int>(_171);
    float _2076 = -_171;
    int _2078 = _2068 ? as_type<int>(_2076) : as_type<int>(_171);
    float _2080 = -_181;
    int _2082 = _2068 ? as_type<int>(_2080) : as_type<int>(_181);
    float _2084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2086 = !_1918;
    float _2088 = _2086 ? _181 : as_type<float>(_1912);
    bool _2090 = !_1984;
    float _2092 = _2090 ? _171 : as_type<float>(_2074);
    bool _2094 = !_1944;
    float _2096 = _2094 ? _171 : as_type<float>(_2078);
    float _2098 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2100 = !_1958;
    float _2102 = _2100 ? _181 : as_type<float>(_2064);
    float _2104 = _607 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2106 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2108 = _611 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2110 = _2050 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2112 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2114 = _2106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2116 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2118 = !_1988;
    float _2120 = _2118 ? _181 : as_type<float>(_2082);
    float _2122 = _2036 + 0.5;
    float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2126 = _2092 + 0.5;
    out.m_62.x = _2112;
    out.m_62.y = _2114;
    out.m_62.z = _2116;
    out.m_62.w = _2110;
    float _2128 = fma(_2098, _2122, _829);
    float _2130 = _2088 + (-0.5);
    float _2132 = -_2120;
    float _2134 = _2132 + 0.5;
    float _2136 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2138 = _1481 > 0.0;
    bool _2140 = isnan(_1481);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2150 = -_2070;
    float _2152 = -_981;
    float _2154 = fma(_2150, _2130, _2152);
    float _2156 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2158 = _2136 * _2084;
    float _2160 = -_1922;
    float _2162 = fma(_2036, _2160, _2128);
    float _2164 = fma(_2088, _1940, _2154);
    bool _2166 = _1543 <= 0.0;
    bool _2168 = !_2146;
    bool _2170 = _2166 || _2168;
    float _2172 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2174 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2176 = _2096 + 0.5;
    float _2178 = _2102 + (-0.5);
    float _2180 = _2156 * _2124;
    float _2182 = exp2(_2172);
    float _2184 = fma(_2174, _2176, _727);
    float _2186 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2188 = _1481 * _1543;
    out.m_64.x = _2158;
    out.m_64.y = _2180;
    out.m_64.z = _2162;
    out.m_64.w = _2164;
    float _2190 = -_1954;
    float _2192 = fma(_2096, _2190, _2184);
    float _2194 = -_2186;
    float _2196 = -_945;
    float _2198 = fma(_2194, _2178, _2196);
    float _2200 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2202 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1946);
    float _2204 = fma(_2102, _1980, _2198);
    float _2206 = _2200 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2208 = _2202 + _1797;
    out.m_66.x = _2192;
    out.m_66.y = _2204;
    float _2210 = -_2182;
    float _2212 = _2210 + 1.0;
    float _2214 = _2208 * 0.5;
    out.m_45.x = _2206;
    float _2216 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1837;
    out.gl_Position.y = _1839;
    out.gl_Position.z = _2202;
    out.gl_Position.w = _1797;
    float _2218 = -_2216;
    float _2220 = _2218 + 1.0;
    out.m_68.z = _2214;
    out.m_68.w = _1797;
    float _2222 = _2216 * _1857;
    float _2224 = _1868 * _2220;
    float _2226 = _1868 * _2222;
    float _2228 = _1882 * _2222;
    float _2230 = fma(_1878, _2226, _1862);
    float _2232 = fma(_1880, _2226, _1864);
    float _2234 = fma(_1868, _2228, _1866);
    out.m_70.x = _2230;
    out.m_70.y = _2232;
    out.m_70.z = _2234;
    out.m_70.w = _2224;
    if (!_2170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2236 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2236;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _637 = false;
    bool _403 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2293 = as_type<float>(_105);
        out.gl_Position.z = _2293;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2362 = as_type<float>(_143);
        out.gl_Position.z = _2362;
    }
    if (_137)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.x;
    float _149 = in.m_52.y;
    float _151 = in.m_52.z;
    int _153 = as_type<int>(_145) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_145) & 2;
    bool _159 = _157 != 0;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _169 = !_155;
    float _171 = _169 ? (-0.5) : 0.5;
    float _173 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _175 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _177 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _167);
    bool _179 = !_159;
    float _181 = _179 ? (-0.5) : 0.5;
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _173);
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _175);
    float _187 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _177);
    bool _189 = !_161;
    float _207;
    if (!_189)
    {
        float _191 = in.m_54.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_89);
        float _213 = 1.0 / _211;
        float _215 = _123 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = 1.0 / _233;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = 1.0 / _241;
    bool _249 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _251 = isnan(_217);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = 1.0 / _237;
    float _263 = _221 * _243;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = _225 * _247;
    bool _279 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_217);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_259;
    float _293 = _291 + 1.0;
    float _295 = _289 * _293;
    float _297 = -_289;
    float _299 = _297 + 1.0;
    float _301 = _229 * _261;
    float _303 = -_275;
    float _305 = _303 + 1.0;
    bool _307 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_217);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _327 = _259 * _305;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = fma(_321, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = _317 * _299;
    float _341 = fma(_331, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = fma(_325, _301, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = fma(_335, _301, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = -_317;
    float _349 = _347 + 1.0;
    float _351 = _337 * _339;
    float _353 = _341 * _339;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _355;
    float _359 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _361;
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _367 = fma(_357, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _369 = fma(_343, _295, _359);
    float _371 = fma(_363, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _373 = fma(_345, _295, _365);
    float _375 = fma(_367, _327, _369);
    float _377 = fma(_371, _327, _373);
    float _379 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[146].x, _375);
    float _381 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[146].y, _377);
    bool _383 = !_245;
    float _401;
    if (!_383)
    {
        float _385 = in.m_54.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _389 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_89);
        float _407 = 1.0 / _405;
        float _409 = _123 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_56.x;
    float _415 = in.m_56.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _419 = _411 + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _423 = _411 + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _433;
    bool _437 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _439 = isnan(_411);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = _411 + _449;
    float _453 = 1.0 / _427;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _457 = 1.0 / _431;
    float _459 = _381 * _415;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _461;
    float _465 = 1.0 / _435;
    float _467 = _451 * _453;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _473;
    float _477 = fma(_463, _467, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = fma(_471, _467, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _481 = fma(_475, _467, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _483 = _419 * _457;
    bool _485 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _487 = isnan(_411);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    bool _497 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _499 = isnan(_411);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _423 * _465;
    float _511 = -_447;
    float _513 = _511 + 1.0;
    float _515 = -_507;
    float _517 = _515 + 1.0;
    float _519 = _495 * _513;
    bool _521 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _523 = isnan(_411);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -_495;
    float _535 = _533 + 1.0;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _541 = _531 * _517;
    float _543 = _507 * _535;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _549 = -_531;
    float _551 = _549 + 1.0;
    float _553 = _477 * _541;
    float _555 = _479 * _541;
    float _557 = _481 * _541;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _563 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].x, _553);
    float _565 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].y, _555);
    float _567 = fma(_539, _483, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = fma(_547, _483, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _575;
    float _579 = fma(_561, _483, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _581 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].z, _557);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _583;
    float _587 = fma(_567, _543, _563);
    float _589 = fma(_573, _509, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _591 = fma(_577, _509, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _593 = fma(_569, _543, _565);
    float _595 = fma(_585, _509, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _597 = fma(_579, _543, _581);
    float _599 = fma(_589, _519, _587);
    float _601 = fma(_591, _519, _593);
    float _603 = _379 * _413;
    float _605 = fma(_595, _519, _597);
    float _607 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[110].x, _599);
    float _609 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[110].y, _601);
    float _611 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[110].z, _605);
    bool _613 = !_455;
    float _615 = _519;
    float _617 = _605;
    float _635;
    if (!_613)
    {
        float _619 = in.m_54.x;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _623 = _619 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _635 = _633;
        _637 = true;
    }
    else
    {
        float _639 = float(_89);
        float _641 = 1.0 / _639;
        float _643 = _123 * _641;
        _635 = _643;
    }
    _637 = false;
    float _645 = _635;
    float _647 = in.m_54.z;
    float _649 = in.m_54.w;
    float _651 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _655 = _653 != 0;
    float _657 = in.m_54.x;
    float _659 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _663 = _661 != 0;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _671 = _669 != 0;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _677 = _581;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_655)
    {
        float _683 = in.m_54.y;
        _677 = _683;
    }
    float _685 = _677;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_655)
    {
        float _691 = in.m_54.z;
        _679 = _691;
    }
    float _693 = _679;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _697 = _647 * 2.0;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _701 = _693;
    if (_655)
    {
        _681 = _657;
    }
    float _703 = _681;
    float _705 = floor(_697);
    float _707 = _703;
    if (!_655)
    {
        _707 = _647;
    }
    float _709 = _707;
    float _711 = _709 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _713 = _657 * 2.0;
    if (!_655)
    {
        _615 = _685;
    }
    float _715 = _615;
    float _717 = -_673;
    float _719 = fma(_711, 2.0, _717);
    float _721 = _715;
    if (!_655)
    {
        _617 = _715;
    }
    float _723 = _617;
    float _725 = -_123;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[86].x, _719);
    bool _729 = _705 > 0.0;
    bool _731 = _705 >= 0.0;
    bool _733 = isnan(_705);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _723;
    float _743 = _685;
    if (_655)
    {
        float _745 = in.m_54.x;
        float _747 = in.m_54.y;
        _741 = _745;
        _743 = _747;
    }
    float _749 = _741;
    float _751 = _743;
    float _753 = floor(_713);
    int _755 = _739 ? 0 : 1;
    int _757 = ~_755;
    int _759 = _757 + 1;
    int _761 = _759 + 1;
    int _763 = _761;
    if (!_729)
    {
        int _765 = ~_755;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = float(_769);
    bool _773 = _753 > 0.0;
    bool _775 = _753 >= 0.0;
    bool _777 = isnan(_753);
    bool _779 = _775 || _777;
    bool _781 = isnan(0.0);
    bool _783 = _779 || _781;
    float _785 = _749 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _787 = _785;
    if (_655)
    {
        _721 = _751;
    }
    float _789 = _721;
    float _791 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[83].z, _687);
    float _793 = _751 * 2.0;
    float _795 = -_675;
    float _797 = fma(_785, 2.0, _795);
    float _799 = _793;
    if (!_655)
    {
        _787 = _693;
    }
    float _801 = _787;
    float _803 = _751 + _657;
    float _805 = _801;
    if (_655)
    {
        _701 = _789;
    }
    float _807 = _701;
    float _809 = floor(_793);
    if (_655)
    {
        _805 = _789;
    }
    float _811 = _805;
    float _813 = _803 + (-1.0);
    float _815 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _791);
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[83].w, _689);
    bool _819 = !_663;
    int _821 = _819 ? 0 : 1;
    float _823 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _825 = _811 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _827 = -_123;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[81].x, _797);
    if (_655)
    {
        _799 = _789;
    }
    float _831 = _799;
    float _833 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _835 = log2(_833);
    int _837 = abs(_821);
    float _839 = fma(_825, -2.0, _695);
    float _841 = in.m_58.x;
    float _843 = in.m_58.y;
    float _845 = in.m_58.z;
    float _847 = _831;
    if (!_655)
    {
        _847 = _657;
    }
    float _849 = _847;
    float _851 = float(_837);
    bool _853 = _809 > 0.0;
    bool _855 = _809 >= 0.0;
    bool _857 = isnan(_809);
    bool _859 = _855 || _857;
    bool _861 = isnan(0.0);
    bool _863 = _859 || _861;
    float _865 = _851 * _771;
    float _867 = _849 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _869 = _783 ? 0 : 1;
    float _871 = _865 * (-2.0);
    float _873 = _835 * _123;
    float _875 = fma(_867, -2.0, _699);
    int _877 = ~_869;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = fma(_823, _871, _823);
    int _885 = _881;
    if (!_773)
    {
        int _887 = ~_869;
        int _889 = _887 + 1;
        _885 = _889;
    }
    int _891 = _885;
    float _893 = exp2(_873);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _897 = 1.0 + _895;
    int _899 = _863 ? 0 : 1;
    float _901 = fma(_871, _841, _841);
    float _903 = _657 + (-0.5);
    int _905 = ~_899;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = 1.0 / _897;
    int _913 = _909;
    if (!_853)
    {
        int _915 = ~_899;
        int _917 = _915 + 1;
        _913 = _917;
    }
    int _919 = _913;
    float _921 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[196].x, _901);
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _925 = !_667;
    int _927 = _925 ? 0 : 1;
    float _929 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[88].w, _923);
    float _931 = -_893;
    float _933 = _931 + 1.0;
    bool _935 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _943 = _939 || _941;
    float _945 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _875);
    bool _947 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(1.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _959 = abs(_927);
    float _961 = _943 ? _933 : 0.0;
    float _963 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _929);
    bool _965 = !_671;
    int _967 = _965 ? 0 : 1;
    float _969 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[88].z, _957);
    float _971 = float(_959);
    float _973 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _817);
    float _975 = float(_891);
    float _977 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _969);
    int _979 = abs(_967);
    float _981 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _839);
    if (_955)
    {
        float _983 = _961 * _911;
        _127 = _983;
    }
    float _985 = _127;
    float _987 = _971 * _975;
    float _989 = _647 + _751;
    float _991 = fma(_883, _985, _921);
    float _993 = _989 + (-1.0);
    float _995 = float(_979);
    float _997 = _987 * (-2.0);
    float _999 = float(_919);
    float _1001 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1003 = _647 + _657;
    float _1005 = _991 * 0.15915493667125701904296875;
    float _1007 = fma(_997, _843, _843);
    float _1009 = _995 * _999;
    float _1011 = fma(_1001, _997, _1001);
    float _1013 = _1003 + (-1.0);
    float _1015 = _1009 * (-2.0);
    float _1017 = _751 + (-0.5);
    float _1019 = _1005 * 6.283185482025146484375;
    float _1021 = sin(_1019);
    float _1023 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1025 = fma(_1015, _845, _845);
    float _1027 = _647 + (-0.5);
    float _1029 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1007);
    float _1031 = fma(_1023, _1015, _1023);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _1035 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1025);
    float _1037 = fma(_1011, _985, _1029);
    float _1039 = _1005 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = fma(_1031, _985, _1035);
    float _1045 = _1037 * 0.15915493667125701904296875;
    float _1047 = _651 * _1033;
    float _1049 = _1043 * 0.15915493667125701904296875;
    float _1051 = in.m_42.x;
    float _1053 = in.m_42.y;
    float _1055 = in.m_42.z;
    float _1057 = _1045 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1063 = _1045 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1049 * 6.283185482025146484375;
    float _1069 = cos(_1067);
    float _1071 = _659 * _1061;
    float _1073 = _1041 * _1059;
    float _1075 = _1021 * _1059;
    float _1077 = _1049 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1021 * _1065;
    float _1083 = _1041 * _1065;
    float _1085 = _1065 * _1069;
    float _1087 = _1069 * _1071;
    float _1089 = _1041 * _1087;
    float _1091 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1093 = _1021 * _1087;
    float _1095 = -_1073;
    float _1097 = fma(_1079, _1081, _1095);
    float _1099 = -_1081;
    float _1101 = fma(_1079, _1073, _1099);
    float _1103 = _1059 * _1069;
    float _1105 = fma(_1079, _1083, _1075);
    float _1107 = -_1071;
    float _1109 = _1079 * _1107;
    float _1111 = fma(_1079, _1075, _1083);
    float _1113 = fma(_1097, _1047, _1093);
    float _1115 = fma(_1105, _1047, _1089);
    float _1117 = fma(_1085, _1047, _1109);
    float _1119 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1121 = fma(_1111, _1091, _1113);
    float _1123 = fma(_1101, _1091, _1115);
    float _1125 = fma(_1103, _1091, _1117);
    float _1127 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1129 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1119);
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1133 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1135 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1127);
    float _1137 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1129);
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1131);
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1133);
    float _1143 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1135);
    float _1145 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1147 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1139);
    float _1149 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1153 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1155 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1159 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1153);
    float _1161 = _1145 + _1155;
    float _1163 = _1151 + _1157;
    float _1165 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1167 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1159);
    float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1171 = _1161 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1175 = _1163 + _1173;
    float _1177 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1165);
    float _1179 = _1167 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1181 = _1171 * _1171;
    float _1183 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1177);
    float _1185 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1187 = fma(_1175, _1175, _1181);
    float _1189 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1191 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1185);
    float _1193 = sqrt(_1187);
    float _1195 = _1179 + _1189;
    float _1197 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1191);
    bool _1199 = _1193 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = _1189;
    float _1203 = _1185;
    float _1205 = _1191;
    float _1207 = _1145;
    float _1209 = _1087;
    if (!_1199)
    {
        _1201 = _1163;
    }
    float _1211 = _1201;
    float _1213 = _1211;
    if (!_1199)
    {
        _1203 = _1161;
    }
    float _1215 = _1203;
    float _1217 = _1215;
    if (!_1199)
    {
        _1205 = _1195;
    }
    float _1219 = _1205;
    bool _1221 = !_1199;
    float _1223 = _1219;
    if (!_1221)
    {
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1229 = _1193 + _1227;
        float _1231 = rsqrt(_1187);
        float _1233 = _1229 * _1225;
        float _1235 = _1195 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = _1233 * 0.15915493667125701904296875;
        float _1239 = _1237 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1237 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = fma(_1241, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1249 = _1231 * _1247;
        float _1251 = _1245 + (-1.0);
        float _1253 = fma(_1175, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1255 = fma(_1171, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1257 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = fma(_1195, _1245, _1257);
        _1223 = _1259;
        _1213 = _1253;
        _1217 = _1255;
    }
    float _1261 = _1223;
    float _1263 = _1213;
    float _1265 = _1217;
    float _1267 = -_1179;
    float _1269 = _1267 + _1261;
    float _1271 = -_1151;
    float _1273 = _1271 + _1263;
    float _1275 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1277 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1279 = _1269 * _1269;
    float _1281 = -_1145;
    float _1283 = _1281 + _1265;
    float _1285 = 1.0 / _1275;
    float _1287 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1277);
    float _1289 = fma(_1273, _1273, _1279);
    bool _1291 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1293 = isnan(0.5);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1299 = _1295 || _1297;
    float _1301 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1287);
    float _1303 = fma(_1283, _1283, _1289);
    float _1305 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1307 = sqrt(_1303);
    float _1309 = _1305 + _1275;
    float _1311 = _1309 * _1285;
    float _1313 = _1311 * 0.5;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1317 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1315);
    float _1319 = _1313;
    float _1321 = _1277;
    float _1323 = _1273;
    float _1325 = _1265;
    float _1327 = _1317;
    if (_1299)
    {
        _1319 = 1.0;
    }
    float _1329 = _1319;
    float _1331 = 1.0 / _1317;
    bool _1333 = _1307 > 0.0;
    float _1335 = _1307;
    float _1337 = _1329;
    if (!_1333)
    {
        _1207 = _1263;
    }
    float _1339 = _1207;
    float _1341 = _1339;
    if (!_1333)
    {
        _1335 = _1261;
    }
    float _1343 = _1335;
    bool _1345 = !_1333;
    float _1347 = _1343;
    if (!_1345)
    {
        float _1349 = _185 * _185;
        float _1351 = fma(_183, _183, _1349);
        float _1353 = fma(_187, _187, _1351);
        float _1355 = rsqrt(_1303);
        float _1357 = sqrt(_1353);
        float _1359 = _1273 * _1355;
        float _1361 = _1269 * _1355;
        float _1363 = _1283 * _1355;
        bool _1365 = _1357 > 0.0;
        float _1367 = _1355;
        float _1369 = _1357;
        _1323 = _1361;
        _1327 = _1353;
        if (!_1365)
        {
            _1367 = _1263;
        }
        float _1371 = _1367;
        _1341 = _1371;
        if (!_1365)
        {
            _1369 = _1261;
        }
        float _1373 = _1369;
        bool _1375 = !_1365;
        _1347 = _1373;
        if (!_1375)
        {
            float _1377 = rsqrt(_1353);
            float _1379 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1381 = _185 * _1377;
            float _1383 = _183 * _1377;
            float _1385 = _187 * _1377;
            float _1387 = _1361 * _1381;
            float _1389 = fma(_1359, _1383, _1387);
            float _1391 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1393 = fma(_1363, _1385, _1389);
            float _1395 = _1393 * _1391;
            float _1397 = fma(_183, _1395, _1263);
            float _1399 = fma(_185, _1395, _1261);
            float _1401 = fma(_187, _1395, _1265);
            _1321 = _1381;
            _1323 = _1395;
            _1347 = _1399;
            _1341 = _1397;
            _1325 = _1401;
        }
    }
    float _1403 = _1321;
    float _1405 = _1323;
    float _1407 = _1347;
    float _1409 = _1341;
    float _1411 = _1325;
    float _1413 = _1327;
    float _1415 = _1403;
    float _1417 = _1405;
    float _1419 = _1413;
    if (_1299)
    {
        _1415 = 1.0;
    }
    float _1421 = _1415;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1425 = _1331 * _1423;
    float _1427 = _1421;
    if (!_1299)
    {
        float _1429 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1431 = _1429 * 0.15915493667125701904296875;
        float _1433 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1435;
        float _1439 = _1431 * 6.283185482025146484375;
        float _1441 = cos(_1439);
        float _1443 = _1433 * 0.15915493667125701904296875;
        float _1445 = _1431 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = 1.0 / _1441;
        float _1451 = _1443 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        float _1455 = _1447 * _1449;
        float _1457 = _1443 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = _1453 * _1455;
        float _1463 = 1.0 / _1437;
        float _1465 = 1.0 / _1461;
        float _1467 = _1459 * _1465;
        float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1471 = fma(_1425, _1467, _1469);
        float _1473 = _1471 * _1463;
        float _1475 = precise::clamp(_1473, 0.0, 1.0);
        _1417 = _1431;
        _1419 = _1437;
        _1337 = _1475;
    }
    float _1477 = _1417;
    float _1479 = _1419;
    float _1481 = _1337;
    float _1483 = _1477;
    float _1485 = _1479;
    if (!_1299)
    {
        float _1487 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1489 = _1487 * 0.15915493667125701904296875;
        float _1491 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1493 = _1489 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = _1491 * 0.15915493667125701904296875;
        float _1499 = _1489 * 6.283185482025146484375;
        float _1501 = sin(_1499);
        float _1503 = 1.0 / _1495;
        float _1505 = _1497 * 6.283185482025146484375;
        float _1507 = cos(_1505);
        float _1509 = _1501 * _1503;
        float _1511 = _1497 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = _1507 * _1509;
        float _1517 = 1.0 / _1515;
        float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1521 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1519;
        float _1523 = 1.0 / _1521;
        float _1525 = _1513 * _1517;
        float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1529 = fma(_1425, _1525, _1527);
        float _1531 = _1529 * _1523;
        float _1533 = precise::clamp(_1531, 0.0, 1.0);
        float _1535 = -_1533;
        float _1537 = _1535 + 1.0;
        _1483 = _1503;
        _1485 = _1517;
        _1427 = _1537;
    }
    float _1539 = _1483;
    float _1541 = _1485;
    float _1543 = _1427;
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1407 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1551 = _1409 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1555 = _1411 + _1553;
    float _1557 = _1547 * _1547;
    float _1559 = fma(_1551, _1551, _1557);
    float _1561 = fma(_1555, _1555, _1559);
    float _1563 = rsqrt(_1561);
    float _1565 = sqrt(_1561);
    float _1567 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1569 = _1551 * _1567;
    float _1571 = _1555 * _1567;
    float _1573 = _1569 * _1569;
    float _1575 = _1571 * _1571;
    float _1577 = _1573 + _1575;
    float _1579 = sqrt(_1577);
    bool _1581 = _1579 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1585 = _1579 + _1583;
    float _1587 = _1555;
    float _1589 = _1559;
    float _1591 = _1585;
    float _1593 = _1539;
    float _1595 = _1547;
    if (_1581)
    {
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1587 = _1597;
    }
    float _1599 = _1587;
    if (_1581)
    {
        float _1601 = rsqrt(_1577);
        _1589 = _1601;
    }
    float _1603 = _1589;
    float _1605 = _1603;
    if (_1581)
    {
        float _1607 = _1585 * _1599;
        _1591 = _1607;
    }
    float _1609 = _1591;
    if (_1581)
    {
        float _1611 = _1609 * 0.15915493667125701904296875;
        _1593 = _1611;
    }
    float _1613 = _1593;
    float _1615 = _1563;
    if (_1581)
    {
        float _1617 = _1613 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        _1615 = _1619;
    }
    float _1621 = _1615;
    float _1623 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1625 = precise::max(0.0, _1623);
    float _1627 = _1541;
    float _1629 = _1625;
    float _1631 = _1623;
    if (_1581)
    {
        float _1633 = _1613 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        _1627 = _1635;
    }
    float _1637 = _1627;
    float _1639 = -_1567;
    float _1641 = -_1625;
    float _1643 = fma(_1547, _1639, _1641);
    if (!_1581)
    {
        _1629 = _1571;
    }
    float _1645 = _1629;
    float _1647 = _1645;
    if (_1581)
    {
        float _1649 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1631 = _1649;
    }
    float _1651 = _1631;
    float _1653 = _1621;
    float _1655 = _1651;
    if (_1581)
    {
        float _1657 = fma(_1621, _1651, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1653 = _1657;
    }
    float _1659 = _1653;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1663 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1661);
    float _1665 = precise::clamp(_1663, 0.0, 1.0);
    float _1667 = _1659;
    if (_1581)
    {
        float _1669 = _1637 + (-1.0);
        _1655 = _1669;
    }
    float _1671 = _1655;
    float _1673 = _1671;
    if (_1581)
    {
        float _1675 = _1603 * _1659;
        _1209 = _1675;
    }
    float _1677 = _1209;
    if (!_1581)
    {
        _1605 = _1569;
    }
    float _1679 = _1605;
    float _1681 = _1679;
    if (_1581)
    {
        float _1683 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1683;
    }
    float _1685 = _1595;
    float _1687 = _1685;
    if (_1581)
    {
        float _1689 = _1569 * _1677;
        _1681 = _1689;
    }
    float _1691 = _1681;
    if (!_1581)
    {
        _1667 = _1643;
    }
    float _1693 = _1667;
    float _1695 = _1693;
    if (_1581)
    {
        float _1697 = _1571 * _1677;
        _1647 = _1697;
    }
    float _1699 = _1647;
    if (!_1581)
    {
        _1673 = _1573;
    }
    float _1701 = _1673;
    float _1703 = _1701;
    if (_1581)
    {
        float _1705 = fma(_1643, _1637, _1685);
        _1695 = _1705;
    }
    float _1707 = _1695;
    if (_1581)
    {
        float _1709 = _1691 * _1691;
        _1703 = _1709;
    }
    float _1711 = _1703;
    if (!_1581)
    {
        _1687 = _1575;
    }
    float _1713 = _1687;
    float _1715 = _1713;
    if (_1581)
    {
        float _1717 = _1699 * _1699;
        _1715 = _1717;
    }
    float _1719 = _1715;
    float _1721 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1723 = fma(_1707, _1707, _1711);
    float _1725 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1727 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1729 = -_1665;
    float _1731 = _1729 + 1.0;
    float _1733 = _1723 + _1719;
    float _1735 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1725);
    float _1737 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1739 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1727);
    float _1741 = rsqrt(_1733);
    float _1743 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1735);
    float _1745 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1737);
    float _1747 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1749 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1739);
    float _1751 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1753 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1745);
    float _1755 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1747);
    float _1757 = abs(_1731);
    float _1759 = log2(_1757);
    float _1761 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1763 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1765 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1767 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1755);
    float _1769 = -_1761;
    float _1771 = fma(_1769, _1721, 1.0);
    float _1773 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1775 = _1741 * _1691;
    float _1777 = _1741 * _1707;
    float _1779 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1773);
    float _1781 = _1741 * _1699;
    float _1783 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1785 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1787 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1779);
    float _1789 = log2(_1771);
    float _1791 = -_1783;
    float _1793 = fma(_1777, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1791);
    float _1795 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1797 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1787);
    float _1799 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1801 = -_1781;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1793);
    float _1805 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1807 = 1.0 / _1797;
    float _1809 = fma(_1803, -0.5, 0.5);
    float _1811 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1799);
    float _1813 = fma(_1803, 0.5, 0.5);
    float _1815 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1805);
    float _1817 = _1777 + 1.0;
    float _1819 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1811);
    float _1821 = fma(_1813, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1823 = exp2(_1795);
    float _1825 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1815);
    float _1827 = _1789 * 0.693147182464599609375;
    float _1829 = fma(_1813, _1821, -0.212114393711090087890625);
    float _1831 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1833 = fma(_1813, _1829, 1.570728778839111328125);
    float _1835 = sqrt(_1809);
    float _1837 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1819);
    float _1839 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1825);
    float _1841 = _1837 * _1807;
    float _1843 = _1839 * _1807;
    float _1845 = -_1777;
    float _1847 = fma(_1823, _1817, _1845);
    float _1849 = fma(_1841, 0.5, 0.5);
    float _1851 = fma(_1843, -0.5, 0.5);
    float _1853 = fma(_1847, 0.5, 0.5);
    float _1855 = _1835 * 0.636619746685028076171875;
    float3 _5061 = float3(_1849, _1851, _1831);
    float _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5061, float3(0.0), isnan(_5061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5061, float3(0.0), isnan(_5061)), level(0.0)).x;
    float3 _5072 = float3(_1849, _1851, _1831);
    float4 _1860 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5072, float3(0.0), isnan(_5072)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5072, float3(0.0), isnan(_5072)), level(0.0)).xyzw;
    float _1862 = _1860.x;
    float _1864 = _1860.y;
    float _1866 = _1860.z;
    float _1868 = _1860.w;
    float _1870 = -_1833;
    float _1872 = fma(_1855, _1870, 1.0);
    float2 _5094 = float2(_1872, _1853);
    float3 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5094, float2(0.0), isnan(_5094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5094, float2(0.0), isnan(_5094)), level(0.0)).xyz;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1886 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1888 = _649 > 0.5;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1898 = _647 > 0.5;
    float _1900 = 1.0 / _1892;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1902;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1910 = -_181;
    int _1912 = _1888 ? as_type<int>(_1910) : as_type<int>(_181);
    float _1914 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1886);
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1918 = _1916 != 0;
    float _1920 = -_815;
    float _1922 = _1920 + 1.0;
    float _1924 = 1.0 / _1896;
    bool _1926 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1928 = isnan(_645);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1934 = _1930 || _1932;
    float _1936 = float(_1934);
    float _1938 = -_973;
    float _1940 = _1938 + 1.0;
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1944 = _1942 != 0;
    float _1946 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1914);
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1950 = _1948 != 0;
    float _1952 = -_977;
    float _1954 = _1952 + 1.0;
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1958 = _1956 != 0;
    float _1960 = _1908 * _1900;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1964 = _645 + _1962;
    bool _1966 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1968 = isnan(_645);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = -_963;
    float _1980 = _1978 + 1.0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1984 = _1982 != 0;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1988 = _1986 != 0;
    float _1990 = _1904 * _1924;
    float _1992 = -_1936;
    float _1994 = _1992 + 1.0;
    bool _1996 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1998 = isnan(_645);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2010 = _645 + _2008;
    float _2012 = fma(_1990, _1964, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2014 = _1976 * _1994;
    float _2016 = -_2006;
    float _2018 = _2016 + 1.0;
    float _2020 = fma(_1960, _2010, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2022 = -_171;
    int _2024 = _1898 ? as_type<int>(_2022) : as_type<int>(_171);
    float _2026 = _2012 * _2014;
    float _2028 = -_1976;
    float _2030 = _2028 + 1.0;
    float _2032 = _1936 * _2018;
    bool _2034 = !_1950;
    float _2036 = _2034 ? _171 : as_type<float>(_2024);
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2040 = _657 > 0.5;
    float _2042 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2026);
    float _2044 = fma(_2020, _2032, _2042);
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2050 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2044);
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2054 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2058 = _2048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2060 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2062 = -_181;
    int _2064 = _1898 ? as_type<int>(_2062) : as_type<int>(_181);
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2068 = _751 > 0.5;
    float _2070 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_60.x = _2054;
    out.m_60.y = _2058;
    out.m_60.z = _2060;
    out.m_60.w = _2056;
    float _2072 = -_171;
    int _2074 = _2040 ? as_type<int>(_2072) : as_type<int>(_171);
    float _2076 = -_171;
    int _2078 = _2068 ? as_type<int>(_2076) : as_type<int>(_171);
    float _2080 = -_181;
    int _2082 = _2068 ? as_type<int>(_2080) : as_type<int>(_181);
    float _2084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2086 = !_1918;
    float _2088 = _2086 ? _181 : as_type<float>(_1912);
    bool _2090 = !_1984;
    float _2092 = _2090 ? _171 : as_type<float>(_2074);
    bool _2094 = !_1944;
    float _2096 = _2094 ? _171 : as_type<float>(_2078);
    float _2098 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2100 = !_1958;
    float _2102 = _2100 ? _181 : as_type<float>(_2064);
    float _2104 = _607 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2106 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2108 = _611 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2110 = _2050 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2112 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2114 = _2106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2116 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2118 = !_1988;
    float _2120 = _2118 ? _181 : as_type<float>(_2082);
    float _2122 = _2036 + 0.5;
    float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2126 = _2092 + 0.5;
    out.m_62.x = _2112;
    out.m_62.y = _2114;
    out.m_62.z = _2116;
    out.m_62.w = _2110;
    float _2128 = fma(_2098, _2122, _829);
    float _2130 = _2088 + (-0.5);
    float _2132 = -_2120;
    float _2134 = _2132 + 0.5;
    float _2136 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2138 = _1481 > 0.0;
    bool _2140 = isnan(_1481);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2150 = -_2070;
    float _2152 = -_981;
    float _2154 = fma(_2150, _2130, _2152);
    float _2156 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2158 = _2136 * _2084;
    float _2160 = -_1922;
    float _2162 = fma(_2036, _2160, _2128);
    float _2164 = fma(_2088, _1940, _2154);
    bool _2166 = _1543 <= 0.0;
    bool _2168 = !_2146;
    bool _2170 = _2166 || _2168;
    float _2172 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2174 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2176 = _2096 + 0.5;
    float _2178 = _2102 + (-0.5);
    float _2180 = _2156 * _2124;
    float _2182 = exp2(_2172);
    float _2184 = fma(_2174, _2176, _727);
    float _2186 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2188 = _1481 * _1543;
    out.m_64.x = _2158;
    out.m_64.y = _2180;
    out.m_64.z = _2162;
    out.m_64.w = _2164;
    float _2190 = -_1954;
    float _2192 = fma(_2096, _2190, _2184);
    float _2194 = -_2186;
    float _2196 = -_945;
    float _2198 = fma(_2194, _2178, _2196);
    float _2200 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2202 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1946);
    float _2204 = fma(_2102, _1980, _2198);
    float _2206 = _2200 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2208 = _2202 + _1797;
    out.m_66.x = _2192;
    out.m_66.y = _2204;
    float _2210 = -_2182;
    float _2212 = _2210 + 1.0;
    float _2214 = _2208 * 0.5;
    out.m_45.x = _2206;
    float _2216 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1837;
    out.gl_Position.y = _1839;
    out.gl_Position.z = _2202;
    out.gl_Position.w = _1797;
    float _2218 = -_2216;
    float _2220 = _2218 + 1.0;
    out.m_68.z = _2214;
    out.m_68.w = _1797;
    float _2222 = _2216 * _1857;
    float _2224 = _1868 * _2220;
    float _2226 = _1868 * _2222;
    float _2228 = _1882 * _2222;
    float _2230 = fma(_1878, _2226, _1862);
    float _2232 = fma(_1880, _2226, _1864);
    float _2234 = fma(_1868, _2228, _1866);
    out.m_70.x = _2230;
    out.m_70.y = _2232;
    out.m_70.z = _2234;
    out.m_70.w = _2224;
    if (!_2170)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2236 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2236;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _637 = false;
    bool _403 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2293 = as_type<float>(_105);
        out.gl_Position.z = _2293;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2362 = as_type<float>(_143);
        out.gl_Position.z = _2362;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.x;
    float _149 = in.m_52.y;
    float _151 = in.m_52.z;
    int _153 = as_type<int>(_145) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_145) & 2;
    bool _159 = _157 != 0;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _169 = !_155;
    float _171 = _169 ? (-0.5) : 0.5;
    float _173 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _175 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _177 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _167);
    bool _179 = !_159;
    float _181 = _179 ? (-0.5) : 0.5;
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _173);
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _175);
    float _187 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _177);
    bool _189 = !_161;
    float _207;
    if (!_189)
    {
        float _191 = in.m_54.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_89);
        float _213 = 1.0 / _211;
        float _215 = _123 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = 1.0 / _233;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = 1.0 / _241;
    bool _249 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _251 = isnan(_217);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = 1.0 / _237;
    float _263 = _221 * _243;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = _225 * _247;
    bool _279 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_217);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_259;
    float _293 = _291 + 1.0;
    float _295 = _289 * _293;
    float _297 = -_289;
    float _299 = _297 + 1.0;
    float _301 = _229 * _261;
    float _303 = -_275;
    float _305 = _303 + 1.0;
    bool _307 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_217);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _327 = _259 * _305;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = fma(_321, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = _317 * _299;
    float _341 = fma(_331, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = fma(_325, _301, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = fma(_335, _301, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = -_317;
    float _349 = _347 + 1.0;
    float _351 = _337 * _339;
    float _353 = _341 * _339;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _355;
    float _359 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _361;
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _367 = fma(_357, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _369 = fma(_343, _295, _359);
    float _371 = fma(_363, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _373 = fma(_345, _295, _365);
    float _375 = fma(_367, _327, _369);
    float _377 = fma(_371, _327, _373);
    float _379 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[146].x, _375);
    float _381 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[146].y, _377);
    bool _383 = !_245;
    float _401;
    if (!_383)
    {
        float _385 = in.m_54.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _389 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_89);
        float _407 = 1.0 / _405;
        float _409 = _123 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_56.x;
    float _415 = in.m_56.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _419 = _411 + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _423 = _411 + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _433;
    bool _437 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _439 = isnan(_411);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = _411 + _449;
    float _453 = 1.0 / _427;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _457 = 1.0 / _431;
    float _459 = _381 * _415;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _461;
    float _465 = 1.0 / _435;
    float _467 = _451 * _453;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _473;
    float _477 = fma(_463, _467, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = fma(_471, _467, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _481 = fma(_475, _467, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _483 = _419 * _457;
    bool _485 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _487 = isnan(_411);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    bool _497 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _499 = isnan(_411);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _423 * _465;
    float _511 = -_447;
    float _513 = _511 + 1.0;
    float _515 = -_507;
    float _517 = _515 + 1.0;
    float _519 = _495 * _513;
    bool _521 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _523 = isnan(_411);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -_495;
    float _535 = _533 + 1.0;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _541 = _531 * _517;
    float _543 = _507 * _535;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _549 = -_531;
    float _551 = _549 + 1.0;
    float _553 = _477 * _541;
    float _555 = _479 * _541;
    float _557 = _481 * _541;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _563 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].x, _553);
    float _565 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].y, _555);
    float _567 = fma(_539, _483, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = fma(_547, _483, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _575;
    float _579 = fma(_561, _483, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _581 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].z, _557);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _583;
    float _587 = fma(_567, _543, _563);
    float _589 = fma(_573, _509, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _591 = fma(_577, _509, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _593 = fma(_569, _543, _565);
    float _595 = fma(_585, _509, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _597 = fma(_579, _543, _581);
    float _599 = fma(_589, _519, _587);
    float _601 = fma(_591, _519, _593);
    float _603 = _379 * _413;
    float _605 = fma(_595, _519, _597);
    float _607 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[110].x, _599);
    float _609 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[110].y, _601);
    float _611 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[110].z, _605);
    bool _613 = !_455;
    float _615 = _519;
    float _617 = _605;
    float _635;
    if (!_613)
    {
        float _619 = in.m_54.x;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _623 = _619 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _635 = _633;
        _637 = true;
    }
    else
    {
        float _639 = float(_89);
        float _641 = 1.0 / _639;
        float _643 = _123 * _641;
        _635 = _643;
    }
    _637 = false;
    float _645 = _635;
    float _647 = in.m_54.z;
    float _649 = in.m_54.w;
    float _651 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _655 = _653 != 0;
    float _657 = in.m_54.x;
    float _659 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _663 = _661 != 0;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _671 = _669 != 0;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _677 = _581;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_655)
    {
        float _683 = in.m_54.y;
        _677 = _683;
    }
    float _685 = _677;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_655)
    {
        float _691 = in.m_54.z;
        _679 = _691;
    }
    float _693 = _679;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _697 = _647 * 2.0;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _701 = _693;
    if (_655)
    {
        _681 = _657;
    }
    float _703 = _681;
    float _705 = floor(_697);
    float _707 = _703;
    if (!_655)
    {
        _707 = _647;
    }
    float _709 = _707;
    float _711 = _709 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _713 = _657 * 2.0;
    if (!_655)
    {
        _615 = _685;
    }
    float _715 = _615;
    float _717 = -_673;
    float _719 = fma(_711, 2.0, _717);
    float _721 = _715;
    if (!_655)
    {
        _617 = _715;
    }
    float _723 = _617;
    float _725 = -_123;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[86].x, _719);
    bool _729 = _705 > 0.0;
    bool _731 = _705 >= 0.0;
    bool _733 = isnan(_705);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _723;
    float _743 = _685;
    if (_655)
    {
        float _745 = in.m_54.x;
        float _747 = in.m_54.y;
        _741 = _745;
        _743 = _747;
    }
    float _749 = _741;
    float _751 = _743;
    float _753 = floor(_713);
    int _755 = _739 ? 0 : 1;
    int _757 = ~_755;
    int _759 = _757 + 1;
    int _761 = _759 + 1;
    int _763 = _761;
    if (!_729)
    {
        int _765 = ~_755;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = float(_769);
    bool _773 = _753 > 0.0;
    bool _775 = _753 >= 0.0;
    bool _777 = isnan(_753);
    bool _779 = _775 || _777;
    bool _781 = isnan(0.0);
    bool _783 = _779 || _781;
    float _785 = _749 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _787 = _785;
    if (_655)
    {
        _721 = _751;
    }
    float _789 = _721;
    float _791 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[83].z, _687);
    float _793 = _751 * 2.0;
    float _795 = -_675;
    float _797 = fma(_785, 2.0, _795);
    float _799 = _793;
    if (!_655)
    {
        _787 = _693;
    }
    float _801 = _787;
    float _803 = _751 + _657;
    float _805 = _801;
    if (_655)
    {
        _701 = _789;
    }
    float _807 = _701;
    float _809 = floor(_793);
    if (_655)
    {
        _805 = _789;
    }
    float _811 = _805;
    float _813 = _803 + (-1.0);
    float _815 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _791);
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[83].w, _689);
    bool _819 = !_663;
    int _821 = _819 ? 0 : 1;
    float _823 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _825 = _811 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _827 = -_123;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[81].x, _797);
    if (_655)
    {
        _799 = _789;
    }
    float _831 = _799;
    float _833 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _835 = log2(_833);
    int _837 = abs(_821);
    float _839 = fma(_825, -2.0, _695);
    float _841 = in.m_58.x;
    float _843 = in.m_58.y;
    float _845 = in.m_58.z;
    float _847 = _831;
    if (!_655)
    {
        _847 = _657;
    }
    float _849 = _847;
    float _851 = float(_837);
    bool _853 = _809 > 0.0;
    bool _855 = _809 >= 0.0;
    bool _857 = isnan(_809);
    bool _859 = _855 || _857;
    bool _861 = isnan(0.0);
    bool _863 = _859 || _861;
    float _865 = _851 * _771;
    float _867 = _849 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _869 = _783 ? 0 : 1;
    float _871 = _865 * (-2.0);
    float _873 = _835 * _123;
    float _875 = fma(_867, -2.0, _699);
    int _877 = ~_869;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = fma(_823, _871, _823);
    int _885 = _881;
    if (!_773)
    {
        int _887 = ~_869;
        int _889 = _887 + 1;
        _885 = _889;
    }
    int _891 = _885;
    float _893 = exp2(_873);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _897 = 1.0 + _895;
    int _899 = _863 ? 0 : 1;
    float _901 = fma(_871, _841, _841);
    float _903 = _657 + (-0.5);
    int _905 = ~_899;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = 1.0 / _897;
    int _913 = _909;
    if (!_853)
    {
        int _915 = ~_899;
        int _917 = _915 + 1;
        _913 = _917;
    }
    int _919 = _913;
    float _921 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[196].x, _901);
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _925 = !_667;
    int _927 = _925 ? 0 : 1;
    float _929 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[88].w, _923);
    float _931 = -_893;
    float _933 = _931 + 1.0;
    bool _935 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _943 = _939 || _941;
    float _945 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _875);
    bool _947 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(1.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _959 = abs(_927);
    float _961 = _943 ? _933 : 0.0;
    float _963 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _929);
    bool _965 = !_671;
    int _967 = _965 ? 0 : 1;
    float _969 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[88].z, _957);
    float _971 = float(_959);
    float _973 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _817);
    float _975 = float(_891);
    float _977 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _969);
    int _979 = abs(_967);
    float _981 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _839);
    if (_955)
    {
        float _983 = _961 * _911;
        _127 = _983;
    }
    float _985 = _127;
    float _987 = _971 * _975;
    float _989 = _647 + _751;
    float _991 = fma(_883, _985, _921);
    float _993 = _989 + (-1.0);
    float _995 = float(_979);
    float _997 = _987 * (-2.0);
    float _999 = float(_919);
    float _1001 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1003 = _647 + _657;
    float _1005 = _991 * 0.15915493667125701904296875;
    float _1007 = fma(_997, _843, _843);
    float _1009 = _995 * _999;
    float _1011 = fma(_1001, _997, _1001);
    float _1013 = _1003 + (-1.0);
    float _1015 = _1009 * (-2.0);
    float _1017 = _751 + (-0.5);
    float _1019 = _1005 * 6.283185482025146484375;
    float _1021 = sin(_1019);
    float _1023 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1025 = fma(_1015, _845, _845);
    float _1027 = _647 + (-0.5);
    float _1029 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1007);
    float _1031 = fma(_1023, _1015, _1023);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _1035 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1025);
    float _1037 = fma(_1011, _985, _1029);
    float _1039 = _1005 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = fma(_1031, _985, _1035);
    float _1045 = _1037 * 0.15915493667125701904296875;
    float _1047 = _651 * _1033;
    float _1049 = _1043 * 0.15915493667125701904296875;
    float _1051 = in.m_42.x;
    float _1053 = in.m_42.y;
    float _1055 = in.m_42.z;
    float _1057 = _1045 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1063 = _1045 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1049 * 6.283185482025146484375;
    float _1069 = cos(_1067);
    float _1071 = _659 * _1061;
    float _1073 = _1041 * _1059;
    float _1075 = _1021 * _1059;
    float _1077 = _1049 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1021 * _1065;
    float _1083 = _1041 * _1065;
    float _1085 = _1065 * _1069;
    float _1087 = _1069 * _1071;
    float _1089 = _1041 * _1087;
    float _1091 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1093 = _1021 * _1087;
    float _1095 = -_1073;
    float _1097 = fma(_1079, _1081, _1095);
    float _1099 = -_1081;
    float _1101 = fma(_1079, _1073, _1099);
    float _1103 = _1059 * _1069;
    float _1105 = fma(_1079, _1083, _1075);
    float _1107 = -_1071;
    float _1109 = _1079 * _1107;
    float _1111 = fma(_1079, _1075, _1083);
    float _1113 = fma(_1097, _1047, _1093);
    float _1115 = fma(_1105, _1047, _1089);
    float _1117 = fma(_1085, _1047, _1109);
    float _1119 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1121 = fma(_1111, _1091, _1113);
    float _1123 = fma(_1101, _1091, _1115);
    float _1125 = fma(_1103, _1091, _1117);
    float _1127 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1129 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1119);
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1133 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1135 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1127);
    float _1137 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1129);
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1131);
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1133);
    float _1143 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1135);
    float _1145 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1147 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1139);
    float _1149 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1153 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1155 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1159 = fma(_1051, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1153);
    float _1161 = _1145 + _1155;
    float _1163 = _1151 + _1157;
    float _1165 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1167 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1159);
    float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1171 = _1161 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1175 = _1163 + _1173;
    float _1177 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1165);
    float _1179 = _1167 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1181 = _1171 * _1171;
    float _1183 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1177);
    float _1185 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1187 = fma(_1175, _1175, _1181);
    float _1189 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1191 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1185);
    float _1193 = sqrt(_1187);
    float _1195 = _1179 + _1189;
    float _1197 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1191);
    bool _1199 = _1193 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = _1189;
    float _1203 = _1185;
    float _1205 = _1191;
    float _1207 = _1145;
    float _1209 = _1087;
    if (!_1199)
    {
        _1201 = _1163;
    }
    float _1211 = _1201;
    float _1213 = _1211;
    if (!_1199)
    {
        _1203 = _1161;
    }
    float _1215 = _1203;
    float _1217 = _1215;
    if (!_1199)
    {
        _1205 = _1195;
    }
    float _1219 = _1205;
    bool _1221 = !_1199;
    float _1223 = _1219;
    if (!_1221)
    {
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1229 = _1193 + _1227;
        float _1231 = rsqrt(_1187);
        float _1233 = _1229 * _1225;
        float _1235 = _1195 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = _1233 * 0.15915493667125701904296875;
        float _1239 = _1237 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1237 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = fma(_1241, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1249 = _1231 * _1247;
        float _1251 = _1245 + (-1.0);
        float _1253 = fma(_1175, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1255 = fma(_1171, _1249, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1257 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = fma(_1195, _1245, _1257);
        _1223 = _1259;
        _1213 = _1253;
        _1217 = _1255;
    }
    float _1261 = _1223;
    float _1263 = _1213;
    float _1265 = _1217;
    float _1267 = -_1179;
    float _1269 = _1267 + _1261;
    float _1271 = -_1151;
    float _1273 = _1271 + _1263;
    float _1275 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1277 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1279 = _1269 * _1269;
    float _1281 = -_1145;
    float _1283 = _1281 + _1265;
    float _1285 = 1.0 / _1275;
    float _1287 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1277);
    float _1289 = fma(_1273, _1273, _1279);
    bool _1291 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1293 = isnan(0.5);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1299 = _1295 || _1297;
    float _1301 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1287);
    float _1303 = fma(_1283, _1283, _1289);
    float _1305 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1307 = sqrt(_1303);
    float _1309 = _1305 + _1275;
    float _1311 = _1309 * _1285;
    float _1313 = _1311 * 0.5;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1317 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1315);
    float _1319 = _1313;
    float _1321 = _1277;
    float _1323 = _1273;
    float _1325 = _1265;
    float _1327 = _1317;
    if (_1299)
    {
        _1319 = 1.0;
    }
    float _1329 = _1319;
    float _1331 = 1.0 / _1317;
    bool _1333 = _1307 > 0.0;
    float _1335 = _1307;
    float _1337 = _1329;
    if (!_1333)
    {
        _1207 = _1263;
    }
    float _1339 = _1207;
    float _1341 = _1339;
    if (!_1333)
    {
        _1335 = _1261;
    }
    float _1343 = _1335;
    bool _1345 = !_1333;
    float _1347 = _1343;
    if (!_1345)
    {
        float _1349 = _185 * _185;
        float _1351 = fma(_183, _183, _1349);
        float _1353 = fma(_187, _187, _1351);
        float _1355 = rsqrt(_1303);
        float _1357 = sqrt(_1353);
        float _1359 = _1273 * _1355;
        float _1361 = _1269 * _1355;
        float _1363 = _1283 * _1355;
        bool _1365 = _1357 > 0.0;
        float _1367 = _1355;
        float _1369 = _1357;
        _1323 = _1361;
        _1327 = _1353;
        if (!_1365)
        {
            _1367 = _1263;
        }
        float _1371 = _1367;
        _1341 = _1371;
        if (!_1365)
        {
            _1369 = _1261;
        }
        float _1373 = _1369;
        bool _1375 = !_1365;
        _1347 = _1373;
        if (!_1375)
        {
            float _1377 = rsqrt(_1353);
            float _1379 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1381 = _185 * _1377;
            float _1383 = _183 * _1377;
            float _1385 = _187 * _1377;
            float _1387 = _1361 * _1381;
            float _1389 = fma(_1359, _1383, _1387);
            float _1391 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1393 = fma(_1363, _1385, _1389);
            float _1395 = _1393 * _1391;
            float _1397 = fma(_183, _1395, _1263);
            float _1399 = fma(_185, _1395, _1261);
            float _1401 = fma(_187, _1395, _1265);
            _1321 = _1381;
            _1323 = _1395;
            _1347 = _1399;
            _1341 = _1397;
            _1325 = _1401;
        }
    }
    float _1403 = _1321;
    float _1405 = _1323;
    float _1407 = _1347;
    float _1409 = _1341;
    float _1411 = _1325;
    float _1413 = _1327;
    float _1415 = _1403;
    float _1417 = _1405;
    float _1419 = _1413;
    if (_1299)
    {
        _1415 = 1.0;
    }
    float _1421 = _1415;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1425 = _1331 * _1423;
    float _1427 = _1421;
    if (!_1299)
    {
        float _1429 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1431 = _1429 * 0.15915493667125701904296875;
        float _1433 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1435;
        float _1439 = _1431 * 6.283185482025146484375;
        float _1441 = cos(_1439);
        float _1443 = _1433 * 0.15915493667125701904296875;
        float _1445 = _1431 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = 1.0 / _1441;
        float _1451 = _1443 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        float _1455 = _1447 * _1449;
        float _1457 = _1443 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = _1453 * _1455;
        float _1463 = 1.0 / _1437;
        float _1465 = 1.0 / _1461;
        float _1467 = _1459 * _1465;
        float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1471 = fma(_1425, _1467, _1469);
        float _1473 = _1471 * _1463;
        float _1475 = precise::clamp(_1473, 0.0, 1.0);
        _1417 = _1431;
        _1419 = _1437;
        _1337 = _1475;
    }
    float _1477 = _1417;
    float _1479 = _1419;
    float _1481 = _1337;
    float _1483 = _1477;
    float _1485 = _1479;
    if (!_1299)
    {
        float _1487 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1489 = _1487 * 0.15915493667125701904296875;
        float _1491 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1493 = _1489 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = _1491 * 0.15915493667125701904296875;
        float _1499 = _1489 * 6.283185482025146484375;
        float _1501 = sin(_1499);
        float _1503 = 1.0 / _1495;
        float _1505 = _1497 * 6.283185482025146484375;
        float _1507 = cos(_1505);
        float _1509 = _1501 * _1503;
        float _1511 = _1497 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = _1507 * _1509;
        float _1517 = 1.0 / _1515;
        float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1521 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1519;
        float _1523 = 1.0 / _1521;
        float _1525 = _1513 * _1517;
        float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1529 = fma(_1425, _1525, _1527);
        float _1531 = _1529 * _1523;
        float _1533 = precise::clamp(_1531, 0.0, 1.0);
        float _1535 = -_1533;
        float _1537 = _1535 + 1.0;
        _1483 = _1503;
        _1485 = _1517;
        _1427 = _1537;
    }
    float _1539 = _1483;
    float _1541 = _1485;
    float _1543 = _1427;
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1407 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1551 = _1409 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1555 = _1411 + _1553;
    float _1557 = _1547 * _1547;
    float _1559 = fma(_1551, _1551, _1557);
    float _1561 = fma(_1555, _1555, _1559);
    float _1563 = rsqrt(_1561);
    float _1565 = sqrt(_1561);
    float _1567 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1569 = _1551 * _1567;
    float _1571 = _1555 * _1567;
    float _1573 = _1569 * _1569;
    float _1575 = _1571 * _1571;
    float _1577 = _1573 + _1575;
    float _1579 = sqrt(_1577);
    bool _1581 = _1579 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1585 = _1579 + _1583;
    float _1587 = _1555;
    float _1589 = _1559;
    float _1591 = _1585;
    float _1593 = _1539;
    float _1595 = _1547;
    if (_1581)
    {
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1587 = _1597;
    }
    float _1599 = _1587;
    if (_1581)
    {
        float _1601 = rsqrt(_1577);
        _1589 = _1601;
    }
    float _1603 = _1589;
    float _1605 = _1603;
    if (_1581)
    {
        float _1607 = _1585 * _1599;
        _1591 = _1607;
    }
    float _1609 = _1591;
    if (_1581)
    {
        float _1611 = _1609 * 0.15915493667125701904296875;
        _1593 = _1611;
    }
    float _1613 = _1593;
    float _1615 = _1563;
    if (_1581)
    {
        float _1617 = _1613 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        _1615 = _1619;
    }
    float _1621 = _1615;
    float _1623 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1625 = precise::max(0.0, _1623);
    float _1627 = _1541;
    float _1629 = _1625;
    float _1631 = _1623;
    if (_1581)
    {
        float _1633 = _1613 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        _1627 = _1635;
    }
    float _1637 = _1627;
    float _1639 = -_1567;
    float _1641 = -_1625;
    float _1643 = fma(_1547, _1639, _1641);
    if (!_1581)
    {
        _1629 = _1571;
    }
    float _1645 = _1629;
    float _1647 = _1645;
    if (_1581)
    {
        float _1649 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1631 = _1649;
    }
    float _1651 = _1631;
    float _1653 = _1621;
    float _1655 = _1651;
    if (_1581)
    {
        float _1657 = fma(_1621, _1651, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1653 = _1657;
    }
    float _1659 = _1653;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1663 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1661);
    float _1665 = precise::clamp(_1663, 0.0, 1.0);
    float _1667 = _1659;
    if (_1581)
    {
        float _1669 = _1637 + (-1.0);
        _1655 = _1669;
    }
    float _1671 = _1655;
    float _1673 = _1671;
    if (_1581)
    {
        float _1675 = _1603 * _1659;
        _1209 = _1675;
    }
    float _1677 = _1209;
    if (!_1581)
    {
        _1605 = _1569;
    }
    float _1679 = _1605;
    float _1681 = _1679;
    if (_1581)
    {
        float _1683 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1683;
    }
    float _1685 = _1595;
    float _1687 = _1685;
    if (_1581)
    {
        float _1689 = _1569 * _1677;
        _1681 = _1689;
    }
    float _1691 = _1681;
    if (!_1581)
    {
        _1667 = _1643;
    }
    float _1693 = _1667;
    float _1695 = _1693;
    if (_1581)
    {
        float _1697 = _1571 * _1677;
        _1647 = _1697;
    }
    float _1699 = _1647;
    if (!_1581)
    {
        _1673 = _1573;
    }
    float _1701 = _1673;
    float _1703 = _1701;
    if (_1581)
    {
        float _1705 = fma(_1643, _1637, _1685);
        _1695 = _1705;
    }
    float _1707 = _1695;
    if (_1581)
    {
        float _1709 = _1691 * _1691;
        _1703 = _1709;
    }
    float _1711 = _1703;
    if (!_1581)
    {
        _1687 = _1575;
    }
    float _1713 = _1687;
    float _1715 = _1713;
    if (_1581)
    {
        float _1717 = _1699 * _1699;
        _1715 = _1717;
    }
    float _1719 = _1715;
    float _1721 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1723 = fma(_1707, _1707, _1711);
    float _1725 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1727 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1729 = -_1665;
    float _1731 = _1729 + 1.0;
    float _1733 = _1723 + _1719;
    float _1735 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1725);
    float _1737 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1739 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1727);
    float _1741 = rsqrt(_1733);
    float _1743 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1735);
    float _1745 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1737);
    float _1747 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1749 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1739);
    float _1751 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1753 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1745);
    float _1755 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1747);
    float _1757 = abs(_1731);
    float _1759 = log2(_1757);
    float _1761 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1763 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1765 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1767 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1755);
    float _1769 = -_1761;
    float _1771 = fma(_1769, _1721, 1.0);
    float _1773 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1775 = _1741 * _1691;
    float _1777 = _1741 * _1707;
    float _1779 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1773);
    float _1781 = _1741 * _1699;
    float _1783 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1785 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1787 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1779);
    float _1789 = log2(_1771);
    float _1791 = -_1783;
    float _1793 = fma(_1777, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1791);
    float _1795 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1797 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1787);
    float _1799 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1801 = -_1781;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1793);
    float _1805 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1807 = 1.0 / _1797;
    float _1809 = fma(_1803, -0.5, 0.5);
    float _1811 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1799);
    float _1813 = fma(_1803, 0.5, 0.5);
    float _1815 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1805);
    float _1817 = _1777 + 1.0;
    float _1819 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1811);
    float _1821 = fma(_1813, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1823 = exp2(_1795);
    float _1825 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1815);
    float _1827 = _1789 * 0.693147182464599609375;
    float _1829 = fma(_1813, _1821, -0.212114393711090087890625);
    float _1831 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1833 = fma(_1813, _1829, 1.570728778839111328125);
    float _1835 = sqrt(_1809);
    float _1837 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1819);
    float _1839 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1825);
    float _1841 = _1837 * _1807;
    float _1843 = _1839 * _1807;
    float _1845 = -_1777;
    float _1847 = fma(_1823, _1817, _1845);
    float _1849 = fma(_1841, 0.5, 0.5);
    float _1851 = fma(_1843, -0.5, 0.5);
    float _1853 = fma(_1847, 0.5, 0.5);
    float _1855 = _1835 * 0.636619746685028076171875;
    float3 _5061 = float3(_1849, _1851, _1831);
    float _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5061, float3(0.0), isnan(_5061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5061, float3(0.0), isnan(_5061)), level(0.0)).x;
    float3 _5072 = float3(_1849, _1851, _1831);
    float4 _1860 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5072, float3(0.0), isnan(_5072)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5072, float3(0.0), isnan(_5072)), level(0.0)).xyzw;
    float _1862 = _1860.x;
    float _1864 = _1860.y;
    float _1866 = _1860.z;
    float _1868 = _1860.w;
    float _1870 = -_1833;
    float _1872 = fma(_1855, _1870, 1.0);
    float2 _5094 = float2(_1872, _1853);
    float3 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5094, float2(0.0), isnan(_5094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5094, float2(0.0), isnan(_5094)), level(0.0)).xyz;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1886 = _1763 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1888 = _649 > 0.5;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1898 = _647 > 0.5;
    float _1900 = 1.0 / _1892;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1902;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1910 = -_181;
    int _1912 = _1888 ? as_type<int>(_1910) : as_type<int>(_181);
    float _1914 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1886);
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1918 = _1916 != 0;
    float _1920 = -_815;
    float _1922 = _1920 + 1.0;
    float _1924 = 1.0 / _1896;
    bool _1926 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1928 = isnan(_645);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1934 = _1930 || _1932;
    float _1936 = float(_1934);
    float _1938 = -_973;
    float _1940 = _1938 + 1.0;
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1944 = _1942 != 0;
    float _1946 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1914);
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1950 = _1948 != 0;
    float _1952 = -_977;
    float _1954 = _1952 + 1.0;
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1958 = _1956 != 0;
    float _1960 = _1908 * _1900;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1964 = _645 + _1962;
    bool _1966 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1968 = isnan(_645);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = -_963;
    float _1980 = _1978 + 1.0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1984 = _1982 != 0;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1988 = _1986 != 0;
    float _1990 = _1904 * _1924;
    float _1992 = -_1936;
    float _1994 = _1992 + 1.0;
    bool _1996 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1998 = isnan(_645);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2010 = _645 + _2008;
    float _2012 = fma(_1990, _1964, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2014 = _1976 * _1994;
    float _2016 = -_2006;
    float _2018 = _2016 + 1.0;
    float _2020 = fma(_1960, _2010, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2022 = -_171;
    int _2024 = _1898 ? as_type<int>(_2022) : as_type<int>(_171);
    float _2026 = _2012 * _2014;
    float _2028 = -_1976;
    float _2030 = _2028 + 1.0;
    float _2032 = _1936 * _2018;
    bool _2034 = !_1950;
    float _2036 = _2034 ? _171 : as_type<float>(_2024);
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2040 = _657 > 0.5;
    float _2042 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2026);
    float _2044 = fma(_2020, _2032, _2042);
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2050 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2044);
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2054 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2058 = _2048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2060 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2062 = -_181;
    int _2064 = _1898 ? as_type<int>(_2062) : as_type<int>(_181);
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2068 = _751 > 0.5;
    float _2070 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_60.x = _2054;
    out.m_60.y = _2058;
    out.m_60.z = _2060;
    out.m_60.w = _2056;
    float _2072 = -_171;
    int _2074 = _2040 ? as_type<int>(_2072) : as_type<int>(_171);
    float _2076 = -_171;
    int _2078 = _2068 ? as_type<int>(_2076) : as_type<int>(_171);
    float _2080 = -_181;
    int _2082 = _2068 ? as_type<int>(_2080) : as_type<int>(_181);
    float _2084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2086 = !_1918;
    float _2088 = _2086 ? _181 : as_type<float>(_1912);
    bool _2090 = !_1984;
    float _2092 = _2090 ? _171 : as_type<float>(_2074);
    bool _2094 = !_1944;
    float _2096 = _2094 ? _171 : as_type<float>(_2078);
    float _2098 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2100 = !_1958;
    float _2102 = _2100 ? _181 : as_type<float>(_2064);
    float _2104 = _607 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2106 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2108 = _611 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2110 = _2050 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2112 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2114 = _2106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2116 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2118 = !_1988;
    float _2120 = _2118 ? _181 : as_type<float>(_2082);
    float _2122 = _2036 + 0.5;
    float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2126 = _2092 + 0.5;
    out.m_62.x = _2112;
    out.m_62.y = _2114;
    out.m_62.z = _2116;
    out.m_62.w = _2110;
    float _2128 = fma(_2098, _2122, _829);
    float _2130 = _2088 + (-0.5);
    float _2132 = -_2120;
    float _2134 = _2132 + 0.5;
    float _2136 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2138 = _1481 > 0.0;
    bool _2140 = isnan(_1481);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2150 = -_2070;
    float _2152 = -_981;
    float _2154 = fma(_2150, _2130, _2152);
    float _2156 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2158 = _2136 * _2084;
    float _2160 = -_1922;
    float _2162 = fma(_2036, _2160, _2128);
    float _2164 = fma(_2088, _1940, _2154);
    bool _2166 = _1543 <= 0.0;
    bool _2168 = !_2146;
    bool _2170 = _2166 || _2168;
    float _2172 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2174 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2176 = _2096 + 0.5;
    float _2178 = _2102 + (-0.5);
    float _2180 = _2156 * _2124;
    float _2182 = exp2(_2172);
    float _2184 = fma(_2174, _2176, _727);
    float _2186 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2188 = _1481 * _1543;
    out.m_64.x = _2158;
    out.m_64.y = _2180;
    out.m_64.z = _2162;
    out.m_64.w = _2164;
    float _2190 = -_1954;
    float _2192 = fma(_2096, _2190, _2184);
    float _2194 = -_2186;
    float _2196 = -_945;
    float _2198 = fma(_2194, _2178, _2196);
    float _2200 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2202 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1946);
    float _2204 = fma(_2102, _1980, _2198);
    float _2206 = _2200 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2208 = _2202 + _1797;
    out.m_66.x = _2192;
    out.m_66.y = _2204;
    float _2210 = -_2182;
    float _2212 = _2210 + 1.0;
    float _2214 = _2208 * 0.5;
    out.m_45.x = _2206;
    float _2216 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1837;
    out.gl_Position.y = _1839;
    out.gl_Position.z = _2202;
    out.gl_Position.w = _1797;
    float _2218 = -_2216;
    float _2220 = _2218 + 1.0;
    out.m_68.z = _2214;
    out.m_68.w = _1797;
    float _2222 = _2216 * _1857;
    float _2224 = _1868 * _2220;
    float _2226 = _1868 * _2222;
    float _2228 = _1882 * _2222;
    float _2230 = fma(_1878, _2226, _1862);
    float _2232 = fma(_1880, _2226, _1864);
    float _2234 = fma(_1868, _2228, _1866);
    out.m_70.x = _2230;
    out.m_70.y = _2232;
    out.m_70.z = _2234;
    out.m_70.w = _2224;
    if (!_2170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2236 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2236;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

