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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_68 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _935 = false;
    bool _837 = false;
    bool _567 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = in.m_44.w;
    float _86 = trunc(_82);
    int _89 = int(_86);
    float _91 = -_84;
    float _93 = _91 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _93;
    bool _97 = _89 >= 1;
    float _99 = 0.0;
    float _101 = as_type<float>(_89);
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _99;
    if (!_97)
    {
        out.m_49.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _103 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2855 = as_type<float>(_109);
        out.gl_Position.z = _2855;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _113 = _84 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_84);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = float(_89);
    bool _125 = _93 >= _123;
    bool _127 = !_121;
    bool _129 = _125 || _127;
    if (_129)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _101;
    if (_129)
    {
        out.m_49.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _111 = as_type<int>(_133);
    }
    int _135 = _111;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2910 = as_type<float>(_135);
        out.gl_Position.z = _2910;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_54.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_44.x;
    float _155 = in.m_44.y;
    float _157 = in.m_44.z;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    int _165 = as_type<int>(_137) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_137) & 2;
    bool _171 = _169 != 0;
    float _173 = _137;
    if (!_151)
    {
        float _175 = _139 * _139;
        float _177 = _175 * 0.5;
        _173 = _177;
    }
    float _179 = _173;
    bool _181 = !_167;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _179;
    if (!_151)
    {
        float _187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_171;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_151;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _139 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _139);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = 1.0 / _123;
    float _235 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _237 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _241 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _243 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _245 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].x, _239);
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].y, _241);
    float _249 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].z, _243);
    float _251 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].x, _245);
    float _253 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].y, _247);
    float _255 = _245;
    if (!_151)
    {
        _255 = _139;
    }
    float _257 = _255;
    bool _259 = !_151;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _139 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _261 = _281;
    }
    float _283 = _261;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _249);
    float _289 = fma(_283, _153, _251);
    float _291 = fma(_283, _155, _253);
    float _293 = _93 * _233;
    float _295 = fma(_283, _157, _287);
    float _297 = fma(_289, _141, _159);
    float _299 = fma(_291, _141, _161);
    float _301 = fma(_295, _141, _163);
    bool _303 = !_285;
    float _305 = _293;
    float _323;
    if (!_303)
    {
        float _307 = in.m_56.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _93);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        _323 = _293;
    }
    _325 = false;
    float _327 = _323;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _327 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _327 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = 1.0 / _339;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _357 = 1.0 / _347;
    bool _359 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _361 = isnan(_327);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _351;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = _327 + _373;
    float _377 = _375 * _353;
    bool _379 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _381 = isnan(_327);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = 1.0 / _343;
    float _393 = _331 * _357;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _397 = _327 + _395;
    float _399 = -_389;
    float _401 = _399 + 1.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _403;
    float _407 = _369 * _401;
    float _409 = _335 * _371;
    bool _411 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _413 = isnan(_327);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -_369;
    float _425 = _423 + 1.0;
    bool _427 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_327);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = fma(_405, _393, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = -_421;
    float _447 = _445 + 1.0;
    float _449 = _421 * _425;
    float _451 = _397 * _391;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    bool _457 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _459 = isnan(_327);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = fma(_443, _409, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _471 = fma(_455, _393, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _437 * _447;
    float _475 = -_437;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = -_467;
    float _485 = _483 + 1.0;
    float _487 = _467 * _477;
    float _489 = fma(_481, _409, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _491 = in.m_54.x;
    float _493 = in.m_54.y;
    float _495 = _471 * _487;
    float _497 = _439 * _487;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _495);
    float _509 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _511 = fma(_501, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _513 = fma(_505, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_489, _473, _507);
    float _525 = fma(_469, _473, _509);
    float _527 = fma(_517, _451, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _529 = fma(_521, _451, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _531 = fma(_511, _449, _523);
    float _533 = fma(_513, _449, _525);
    float _535 = fma(_527, _407, _531);
    float _537 = fma(_529, _407, _533);
    float _539 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[147].x, _535);
    float _541 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[147].y, _537);
    float _543 = _539 * _491;
    float _545 = _541 * _493;
    bool _547 = !_355;
    float _565;
    if (!_547)
    {
        float _549 = in.m_56.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].x, _93);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        _565 = _293;
    }
    _567 = false;
    float _569 = _565;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _573 = _569 + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _577 = _569 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _581 = _569 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _599 = 1.0 / _585;
    float _601 = 1.0 / _589;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _605 = _569 + _603;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _609 = 1.0 / _597;
    float _611 = _577 * _599;
    bool _613 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _615 = isnan(_569);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _593;
    float _627 = _573 * _601;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _629;
    bool _633 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _635 = isnan(_569);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = fma(_631, _611, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _647 = _605 * _609;
    bool _649 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _651 = isnan(_569);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -_643;
    float _663 = _661 + 1.0;
    bool _665 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _667 = isnan(_569);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_659;
    float _679 = _677 + 1.0;
    float _681 = _581 * _625;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _687;
    float _691 = _623 * _679;
    float _693 = -_623;
    float _695 = _693 + 1.0;
    float _697 = fma(_685, _611, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _699 = fma(_689, _611, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _701 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _703 = isnan(_569);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _643 * _695;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _727 = _711 * _663;
    float _729 = -_711;
    float _731 = _729 + 1.0;
    float _733 = fma(_717, _627, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _735 = fma(_725, _627, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _737 = fma(_721, _627, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _739 = _675 * _731;
    float _741 = -_675;
    float _743 = _741 + 1.0;
    float _745 = _645 * _739;
    float _747 = _697 * _739;
    float _749 = _699 * _739;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _755;
    float _759 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[107].x, _745);
    float _761 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[107].y, _747);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _763;
    float _767 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[107].z, _749);
    float _769 = fma(_753, _681, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _771 = fma(_757, _681, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _773 = fma(_735, _727, _761);
    float _775 = fma(_765, _681, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _777 = fma(_733, _727, _759);
    float _779 = fma(_737, _727, _767);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _793 = fma(_769, _713, _777);
    float _795 = fma(_783, _647, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _797 = fma(_787, _647, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _799 = fma(_791, _647, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _801 = fma(_775, _713, _773);
    float _803 = fma(_771, _713, _779);
    float _805 = fma(_795, _691, _793);
    float _807 = fma(_797, _691, _801);
    float _809 = fma(_799, _691, _803);
    float _811 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[111].x, _805);
    float _813 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[111].y, _807);
    float _815 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[111].z, _809);
    bool _817 = !_607;
    float _835;
    if (!_817)
    {
        float _819 = in.m_56.x;
        float _821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _823 = _819 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[11].y, _93);
        float _827 = _825 * _821;
        float _829 = floor(_827);
        float _831 = -_829;
        float _833 = _827 + _831;
        _835 = _833;
        _837 = true;
    }
    else
    {
        _835 = _293;
    }
    _837 = false;
    float _839 = _835;
    bool _841 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _843 = isnan(_839);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _857 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _859 = isnan(_839);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _869;
    bool _873 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _875 = 1.0 / _855;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    float _881 = _867 * _879;
    float _883 = -_867;
    float _885 = _883 + 1.0;
    float _887 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = _871 * _875;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _893 = _839 + _891;
    float _895 = _811 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = fma(_889, _893, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _901 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = _899 * _881;
    float _905 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[115].x, _903);
    float _907 = _813 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _909 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[116].x, _905);
    float _911 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _909 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _901;
    out.m_58.y = _911;
    out.m_58.z = _897;
    out.m_58.w = _913;
    bool _915 = !_873;
    float _933;
    if (!_915)
    {
        float _917 = in.m_56.x;
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _921 = _917 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[11].z, _93);
        float _925 = _923 * _919;
        float _927 = floor(_925);
        float _929 = -_927;
        float _931 = _925 + _929;
        _933 = _931;
        _935 = true;
    }
    else
    {
        _933 = _293;
    }
    _935 = false;
    float _937 = _933;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _941 = _937 + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _945 = _937 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _949 = _937 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _959;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _967 = 1.0 / _953;
    float _969 = 1.0 / _957;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _973 = _937 + _971;
    bool _975 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _977 = 1.0 / _961;
    float _979 = _945 * _967;
    bool _981 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _983 = isnan(_937);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = 1.0 / _965;
    float _995 = _941 * _969;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1001;
    float _1005 = _949 * _977;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1007;
    bool _1011 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1013 = isnan(_937);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1019 = _1015 || _1017;
    float _1021 = float(_1019);
    float _1023 = fma(_1003, _979, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1025 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1027 = isnan(_937);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1033 = _1029 || _1031;
    float _1035 = float(_1033);
    float _1037 = fma(_999, _979, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1039 = fma(_1009, _979, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1041 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1043 = isnan(_937);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = _973 * _993;
    float _1055 = -_991;
    float _1057 = _1055 + 1.0;
    float _1059 = -_1021;
    float _1061 = _1059 + 1.0;
    float _1063 = _1035 * _1057;
    float _1065 = -_1035;
    float _1067 = _1065 + 1.0;
    bool _1069 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1071 = isnan(_937);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _1051 * _1061;
    float _1083 = -_1051;
    float _1085 = _1083 + 1.0;
    float _1087 = _1021 * _1067;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1101 = _1079 * _1085;
    float _1103 = fma(_1091, _995, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1105 = fma(_1095, _995, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1107 = fma(_1099, _995, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1109 = _1023 * _1101;
    float _1111 = _1037 * _1101;
    float _1113 = -_1079;
    float _1115 = _1113 + 1.0;
    float _1117 = _1039 * _1101;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1123;
    float _1127 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1109);
    float _1129 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1111);
    float _1131 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1117);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1133;
    float _1137 = fma(_1103, _1081, _1127);
    float _1139 = fma(_1105, _1081, _1129);
    float _1141 = fma(_1121, _1005, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1143 = fma(_1125, _1005, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1145 = fma(_1107, _1081, _1131);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1155 = fma(_1135, _1005, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1161 = fma(_1141, _1087, _1137);
    float _1163 = fma(_1149, _1053, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1165 = fma(_1153, _1053, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1167 = fma(_1143, _1087, _1139);
    float _1169 = fma(_1159, _1053, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1171 = fma(_1155, _1087, _1145);
    float _1173 = fma(_1163, _1063, _1161);
    float _1175 = fma(_1165, _1063, _1167);
    float _1177 = fma(_1169, _1063, _1171);
    float _1179 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1173);
    float _1181 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1175);
    float _1183 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1177);
    bool _1185 = !_975;
    float _1187 = _1111;
    if (!_1185)
    {
        float _1189 = in.m_56.x;
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1193 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1195 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[11].w, _93);
        float _1197 = _1195 * _1191;
        float _1199 = floor(_1197);
        float _1201 = -_1199;
        float _1203 = _1197 + _1201;
        _305 = _1203;
    }
    float _1205 = _305;
    float _1207 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1211 = _299 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1213 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1217 = _1207 * _1209;
    float _1219 = _299 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1221 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1211);
    float _1223 = _299 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1225 = _1213 * _1215;
    float _1227 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1229 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1219);
    float _1231 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1221);
    float _1233 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1223);
    float _1235 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1237 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1227);
    float _1241 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1229);
    float _1243 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1245 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1233);
    float _1247 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1237);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1239);
    float _1251 = _1241 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1253 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1257 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1247);
    float _1259 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1261 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1253);
    float _1263 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1265 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1267 = _1255 + _1259;
    float _1269 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1261);
    float _1271 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1263);
    float _1273 = _1251 + _1265;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1277 = _1267 + _1275;
    float _1279 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1281 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1285 = _1273 + _1283;
    float _1287 = _1277 * _1277;
    float _1289 = 1.0 / _1279;
    float _1291 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1281);
    bool _1293 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1295 = isnan(0.5);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1301 = _1297 || _1299;
    float _1303 = fma(_1285, _1285, _1287);
    float _1305 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1271);
    float _1307 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1291);
    float _1309 = sqrt(_1303);
    float _1311 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1313 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1315 = _1311 + _1279;
    float _1317 = _1255;
    float _1319 = _1263;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _1323 = _1313;
    float _1325 = _1285;
    float _1327 = _1243;
    float _1329 = _1251;
    if (_1301)
    {
        _1317 = 1.0;
    }
    float _1331 = _1317;
    float _1333 = _1315 * _1289;
    float _1335 = _1333 * 0.5;
    float _1337 = _1243 + _1313;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1341 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1339);
    bool _1343 = _1309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1345 = 1.0 / _1341;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1349 = _1347 != 0;
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1353 = _1351 != 0;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1357 = _1355 != 0;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1361 = _1359 != 0;
    bool _1363 = !_1353;
    int _1365 = _1363 ? 0 : 1;
    bool _1367 = !_1349;
    int _1369 = _1367 ? 0 : 1;
    bool _1371 = !_1357;
    int _1373 = _1371 ? 0 : 1;
    bool _1375 = !_1361;
    int _1377 = _1375 ? 0 : 1;
    float _1379 = _1331;
    if (!_1343)
    {
        _1319 = _1273;
    }
    float _1381 = _1319;
    float _1383 = _1381;
    if (!_1343)
    {
        _1321 = _1267;
    }
    float _1385 = _1321;
    float _1387 = _1385;
    if (!_1343)
    {
        _1323 = _1337;
    }
    float _1389 = _1323;
    bool _1391 = !_1343;
    float _1393 = _1389;
    if (!_1391)
    {
        float _1395 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1399 = _1309 + _1397;
        float _1401 = rsqrt(_1303);
        float _1403 = _1399 * _1395;
        float _1405 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1407 = _1403 * 0.15915493667125701904296875;
        float _1409 = _1407 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1407 * 6.283185482025146484375;
        float _1415 = sin(_1413);
        float _1417 = _1411 + (-1.0);
        float _1419 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1421 = fma(_1415, _1405, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1423 = fma(_1337, _1411, _1419);
        float _1425 = _1401 * _1421;
        float _1427 = fma(_1285, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1429 = fma(_1277, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1393 = _1423;
        _1383 = _1427;
        _1387 = _1429;
    }
    float _1431 = _1393;
    float _1433 = _1383;
    float _1435 = _1387;
    if (_1301)
    {
        _1325 = 1.0;
    }
    float _1437 = _1325;
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1441 = _1345 * _1439;
    float _1443 = _1437;
    if (!_1301)
    {
        float _1445 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1447 = _1445 * 0.15915493667125701904296875;
        float _1449 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1451 = _1447 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        float _1455 = _1449 * 0.15915493667125701904296875;
        float _1457 = _1447 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = 1.0 / _1453;
        float _1463 = _1455 * 6.283185482025146484375;
        float _1465 = cos(_1463);
        float _1467 = _1459 * _1461;
        float _1469 = _1455 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1465 * _1467;
        float _1475 = 1.0 / _1473;
        float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1479 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1477;
        float _1481 = 1.0 / _1479;
        float _1483 = _1471 * _1475;
        float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1487 = fma(_1441, _1483, _1485);
        float _1489 = _1487 * _1481;
        float _1491 = precise::clamp(_1489, 0.0, 1.0);
        _1327 = _1481;
        _1379 = _1491;
    }
    float _1493 = _1327;
    float _1495 = _1379;
    float _1497 = _1493;
    if (!_1301)
    {
        float _1499 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1501 = _1499 * 0.15915493667125701904296875;
        float _1503 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = cos(_1505);
        float _1509 = _1503 * 0.15915493667125701904296875;
        float _1511 = _1501 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = 1.0 / _1507;
        float _1517 = _1509 * 6.283185482025146484375;
        float _1519 = cos(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = _1509 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = 1.0 / _1527;
        float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1533 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1531;
        float _1535 = 1.0 / _1533;
        float _1537 = _1525 * _1529;
        float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1541 = fma(_1441, _1537, _1539);
        float _1543 = _1541 * _1535;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = -_1545;
        float _1549 = _1547 + 1.0;
        _1497 = _1515;
        _1443 = _1549;
    }
    float _1551 = _1497;
    float _1553 = _1443;
    float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1557 = _1431 + _1555;
    float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1561 = _1433 + _1559;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1565 = _1435 + _1563;
    float _1567 = _1557 * _1557;
    float _1569 = fma(_1561, _1561, _1567);
    float _1571 = fma(_1565, _1565, _1569);
    float _1573 = rsqrt(_1571);
    float _1575 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1577 = _1561 * _1575;
    float _1579 = _1565 * _1575;
    float _1581 = _1577 * _1577;
    float _1583 = _1579 * _1579;
    float _1585 = _1581 + _1583;
    float _1587 = sqrt(_1585);
    bool _1589 = _1587 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1593 = _1587 + _1591;
    float _1595 = _1573;
    float _1597 = _1585;
    float _1599 = _1593;
    float _1601 = _1551;
    float _1603 = _1557;
    if (_1589)
    {
        float _1605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1605;
    }
    float _1607 = _1595;
    if (_1589)
    {
        float _1609 = rsqrt(_1585);
        _1597 = _1609;
    }
    float _1611 = _1597;
    float _1613 = _1611;
    if (_1589)
    {
        float _1615 = _1593 * _1607;
        _1599 = _1615;
    }
    float _1617 = _1599;
    if (_1589)
    {
        float _1619 = _1617 * 0.15915493667125701904296875;
        _1601 = _1619;
    }
    float _1621 = _1601;
    float _1623 = _1565;
    if (_1589)
    {
        float _1625 = _1621 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1633 = precise::max(0.0, _1631);
    float _1635 = _1607;
    float _1637 = _1633;
    if (_1589)
    {
        float _1639 = _1621 * 6.283185482025146484375;
        float _1641 = cos(_1639);
        _1635 = _1641;
    }
    float _1643 = _1635;
    float _1645 = -_1575;
    float _1647 = -_1633;
    float _1649 = fma(_1557, _1645, _1647);
    if (_1589)
    {
        float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1603 = _1651;
    }
    float _1653 = _1603;
    float _1655 = sqrt(_1571);
    float _1657 = _1653;
    float _1659 = _1629;
    if (_1589)
    {
        float _1661 = fma(_1629, _1653, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1657 = _1661;
    }
    float _1663 = _1657;
    float _1665 = _1663;
    if (!_1589)
    {
        _1659 = _1577;
    }
    float _1667 = _1659;
    float _1669 = _1667;
    float _1671 = _1643;
    if (_1589)
    {
        float _1673 = _1643 + (-1.0);
        _1637 = _1673;
    }
    float _1675 = _1637;
    float _1677 = _1675;
    if (_1589)
    {
        float _1679 = _1611 * _1663;
        _1187 = _1679;
    }
    float _1681 = _1187;
    if (!_1589)
    {
        _1665 = _1649;
    }
    float _1683 = _1665;
    float _1685 = _1683;
    if (_1589)
    {
        float _1687 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1687;
    }
    float _1689 = _1329;
    if (_1589)
    {
        float _1691 = _1577 * _1681;
        _1669 = _1691;
    }
    float _1693 = _1669;
    if (!_1589)
    {
        _1677 = _1579;
    }
    float _1695 = _1677;
    float _1697 = _1695;
    if (_1589)
    {
        float _1699 = _1579 * _1681;
        _1697 = _1699;
    }
    float _1701 = _1697;
    if (!_1589)
    {
        _1613 = _1581;
    }
    float _1703 = _1613;
    float _1705 = _1703;
    if (_1589)
    {
        float _1707 = fma(_1649, _1643, _1689);
        _1685 = _1707;
    }
    float _1709 = _1685;
    if (_1589)
    {
        float _1711 = _1693 * _1693;
        _1705 = _1711;
    }
    float _1713 = _1705;
    if (!_1589)
    {
        _1671 = _1583;
    }
    float _1715 = _1671;
    float _1717 = _1715;
    if (_1589)
    {
        float _1719 = _1701 * _1701;
        _1717 = _1719;
    }
    float _1721 = _1717;
    float _1723 = fma(_1709, _1709, _1713);
    float _1725 = _1723 + _1721;
    float _1727 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1729 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1731 = fma(_1655, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1729);
    float _1733 = precise::clamp(_1731, 0.0, 1.0);
    float _1735 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1737 = rsqrt(_1725);
    float _1739 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1727);
    float _1741 = -_1733;
    float _1743 = _1741 + 1.0;
    float _1745 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1735);
    float _1747 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1749 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1739);
    float _1751 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1753 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1755 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1745);
    float _1757 = abs(_1743);
    float _1759 = log2(_1757);
    float _1761 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1751);
    float _1763 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1753);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1767 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1761);
    float _1771 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1763);
    float _1773 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1775 = _1737 * _1693;
    float _1777 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1779 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = _1737 * _1709;
    float _1783 = _1737 * _1701;
    float _1785 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1773);
    float _1787 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1789 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1791 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1793 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1785);
    float _1795 = -_1787;
    float _1797 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1795);
    float _1799 = -_1789;
    float _1801 = fma(_1799, _1747, 1.0);
    float _1803 = exp2(_1791);
    float _1805 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1793);
    float _1807 = -_1783;
    float _1809 = fma(_1807, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1797);
    float _1811 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1813 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1815 = fma(_1809, -0.5, 0.5);
    float _1817 = fma(_1809, 0.5, 0.5);
    float _1819 = log2(_1801);
    float _1821 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1811);
    float _1823 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1813);
    float _1825 = _1781 + 1.0;
    float _1827 = fma(_1817, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1829 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1821);
    float _1831 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1823);
    float _1833 = 1.0 / _1805;
    float _1835 = -_1781;
    float _1837 = fma(_1803, _1825, _1835);
    float _1839 = fma(_1817, _1827, -0.212114393711090087890625);
    float _1841 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1829);
    float _1843 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1831);
    float _1845 = fma(_1837, 0.5, 0.5);
    float _1847 = fma(_1817, _1839, 1.570728778839111328125);
    float _1849 = sqrt(_1815);
    float _1851 = _1819 * 0.693147182464599609375;
    float _1853 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1855 = _1841 * _1833;
    float _1857 = _1843 * _1833;
    float _1859 = fma(_1855, 0.5, 0.5);
    float _1861 = fma(_1857, -0.5, 0.5);
    float _1863 = _1849 * 0.636619746685028076171875;
    float _1865 = -_1847;
    float _1867 = fma(_1863, _1865, 1.0);
    float3 _5733 = float3(_1859, _1861, _1853);
    float _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5733, float3(0.0), isnan(_5733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5733, float3(0.0), isnan(_5733)), level(0.0)).x;
    float3 _5744 = float3(_1859, _1861, _1853);
    float4 _1872 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5744, float3(0.0), isnan(_5744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5744, float3(0.0), isnan(_5744)), level(0.0)).xyzw;
    float _1874 = _1872.x;
    float _1876 = _1872.y;
    float _1878 = _1872.z;
    float _1880 = _1872.w;
    float2 _5761 = float2(_1867, _1845);
    float3 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5761, float2(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5761, float2(0.0), isnan(_5761)), level(0.0)).xyz;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1894 = int(_1892);
    int _1896 = abs(_1365);
    float _1898 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1900 = abs(_1373);
    float _1902 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1904 = _1181 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1906 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1908 = isnan(_1205);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1914 = _1910 || _1912;
    float _1916 = float(_1914);
    float _1918 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1920 = int(_1918);
    float _1922 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1902);
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1926 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1922);
    float _1928 = float(_1894);
    float _1930 = exp2(_1898);
    float _1932 = float(uint(_1920));
    float _1934 = 1.0 / _1928;
    int _1936 = ~_1920;
    int _1938 = _1936 + 1;
    int _1940 = ~_1920;
    int _1942 = _1940 + 1;
    float _1944 = 1.0 / _1932;
    int _1946 = ~_1920;
    int _1948 = _1946 + 1;
    float _1950 = -_1930;
    float _1952 = _1950 + 1.0;
    float _1954 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1956 = _93 * _1934;
    float _1958 = float(_1920);
    float _1960 = trunc(_1956);
    int _1962 = int(_1960);
    int _1964 = as_type<int>(_1944) + (-2);
    float _1966 = float(uint(_1962));
    float _1968 = as_type<float>(_1964) * _1966;
    float _1970 = in.m_56.x;
    float _1972 = in.m_56.y;
    float _1974 = in.m_56.z;
    float _1976 = in.m_56.w;
    float _1978 = trunc(_1968);
    float _1980 = precise::max(_1978, 0.0);
    uint _1983 = uint(_1980);
    int _1985 = _1948 * int(_1983);
    int _1987 = _1985 + _1962;
    float _1989 = float(uint(_1987));
    bool _1991 = _1976 > 0.5;
    float _1993 = as_type<float>(_1964) * _1989;
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1997 = _1995 != 0;
    float _1999 = trunc(_1993);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    bool _2005 = !_1997;
    float _2007 = _2005 ? 1.2345600128173828125 : 1.0;
    bool _2009 = !_1997;
    float _2011 = _2009 ? _1972 : _1970;
    int _2013 = _1920 + (-1);
    float _2015 = _2011 * _2007;
    float _2017 = 0.0;
    float _2019 = _1974;
    if (!_1997)
    {
        _2017 = _1974;
    }
    float _2021 = _2017;
    float _2023 = _2021;
    if (_1997)
    {
        _2023 = _1972;
    }
    float _2025 = _2023;
    float _2027 = floor(_2015);
    int _2029 = int(_1983) + int(_2003);
    float _2031 = float(_1962);
    int _2033 = _1938 * _2029;
    int _2035 = _2033 + _1962;
    bool _2037 = _2031 >= _1958;
    bool _2039 = isnan(_2031);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(_1958);
    bool _2045 = _2041 || _2043;
    float _2047 = float(_2045);
    bool _2049 = uint(_2035) >= uint(_1920);
    float _2051 = trunc(_2047);
    int _2053 = int(_2051);
    bool _2055 = !_2049;
    int _2057 = _2055 ? 0 : (-1);
    float _2059 = -_2027;
    float _2061 = _2015 + _2059;
    bool _2063 = _1920 == 0;
    int _2065 = ~_2029;
    int _2067 = _2065 + _2057;
    int _2069 = _2067 + 1;
    float _2071 = _93 * _1958;
    float _2073 = _2061 * _1958;
    int _2075 = _1920 * _2069;
    int _2077 = _2075 + _1962;
    float _2079 = _2071 * _233;
    float _2081 = trunc(_2073);
    int _2083 = int(_2081);
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2087 = _2085 != 0;
    int _2089 = ~_2053;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    bool _2095 = !_2063;
    int _2097 = _2095 ? _2077 : (-1);
    bool _2099 = !_2087;
    int _2101 = _2099 ? 0 : 1;
    float _2103 = trunc(_2079);
    int _2105 = int(_2103);
    int _2107 = abs(_1369);
    int _2109 = _2097 * _2093;
    int _2111 = abs(_2101);
    int _2113 = _2053 * _2013;
    int _2115 = _2113 + _2109;
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2119 = _2117 != 0;
    int _2121 = _2115 * _1896;
    int _2123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2125 = _2123 != 0;
    int _2127 = _2083 * _2111;
    int _2129 = _2127 + _1962;
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2133 = _2131 != 0;
    int _2135 = _2105 * _2107;
    int _2137 = _2135 + _2121;
    int _2139 = abs(_1377);
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2143 = _2141 != 0;
    int _2145 = _2129 * _1900;
    int _2147 = _2145 + _2137;
    float _2149 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2151 = _2083 * _2139;
    int _2153 = _2151 + _2147;
    float _2155 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2157 = _2155 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2159 = -_193;
    int _2161 = _1991 ? as_type<int>(_2159) : as_type<int>(_193);
    float _2163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2165 = float(uint(_2153));
    float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2169 = _2167 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2173 = _2171 != 0;
    float _2175 = fma(_2149, -2.0, _2163);
    float _2177 = as_type<float>(_1964) * _2165;
    float _2179 = 1.0 / _2169;
    int _2181 = ~_1920;
    int _2183 = _2181 + 1;
    float _2185 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2189 = float(uint(_2129));
    float _2191 = -_2187;
    float _2193 = fma(_2185, 2.0, _2191);
    float _2195 = trunc(_2177);
    float _2197 = precise::max(_2195, 0.0);
    uint _2199 = uint(_2197);
    float _2201 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2201;
    float _2205 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2207 = _2205 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2209 = 1.0 / _2157;
    float _2211 = _2203 * _2179;
    float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2215 = _2213 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2217 = 1.0 / _2207;
    bool _2219 = !_2119;
    float _2221 = _2219 ? _193 : as_type<float>(_2161);
    bool _2223 = _1970 > 0.5;
    int _2225 = _2183 * int(_2199);
    int _2227 = _2225 + _2153;
    float _2229 = -_183;
    int _2231 = _2223 ? as_type<int>(_2229) : as_type<int>(_183);
    float _2233 = _2215 * _2209;
    bool _2235 = _1972 > 0.5;
    float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2239 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2237;
    float _2241 = float(uint(_2227));
    float _2243 = -_193;
    int _2245 = _2235 ? as_type<int>(_2243) : as_type<int>(_193);
    float _2247 = _2239 * _2217;
    bool _2249 = _1974 > 0.5;
    float _2251 = as_type<float>(_1964) * _2241;
    float _2253 = _2217;
    if (!_1997)
    {
        _2253 = _1972;
    }
    float _2255 = _2253;
    float _2257 = trunc(_2251);
    float _2259 = precise::max(_2257, 0.0);
    uint _2261 = uint(_2259);
    bool _2263 = !_2133;
    float _2265 = _2263 ? _183 : as_type<float>(_2231);
    float _2267 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1924);
    float _2269 = -_183;
    int _2271 = _2249 ? as_type<int>(_2269) : as_type<int>(_183);
    float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2275 = _1205 + _2273;
    float _2277 = _2255;
    if (_1997)
    {
        _2277 = _1970;
    }
    float _2279 = _2277;
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2283 = !_2143;
    float _2285 = _2283 ? _193 : as_type<float>(_2245);
    float _2287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2289 = !_2173;
    float _2291 = _2289 ? _183 : as_type<float>(_2271);
    float _2293 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2281);
    float _2295 = fma(_2233, _2275, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2299 = _1205 + _2297;
    if (_1997)
    {
        _2019 = _1972;
    }
    float _2301 = _2019;
    float _2303 = _2285 + (-0.5);
    bool _2305 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2307 = isnan(_1205);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2313 = _2309 || _2311;
    float _2315 = float(_2313);
    float _2317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2319 = fma(_2211, _2299, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2321 = int(_2199) + int(_2261);
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2325 = _1205 + _2323;
    bool _2327 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2329 = isnan(_1205);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2335 = _2331 || _2333;
    float _2337 = float(_2335);
    float _2339 = -_2315;
    float _2341 = _2339 + 1.0;
    float _2343 = fma(_2247, _2325, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2345 = _1942 * _2321;
    int _2347 = _2345 + _2153;
    float _2349 = -_2337;
    float _2351 = _2349 + 1.0;
    bool _2353 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2355 = isnan(_1205);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2361 = _2357 || _2359;
    float _2363 = float(_2361);
    float _2365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2367 = _1916 * _2341;
    float _2369 = _2315 * _2351;
    bool _2371 = uint(_2347) >= uint(_1920);
    float _2373 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2365);
    float _2375 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2377 = as_type<float>(_1964) * _2189;
    bool _2379 = !_2371;
    int _2381 = _2379 ? 0 : (-1);
    float _2383 = -_1916;
    float _2385 = _2383 + 1.0;
    float _2387 = -_93;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2193);
    float _2391 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2175);
    int _2393 = ~_2321;
    int _2395 = _2393 + _2381;
    int _2397 = _2395 + 1;
    float _2399 = trunc(_2377);
    float _2401 = precise::max(_2399, 0.0);
    uint _2403 = uint(_2401);
    float _2405 = _2287 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2407 = _2265 + 0.5;
    float _2409 = _2363 * _2385;
    int _2411 = _1920 * _2397;
    int _2413 = _2411 + _2153;
    float _2415 = fma(_2405, _2407, _2389);
    float _2417 = -_2375;
    float _2419 = -_2391;
    float _2421 = fma(_2417, _2303, _2419);
    float _2423 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2425 = !_2063;
    int _2427 = _2425 ? _2413 : (-1);
    float _2429 = _2319 * _2409;
    int _2431 = ~_1920;
    int _2433 = _2431 + 1;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2437 = _2427 >> 31;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2441 = _2433 * int(_2403);
    int _2443 = _2441 + _2129;
    int _2445 = _2437 & 3;
    float _2447 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2435);
    float _2449 = _2279 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2453 = _2427 + _2445;
    float _2455 = -_2363;
    float _2457 = _2455 + 1.0;
    float _2459 = fma(_2423, -2.0, _2439);
    float _2461 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2293);
    int _2463 = _2453 >> 2;
    float _2465 = -_2451;
    float _2467 = fma(_2449, 2.0, _2465);
    float _2469 = float(uint(_2443));
    float _2471 = fma(_2457, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2429);
    int _2473 = _2463 << 4;
    int _2475 = _2473 + 512;
    float _2477 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2447);
    float _2479 = -_93;
    float _2481 = fma(_2479, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2467);
    float _2483 = as_type<float>(_1964) * _2469;
    uint _2485 = uint(int(uint(_2475) >> uint(2)));
    uint _2487 = uint(int(uint(int(_2485)) >> uint(2)));
    int _2489 = int(_2485) & 3;
    float _2491 = (*spvDescriptorSet0.vp_c9)._m0[int(_2487)][_2489];
    int _2493 = int(_2485) + 1;
    uint _2495 = uint(int(uint(_2493) >> uint(2)));
    int _2497 = _2493 & 3;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[int(_2495)][_2497];
    float _2501 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2267);
    float _2503 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2373);
    float _2505 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2459);
    float _2507 = fma(_2295, _2367, _2471);
    float _2509 = -_2501;
    float _2511 = _2509 + 1.0;
    int _2513 = _2427 & 3;
    bool _2515 = _2513 != 0;
    float _2517 = _2291 + 0.5;
    int _2519 = _2475 + 8;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    uint _2523 = uint(int(uint(int(_2521)) >> uint(2)));
    int _2525 = int(_2521) & 3;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[int(_2523)][_2525];
    int _2529 = int(_2521) + 1;
    uint _2531 = uint(int(uint(_2529) >> uint(2)));
    int _2533 = _2529 & 3;
    float _2535 = (*spvDescriptorSet0.vp_c9)._m0[int(_2531)][_2533];
    int _2537 = _2427 & 3;
    bool _2539 = _2537 != 0;
    float _2541 = -_2477;
    float _2543 = _2541 + 1.0;
    float _2545 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2481);
    float _2547 = trunc(_2483);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    bool _2553 = uint(_2537) > 1u;
    float _2555 = -_2461;
    float _2557 = _2555 + 1.0;
    bool _2559 = _2537 != 3;
    float _2561 = -_2543;
    float _2563 = fma(_2291, _2561, _2545);
    int _2565 = _2515 ? 0 : 1;
    float _2567 = _2221 + (-0.5);
    bool _2569 = uint(_2537) >= 2u;
    float _2571 = fma(_2285, _2557, _2421);
    int _2573 = ~_2565;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    float _2579 = -_2511;
    float _2581 = fma(_2265, _2579, _2415);
    float _2583 = -_2567;
    float _2585 = -_2505;
    float _2587 = fma(_2583, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2585);
    float _2589 = -_2503;
    float _2591 = _2589 + 1.0;
    int _2593 = _2569 ? 0 : 1;
    float _2595 = fma(_2343, _2369, _2507);
    int _2597 = _2577;
    if (!_2553)
    {
        int _2599 = ~_2565;
        int _2601 = _2599 + 1;
        _2597 = _2601;
    }
    int _2603 = _2597;
    float _2605 = fma(_2221, _2591, _2587);
    bool _2607 = !_2539;
    int _2609 = _2607 ? 0 : 1;
    float _2611 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2595);
    int _2613 = abs(_2603);
    float _2615 = _1954 * _1869;
    int _2617 = ~_2593;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    out.m_60.x = _2581;
    out.m_60.y = _2571;
    out.m_60.z = _2563;
    out.m_60.w = _2605;
    int _2623 = _2621;
    if (_2559)
    {
        int _2625 = ~_2593;
        int _2627 = _2625 + 1;
        _2623 = _2627;
    }
    int _2629 = _2623;
    float _2631 = -_1954;
    float _2633 = _2631 + 1.0;
    bool _2635 = _2537 != 3;
    int _2637 = abs(_2609);
    int _2639 = int(_2403) + int(_2551);
    int _2641 = ~_1920;
    int _2643 = _2641 + 1;
    bool _2645 = !_2635;
    int _2647 = _2645 ? 0 : (-1);
    int _2649 = _2643 * _2639;
    int _2651 = _2649 + _2129;
    int _2653 = ~_2613;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    int _2659 = abs(_2647);
    int _2661 = abs(_2629);
    int _2663 = _2657 * as_type<int>(_2499);
    int _2665 = ~_2637;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    bool _2671 = uint(_2651) >= uint(_1920);
    int _2673 = ~_2661;
    int _2675 = _2673 + 1;
    int _2677 = _2675 + 1;
    int _2679 = _2669 * as_type<int>(_2491);
    int _2681 = _2679 + _2663;
    bool _2683 = !_2671;
    int _2685 = _2683 ? 0 : (-1);
    float _2687 = _1495 * _1553;
    int _2689 = _2677 * as_type<int>(_2527);
    int _2691 = _2689 + _2681;
    bool _2693 = !_2125;
    int _2695 = _2693 ? 0 : 1;
    float _2697 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2699 = ~_2639;
    int _2701 = _2699 + _2685;
    int _2703 = _2701 + 1;
    int _2705 = ~_2659;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    float _2711 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2713 = abs(_2695);
    int _2715 = _1920 * _2703;
    int _2717 = _2715 + _2129;
    float _2719 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2721 = _2709 * as_type<int>(_2535);
    int _2723 = _2721 + _2691;
    int _2725 = ~_2713;
    int _2727 = _2725 + 1;
    int _2729 = _2727 + 1;
    float _2731 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2733 = !_2063;
    int _2735 = _2733 ? _2717 : (-1);
    float _2737 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2739 = _1495 > 0.0;
    bool _2741 = isnan(_1495);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan(0.0);
    bool _2747 = _2743 || _2745;
    int _2749 = _2723 * _2729;
    float _2751 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1926);
    float _2753 = _2737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2755 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2757 = _2735 * _2713;
    int _2759 = _2757 + _2749;
    float _2761 = _2697 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2763 = _2751 + _1805;
    bool _2765 = _1553 <= 0.0;
    bool _2767 = !_2747;
    bool _2769 = _2765 || _2767;
    out.m_62.x = _2753;
    out.m_62.y = _2719;
    out.m_62.z = _2755;
    out.m_62.w = _2731;
    float _2771 = _2763 * 0.5;
    float _2773 = float(_2759);
    float _2775 = _1890 * _2615;
    out.m_49.x = _2761;
    out.gl_Position.x = _1841;
    out.gl_Position.y = _1843;
    out.gl_Position.z = _2751;
    out.gl_Position.w = _1805;
    out.m_64.y = _2773;
    float _2777 = _1880 * _2615;
    float _2779 = _1880 * _2633;
    out.m_66.z = _2771;
    out.m_66.w = _1805;
    float _2781 = fma(_1886, _2777, _1874);
    float _2783 = fma(_1888, _2777, _1876);
    float _2785 = fma(_1880, _2775, _1878);
    out.m_68.x = _2781;
    out.m_68.y = _2783;
    out.m_68.z = _2785;
    out.m_68.w = _2779;
    if (!_2769)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2787 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2787;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _935 = false;
    bool _837 = false;
    bool _567 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = in.m_44.w;
    float _86 = trunc(_82);
    int _89 = int(_86);
    float _91 = -_84;
    float _93 = _91 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _93;
    bool _97 = _89 >= 1;
    float _99 = 0.0;
    float _101 = as_type<float>(_89);
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _99;
    if (!_97)
    {
        out.m_49.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _103 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2855 = as_type<float>(_109);
        out.gl_Position.z = _2855;
    }
    if (!_97)
    {
        return out;
    }
    bool _113 = _84 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_84);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = float(_89);
    bool _125 = _93 >= _123;
    bool _127 = !_121;
    bool _129 = _125 || _127;
    if (_129)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _101;
    if (_129)
    {
        out.m_49.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _111 = as_type<int>(_133);
    }
    int _135 = _111;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2910 = as_type<float>(_135);
        out.gl_Position.z = _2910;
    }
    if (_129)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_54.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_44.x;
    float _155 = in.m_44.y;
    float _157 = in.m_44.z;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    int _165 = as_type<int>(_137) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_137) & 2;
    bool _171 = _169 != 0;
    float _173 = _137;
    if (!_151)
    {
        float _175 = _139 * _139;
        float _177 = _175 * 0.5;
        _173 = _177;
    }
    float _179 = _173;
    bool _181 = !_167;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _179;
    if (!_151)
    {
        float _187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_171;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_151;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _139 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _139);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = 1.0 / _123;
    float _235 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _237 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _241 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _243 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _245 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].x, _239);
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].y, _241);
    float _249 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].z, _243);
    float _251 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].x, _245);
    float _253 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].y, _247);
    float _255 = _245;
    if (!_151)
    {
        _255 = _139;
    }
    float _257 = _255;
    bool _259 = !_151;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _139 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _261 = _281;
    }
    float _283 = _261;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _249);
    float _289 = fma(_283, _153, _251);
    float _291 = fma(_283, _155, _253);
    float _293 = _93 * _233;
    float _295 = fma(_283, _157, _287);
    float _297 = fma(_289, _141, _159);
    float _299 = fma(_291, _141, _161);
    float _301 = fma(_295, _141, _163);
    bool _303 = !_285;
    float _305 = _293;
    float _323;
    if (!_303)
    {
        float _307 = in.m_56.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _93);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        _323 = _293;
    }
    _325 = false;
    float _327 = _323;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _327 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _327 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = 1.0 / _339;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _357 = 1.0 / _347;
    bool _359 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _361 = isnan(_327);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _351;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = _327 + _373;
    float _377 = _375 * _353;
    bool _379 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _381 = isnan(_327);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = 1.0 / _343;
    float _393 = _331 * _357;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _397 = _327 + _395;
    float _399 = -_389;
    float _401 = _399 + 1.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _403;
    float _407 = _369 * _401;
    float _409 = _335 * _371;
    bool _411 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _413 = isnan(_327);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -_369;
    float _425 = _423 + 1.0;
    bool _427 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_327);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = fma(_405, _393, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = -_421;
    float _447 = _445 + 1.0;
    float _449 = _421 * _425;
    float _451 = _397 * _391;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    bool _457 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _459 = isnan(_327);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = fma(_443, _409, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _471 = fma(_455, _393, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _437 * _447;
    float _475 = -_437;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = -_467;
    float _485 = _483 + 1.0;
    float _487 = _467 * _477;
    float _489 = fma(_481, _409, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _491 = in.m_54.x;
    float _493 = in.m_54.y;
    float _495 = _471 * _487;
    float _497 = _439 * _487;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _495);
    float _509 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _511 = fma(_501, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _513 = fma(_505, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_489, _473, _507);
    float _525 = fma(_469, _473, _509);
    float _527 = fma(_517, _451, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _529 = fma(_521, _451, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _531 = fma(_511, _449, _523);
    float _533 = fma(_513, _449, _525);
    float _535 = fma(_527, _407, _531);
    float _537 = fma(_529, _407, _533);
    float _539 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[147].x, _535);
    float _541 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[147].y, _537);
    float _543 = _539 * _491;
    float _545 = _541 * _493;
    bool _547 = !_355;
    float _565;
    if (!_547)
    {
        float _549 = in.m_56.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].x, _93);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        _565 = _293;
    }
    _567 = false;
    float _569 = _565;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _573 = _569 + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _577 = _569 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _581 = _569 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _599 = 1.0 / _585;
    float _601 = 1.0 / _589;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _605 = _569 + _603;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _609 = 1.0 / _597;
    float _611 = _577 * _599;
    bool _613 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _615 = isnan(_569);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _593;
    float _627 = _573 * _601;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _629;
    bool _633 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _635 = isnan(_569);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = fma(_631, _611, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _647 = _605 * _609;
    bool _649 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _651 = isnan(_569);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -_643;
    float _663 = _661 + 1.0;
    bool _665 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _667 = isnan(_569);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_659;
    float _679 = _677 + 1.0;
    float _681 = _581 * _625;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _687;
    float _691 = _623 * _679;
    float _693 = -_623;
    float _695 = _693 + 1.0;
    float _697 = fma(_685, _611, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _699 = fma(_689, _611, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _701 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _703 = isnan(_569);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _643 * _695;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _727 = _711 * _663;
    float _729 = -_711;
    float _731 = _729 + 1.0;
    float _733 = fma(_717, _627, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _735 = fma(_725, _627, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _737 = fma(_721, _627, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _739 = _675 * _731;
    float _741 = -_675;
    float _743 = _741 + 1.0;
    float _745 = _645 * _739;
    float _747 = _697 * _739;
    float _749 = _699 * _739;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _755;
    float _759 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[107].x, _745);
    float _761 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[107].y, _747);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _763;
    float _767 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[107].z, _749);
    float _769 = fma(_753, _681, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _771 = fma(_757, _681, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _773 = fma(_735, _727, _761);
    float _775 = fma(_765, _681, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _777 = fma(_733, _727, _759);
    float _779 = fma(_737, _727, _767);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _793 = fma(_769, _713, _777);
    float _795 = fma(_783, _647, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _797 = fma(_787, _647, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _799 = fma(_791, _647, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _801 = fma(_775, _713, _773);
    float _803 = fma(_771, _713, _779);
    float _805 = fma(_795, _691, _793);
    float _807 = fma(_797, _691, _801);
    float _809 = fma(_799, _691, _803);
    float _811 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[111].x, _805);
    float _813 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[111].y, _807);
    float _815 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[111].z, _809);
    bool _817 = !_607;
    float _835;
    if (!_817)
    {
        float _819 = in.m_56.x;
        float _821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _823 = _819 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[11].y, _93);
        float _827 = _825 * _821;
        float _829 = floor(_827);
        float _831 = -_829;
        float _833 = _827 + _831;
        _835 = _833;
        _837 = true;
    }
    else
    {
        _835 = _293;
    }
    _837 = false;
    float _839 = _835;
    bool _841 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _843 = isnan(_839);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _857 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _859 = isnan(_839);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _869;
    bool _873 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _875 = 1.0 / _855;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    float _881 = _867 * _879;
    float _883 = -_867;
    float _885 = _883 + 1.0;
    float _887 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = _871 * _875;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _893 = _839 + _891;
    float _895 = _811 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = fma(_889, _893, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _901 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = _899 * _881;
    float _905 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[115].x, _903);
    float _907 = _813 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _909 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[116].x, _905);
    float _911 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _909 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _901;
    out.m_58.y = _911;
    out.m_58.z = _897;
    out.m_58.w = _913;
    bool _915 = !_873;
    float _933;
    if (!_915)
    {
        float _917 = in.m_56.x;
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _921 = _917 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[11].z, _93);
        float _925 = _923 * _919;
        float _927 = floor(_925);
        float _929 = -_927;
        float _931 = _925 + _929;
        _933 = _931;
        _935 = true;
    }
    else
    {
        _933 = _293;
    }
    _935 = false;
    float _937 = _933;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _941 = _937 + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _945 = _937 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _949 = _937 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _959;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _967 = 1.0 / _953;
    float _969 = 1.0 / _957;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _973 = _937 + _971;
    bool _975 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _977 = 1.0 / _961;
    float _979 = _945 * _967;
    bool _981 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _983 = isnan(_937);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = 1.0 / _965;
    float _995 = _941 * _969;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1001;
    float _1005 = _949 * _977;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1007;
    bool _1011 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1013 = isnan(_937);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1019 = _1015 || _1017;
    float _1021 = float(_1019);
    float _1023 = fma(_1003, _979, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1025 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1027 = isnan(_937);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1033 = _1029 || _1031;
    float _1035 = float(_1033);
    float _1037 = fma(_999, _979, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1039 = fma(_1009, _979, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1041 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1043 = isnan(_937);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = _973 * _993;
    float _1055 = -_991;
    float _1057 = _1055 + 1.0;
    float _1059 = -_1021;
    float _1061 = _1059 + 1.0;
    float _1063 = _1035 * _1057;
    float _1065 = -_1035;
    float _1067 = _1065 + 1.0;
    bool _1069 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1071 = isnan(_937);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _1051 * _1061;
    float _1083 = -_1051;
    float _1085 = _1083 + 1.0;
    float _1087 = _1021 * _1067;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1101 = _1079 * _1085;
    float _1103 = fma(_1091, _995, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1105 = fma(_1095, _995, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1107 = fma(_1099, _995, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1109 = _1023 * _1101;
    float _1111 = _1037 * _1101;
    float _1113 = -_1079;
    float _1115 = _1113 + 1.0;
    float _1117 = _1039 * _1101;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1123;
    float _1127 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1109);
    float _1129 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1111);
    float _1131 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1117);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1133;
    float _1137 = fma(_1103, _1081, _1127);
    float _1139 = fma(_1105, _1081, _1129);
    float _1141 = fma(_1121, _1005, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1143 = fma(_1125, _1005, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1145 = fma(_1107, _1081, _1131);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1155 = fma(_1135, _1005, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1161 = fma(_1141, _1087, _1137);
    float _1163 = fma(_1149, _1053, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1165 = fma(_1153, _1053, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1167 = fma(_1143, _1087, _1139);
    float _1169 = fma(_1159, _1053, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1171 = fma(_1155, _1087, _1145);
    float _1173 = fma(_1163, _1063, _1161);
    float _1175 = fma(_1165, _1063, _1167);
    float _1177 = fma(_1169, _1063, _1171);
    float _1179 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1173);
    float _1181 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1175);
    float _1183 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1177);
    bool _1185 = !_975;
    float _1187 = _1111;
    if (!_1185)
    {
        float _1189 = in.m_56.x;
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1193 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1195 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[11].w, _93);
        float _1197 = _1195 * _1191;
        float _1199 = floor(_1197);
        float _1201 = -_1199;
        float _1203 = _1197 + _1201;
        _305 = _1203;
    }
    float _1205 = _305;
    float _1207 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1211 = _299 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1213 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1217 = _1207 * _1209;
    float _1219 = _299 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1221 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1211);
    float _1223 = _299 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1225 = _1213 * _1215;
    float _1227 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1229 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1219);
    float _1231 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1221);
    float _1233 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1223);
    float _1235 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1237 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1227);
    float _1241 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1229);
    float _1243 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1245 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1233);
    float _1247 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1237);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1239);
    float _1251 = _1241 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1253 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1257 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1247);
    float _1259 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1261 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1253);
    float _1263 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1265 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1267 = _1255 + _1259;
    float _1269 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1261);
    float _1271 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1263);
    float _1273 = _1251 + _1265;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1277 = _1267 + _1275;
    float _1279 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1281 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1285 = _1273 + _1283;
    float _1287 = _1277 * _1277;
    float _1289 = 1.0 / _1279;
    float _1291 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1281);
    bool _1293 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1295 = isnan(0.5);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1301 = _1297 || _1299;
    float _1303 = fma(_1285, _1285, _1287);
    float _1305 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1271);
    float _1307 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1291);
    float _1309 = sqrt(_1303);
    float _1311 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1313 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1315 = _1311 + _1279;
    float _1317 = _1255;
    float _1319 = _1263;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _1323 = _1313;
    float _1325 = _1285;
    float _1327 = _1243;
    float _1329 = _1251;
    if (_1301)
    {
        _1317 = 1.0;
    }
    float _1331 = _1317;
    float _1333 = _1315 * _1289;
    float _1335 = _1333 * 0.5;
    float _1337 = _1243 + _1313;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1341 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1339);
    bool _1343 = _1309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1345 = 1.0 / _1341;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1349 = _1347 != 0;
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1353 = _1351 != 0;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1357 = _1355 != 0;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1361 = _1359 != 0;
    bool _1363 = !_1353;
    int _1365 = _1363 ? 0 : 1;
    bool _1367 = !_1349;
    int _1369 = _1367 ? 0 : 1;
    bool _1371 = !_1357;
    int _1373 = _1371 ? 0 : 1;
    bool _1375 = !_1361;
    int _1377 = _1375 ? 0 : 1;
    float _1379 = _1331;
    if (!_1343)
    {
        _1319 = _1273;
    }
    float _1381 = _1319;
    float _1383 = _1381;
    if (!_1343)
    {
        _1321 = _1267;
    }
    float _1385 = _1321;
    float _1387 = _1385;
    if (!_1343)
    {
        _1323 = _1337;
    }
    float _1389 = _1323;
    bool _1391 = !_1343;
    float _1393 = _1389;
    if (!_1391)
    {
        float _1395 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1399 = _1309 + _1397;
        float _1401 = rsqrt(_1303);
        float _1403 = _1399 * _1395;
        float _1405 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1407 = _1403 * 0.15915493667125701904296875;
        float _1409 = _1407 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1407 * 6.283185482025146484375;
        float _1415 = sin(_1413);
        float _1417 = _1411 + (-1.0);
        float _1419 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1421 = fma(_1415, _1405, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1423 = fma(_1337, _1411, _1419);
        float _1425 = _1401 * _1421;
        float _1427 = fma(_1285, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1429 = fma(_1277, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1393 = _1423;
        _1383 = _1427;
        _1387 = _1429;
    }
    float _1431 = _1393;
    float _1433 = _1383;
    float _1435 = _1387;
    if (_1301)
    {
        _1325 = 1.0;
    }
    float _1437 = _1325;
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1441 = _1345 * _1439;
    float _1443 = _1437;
    if (!_1301)
    {
        float _1445 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1447 = _1445 * 0.15915493667125701904296875;
        float _1449 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1451 = _1447 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        float _1455 = _1449 * 0.15915493667125701904296875;
        float _1457 = _1447 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = 1.0 / _1453;
        float _1463 = _1455 * 6.283185482025146484375;
        float _1465 = cos(_1463);
        float _1467 = _1459 * _1461;
        float _1469 = _1455 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1465 * _1467;
        float _1475 = 1.0 / _1473;
        float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1479 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1477;
        float _1481 = 1.0 / _1479;
        float _1483 = _1471 * _1475;
        float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1487 = fma(_1441, _1483, _1485);
        float _1489 = _1487 * _1481;
        float _1491 = precise::clamp(_1489, 0.0, 1.0);
        _1327 = _1481;
        _1379 = _1491;
    }
    float _1493 = _1327;
    float _1495 = _1379;
    float _1497 = _1493;
    if (!_1301)
    {
        float _1499 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1501 = _1499 * 0.15915493667125701904296875;
        float _1503 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = cos(_1505);
        float _1509 = _1503 * 0.15915493667125701904296875;
        float _1511 = _1501 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = 1.0 / _1507;
        float _1517 = _1509 * 6.283185482025146484375;
        float _1519 = cos(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = _1509 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = 1.0 / _1527;
        float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1533 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1531;
        float _1535 = 1.0 / _1533;
        float _1537 = _1525 * _1529;
        float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1541 = fma(_1441, _1537, _1539);
        float _1543 = _1541 * _1535;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = -_1545;
        float _1549 = _1547 + 1.0;
        _1497 = _1515;
        _1443 = _1549;
    }
    float _1551 = _1497;
    float _1553 = _1443;
    float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1557 = _1431 + _1555;
    float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1561 = _1433 + _1559;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1565 = _1435 + _1563;
    float _1567 = _1557 * _1557;
    float _1569 = fma(_1561, _1561, _1567);
    float _1571 = fma(_1565, _1565, _1569);
    float _1573 = rsqrt(_1571);
    float _1575 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1577 = _1561 * _1575;
    float _1579 = _1565 * _1575;
    float _1581 = _1577 * _1577;
    float _1583 = _1579 * _1579;
    float _1585 = _1581 + _1583;
    float _1587 = sqrt(_1585);
    bool _1589 = _1587 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1593 = _1587 + _1591;
    float _1595 = _1573;
    float _1597 = _1585;
    float _1599 = _1593;
    float _1601 = _1551;
    float _1603 = _1557;
    if (_1589)
    {
        float _1605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1605;
    }
    float _1607 = _1595;
    if (_1589)
    {
        float _1609 = rsqrt(_1585);
        _1597 = _1609;
    }
    float _1611 = _1597;
    float _1613 = _1611;
    if (_1589)
    {
        float _1615 = _1593 * _1607;
        _1599 = _1615;
    }
    float _1617 = _1599;
    if (_1589)
    {
        float _1619 = _1617 * 0.15915493667125701904296875;
        _1601 = _1619;
    }
    float _1621 = _1601;
    float _1623 = _1565;
    if (_1589)
    {
        float _1625 = _1621 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1633 = precise::max(0.0, _1631);
    float _1635 = _1607;
    float _1637 = _1633;
    if (_1589)
    {
        float _1639 = _1621 * 6.283185482025146484375;
        float _1641 = cos(_1639);
        _1635 = _1641;
    }
    float _1643 = _1635;
    float _1645 = -_1575;
    float _1647 = -_1633;
    float _1649 = fma(_1557, _1645, _1647);
    if (_1589)
    {
        float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1603 = _1651;
    }
    float _1653 = _1603;
    float _1655 = sqrt(_1571);
    float _1657 = _1653;
    float _1659 = _1629;
    if (_1589)
    {
        float _1661 = fma(_1629, _1653, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1657 = _1661;
    }
    float _1663 = _1657;
    float _1665 = _1663;
    if (!_1589)
    {
        _1659 = _1577;
    }
    float _1667 = _1659;
    float _1669 = _1667;
    float _1671 = _1643;
    if (_1589)
    {
        float _1673 = _1643 + (-1.0);
        _1637 = _1673;
    }
    float _1675 = _1637;
    float _1677 = _1675;
    if (_1589)
    {
        float _1679 = _1611 * _1663;
        _1187 = _1679;
    }
    float _1681 = _1187;
    if (!_1589)
    {
        _1665 = _1649;
    }
    float _1683 = _1665;
    float _1685 = _1683;
    if (_1589)
    {
        float _1687 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1687;
    }
    float _1689 = _1329;
    if (_1589)
    {
        float _1691 = _1577 * _1681;
        _1669 = _1691;
    }
    float _1693 = _1669;
    if (!_1589)
    {
        _1677 = _1579;
    }
    float _1695 = _1677;
    float _1697 = _1695;
    if (_1589)
    {
        float _1699 = _1579 * _1681;
        _1697 = _1699;
    }
    float _1701 = _1697;
    if (!_1589)
    {
        _1613 = _1581;
    }
    float _1703 = _1613;
    float _1705 = _1703;
    if (_1589)
    {
        float _1707 = fma(_1649, _1643, _1689);
        _1685 = _1707;
    }
    float _1709 = _1685;
    if (_1589)
    {
        float _1711 = _1693 * _1693;
        _1705 = _1711;
    }
    float _1713 = _1705;
    if (!_1589)
    {
        _1671 = _1583;
    }
    float _1715 = _1671;
    float _1717 = _1715;
    if (_1589)
    {
        float _1719 = _1701 * _1701;
        _1717 = _1719;
    }
    float _1721 = _1717;
    float _1723 = fma(_1709, _1709, _1713);
    float _1725 = _1723 + _1721;
    float _1727 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1729 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1731 = fma(_1655, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1729);
    float _1733 = precise::clamp(_1731, 0.0, 1.0);
    float _1735 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1737 = rsqrt(_1725);
    float _1739 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1727);
    float _1741 = -_1733;
    float _1743 = _1741 + 1.0;
    float _1745 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1735);
    float _1747 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1749 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1739);
    float _1751 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1753 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1755 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1745);
    float _1757 = abs(_1743);
    float _1759 = log2(_1757);
    float _1761 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1751);
    float _1763 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1753);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1767 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1761);
    float _1771 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1763);
    float _1773 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1775 = _1737 * _1693;
    float _1777 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1779 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = _1737 * _1709;
    float _1783 = _1737 * _1701;
    float _1785 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1773);
    float _1787 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1789 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1791 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1793 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1785);
    float _1795 = -_1787;
    float _1797 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1795);
    float _1799 = -_1789;
    float _1801 = fma(_1799, _1747, 1.0);
    float _1803 = exp2(_1791);
    float _1805 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1793);
    float _1807 = -_1783;
    float _1809 = fma(_1807, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1797);
    float _1811 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1813 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1815 = fma(_1809, -0.5, 0.5);
    float _1817 = fma(_1809, 0.5, 0.5);
    float _1819 = log2(_1801);
    float _1821 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1811);
    float _1823 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1813);
    float _1825 = _1781 + 1.0;
    float _1827 = fma(_1817, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1829 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1821);
    float _1831 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1823);
    float _1833 = 1.0 / _1805;
    float _1835 = -_1781;
    float _1837 = fma(_1803, _1825, _1835);
    float _1839 = fma(_1817, _1827, -0.212114393711090087890625);
    float _1841 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1829);
    float _1843 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1831);
    float _1845 = fma(_1837, 0.5, 0.5);
    float _1847 = fma(_1817, _1839, 1.570728778839111328125);
    float _1849 = sqrt(_1815);
    float _1851 = _1819 * 0.693147182464599609375;
    float _1853 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1855 = _1841 * _1833;
    float _1857 = _1843 * _1833;
    float _1859 = fma(_1855, 0.5, 0.5);
    float _1861 = fma(_1857, -0.5, 0.5);
    float _1863 = _1849 * 0.636619746685028076171875;
    float _1865 = -_1847;
    float _1867 = fma(_1863, _1865, 1.0);
    float3 _5733 = float3(_1859, _1861, _1853);
    float _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5733, float3(0.0), isnan(_5733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5733, float3(0.0), isnan(_5733)), level(0.0)).x;
    float3 _5744 = float3(_1859, _1861, _1853);
    float4 _1872 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5744, float3(0.0), isnan(_5744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5744, float3(0.0), isnan(_5744)), level(0.0)).xyzw;
    float _1874 = _1872.x;
    float _1876 = _1872.y;
    float _1878 = _1872.z;
    float _1880 = _1872.w;
    float2 _5761 = float2(_1867, _1845);
    float3 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5761, float2(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5761, float2(0.0), isnan(_5761)), level(0.0)).xyz;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1894 = int(_1892);
    int _1896 = abs(_1365);
    float _1898 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1900 = abs(_1373);
    float _1902 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1904 = _1181 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1906 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1908 = isnan(_1205);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1914 = _1910 || _1912;
    float _1916 = float(_1914);
    float _1918 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1920 = int(_1918);
    float _1922 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1902);
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1926 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1922);
    float _1928 = float(_1894);
    float _1930 = exp2(_1898);
    float _1932 = float(uint(_1920));
    float _1934 = 1.0 / _1928;
    int _1936 = ~_1920;
    int _1938 = _1936 + 1;
    int _1940 = ~_1920;
    int _1942 = _1940 + 1;
    float _1944 = 1.0 / _1932;
    int _1946 = ~_1920;
    int _1948 = _1946 + 1;
    float _1950 = -_1930;
    float _1952 = _1950 + 1.0;
    float _1954 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1956 = _93 * _1934;
    float _1958 = float(_1920);
    float _1960 = trunc(_1956);
    int _1962 = int(_1960);
    int _1964 = as_type<int>(_1944) + (-2);
    float _1966 = float(uint(_1962));
    float _1968 = as_type<float>(_1964) * _1966;
    float _1970 = in.m_56.x;
    float _1972 = in.m_56.y;
    float _1974 = in.m_56.z;
    float _1976 = in.m_56.w;
    float _1978 = trunc(_1968);
    float _1980 = precise::max(_1978, 0.0);
    uint _1983 = uint(_1980);
    int _1985 = _1948 * int(_1983);
    int _1987 = _1985 + _1962;
    float _1989 = float(uint(_1987));
    bool _1991 = _1976 > 0.5;
    float _1993 = as_type<float>(_1964) * _1989;
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1997 = _1995 != 0;
    float _1999 = trunc(_1993);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    bool _2005 = !_1997;
    float _2007 = _2005 ? 1.2345600128173828125 : 1.0;
    bool _2009 = !_1997;
    float _2011 = _2009 ? _1972 : _1970;
    int _2013 = _1920 + (-1);
    float _2015 = _2011 * _2007;
    float _2017 = 0.0;
    float _2019 = _1974;
    if (!_1997)
    {
        _2017 = _1974;
    }
    float _2021 = _2017;
    float _2023 = _2021;
    if (_1997)
    {
        _2023 = _1972;
    }
    float _2025 = _2023;
    float _2027 = floor(_2015);
    int _2029 = int(_1983) + int(_2003);
    float _2031 = float(_1962);
    int _2033 = _1938 * _2029;
    int _2035 = _2033 + _1962;
    bool _2037 = _2031 >= _1958;
    bool _2039 = isnan(_2031);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(_1958);
    bool _2045 = _2041 || _2043;
    float _2047 = float(_2045);
    bool _2049 = uint(_2035) >= uint(_1920);
    float _2051 = trunc(_2047);
    int _2053 = int(_2051);
    bool _2055 = !_2049;
    int _2057 = _2055 ? 0 : (-1);
    float _2059 = -_2027;
    float _2061 = _2015 + _2059;
    bool _2063 = _1920 == 0;
    int _2065 = ~_2029;
    int _2067 = _2065 + _2057;
    int _2069 = _2067 + 1;
    float _2071 = _93 * _1958;
    float _2073 = _2061 * _1958;
    int _2075 = _1920 * _2069;
    int _2077 = _2075 + _1962;
    float _2079 = _2071 * _233;
    float _2081 = trunc(_2073);
    int _2083 = int(_2081);
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2087 = _2085 != 0;
    int _2089 = ~_2053;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    bool _2095 = !_2063;
    int _2097 = _2095 ? _2077 : (-1);
    bool _2099 = !_2087;
    int _2101 = _2099 ? 0 : 1;
    float _2103 = trunc(_2079);
    int _2105 = int(_2103);
    int _2107 = abs(_1369);
    int _2109 = _2097 * _2093;
    int _2111 = abs(_2101);
    int _2113 = _2053 * _2013;
    int _2115 = _2113 + _2109;
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2119 = _2117 != 0;
    int _2121 = _2115 * _1896;
    int _2123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2125 = _2123 != 0;
    int _2127 = _2083 * _2111;
    int _2129 = _2127 + _1962;
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2133 = _2131 != 0;
    int _2135 = _2105 * _2107;
    int _2137 = _2135 + _2121;
    int _2139 = abs(_1377);
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2143 = _2141 != 0;
    int _2145 = _2129 * _1900;
    int _2147 = _2145 + _2137;
    float _2149 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2151 = _2083 * _2139;
    int _2153 = _2151 + _2147;
    float _2155 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2157 = _2155 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2159 = -_193;
    int _2161 = _1991 ? as_type<int>(_2159) : as_type<int>(_193);
    float _2163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2165 = float(uint(_2153));
    float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2169 = _2167 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2173 = _2171 != 0;
    float _2175 = fma(_2149, -2.0, _2163);
    float _2177 = as_type<float>(_1964) * _2165;
    float _2179 = 1.0 / _2169;
    int _2181 = ~_1920;
    int _2183 = _2181 + 1;
    float _2185 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2189 = float(uint(_2129));
    float _2191 = -_2187;
    float _2193 = fma(_2185, 2.0, _2191);
    float _2195 = trunc(_2177);
    float _2197 = precise::max(_2195, 0.0);
    uint _2199 = uint(_2197);
    float _2201 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2201;
    float _2205 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2207 = _2205 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2209 = 1.0 / _2157;
    float _2211 = _2203 * _2179;
    float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2215 = _2213 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2217 = 1.0 / _2207;
    bool _2219 = !_2119;
    float _2221 = _2219 ? _193 : as_type<float>(_2161);
    bool _2223 = _1970 > 0.5;
    int _2225 = _2183 * int(_2199);
    int _2227 = _2225 + _2153;
    float _2229 = -_183;
    int _2231 = _2223 ? as_type<int>(_2229) : as_type<int>(_183);
    float _2233 = _2215 * _2209;
    bool _2235 = _1972 > 0.5;
    float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2239 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2237;
    float _2241 = float(uint(_2227));
    float _2243 = -_193;
    int _2245 = _2235 ? as_type<int>(_2243) : as_type<int>(_193);
    float _2247 = _2239 * _2217;
    bool _2249 = _1974 > 0.5;
    float _2251 = as_type<float>(_1964) * _2241;
    float _2253 = _2217;
    if (!_1997)
    {
        _2253 = _1972;
    }
    float _2255 = _2253;
    float _2257 = trunc(_2251);
    float _2259 = precise::max(_2257, 0.0);
    uint _2261 = uint(_2259);
    bool _2263 = !_2133;
    float _2265 = _2263 ? _183 : as_type<float>(_2231);
    float _2267 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1924);
    float _2269 = -_183;
    int _2271 = _2249 ? as_type<int>(_2269) : as_type<int>(_183);
    float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2275 = _1205 + _2273;
    float _2277 = _2255;
    if (_1997)
    {
        _2277 = _1970;
    }
    float _2279 = _2277;
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2283 = !_2143;
    float _2285 = _2283 ? _193 : as_type<float>(_2245);
    float _2287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2289 = !_2173;
    float _2291 = _2289 ? _183 : as_type<float>(_2271);
    float _2293 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2281);
    float _2295 = fma(_2233, _2275, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2299 = _1205 + _2297;
    if (_1997)
    {
        _2019 = _1972;
    }
    float _2301 = _2019;
    float _2303 = _2285 + (-0.5);
    bool _2305 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2307 = isnan(_1205);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2313 = _2309 || _2311;
    float _2315 = float(_2313);
    float _2317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2319 = fma(_2211, _2299, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2321 = int(_2199) + int(_2261);
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2325 = _1205 + _2323;
    bool _2327 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2329 = isnan(_1205);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2335 = _2331 || _2333;
    float _2337 = float(_2335);
    float _2339 = -_2315;
    float _2341 = _2339 + 1.0;
    float _2343 = fma(_2247, _2325, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2345 = _1942 * _2321;
    int _2347 = _2345 + _2153;
    float _2349 = -_2337;
    float _2351 = _2349 + 1.0;
    bool _2353 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2355 = isnan(_1205);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2361 = _2357 || _2359;
    float _2363 = float(_2361);
    float _2365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2367 = _1916 * _2341;
    float _2369 = _2315 * _2351;
    bool _2371 = uint(_2347) >= uint(_1920);
    float _2373 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2365);
    float _2375 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2377 = as_type<float>(_1964) * _2189;
    bool _2379 = !_2371;
    int _2381 = _2379 ? 0 : (-1);
    float _2383 = -_1916;
    float _2385 = _2383 + 1.0;
    float _2387 = -_93;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2193);
    float _2391 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2175);
    int _2393 = ~_2321;
    int _2395 = _2393 + _2381;
    int _2397 = _2395 + 1;
    float _2399 = trunc(_2377);
    float _2401 = precise::max(_2399, 0.0);
    uint _2403 = uint(_2401);
    float _2405 = _2287 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2407 = _2265 + 0.5;
    float _2409 = _2363 * _2385;
    int _2411 = _1920 * _2397;
    int _2413 = _2411 + _2153;
    float _2415 = fma(_2405, _2407, _2389);
    float _2417 = -_2375;
    float _2419 = -_2391;
    float _2421 = fma(_2417, _2303, _2419);
    float _2423 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2425 = !_2063;
    int _2427 = _2425 ? _2413 : (-1);
    float _2429 = _2319 * _2409;
    int _2431 = ~_1920;
    int _2433 = _2431 + 1;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2437 = _2427 >> 31;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2441 = _2433 * int(_2403);
    int _2443 = _2441 + _2129;
    int _2445 = _2437 & 3;
    float _2447 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2435);
    float _2449 = _2279 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2453 = _2427 + _2445;
    float _2455 = -_2363;
    float _2457 = _2455 + 1.0;
    float _2459 = fma(_2423, -2.0, _2439);
    float _2461 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2293);
    int _2463 = _2453 >> 2;
    float _2465 = -_2451;
    float _2467 = fma(_2449, 2.0, _2465);
    float _2469 = float(uint(_2443));
    float _2471 = fma(_2457, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2429);
    int _2473 = _2463 << 4;
    int _2475 = _2473 + 512;
    float _2477 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2447);
    float _2479 = -_93;
    float _2481 = fma(_2479, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2467);
    float _2483 = as_type<float>(_1964) * _2469;
    uint _2485 = uint(int(uint(_2475) >> uint(2)));
    uint _2487 = uint(int(uint(int(_2485)) >> uint(2)));
    int _2489 = int(_2485) & 3;
    float _2491 = (*spvDescriptorSet0.vp_c9)._m0[int(_2487)][_2489];
    int _2493 = int(_2485) + 1;
    uint _2495 = uint(int(uint(_2493) >> uint(2)));
    int _2497 = _2493 & 3;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[int(_2495)][_2497];
    float _2501 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2267);
    float _2503 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2373);
    float _2505 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2459);
    float _2507 = fma(_2295, _2367, _2471);
    float _2509 = -_2501;
    float _2511 = _2509 + 1.0;
    int _2513 = _2427 & 3;
    bool _2515 = _2513 != 0;
    float _2517 = _2291 + 0.5;
    int _2519 = _2475 + 8;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    uint _2523 = uint(int(uint(int(_2521)) >> uint(2)));
    int _2525 = int(_2521) & 3;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[int(_2523)][_2525];
    int _2529 = int(_2521) + 1;
    uint _2531 = uint(int(uint(_2529) >> uint(2)));
    int _2533 = _2529 & 3;
    float _2535 = (*spvDescriptorSet0.vp_c9)._m0[int(_2531)][_2533];
    int _2537 = _2427 & 3;
    bool _2539 = _2537 != 0;
    float _2541 = -_2477;
    float _2543 = _2541 + 1.0;
    float _2545 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2481);
    float _2547 = trunc(_2483);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    bool _2553 = uint(_2537) > 1u;
    float _2555 = -_2461;
    float _2557 = _2555 + 1.0;
    bool _2559 = _2537 != 3;
    float _2561 = -_2543;
    float _2563 = fma(_2291, _2561, _2545);
    int _2565 = _2515 ? 0 : 1;
    float _2567 = _2221 + (-0.5);
    bool _2569 = uint(_2537) >= 2u;
    float _2571 = fma(_2285, _2557, _2421);
    int _2573 = ~_2565;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    float _2579 = -_2511;
    float _2581 = fma(_2265, _2579, _2415);
    float _2583 = -_2567;
    float _2585 = -_2505;
    float _2587 = fma(_2583, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2585);
    float _2589 = -_2503;
    float _2591 = _2589 + 1.0;
    int _2593 = _2569 ? 0 : 1;
    float _2595 = fma(_2343, _2369, _2507);
    int _2597 = _2577;
    if (!_2553)
    {
        int _2599 = ~_2565;
        int _2601 = _2599 + 1;
        _2597 = _2601;
    }
    int _2603 = _2597;
    float _2605 = fma(_2221, _2591, _2587);
    bool _2607 = !_2539;
    int _2609 = _2607 ? 0 : 1;
    float _2611 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2595);
    int _2613 = abs(_2603);
    float _2615 = _1954 * _1869;
    int _2617 = ~_2593;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    out.m_60.x = _2581;
    out.m_60.y = _2571;
    out.m_60.z = _2563;
    out.m_60.w = _2605;
    int _2623 = _2621;
    if (_2559)
    {
        int _2625 = ~_2593;
        int _2627 = _2625 + 1;
        _2623 = _2627;
    }
    int _2629 = _2623;
    float _2631 = -_1954;
    float _2633 = _2631 + 1.0;
    bool _2635 = _2537 != 3;
    int _2637 = abs(_2609);
    int _2639 = int(_2403) + int(_2551);
    int _2641 = ~_1920;
    int _2643 = _2641 + 1;
    bool _2645 = !_2635;
    int _2647 = _2645 ? 0 : (-1);
    int _2649 = _2643 * _2639;
    int _2651 = _2649 + _2129;
    int _2653 = ~_2613;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    int _2659 = abs(_2647);
    int _2661 = abs(_2629);
    int _2663 = _2657 * as_type<int>(_2499);
    int _2665 = ~_2637;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    bool _2671 = uint(_2651) >= uint(_1920);
    int _2673 = ~_2661;
    int _2675 = _2673 + 1;
    int _2677 = _2675 + 1;
    int _2679 = _2669 * as_type<int>(_2491);
    int _2681 = _2679 + _2663;
    bool _2683 = !_2671;
    int _2685 = _2683 ? 0 : (-1);
    float _2687 = _1495 * _1553;
    int _2689 = _2677 * as_type<int>(_2527);
    int _2691 = _2689 + _2681;
    bool _2693 = !_2125;
    int _2695 = _2693 ? 0 : 1;
    float _2697 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2699 = ~_2639;
    int _2701 = _2699 + _2685;
    int _2703 = _2701 + 1;
    int _2705 = ~_2659;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    float _2711 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2713 = abs(_2695);
    int _2715 = _1920 * _2703;
    int _2717 = _2715 + _2129;
    float _2719 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2721 = _2709 * as_type<int>(_2535);
    int _2723 = _2721 + _2691;
    int _2725 = ~_2713;
    int _2727 = _2725 + 1;
    int _2729 = _2727 + 1;
    float _2731 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2733 = !_2063;
    int _2735 = _2733 ? _2717 : (-1);
    float _2737 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2739 = _1495 > 0.0;
    bool _2741 = isnan(_1495);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan(0.0);
    bool _2747 = _2743 || _2745;
    int _2749 = _2723 * _2729;
    float _2751 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1926);
    float _2753 = _2737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2755 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2757 = _2735 * _2713;
    int _2759 = _2757 + _2749;
    float _2761 = _2697 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2763 = _2751 + _1805;
    bool _2765 = _1553 <= 0.0;
    bool _2767 = !_2747;
    bool _2769 = _2765 || _2767;
    out.m_62.x = _2753;
    out.m_62.y = _2719;
    out.m_62.z = _2755;
    out.m_62.w = _2731;
    float _2771 = _2763 * 0.5;
    float _2773 = float(_2759);
    float _2775 = _1890 * _2615;
    out.m_49.x = _2761;
    out.gl_Position.x = _1841;
    out.gl_Position.y = _1843;
    out.gl_Position.z = _2751;
    out.gl_Position.w = _1805;
    out.m_64.y = _2773;
    float _2777 = _1880 * _2615;
    float _2779 = _1880 * _2633;
    out.m_66.z = _2771;
    out.m_66.w = _1805;
    float _2781 = fma(_1886, _2777, _1874);
    float _2783 = fma(_1888, _2777, _1876);
    float _2785 = fma(_1880, _2775, _1878);
    out.m_68.x = _2781;
    out.m_68.y = _2783;
    out.m_68.z = _2785;
    out.m_68.w = _2779;
    if (!_2769)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2787 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2787;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _935 = false;
    bool _837 = false;
    bool _567 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = in.m_44.w;
    float _86 = trunc(_82);
    int _89 = int(_86);
    float _91 = -_84;
    float _93 = _91 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _93;
    bool _97 = _89 >= 1;
    float _99 = 0.0;
    float _101 = as_type<float>(_89);
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _99;
    if (!_97)
    {
        out.m_49.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _103 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2855 = as_type<float>(_109);
        out.gl_Position.z = _2855;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _113 = _84 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_84);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = float(_89);
    bool _125 = _93 >= _123;
    bool _127 = !_121;
    bool _129 = _125 || _127;
    if (_129)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _101;
    if (_129)
    {
        out.m_49.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _111 = as_type<int>(_133);
    }
    int _135 = _111;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2910 = as_type<float>(_135);
        out.gl_Position.z = _2910;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_54.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_44.x;
    float _155 = in.m_44.y;
    float _157 = in.m_44.z;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    int _165 = as_type<int>(_137) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_137) & 2;
    bool _171 = _169 != 0;
    float _173 = _137;
    if (!_151)
    {
        float _175 = _139 * _139;
        float _177 = _175 * 0.5;
        _173 = _177;
    }
    float _179 = _173;
    bool _181 = !_167;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _179;
    if (!_151)
    {
        float _187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_171;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_151;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _139 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _139);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = 1.0 / _123;
    float _235 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _237 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _241 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _243 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _245 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].x, _239);
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].y, _241);
    float _249 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].z, _243);
    float _251 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].x, _245);
    float _253 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].y, _247);
    float _255 = _245;
    if (!_151)
    {
        _255 = _139;
    }
    float _257 = _255;
    bool _259 = !_151;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _139 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _261 = _281;
    }
    float _283 = _261;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _249);
    float _289 = fma(_283, _153, _251);
    float _291 = fma(_283, _155, _253);
    float _293 = _93 * _233;
    float _295 = fma(_283, _157, _287);
    float _297 = fma(_289, _141, _159);
    float _299 = fma(_291, _141, _161);
    float _301 = fma(_295, _141, _163);
    bool _303 = !_285;
    float _305 = _293;
    float _323;
    if (!_303)
    {
        float _307 = in.m_56.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _93);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        _323 = _293;
    }
    _325 = false;
    float _327 = _323;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _327 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _327 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = 1.0 / _339;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _357 = 1.0 / _347;
    bool _359 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _361 = isnan(_327);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _351;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = _327 + _373;
    float _377 = _375 * _353;
    bool _379 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _381 = isnan(_327);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = 1.0 / _343;
    float _393 = _331 * _357;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _397 = _327 + _395;
    float _399 = -_389;
    float _401 = _399 + 1.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _403;
    float _407 = _369 * _401;
    float _409 = _335 * _371;
    bool _411 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _413 = isnan(_327);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -_369;
    float _425 = _423 + 1.0;
    bool _427 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_327);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = fma(_405, _393, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = -_421;
    float _447 = _445 + 1.0;
    float _449 = _421 * _425;
    float _451 = _397 * _391;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    bool _457 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _459 = isnan(_327);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = fma(_443, _409, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _471 = fma(_455, _393, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _437 * _447;
    float _475 = -_437;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = -_467;
    float _485 = _483 + 1.0;
    float _487 = _467 * _477;
    float _489 = fma(_481, _409, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _491 = in.m_54.x;
    float _493 = in.m_54.y;
    float _495 = _471 * _487;
    float _497 = _439 * _487;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _495);
    float _509 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _511 = fma(_501, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _513 = fma(_505, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_489, _473, _507);
    float _525 = fma(_469, _473, _509);
    float _527 = fma(_517, _451, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _529 = fma(_521, _451, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _531 = fma(_511, _449, _523);
    float _533 = fma(_513, _449, _525);
    float _535 = fma(_527, _407, _531);
    float _537 = fma(_529, _407, _533);
    float _539 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[147].x, _535);
    float _541 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[147].y, _537);
    float _543 = _539 * _491;
    float _545 = _541 * _493;
    bool _547 = !_355;
    float _565;
    if (!_547)
    {
        float _549 = in.m_56.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].x, _93);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        _565 = _293;
    }
    _567 = false;
    float _569 = _565;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _573 = _569 + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _577 = _569 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _581 = _569 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _599 = 1.0 / _585;
    float _601 = 1.0 / _589;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _605 = _569 + _603;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _609 = 1.0 / _597;
    float _611 = _577 * _599;
    bool _613 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _615 = isnan(_569);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _593;
    float _627 = _573 * _601;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _629;
    bool _633 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _635 = isnan(_569);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = fma(_631, _611, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _647 = _605 * _609;
    bool _649 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _651 = isnan(_569);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -_643;
    float _663 = _661 + 1.0;
    bool _665 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _667 = isnan(_569);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_659;
    float _679 = _677 + 1.0;
    float _681 = _581 * _625;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _687;
    float _691 = _623 * _679;
    float _693 = -_623;
    float _695 = _693 + 1.0;
    float _697 = fma(_685, _611, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _699 = fma(_689, _611, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _701 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _703 = isnan(_569);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _643 * _695;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _727 = _711 * _663;
    float _729 = -_711;
    float _731 = _729 + 1.0;
    float _733 = fma(_717, _627, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _735 = fma(_725, _627, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _737 = fma(_721, _627, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _739 = _675 * _731;
    float _741 = -_675;
    float _743 = _741 + 1.0;
    float _745 = _645 * _739;
    float _747 = _697 * _739;
    float _749 = _699 * _739;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _755;
    float _759 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[107].x, _745);
    float _761 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[107].y, _747);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _763;
    float _767 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[107].z, _749);
    float _769 = fma(_753, _681, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _771 = fma(_757, _681, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _773 = fma(_735, _727, _761);
    float _775 = fma(_765, _681, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _777 = fma(_733, _727, _759);
    float _779 = fma(_737, _727, _767);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _793 = fma(_769, _713, _777);
    float _795 = fma(_783, _647, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _797 = fma(_787, _647, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _799 = fma(_791, _647, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _801 = fma(_775, _713, _773);
    float _803 = fma(_771, _713, _779);
    float _805 = fma(_795, _691, _793);
    float _807 = fma(_797, _691, _801);
    float _809 = fma(_799, _691, _803);
    float _811 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[111].x, _805);
    float _813 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[111].y, _807);
    float _815 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[111].z, _809);
    bool _817 = !_607;
    float _835;
    if (!_817)
    {
        float _819 = in.m_56.x;
        float _821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _823 = _819 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[11].y, _93);
        float _827 = _825 * _821;
        float _829 = floor(_827);
        float _831 = -_829;
        float _833 = _827 + _831;
        _835 = _833;
        _837 = true;
    }
    else
    {
        _835 = _293;
    }
    _837 = false;
    float _839 = _835;
    bool _841 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _843 = isnan(_839);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _857 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _859 = isnan(_839);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _869;
    bool _873 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _875 = 1.0 / _855;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    float _881 = _867 * _879;
    float _883 = -_867;
    float _885 = _883 + 1.0;
    float _887 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _889 = _871 * _875;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _893 = _839 + _891;
    float _895 = _811 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _897 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = fma(_889, _893, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _901 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = _899 * _881;
    float _905 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[115].x, _903);
    float _907 = _813 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _909 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[116].x, _905);
    float _911 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _909 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _901;
    out.m_58.y = _911;
    out.m_58.z = _897;
    out.m_58.w = _913;
    bool _915 = !_873;
    float _933;
    if (!_915)
    {
        float _917 = in.m_56.x;
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _921 = _917 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[11].z, _93);
        float _925 = _923 * _919;
        float _927 = floor(_925);
        float _929 = -_927;
        float _931 = _925 + _929;
        _933 = _931;
        _935 = true;
    }
    else
    {
        _933 = _293;
    }
    _935 = false;
    float _937 = _933;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _941 = _937 + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _945 = _937 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _949 = _937 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _959;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _967 = 1.0 / _953;
    float _969 = 1.0 / _957;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _973 = _937 + _971;
    bool _975 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _977 = 1.0 / _961;
    float _979 = _945 * _967;
    bool _981 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _983 = isnan(_937);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = 1.0 / _965;
    float _995 = _941 * _969;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1001;
    float _1005 = _949 * _977;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1007;
    bool _1011 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1013 = isnan(_937);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1019 = _1015 || _1017;
    float _1021 = float(_1019);
    float _1023 = fma(_1003, _979, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1025 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1027 = isnan(_937);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1033 = _1029 || _1031;
    float _1035 = float(_1033);
    float _1037 = fma(_999, _979, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1039 = fma(_1009, _979, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1041 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1043 = isnan(_937);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = _973 * _993;
    float _1055 = -_991;
    float _1057 = _1055 + 1.0;
    float _1059 = -_1021;
    float _1061 = _1059 + 1.0;
    float _1063 = _1035 * _1057;
    float _1065 = -_1035;
    float _1067 = _1065 + 1.0;
    bool _1069 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1071 = isnan(_937);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _1051 * _1061;
    float _1083 = -_1051;
    float _1085 = _1083 + 1.0;
    float _1087 = _1021 * _1067;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1101 = _1079 * _1085;
    float _1103 = fma(_1091, _995, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1105 = fma(_1095, _995, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1107 = fma(_1099, _995, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1109 = _1023 * _1101;
    float _1111 = _1037 * _1101;
    float _1113 = -_1079;
    float _1115 = _1113 + 1.0;
    float _1117 = _1039 * _1101;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1123;
    float _1127 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1109);
    float _1129 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1111);
    float _1131 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1117);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1133;
    float _1137 = fma(_1103, _1081, _1127);
    float _1139 = fma(_1105, _1081, _1129);
    float _1141 = fma(_1121, _1005, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1143 = fma(_1125, _1005, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1145 = fma(_1107, _1081, _1131);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1155 = fma(_1135, _1005, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1161 = fma(_1141, _1087, _1137);
    float _1163 = fma(_1149, _1053, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1165 = fma(_1153, _1053, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1167 = fma(_1143, _1087, _1139);
    float _1169 = fma(_1159, _1053, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1171 = fma(_1155, _1087, _1145);
    float _1173 = fma(_1163, _1063, _1161);
    float _1175 = fma(_1165, _1063, _1167);
    float _1177 = fma(_1169, _1063, _1171);
    float _1179 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1173);
    float _1181 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1175);
    float _1183 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1177);
    bool _1185 = !_975;
    float _1187 = _1111;
    if (!_1185)
    {
        float _1189 = in.m_56.x;
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1193 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1195 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[11].w, _93);
        float _1197 = _1195 * _1191;
        float _1199 = floor(_1197);
        float _1201 = -_1199;
        float _1203 = _1197 + _1201;
        _305 = _1203;
    }
    float _1205 = _305;
    float _1207 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1211 = _299 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1213 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1217 = _1207 * _1209;
    float _1219 = _299 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1221 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1211);
    float _1223 = _299 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1225 = _1213 * _1215;
    float _1227 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1229 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1219);
    float _1231 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1221);
    float _1233 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1223);
    float _1235 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1237 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1227);
    float _1241 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1229);
    float _1243 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1245 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1233);
    float _1247 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1237);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1239);
    float _1251 = _1241 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1253 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1257 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1247);
    float _1259 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1261 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1253);
    float _1263 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1265 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1267 = _1255 + _1259;
    float _1269 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1261);
    float _1271 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1263);
    float _1273 = _1251 + _1265;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1277 = _1267 + _1275;
    float _1279 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1281 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1285 = _1273 + _1283;
    float _1287 = _1277 * _1277;
    float _1289 = 1.0 / _1279;
    float _1291 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1281);
    bool _1293 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1295 = isnan(0.5);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1301 = _1297 || _1299;
    float _1303 = fma(_1285, _1285, _1287);
    float _1305 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1271);
    float _1307 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1291);
    float _1309 = sqrt(_1303);
    float _1311 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1313 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1315 = _1311 + _1279;
    float _1317 = _1255;
    float _1319 = _1263;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _1323 = _1313;
    float _1325 = _1285;
    float _1327 = _1243;
    float _1329 = _1251;
    if (_1301)
    {
        _1317 = 1.0;
    }
    float _1331 = _1317;
    float _1333 = _1315 * _1289;
    float _1335 = _1333 * 0.5;
    float _1337 = _1243 + _1313;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1341 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1339);
    bool _1343 = _1309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1345 = 1.0 / _1341;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1349 = _1347 != 0;
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1353 = _1351 != 0;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1357 = _1355 != 0;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1361 = _1359 != 0;
    bool _1363 = !_1353;
    int _1365 = _1363 ? 0 : 1;
    bool _1367 = !_1349;
    int _1369 = _1367 ? 0 : 1;
    bool _1371 = !_1357;
    int _1373 = _1371 ? 0 : 1;
    bool _1375 = !_1361;
    int _1377 = _1375 ? 0 : 1;
    float _1379 = _1331;
    if (!_1343)
    {
        _1319 = _1273;
    }
    float _1381 = _1319;
    float _1383 = _1381;
    if (!_1343)
    {
        _1321 = _1267;
    }
    float _1385 = _1321;
    float _1387 = _1385;
    if (!_1343)
    {
        _1323 = _1337;
    }
    float _1389 = _1323;
    bool _1391 = !_1343;
    float _1393 = _1389;
    if (!_1391)
    {
        float _1395 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1399 = _1309 + _1397;
        float _1401 = rsqrt(_1303);
        float _1403 = _1399 * _1395;
        float _1405 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1407 = _1403 * 0.15915493667125701904296875;
        float _1409 = _1407 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1407 * 6.283185482025146484375;
        float _1415 = sin(_1413);
        float _1417 = _1411 + (-1.0);
        float _1419 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1421 = fma(_1415, _1405, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1423 = fma(_1337, _1411, _1419);
        float _1425 = _1401 * _1421;
        float _1427 = fma(_1285, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1429 = fma(_1277, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1393 = _1423;
        _1383 = _1427;
        _1387 = _1429;
    }
    float _1431 = _1393;
    float _1433 = _1383;
    float _1435 = _1387;
    if (_1301)
    {
        _1325 = 1.0;
    }
    float _1437 = _1325;
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1441 = _1345 * _1439;
    float _1443 = _1437;
    if (!_1301)
    {
        float _1445 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1447 = _1445 * 0.15915493667125701904296875;
        float _1449 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1451 = _1447 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        float _1455 = _1449 * 0.15915493667125701904296875;
        float _1457 = _1447 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = 1.0 / _1453;
        float _1463 = _1455 * 6.283185482025146484375;
        float _1465 = cos(_1463);
        float _1467 = _1459 * _1461;
        float _1469 = _1455 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1465 * _1467;
        float _1475 = 1.0 / _1473;
        float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1479 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1477;
        float _1481 = 1.0 / _1479;
        float _1483 = _1471 * _1475;
        float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1487 = fma(_1441, _1483, _1485);
        float _1489 = _1487 * _1481;
        float _1491 = precise::clamp(_1489, 0.0, 1.0);
        _1327 = _1481;
        _1379 = _1491;
    }
    float _1493 = _1327;
    float _1495 = _1379;
    float _1497 = _1493;
    if (!_1301)
    {
        float _1499 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1501 = _1499 * 0.15915493667125701904296875;
        float _1503 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = cos(_1505);
        float _1509 = _1503 * 0.15915493667125701904296875;
        float _1511 = _1501 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = 1.0 / _1507;
        float _1517 = _1509 * 6.283185482025146484375;
        float _1519 = cos(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = _1509 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = 1.0 / _1527;
        float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1533 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1531;
        float _1535 = 1.0 / _1533;
        float _1537 = _1525 * _1529;
        float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1541 = fma(_1441, _1537, _1539);
        float _1543 = _1541 * _1535;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = -_1545;
        float _1549 = _1547 + 1.0;
        _1497 = _1515;
        _1443 = _1549;
    }
    float _1551 = _1497;
    float _1553 = _1443;
    float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1557 = _1431 + _1555;
    float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1561 = _1433 + _1559;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1565 = _1435 + _1563;
    float _1567 = _1557 * _1557;
    float _1569 = fma(_1561, _1561, _1567);
    float _1571 = fma(_1565, _1565, _1569);
    float _1573 = rsqrt(_1571);
    float _1575 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1577 = _1561 * _1575;
    float _1579 = _1565 * _1575;
    float _1581 = _1577 * _1577;
    float _1583 = _1579 * _1579;
    float _1585 = _1581 + _1583;
    float _1587 = sqrt(_1585);
    bool _1589 = _1587 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1593 = _1587 + _1591;
    float _1595 = _1573;
    float _1597 = _1585;
    float _1599 = _1593;
    float _1601 = _1551;
    float _1603 = _1557;
    if (_1589)
    {
        float _1605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1605;
    }
    float _1607 = _1595;
    if (_1589)
    {
        float _1609 = rsqrt(_1585);
        _1597 = _1609;
    }
    float _1611 = _1597;
    float _1613 = _1611;
    if (_1589)
    {
        float _1615 = _1593 * _1607;
        _1599 = _1615;
    }
    float _1617 = _1599;
    if (_1589)
    {
        float _1619 = _1617 * 0.15915493667125701904296875;
        _1601 = _1619;
    }
    float _1621 = _1601;
    float _1623 = _1565;
    if (_1589)
    {
        float _1625 = _1621 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1633 = precise::max(0.0, _1631);
    float _1635 = _1607;
    float _1637 = _1633;
    if (_1589)
    {
        float _1639 = _1621 * 6.283185482025146484375;
        float _1641 = cos(_1639);
        _1635 = _1641;
    }
    float _1643 = _1635;
    float _1645 = -_1575;
    float _1647 = -_1633;
    float _1649 = fma(_1557, _1645, _1647);
    if (_1589)
    {
        float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1603 = _1651;
    }
    float _1653 = _1603;
    float _1655 = sqrt(_1571);
    float _1657 = _1653;
    float _1659 = _1629;
    if (_1589)
    {
        float _1661 = fma(_1629, _1653, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1657 = _1661;
    }
    float _1663 = _1657;
    float _1665 = _1663;
    if (!_1589)
    {
        _1659 = _1577;
    }
    float _1667 = _1659;
    float _1669 = _1667;
    float _1671 = _1643;
    if (_1589)
    {
        float _1673 = _1643 + (-1.0);
        _1637 = _1673;
    }
    float _1675 = _1637;
    float _1677 = _1675;
    if (_1589)
    {
        float _1679 = _1611 * _1663;
        _1187 = _1679;
    }
    float _1681 = _1187;
    if (!_1589)
    {
        _1665 = _1649;
    }
    float _1683 = _1665;
    float _1685 = _1683;
    if (_1589)
    {
        float _1687 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1329 = _1687;
    }
    float _1689 = _1329;
    if (_1589)
    {
        float _1691 = _1577 * _1681;
        _1669 = _1691;
    }
    float _1693 = _1669;
    if (!_1589)
    {
        _1677 = _1579;
    }
    float _1695 = _1677;
    float _1697 = _1695;
    if (_1589)
    {
        float _1699 = _1579 * _1681;
        _1697 = _1699;
    }
    float _1701 = _1697;
    if (!_1589)
    {
        _1613 = _1581;
    }
    float _1703 = _1613;
    float _1705 = _1703;
    if (_1589)
    {
        float _1707 = fma(_1649, _1643, _1689);
        _1685 = _1707;
    }
    float _1709 = _1685;
    if (_1589)
    {
        float _1711 = _1693 * _1693;
        _1705 = _1711;
    }
    float _1713 = _1705;
    if (!_1589)
    {
        _1671 = _1583;
    }
    float _1715 = _1671;
    float _1717 = _1715;
    if (_1589)
    {
        float _1719 = _1701 * _1701;
        _1717 = _1719;
    }
    float _1721 = _1717;
    float _1723 = fma(_1709, _1709, _1713);
    float _1725 = _1723 + _1721;
    float _1727 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1729 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1731 = fma(_1655, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1729);
    float _1733 = precise::clamp(_1731, 0.0, 1.0);
    float _1735 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1737 = rsqrt(_1725);
    float _1739 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1727);
    float _1741 = -_1733;
    float _1743 = _1741 + 1.0;
    float _1745 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1735);
    float _1747 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1749 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1739);
    float _1751 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1753 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1755 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1745);
    float _1757 = abs(_1743);
    float _1759 = log2(_1757);
    float _1761 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1751);
    float _1763 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1753);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1767 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1769 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1761);
    float _1771 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1763);
    float _1773 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1775 = _1737 * _1693;
    float _1777 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1779 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = _1737 * _1709;
    float _1783 = _1737 * _1701;
    float _1785 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1773);
    float _1787 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1789 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1791 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1793 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1785);
    float _1795 = -_1787;
    float _1797 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1795);
    float _1799 = -_1789;
    float _1801 = fma(_1799, _1747, 1.0);
    float _1803 = exp2(_1791);
    float _1805 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1793);
    float _1807 = -_1783;
    float _1809 = fma(_1807, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1797);
    float _1811 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1813 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1815 = fma(_1809, -0.5, 0.5);
    float _1817 = fma(_1809, 0.5, 0.5);
    float _1819 = log2(_1801);
    float _1821 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1811);
    float _1823 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1813);
    float _1825 = _1781 + 1.0;
    float _1827 = fma(_1817, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1829 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1821);
    float _1831 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1823);
    float _1833 = 1.0 / _1805;
    float _1835 = -_1781;
    float _1837 = fma(_1803, _1825, _1835);
    float _1839 = fma(_1817, _1827, -0.212114393711090087890625);
    float _1841 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1829);
    float _1843 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1831);
    float _1845 = fma(_1837, 0.5, 0.5);
    float _1847 = fma(_1817, _1839, 1.570728778839111328125);
    float _1849 = sqrt(_1815);
    float _1851 = _1819 * 0.693147182464599609375;
    float _1853 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1855 = _1841 * _1833;
    float _1857 = _1843 * _1833;
    float _1859 = fma(_1855, 0.5, 0.5);
    float _1861 = fma(_1857, -0.5, 0.5);
    float _1863 = _1849 * 0.636619746685028076171875;
    float _1865 = -_1847;
    float _1867 = fma(_1863, _1865, 1.0);
    float3 _5733 = float3(_1859, _1861, _1853);
    float _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5733, float3(0.0), isnan(_5733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5733, float3(0.0), isnan(_5733)), level(0.0)).x;
    float3 _5744 = float3(_1859, _1861, _1853);
    float4 _1872 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5744, float3(0.0), isnan(_5744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5744, float3(0.0), isnan(_5744)), level(0.0)).xyzw;
    float _1874 = _1872.x;
    float _1876 = _1872.y;
    float _1878 = _1872.z;
    float _1880 = _1872.w;
    float2 _5761 = float2(_1867, _1845);
    float3 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5761, float2(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5761, float2(0.0), isnan(_5761)), level(0.0)).xyz;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1894 = int(_1892);
    int _1896 = abs(_1365);
    float _1898 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1900 = abs(_1373);
    float _1902 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1904 = _1181 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1906 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1908 = isnan(_1205);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1914 = _1910 || _1912;
    float _1916 = float(_1914);
    float _1918 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1920 = int(_1918);
    float _1922 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1902);
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1926 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1922);
    float _1928 = float(_1894);
    float _1930 = exp2(_1898);
    float _1932 = float(uint(_1920));
    float _1934 = 1.0 / _1928;
    int _1936 = ~_1920;
    int _1938 = _1936 + 1;
    int _1940 = ~_1920;
    int _1942 = _1940 + 1;
    float _1944 = 1.0 / _1932;
    int _1946 = ~_1920;
    int _1948 = _1946 + 1;
    float _1950 = -_1930;
    float _1952 = _1950 + 1.0;
    float _1954 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1956 = _93 * _1934;
    float _1958 = float(_1920);
    float _1960 = trunc(_1956);
    int _1962 = int(_1960);
    int _1964 = as_type<int>(_1944) + (-2);
    float _1966 = float(uint(_1962));
    float _1968 = as_type<float>(_1964) * _1966;
    float _1970 = in.m_56.x;
    float _1972 = in.m_56.y;
    float _1974 = in.m_56.z;
    float _1976 = in.m_56.w;
    float _1978 = trunc(_1968);
    float _1980 = precise::max(_1978, 0.0);
    uint _1983 = uint(_1980);
    int _1985 = _1948 * int(_1983);
    int _1987 = _1985 + _1962;
    float _1989 = float(uint(_1987));
    bool _1991 = _1976 > 0.5;
    float _1993 = as_type<float>(_1964) * _1989;
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1997 = _1995 != 0;
    float _1999 = trunc(_1993);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    bool _2005 = !_1997;
    float _2007 = _2005 ? 1.2345600128173828125 : 1.0;
    bool _2009 = !_1997;
    float _2011 = _2009 ? _1972 : _1970;
    int _2013 = _1920 + (-1);
    float _2015 = _2011 * _2007;
    float _2017 = 0.0;
    float _2019 = _1974;
    if (!_1997)
    {
        _2017 = _1974;
    }
    float _2021 = _2017;
    float _2023 = _2021;
    if (_1997)
    {
        _2023 = _1972;
    }
    float _2025 = _2023;
    float _2027 = floor(_2015);
    int _2029 = int(_1983) + int(_2003);
    float _2031 = float(_1962);
    int _2033 = _1938 * _2029;
    int _2035 = _2033 + _1962;
    bool _2037 = _2031 >= _1958;
    bool _2039 = isnan(_2031);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(_1958);
    bool _2045 = _2041 || _2043;
    float _2047 = float(_2045);
    bool _2049 = uint(_2035) >= uint(_1920);
    float _2051 = trunc(_2047);
    int _2053 = int(_2051);
    bool _2055 = !_2049;
    int _2057 = _2055 ? 0 : (-1);
    float _2059 = -_2027;
    float _2061 = _2015 + _2059;
    bool _2063 = _1920 == 0;
    int _2065 = ~_2029;
    int _2067 = _2065 + _2057;
    int _2069 = _2067 + 1;
    float _2071 = _93 * _1958;
    float _2073 = _2061 * _1958;
    int _2075 = _1920 * _2069;
    int _2077 = _2075 + _1962;
    float _2079 = _2071 * _233;
    float _2081 = trunc(_2073);
    int _2083 = int(_2081);
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2087 = _2085 != 0;
    int _2089 = ~_2053;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    bool _2095 = !_2063;
    int _2097 = _2095 ? _2077 : (-1);
    bool _2099 = !_2087;
    int _2101 = _2099 ? 0 : 1;
    float _2103 = trunc(_2079);
    int _2105 = int(_2103);
    int _2107 = abs(_1369);
    int _2109 = _2097 * _2093;
    int _2111 = abs(_2101);
    int _2113 = _2053 * _2013;
    int _2115 = _2113 + _2109;
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2119 = _2117 != 0;
    int _2121 = _2115 * _1896;
    int _2123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2125 = _2123 != 0;
    int _2127 = _2083 * _2111;
    int _2129 = _2127 + _1962;
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2133 = _2131 != 0;
    int _2135 = _2105 * _2107;
    int _2137 = _2135 + _2121;
    int _2139 = abs(_1377);
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2143 = _2141 != 0;
    int _2145 = _2129 * _1900;
    int _2147 = _2145 + _2137;
    float _2149 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2151 = _2083 * _2139;
    int _2153 = _2151 + _2147;
    float _2155 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2157 = _2155 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2159 = -_193;
    int _2161 = _1991 ? as_type<int>(_2159) : as_type<int>(_193);
    float _2163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2165 = float(uint(_2153));
    float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2169 = _2167 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2173 = _2171 != 0;
    float _2175 = fma(_2149, -2.0, _2163);
    float _2177 = as_type<float>(_1964) * _2165;
    float _2179 = 1.0 / _2169;
    int _2181 = ~_1920;
    int _2183 = _2181 + 1;
    float _2185 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2189 = float(uint(_2129));
    float _2191 = -_2187;
    float _2193 = fma(_2185, 2.0, _2191);
    float _2195 = trunc(_2177);
    float _2197 = precise::max(_2195, 0.0);
    uint _2199 = uint(_2197);
    float _2201 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2201;
    float _2205 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2207 = _2205 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2209 = 1.0 / _2157;
    float _2211 = _2203 * _2179;
    float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2215 = _2213 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2217 = 1.0 / _2207;
    bool _2219 = !_2119;
    float _2221 = _2219 ? _193 : as_type<float>(_2161);
    bool _2223 = _1970 > 0.5;
    int _2225 = _2183 * int(_2199);
    int _2227 = _2225 + _2153;
    float _2229 = -_183;
    int _2231 = _2223 ? as_type<int>(_2229) : as_type<int>(_183);
    float _2233 = _2215 * _2209;
    bool _2235 = _1972 > 0.5;
    float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2239 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2237;
    float _2241 = float(uint(_2227));
    float _2243 = -_193;
    int _2245 = _2235 ? as_type<int>(_2243) : as_type<int>(_193);
    float _2247 = _2239 * _2217;
    bool _2249 = _1974 > 0.5;
    float _2251 = as_type<float>(_1964) * _2241;
    float _2253 = _2217;
    if (!_1997)
    {
        _2253 = _1972;
    }
    float _2255 = _2253;
    float _2257 = trunc(_2251);
    float _2259 = precise::max(_2257, 0.0);
    uint _2261 = uint(_2259);
    bool _2263 = !_2133;
    float _2265 = _2263 ? _183 : as_type<float>(_2231);
    float _2267 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1924);
    float _2269 = -_183;
    int _2271 = _2249 ? as_type<int>(_2269) : as_type<int>(_183);
    float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2275 = _1205 + _2273;
    float _2277 = _2255;
    if (_1997)
    {
        _2277 = _1970;
    }
    float _2279 = _2277;
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2283 = !_2143;
    float _2285 = _2283 ? _193 : as_type<float>(_2245);
    float _2287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2289 = !_2173;
    float _2291 = _2289 ? _183 : as_type<float>(_2271);
    float _2293 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2281);
    float _2295 = fma(_2233, _2275, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2299 = _1205 + _2297;
    if (_1997)
    {
        _2019 = _1972;
    }
    float _2301 = _2019;
    float _2303 = _2285 + (-0.5);
    bool _2305 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2307 = isnan(_1205);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2313 = _2309 || _2311;
    float _2315 = float(_2313);
    float _2317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2319 = fma(_2211, _2299, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2321 = int(_2199) + int(_2261);
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2325 = _1205 + _2323;
    bool _2327 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2329 = isnan(_1205);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2335 = _2331 || _2333;
    float _2337 = float(_2335);
    float _2339 = -_2315;
    float _2341 = _2339 + 1.0;
    float _2343 = fma(_2247, _2325, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2345 = _1942 * _2321;
    int _2347 = _2345 + _2153;
    float _2349 = -_2337;
    float _2351 = _2349 + 1.0;
    bool _2353 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2355 = isnan(_1205);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2361 = _2357 || _2359;
    float _2363 = float(_2361);
    float _2365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2367 = _1916 * _2341;
    float _2369 = _2315 * _2351;
    bool _2371 = uint(_2347) >= uint(_1920);
    float _2373 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2365);
    float _2375 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2377 = as_type<float>(_1964) * _2189;
    bool _2379 = !_2371;
    int _2381 = _2379 ? 0 : (-1);
    float _2383 = -_1916;
    float _2385 = _2383 + 1.0;
    float _2387 = -_93;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2193);
    float _2391 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2175);
    int _2393 = ~_2321;
    int _2395 = _2393 + _2381;
    int _2397 = _2395 + 1;
    float _2399 = trunc(_2377);
    float _2401 = precise::max(_2399, 0.0);
    uint _2403 = uint(_2401);
    float _2405 = _2287 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2407 = _2265 + 0.5;
    float _2409 = _2363 * _2385;
    int _2411 = _1920 * _2397;
    int _2413 = _2411 + _2153;
    float _2415 = fma(_2405, _2407, _2389);
    float _2417 = -_2375;
    float _2419 = -_2391;
    float _2421 = fma(_2417, _2303, _2419);
    float _2423 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2425 = !_2063;
    int _2427 = _2425 ? _2413 : (-1);
    float _2429 = _2319 * _2409;
    int _2431 = ~_1920;
    int _2433 = _2431 + 1;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2437 = _2427 >> 31;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2441 = _2433 * int(_2403);
    int _2443 = _2441 + _2129;
    int _2445 = _2437 & 3;
    float _2447 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2435);
    float _2449 = _2279 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2453 = _2427 + _2445;
    float _2455 = -_2363;
    float _2457 = _2455 + 1.0;
    float _2459 = fma(_2423, -2.0, _2439);
    float _2461 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2293);
    int _2463 = _2453 >> 2;
    float _2465 = -_2451;
    float _2467 = fma(_2449, 2.0, _2465);
    float _2469 = float(uint(_2443));
    float _2471 = fma(_2457, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2429);
    int _2473 = _2463 << 4;
    int _2475 = _2473 + 512;
    float _2477 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2447);
    float _2479 = -_93;
    float _2481 = fma(_2479, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2467);
    float _2483 = as_type<float>(_1964) * _2469;
    uint _2485 = uint(int(uint(_2475) >> uint(2)));
    uint _2487 = uint(int(uint(int(_2485)) >> uint(2)));
    int _2489 = int(_2485) & 3;
    float _2491 = (*spvDescriptorSet0.vp_c9)._m0[int(_2487)][_2489];
    int _2493 = int(_2485) + 1;
    uint _2495 = uint(int(uint(_2493) >> uint(2)));
    int _2497 = _2493 & 3;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[int(_2495)][_2497];
    float _2501 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2267);
    float _2503 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2373);
    float _2505 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2459);
    float _2507 = fma(_2295, _2367, _2471);
    float _2509 = -_2501;
    float _2511 = _2509 + 1.0;
    int _2513 = _2427 & 3;
    bool _2515 = _2513 != 0;
    float _2517 = _2291 + 0.5;
    int _2519 = _2475 + 8;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    uint _2523 = uint(int(uint(int(_2521)) >> uint(2)));
    int _2525 = int(_2521) & 3;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[int(_2523)][_2525];
    int _2529 = int(_2521) + 1;
    uint _2531 = uint(int(uint(_2529) >> uint(2)));
    int _2533 = _2529 & 3;
    float _2535 = (*spvDescriptorSet0.vp_c9)._m0[int(_2531)][_2533];
    int _2537 = _2427 & 3;
    bool _2539 = _2537 != 0;
    float _2541 = -_2477;
    float _2543 = _2541 + 1.0;
    float _2545 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2481);
    float _2547 = trunc(_2483);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    bool _2553 = uint(_2537) > 1u;
    float _2555 = -_2461;
    float _2557 = _2555 + 1.0;
    bool _2559 = _2537 != 3;
    float _2561 = -_2543;
    float _2563 = fma(_2291, _2561, _2545);
    int _2565 = _2515 ? 0 : 1;
    float _2567 = _2221 + (-0.5);
    bool _2569 = uint(_2537) >= 2u;
    float _2571 = fma(_2285, _2557, _2421);
    int _2573 = ~_2565;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    float _2579 = -_2511;
    float _2581 = fma(_2265, _2579, _2415);
    float _2583 = -_2567;
    float _2585 = -_2505;
    float _2587 = fma(_2583, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2585);
    float _2589 = -_2503;
    float _2591 = _2589 + 1.0;
    int _2593 = _2569 ? 0 : 1;
    float _2595 = fma(_2343, _2369, _2507);
    int _2597 = _2577;
    if (!_2553)
    {
        int _2599 = ~_2565;
        int _2601 = _2599 + 1;
        _2597 = _2601;
    }
    int _2603 = _2597;
    float _2605 = fma(_2221, _2591, _2587);
    bool _2607 = !_2539;
    int _2609 = _2607 ? 0 : 1;
    float _2611 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2595);
    int _2613 = abs(_2603);
    float _2615 = _1954 * _1869;
    int _2617 = ~_2593;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    out.m_60.x = _2581;
    out.m_60.y = _2571;
    out.m_60.z = _2563;
    out.m_60.w = _2605;
    int _2623 = _2621;
    if (_2559)
    {
        int _2625 = ~_2593;
        int _2627 = _2625 + 1;
        _2623 = _2627;
    }
    int _2629 = _2623;
    float _2631 = -_1954;
    float _2633 = _2631 + 1.0;
    bool _2635 = _2537 != 3;
    int _2637 = abs(_2609);
    int _2639 = int(_2403) + int(_2551);
    int _2641 = ~_1920;
    int _2643 = _2641 + 1;
    bool _2645 = !_2635;
    int _2647 = _2645 ? 0 : (-1);
    int _2649 = _2643 * _2639;
    int _2651 = _2649 + _2129;
    int _2653 = ~_2613;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    int _2659 = abs(_2647);
    int _2661 = abs(_2629);
    int _2663 = _2657 * as_type<int>(_2499);
    int _2665 = ~_2637;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    bool _2671 = uint(_2651) >= uint(_1920);
    int _2673 = ~_2661;
    int _2675 = _2673 + 1;
    int _2677 = _2675 + 1;
    int _2679 = _2669 * as_type<int>(_2491);
    int _2681 = _2679 + _2663;
    bool _2683 = !_2671;
    int _2685 = _2683 ? 0 : (-1);
    float _2687 = _1495 * _1553;
    int _2689 = _2677 * as_type<int>(_2527);
    int _2691 = _2689 + _2681;
    bool _2693 = !_2125;
    int _2695 = _2693 ? 0 : 1;
    float _2697 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2699 = ~_2639;
    int _2701 = _2699 + _2685;
    int _2703 = _2701 + 1;
    int _2705 = ~_2659;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    float _2711 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2713 = abs(_2695);
    int _2715 = _1920 * _2703;
    int _2717 = _2715 + _2129;
    float _2719 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2721 = _2709 * as_type<int>(_2535);
    int _2723 = _2721 + _2691;
    int _2725 = ~_2713;
    int _2727 = _2725 + 1;
    int _2729 = _2727 + 1;
    float _2731 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2733 = !_2063;
    int _2735 = _2733 ? _2717 : (-1);
    float _2737 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2739 = _1495 > 0.0;
    bool _2741 = isnan(_1495);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan(0.0);
    bool _2747 = _2743 || _2745;
    int _2749 = _2723 * _2729;
    float _2751 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1926);
    float _2753 = _2737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2755 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2757 = _2735 * _2713;
    int _2759 = _2757 + _2749;
    float _2761 = _2697 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2763 = _2751 + _1805;
    bool _2765 = _1553 <= 0.0;
    bool _2767 = !_2747;
    bool _2769 = _2765 || _2767;
    out.m_62.x = _2753;
    out.m_62.y = _2719;
    out.m_62.z = _2755;
    out.m_62.w = _2731;
    float _2771 = _2763 * 0.5;
    float _2773 = float(_2759);
    float _2775 = _1890 * _2615;
    out.m_49.x = _2761;
    out.gl_Position.x = _1841;
    out.gl_Position.y = _1843;
    out.gl_Position.z = _2751;
    out.gl_Position.w = _1805;
    out.m_64.y = _2773;
    float _2777 = _1880 * _2615;
    float _2779 = _1880 * _2633;
    out.m_66.z = _2771;
    out.m_66.w = _1805;
    float _2781 = fma(_1886, _2777, _1874);
    float _2783 = fma(_1888, _2777, _1876);
    float _2785 = fma(_1880, _2775, _1878);
    out.m_68.x = _2781;
    out.m_68.y = _2783;
    out.m_68.z = _2785;
    out.m_68.w = _2779;
    if (!_2769)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2787 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2787;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

