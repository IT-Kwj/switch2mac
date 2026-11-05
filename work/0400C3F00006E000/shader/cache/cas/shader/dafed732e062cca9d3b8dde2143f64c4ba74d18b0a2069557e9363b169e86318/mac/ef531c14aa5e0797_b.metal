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
    float4 m_49 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2494 = false;
    bool _301 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_107)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2798 = as_type<float>(_117);
        out.gl_Position.z = _2798;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_51.w;
    float _123 = float(_103);
    float _125 = -_121;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_121);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    bool _139 = _127 >= _123;
    bool _141 = !_137;
    bool _143 = _139 || _141;
    float _145 = _121;
    float _147 = _127;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2863 = as_type<float>(_153);
        out.gl_Position.z = _2863;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    float _161 = 1.0 / _123;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = _127 * _161;
    float _167 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _171 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _173 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    float _177 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _171);
    float _179 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _173);
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _175);
    float _183 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _177);
    bool _185 = !_163;
    float _203;
    if (!_185)
    {
        float _187 = in.m_55.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        _203 = _165;
    }
    _205 = false;
    float _207 = _203;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -_223;
    float _231 = _229 + 1.0;
    bool _233 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _235 = isnan(_207);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _227;
    float _253 = _243 * _231;
    float _255 = -_243;
    float _257 = _255 + 1.0;
    float _259 = _211 * _251;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = fma(_247, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = fma(_263, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _269 = _265 * _253;
    float _271 = _267 * _253;
    float _273 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_249;
    float _299;
    if (!_281)
    {
        float _283 = in.m_55.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        _299 = _165;
    }
    _301 = false;
    float _303 = _299;
    float _305 = in.m_55.x;
    float _307 = in.m_55.y;
    float _309 = in.m_55.z;
    float _311 = in.m_55.w;
    float _313 = as_type<float>(int(gl_VertexIndex));
    float _315 = in.m_60.x;
    float _317 = in.m_60.y;
    float _319 = in.m_46.x;
    float _321 = in.m_46.y;
    float _323 = in.m_46.z;
    float _325 = _305 * 2.0;
    float _327 = _309 * 2.0;
    int _329 = as_type<int>(_313) & 1;
    bool _331 = _329 != 0;
    int _333 = as_type<int>(_313) & 2;
    bool _335 = _333 != 0;
    float _337 = floor(_325);
    float _339 = _277 * _315;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _351 = _349 != 0;
    float _353 = _279 * _317;
    float _355 = _321 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _321 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = floor(_327);
    float _361 = _321 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _367 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _369 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _371 = _307 + _309;
    bool _373 = _337 >= 0.0;
    bool _375 = isnan(_337);
    bool _377 = _373 || _375;
    bool _379 = isnan(0.0);
    bool _381 = _377 || _379;
    float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _385 = log2(_383);
    float _387 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _363);
    float _389 = _371 + (-1.0);
    int _391 = _381 ? 0 : 1;
    float _393 = _307 + _305;
    bool _395 = _337 > 0.0;
    float _397 = _307 * 2.0;
    bool _399 = _359 >= 0.0;
    bool _401 = isnan(_359);
    bool _403 = _399 || _401;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    float _409 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _411 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _413 = _393 + (-1.0);
    float _415 = floor(_397);
    int _417 = _407 ? 0 : 1;
    float _419 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _409);
    bool _421 = _359 > 0.0;
    float _423 = _309 + _305;
    float _425 = _385 * _127;
    int _427 = ~_391;
    int _429 = _427 + 1;
    int _431 = _429 + 1;
    float _433 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _435 = _423 + (-1.0);
    int _437 = _431;
    if (!_395)
    {
        int _439 = ~_391;
        int _441 = _439 + 1;
        _437 = _441;
    }
    int _443 = _437;
    float _445 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _447 = exp2(_425);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _451 = ~_417;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    float _457 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _459 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    int _461 = _455;
    if (!_421)
    {
        int _463 = ~_417;
        int _465 = _463 + 1;
        _461 = _465;
    }
    int _467 = _461;
    float _469 = _307 + (-0.5);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _473 = 1.0 + _471;
    bool _475 = _415 > 0.0;
    float _477 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _479 = _415 >= 0.0;
    bool _481 = isnan(_415);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _419);
    float _491 = in.m_62.x;
    float _493 = in.m_62.y;
    float _495 = in.m_62.z;
    bool _497 = !_343;
    int _499 = _497 ? 0 : 1;
    float _501 = 1.0 / _473;
    float _503 = float(_467);
    float _505 = -_447;
    float _507 = _505 + 1.0;
    int _509 = abs(_499);
    float _511 = _445 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _513 = !_347;
    int _515 = _513 ? 0 : 1;
    float _517 = _353 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _519 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _521 = isnan(1.0);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _527 = _523 || _525;
    float _529 = rsqrt(_489);
    int _531 = abs(_515);
    float _533 = _459 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _535 = float(_509);
    float _537 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _539 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    int _549 = _487 ? 0 : 1;
    float _551 = _535 * _503;
    float _553 = _547 ? _507 : 0.0;
    int _555 = ~_549;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = float(_531);
    int _563 = _559;
    if (_527)
    {
        float _565 = _553 * _501;
        _147 = _565;
    }
    float _567 = _147;
    float _569 = float(_443);
    float _571 = _305 + (-0.5);
    if (!_475)
    {
        int _573 = ~_549;
        int _575 = _573 + 1;
        _563 = _575;
    }
    int _577 = _563;
    float _579 = _551 * (-2.0);
    float _581 = _561 * _569;
    float _583 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _585 = fma(_579, _491, _491);
    float _587 = fma(_433, _579, _433);
    bool _589 = !_351;
    int _591 = _589 ? 0 : 1;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _593;
    float _597 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[196].x, _585);
    float _599 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _601 = abs(_591);
    float _603 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _605 = _581 * (-2.0);
    float _607 = _599 * _599;
    float _609 = fma(_587, _567, _597);
    float _611 = 1.0 / _595;
    float _613 = fma(_605, _493, _493);
    float _615 = fma(_603, _603, _607);
    float _617 = float(_601);
    float _619 = fma(_411, _605, _411);
    float _621 = float(_577);
    float _623 = fma(_583, _583, _615);
    float _625 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[196].y, _613);
    float _627 = _309 + (-0.5);
    float _629 = _617 * _621;
    float _631 = rsqrt(_623);
    float _633 = fma(_619, _567, _625);
    float _635 = _477 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _637 = _629 * (-2.0);
    float _639 = _609 * 0.15915493667125701904296875;
    float _641 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _635);
    float _643 = fma(_637, _495, _495);
    float _645 = fma(_449, _637, _449);
    bool _647 = !_335;
    float _649 = _647 ? (-0.5) : 0.5;
    float _651 = _633 * 0.15915493667125701904296875;
    float _653 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[196].z, _643);
    float _655 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _387);
    float _657 = _639 * 6.283185482025146484375;
    float _659 = sin(_657);
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _649);
    float _663 = fma(_645, _567, _653);
    float _665 = _603 * _631;
    float _667 = _599 * _631;
    float _669 = _517 * _661;
    float _671 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[0].z, _641);
    float _673 = _655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _675 = _663 * 0.15915493667125701904296875;
    float _677 = -_511;
    float _679 = _677 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _681 = _671 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _683 = -_477;
    float _685 = _683 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _687 = _639 * 6.283185482025146484375;
    float _689 = cos(_687);
    float _691 = _583 * _631;
    float _693 = -_681;
    float _695 = _673 + _693;
    float _697 = _685 * _685;
    float _699 = abs(_695);
    float _701 = precise::max(_699, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _703 = _651 * 6.283185482025146484375;
    float _705 = sin(_703);
    float _707 = fma(_679, _679, _697);
    bool _709 = !_331;
    float _711 = _709 ? (-0.5) : 0.5;
    float _713 = -_533;
    float _715 = _713 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _717 = _681 >= _673;
    bool _719 = isnan(_681);
    bool _721 = _717 || _719;
    bool _723 = isnan(_673);
    bool _725 = _721 || _723;
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _711);
    float _729 = _651 * 6.283185482025146484375;
    float _731 = cos(_729);
    float _733 = _675 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = precise::min(_701, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _739 = _537 * _727;
    float _741 = fma(_715, _715, _707);
    float _743 = _659 * _705;
    bool _745 = !_725;
    float _747 = _745 ? 1.0 : (-1.0);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _751 = _737 + _749;
    float _753 = _675 * 6.283185482025146484375;
    float _755 = sin(_753);
    float _757 = _689 * _731;
    float _759 = _751 * _611;
    float _761 = _689 * _705;
    float _763 = _659 * _731;
    float _765 = _747 * _759;
    float _767 = _477 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _769 = _689 * _735;
    float _771 = _659 * _735;
    float _773 = _731 * _735;
    float _775 = _705 * _735;
    float _777 = sqrt(_741);
    float _779 = fma(_755, _757, _743);
    float _781 = fma(_755, _743, _757);
    float _783 = _769 * _669;
    float _785 = -_761;
    float _787 = fma(_755, _763, _785);
    float _789 = -_763;
    float _791 = fma(_755, _761, _789);
    float _793 = -_669;
    float _795 = _755 * _793;
    float _797 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _799 = fma(_779, _739, _783);
    float _801 = _771 * _669;
    float _803 = fma(_773, _739, _795);
    float _805 = fma(_791, _797, _799);
    float _807 = fma(_787, _739, _801);
    float _809 = fma(_775, _797, _803);
    float _811 = _805 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _813 = fma(_781, _797, _807);
    float _815 = _165 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _817 = _805 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = _805 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].x, _811);
    float _823 = _815 * _765;
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _827 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _821);
    float _831 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _767);
    float _833 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _825);
    float _835 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _827);
    float _837 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _839 = _823 * 0.15915493667125701904296875;
    float _841 = _833 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _843 = abs(_777);
    float _845 = precise::max(0.0, _843);
    float _847 = _477 + _837;
    float _849 = _835 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _851 = _511 + _841;
    float _853 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[2].z, _831);
    float _855 = _847 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _857 = _847 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _847 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _861 = precise::min(_845, 40.0);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _855);
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _857);
    float _867 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _859);
    float _869 = _533 + _849;
    float _871 = _839 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = fma(_861, -0.02500000037252902984619140625, 1.0);
    float _877 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _867);
    float _879 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _865);
    float _881 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _863);
    float _883 = _853 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _887 = _839 * 6.283185482025146484375;
    float _889 = cos(_887);
    float _891 = _879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _893 = _881 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _895 = -_885;
    float _897 = _895 + _883;
    float _899 = _691 * _691;
    float _901 = _891 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _903 = _891 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _905 = fma(_875, _897, _885);
    float _907 = _891 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _909 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[13].x, _901);
    float _911 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[12].x, _903);
    float _913 = _665 * _873;
    float _915 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[14].x, _907);
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[13].z, _909);
    float _919 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[12].z, _911);
    float _921 = _667 * _873;
    float _923 = -_889;
    float _925 = _923 + 1.0;
    float _927 = _917 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _929 = _919 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _931 = _691 * _873;
    float _933 = _667 * _925;
    float _935 = _665 * _925;
    float _937 = -_477;
    float _939 = _937 + _927;
    float _941 = -_511;
    float _943 = _941 + _929;
    float _945 = fma(_691, _933, _913);
    float _947 = -_921;
    float _949 = fma(_691, _935, _947);
    float _951 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[14].z, _915);
    float _953 = -_931;
    float _955 = fma(_667, _935, _953);
    float _957 = _945 * _939;
    float _959 = fma(_925, _899, _889);
    float _961 = _955 * _939;
    float _963 = fma(_949, _943, _957);
    float _965 = _951 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _967 = fma(_665, _935, _889);
    float _969 = fma(_691, _935, _921);
    float _971 = fma(_667, _933, _889);
    float _973 = -_533;
    float _975 = _973 + _965;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _981 = fma(_967, _943, _961);
    float _983 = fma(_667, _935, _931);
    float _985 = fma(_959, _975, _963);
    float _987 = fma(_165, _979, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _989 = fma(_969, _975, _981);
    float _991 = _971 * _939;
    float _993 = -_913;
    float _995 = fma(_691, _933, _993);
    float _997 = fma(_985, _987, _533);
    float _999 = fma(_989, _987, _511);
    float _1001 = fma(_983, _943, _991);
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _997 + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1009 = _999 + _1007;
    float _1011 = fma(_995, _975, _1001);
    float _1013 = _1005 * _1005;
    float _1015 = _477 + _1011;
    float _1017 = fma(_1009, _1009, _1013);
    float _1019 = sqrt(_1017);
    bool _1021 = _1019 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1023 = _691;
    float _1025 = _975;
    float _1027 = _931;
    float _1029 = _1019;
    float _1031 = _1005;
    if (!_1021)
    {
        _1023 = _999;
    }
    float _1033 = _1023;
    float _1035 = _1033;
    if (!_1021)
    {
        _1025 = _997;
    }
    float _1037 = _1025;
    float _1039 = _1037;
    if (!_1021)
    {
        _1027 = _1015;
    }
    float _1041 = _1027;
    bool _1043 = !_1021;
    float _1045 = _1041;
    if (!_1043)
    {
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1051 = _1019 + _1049;
        float _1053 = _1015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = rsqrt(_1017);
        float _1057 = _1051 * _1047;
        float _1059 = _1057 * 0.15915493667125701904296875;
        float _1061 = _1059 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = _1059 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1063 + (-1.0);
        float _1071 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = fma(_1067, _1053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1075 = fma(_1015, _1063, _1071);
        float _1077 = _1055 * _1073;
        float _1079 = fma(_1009, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1081 = fma(_1005, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1045 = _1075;
        _1035 = _1079;
        _1039 = _1081;
        _1029 = _1051;
    }
    float _1083 = _1045;
    float _1085 = _1035;
    float _1087 = _1039;
    float _1089 = _1029;
    float _1091 = -_477;
    float _1093 = _1091 + _1083;
    float _1095 = -_511;
    float _1097 = _1095 + _1085;
    float _1099 = -_533;
    float _1101 = _1099 + _1087;
    float _1103 = _1093 * _1093;
    float _1105 = fma(_1097, _1097, _1103);
    float _1107 = fma(_1101, _1101, _1105);
    float _1109 = sqrt(_1107);
    bool _1111 = _1109 > 0.0;
    bool _1113 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(0.5);
    bool _1121 = _1117 || _1119;
    float _1123 = _1087;
    float _1125 = _1085;
    float _1127 = _1097;
    float _1129 = _1089;
    if (!_1111)
    {
        _1031 = _1083;
    }
    float _1131 = _1031;
    bool _1133 = !_1111;
    float _1135 = _1131;
    float _1137 = _1131;
    if (!_1133)
    {
        float _1139 = _181 * _181;
        float _1141 = fma(_179, _179, _1139);
        float _1143 = fma(_183, _183, _1141);
        float _1145 = rsqrt(_1107);
        float _1147 = sqrt(_1143);
        float _1149 = _1093 * _1145;
        float _1151 = _1101 * _1145;
        bool _1153 = _1147 > 0.0;
        float _1155 = _1097 * _1145;
        if (!_1153)
        {
            _1135 = _1083;
        }
        float _1157 = _1135;
        bool _1159 = !_1153;
        _1137 = _1157;
        if (!_1159)
        {
            float _1161 = rsqrt(_1143);
            float _1163 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1165 = _181 * _1161;
            float _1167 = _179 * _1161;
            float _1169 = _1149 * _1165;
            float _1171 = _183 * _1161;
            float _1173 = fma(_1155, _1167, _1169);
            float _1175 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1177 = fma(_1151, _1171, _1173);
            float _1179 = _1177 * _1175;
            float _1181 = fma(_179, _1179, _1085);
            float _1183 = fma(_181, _1179, _1083);
            float _1185 = fma(_183, _1179, _1087);
            _1137 = _1183;
            _1123 = _1185;
            _1125 = _1181;
            _1127 = _1171;
        }
    }
    float _1187 = _1137;
    float _1189 = _1123;
    float _1191 = _1125;
    float _1193 = _1127;
    float _1195 = _1187;
    float _1197 = _1191;
    float _1199 = _1189;
    float _1201 = _1193;
    if (!_1121)
    {
        float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1205 = _477 + _1203;
        float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1209 = _511 + _1207;
        float _1211 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1213 = -_477;
        float _1215 = _1213 + _1187;
        float _1217 = _1205 * _1205;
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1221 = _533 + _1219;
        float _1223 = -_533;
        float _1225 = _1223 + _1189;
        float _1227 = fma(_1209, _1209, _1217);
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1231 = fma(_1221, _1221, _1227);
        float _1233 = sqrt(_1231);
        float _1235 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = -_511;
        float _1239 = _1237 + _1191;
        float _1241 = precise::min(_1233, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1243 = _1241 * _1229;
        float _1245 = _1235 * _1243;
        float _1247 = fma(_1239, _1245, _511);
        float _1249 = fma(_1215, _1245, _477);
        float _1251 = fma(_1225, _1245, _533);
        _1195 = _1249;
        _1197 = _1247;
        _1199 = _1251;
    }
    float _1253 = _1195;
    float _1255 = _1197;
    float _1257 = _1199;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1261 = _1253 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1265 = _1255 + _1263;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1269 = _1257 + _1267;
    float _1271 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1273 = _1261 * _1261;
    float _1275 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1271);
    float _1277 = fma(_1265, _1265, _1273);
    float _1279 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1281 = fma(_1269, _1269, _1277);
    float _1283 = rsqrt(_1281);
    float _1285 = sqrt(_1281);
    float _1287 = _1283 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1289 = _1265 * _1287;
    float _1291 = _1269 * _1287;
    float _1293 = _1289 * _1289;
    float _1295 = _1291 * _1291;
    float _1297 = _1293 + _1295;
    float _1299 = sqrt(_1297);
    bool _1301 = _1299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1305 = _1299 + _1303;
    float _1307 = _1269;
    float _1309 = _1297;
    float _1311 = _1305;
    float _1313 = _1261;
    if (_1301)
    {
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1315;
    }
    float _1317 = _1307;
    if (_1301)
    {
        float _1319 = rsqrt(_1297);
        _1309 = _1319;
    }
    float _1321 = _1309;
    float _1323 = _1321;
    if (_1301)
    {
        float _1325 = _1305 * _1317;
        _1311 = _1325;
    }
    float _1327 = _1311;
    if (_1301)
    {
        float _1329 = _1327 * 0.15915493667125701904296875;
        _1201 = _1329;
    }
    float _1331 = _1201;
    float _1333 = _1317;
    float _1335 = _1331;
    if (_1301)
    {
        float _1337 = _1331 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        _1333 = _1339;
    }
    float _1341 = _1333;
    float _1343 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1345 = precise::max(0.0, _1343);
    float _1347 = _1283;
    float _1349 = _1345;
    if (_1301)
    {
        float _1351 = _1331 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        _1347 = _1353;
    }
    float _1355 = _1347;
    float _1357 = -_1287;
    float _1359 = -_1345;
    float _1361 = fma(_1261, _1357, _1359);
    float _1363 = _1361;
    if (_1301)
    {
        float _1365 = _1361 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1349 = _1365;
    }
    float _1367 = _1349;
    if (!_1301)
    {
        _1335 = _1295;
    }
    float _1369 = _1335;
    float _1371 = _1341;
    float _1373 = _1369;
    if (_1301)
    {
        float _1375 = fma(_1341, _1367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1371 = _1375;
    }
    float _1377 = _1371;
    float _1379 = _1377;
    float _1381 = _1355;
    if (_1301)
    {
        float _1383 = _1355 + (-1.0);
        _1313 = _1383;
    }
    float _1385 = _1313;
    float _1387 = _1385;
    if (_1301)
    {
        float _1389 = _1321 * _1377;
        _1129 = _1389;
    }
    float _1391 = _1129;
    if (!_1301)
    {
        _1379 = _1289;
    }
    float _1393 = _1379;
    float _1395 = _1393;
    if (_1301)
    {
        float _1397 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1387 = _1397;
    }
    float _1399 = _1387;
    if (_1301)
    {
        float _1401 = _1289 * _1391;
        _1395 = _1401;
    }
    float _1403 = _1395;
    if (!_1301)
    {
        _1323 = _1291;
    }
    float _1405 = _1323;
    float _1407 = _1405;
    if (_1301)
    {
        float _1409 = _1291 * _1391;
        _1407 = _1409;
    }
    float _1411 = _1407;
    if (_1301)
    {
        float _1413 = fma(_1361, _1355, _1399);
        _1363 = _1413;
    }
    float _1415 = _1363;
    if (!_1301)
    {
        _1381 = _1293;
    }
    float _1417 = _1381;
    float _1419 = _1417;
    if (_1301)
    {
        float _1421 = _1403 * _1403;
        _1419 = _1421;
    }
    float _1423 = _1419;
    if (_1301)
    {
        float _1425 = _1411 * _1411;
        _1373 = _1425;
    }
    float _1427 = _1373;
    float _1429 = fma(_511, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1431 = fma(_1415, _1415, _1423);
    float _1433 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1435 = floor(_1429);
    float _1437 = _1431 + _1427;
    float _1439 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1433);
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1443 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1441);
    float _1445 = precise::clamp(_1443, 0.0, 1.0);
    float _1447 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1449 = rsqrt(_1437);
    float _1451 = -_1445;
    float _1453 = _1451 + 1.0;
    float _1455 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1457 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1459 = fma(_533, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1461 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1463 = abs(_1453);
    float _1465 = log2(_1463);
    float _1467 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1469 = -_1461;
    float _1471 = fma(_1469, _1457, 1.0);
    float _1473 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1475 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1467);
    float _1477 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1473);
    float _1479 = _1449 * _1403;
    float _1481 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1475);
    float _1483 = _1449 * _1415;
    float _1485 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1477);
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1491 = _1449 * _1411;
    float _1493 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1495 = -_1487;
    float _1497 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1495);
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1501 = floor(_1459);
    float _1503 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1505 = -_1491;
    float _1507 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1497);
    float _1509 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1499);
    float _1511 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1513 = -_1435;
    float _1515 = _1429 + _1513;
    float _1517 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1519 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1509);
    float _1521 = log2(_1471);
    float _1523 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1525 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1517);
    float _1527 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1519);
    float _1529 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1523);
    float _1531 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1525);
    float _1533 = exp2(_1511);
    float _1535 = fma(_1507, -0.5, 0.5);
    float _1537 = fma(_1507, 0.5, 0.5);
    float _1539 = -_1501;
    float _1541 = _1459 + _1539;
    float _1543 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1529);
    float _1545 = _1483 + 1.0;
    float _1547 = fma(_1537, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1531);
    float _1551 = 1.0 / _1527;
    float _1553 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1543);
    float _1555 = fma(_1537, _1547, -0.212114393711090087890625);
    float _1557 = _1521 * 0.693147182464599609375;
    float _1559 = sqrt(_1535);
    float2 _5116 = float2(_1515, _1541);
    float _1561 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5116, float2(0.0), isnan(_5116)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5116, float2(0.0), isnan(_5116)), level(0.0)).x;
    float _1563 = fma(_1537, _1555, 1.570728778839111328125);
    float _1565 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1567 = _1553 * _1551;
    float _1569 = -_1483;
    float _1571 = fma(_1533, _1545, _1569);
    float _1573 = _1549 * _1551;
    float _1575 = fma(_1571, 0.5, 0.5);
    float _1577 = fma(_1573, 0.5, 0.5);
    float _1579 = fma(_1567, -0.5, 0.5);
    float _1581 = _1559 * 0.636619746685028076171875;
    float _1583 = -_1563;
    float _1585 = fma(_1581, _1583, 1.0);
    float3 _5161 = float3(_1577, _1579, _1565);
    float _1587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5161, float3(0.0), isnan(_5161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5161, float3(0.0), isnan(_5161)), level(0.0)).x;
    float3 _5172 = float3(_1577, _1579, _1565);
    float4 _1590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).xyzw;
    float _1592 = _1590.x;
    float _1594 = _1590.y;
    float _1596 = _1590.z;
    float _1598 = _1590.w;
    float2 _5188 = float2(_1585, _1575);
    float3 _1602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5188, float2(0.0), isnan(_5188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5188, float2(0.0), isnan(_5188)), level(0.0)).xyz;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1612 = _165 + _1610;
    float _1614 = _477 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1620 = _311 > 0.5;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1630 = 1.0 / _1618;
    bool _1632 = _305 > 0.5;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1642 = _477 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1644 = _307 > 0.5;
    float _1646 = 1.0 / _1624;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1652 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1656 = _1654 != 0;
    float _1658 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1662 = _1660 != 0;
    float _1664 = 1.0 / _1628;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1668 = _1666 != 0;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1670;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1676 = _1674 != 0;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1680 = _1678 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1682 = -_711;
    int _1684 = _1632 ? as_type<int>(_1682) : as_type<int>(_711);
    float _1686 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1658);
    bool _1688 = _309 > 0.5;
    float _1690 = 1.0 / _1636;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1700 = _1672 * _1646;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1702;
    float _1706 = _1698 * _1630;
    float _1708 = 1.0 / _1640;
    bool _1710 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1712 = isnan(_165);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = _1704 * _1664;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1728 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1730 = isnan(_165);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = -_1720;
    float _1742 = _1740 + 1.0;
    bool _1744 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1746 = isnan(_165);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = 1.0 / _1650;
    float _1758 = _1694 * _1690;
    float _1760 = _1738 * _1742;
    float _1762 = -_1738;
    float _1764 = _1762 + 1.0;
    bool _1766 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1768 = isnan(_165);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1782 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1784 = isnan(_165);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = _1754 * _1764;
    float _1796 = _1680 * _1708;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1798;
    float _1802 = 1.0 / _1726;
    float _1804 = -_1776;
    float _1806 = _1804 + 1.0;
    float _1808 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1686);
    bool _1810 = !_1656;
    float _1812 = _1810 ? _711 : as_type<float>(_1684);
    float _1814 = _1792 * _1806;
    float _1816 = _1800 * _1756;
    float _1818 = -_1754;
    float _1820 = _1818 + 1.0;
    float _1822 = -_1792;
    float _1824 = _1822 + 1.0;
    bool _1826 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1828 = isnan(_165);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1834 = _1830 || _1832;
    float _1836 = float(_1834);
    float _1838 = _1776 * _1820;
    float _1840 = exp2(_1652);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1846 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1848 = isnan(_165);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = -_1836;
    float _1860 = _1858 + 1.0;
    float _1862 = _1780 * _1802;
    float _1864 = fma(_1758, _1612, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1866 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1868 = isnan(_165);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = _1856 * _1824;
    float _1880 = 1.0 / _1844;
    float _1882 = -_1856;
    float _1884 = _1882 + 1.0;
    float _1886 = _1836 * _1884;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1888;
    float _1892 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1614);
    float _1894 = _1876 * _1860;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1898 = _303 + _1896;
    float _1900 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1642);
    float _1902 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1892);
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1906 = _165 + _1904;
    float _1908 = fma(_1722, _1898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1910 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1900);
    float _1912 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1914 = _165 + _1912;
    float _1916 = _1890 * _1880;
    float _1918 = _1864 * _1894;
    float _1920 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1922 = -_1876;
    float _1924 = _1922 + 1.0;
    float _1926 = fma(_1706, _1906, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1928 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1930 = 1.0 / _1920;
    float _1932 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1918);
    float _1934 = fma(_1700, _1914, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1938 = _165 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1942 = _165 + _1940;
    float _1944 = fma(_1926, _1886, _1932);
    float _1946 = _1928 + _1920;
    float _1948 = fma(_1796, _1938, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1950 = fma(_1816, _1942, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1952 = fma(_1934, _1878, _1944);
    float _1954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1958 = _165 + _1956;
    float _1960 = fma(_1948, _1814, _1952);
    bool _1962 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1964 = isnan(_303);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1970 = _1966 || _1968;
    float _1972 = float(_1970);
    float _1974 = -_1840;
    float _1976 = _1974 + 1.0;
    float _1978 = _1946 * _1930;
    float _1980 = _1978 * 0.5;
    float _1982 = fma(_1950, _1838, _1960);
    float _1984 = fma(_1862, _1958, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1988 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1986);
    bool _1990 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1992 = isnan(_303);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = -_1972;
    float _2004 = _2002 + 1.0;
    bool _2006 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    float _2016 = 1.0 / _1988;
    float _2018 = _1812 + 0.5;
    float _2020 = fma(_1984, _1794, _1982);
    float _2022 = -_711;
    int _2024 = _1688 ? as_type<int>(_2022) : as_type<int>(_711);
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2028 = _165 + _2026;
    float _2030 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2032 = _2000 * _2004;
    bool _2034 = !_1668;
    float _2036 = _2034 ? _711 : as_type<float>(_2024);
    float _2038 = fma(_1916, _2028, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2040 = _2030 * _1954;
    float _2042 = _1908 * _2032;
    float _2044 = -_2000;
    float _2046 = _2044 + 1.0;
    float _2048 = fma(_2038, _1760, _2020);
    float _2050 = -_649;
    int _2052 = _1620 ? as_type<int>(_2050) : as_type<int>(_649);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2056 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2042);
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2060 = _2016 * _2058;
    bool _2062 = !_1676;
    float _2064 = _2062 ? _649 : as_type<float>(_2052);
    float _2066 = _2036 + 0.5;
    float _2068 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2056);
    float _2070 = -_649;
    int _2072 = _1644 ? as_type<int>(_2070) : as_type<int>(_649);
    float _2074 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2048);
    float _2076 = abs(_2060);
    float _2078 = log2(_2076);
    float _2080 = -_2064;
    float _2082 = _2080 + 0.5;
    bool _2084 = !_1662;
    float _2086 = _2084 ? _649 : as_type<float>(_2072);
    float _2088 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2092 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2094 = -_2086;
    float _2096 = _2094 + 0.5;
    float _2098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2100 = _2088 * _2054;
    float _2102 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2104 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2106 = _2068 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2112 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2114 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2116 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2118 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _2074;
    float _2120 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2122 = -_755;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2116);
    float _2126 = exp2(_2112);
    float _2128 = _2090 * _2098;
    float _2130 = -_755;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2092);
    float _2134 = -_755;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2104);
    float _2138 = _779 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2142 = _2102 * _2110;
    float _2144 = _711 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2146 = _2110;
    float _2148 = _2082;
    float _2150 = _2060;
    if (!_2014)
    {
        _2146 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2152 = _2146;
    float _2154 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _2040;
    out.m_66.y = _2142;
    out.m_66.z = _2100;
    out.m_66.w = _2128;
    float _2156 = _2152;
    if (!_2014)
    {
        float _2158 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2160 = _2060 + _2158;
        _2148 = _2160;
    }
    float _2162 = _2148;
    if (!_2014)
    {
        float _2164 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2166 = _2152 + _2164;
        _2156 = _2166;
    }
    float _2168 = _2156;
    float _2170 = fma(_2126, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2172 = precise::clamp(_2170, 0.0, 1.0);
    out.m_68.x = _2154;
    out.m_68.y = _2118;
    out.m_68.z = _2120;
    out.m_68.w = _2106;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2176 = _1984;
    float _2178 = _2168;
    if (!_2014)
    {
        float _2180 = 1.0 / _2168;
        _2176 = _2180;
    }
    float _2182 = _2176;
    bool _2184 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2186 = isnan(_1285);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2192 = _2188 || _2190;
    out.m_70.w = _2174;
    float _2194 = _779 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2196 = _649 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2198 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2200 = fma(_2172, -2.0, 3.0);
    float _2202 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2194);
    float _2204 = _791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2206 = _791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2208 = _2172 * _2172;
    float _2210 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2124);
    float _2212 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2132);
    float _2214 = _791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2216 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2136);
    float _2218 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2204);
    float _2220 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2206);
    float _2222 = _2208 * _2200;
    float _2224 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2214);
    float _2226 = _779 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2228 = _2196 * _2210;
    float _2230 = _2196 * _2212;
    float _2232 = _2196 * _2216;
    float _2234 = -_2222;
    float _2236 = _2234 + 1.0;
    float _2238 = in.m_72.x;
    float _2240 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2242 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2198);
    bool _2244 = _2060 <= 8000.0;
    bool _2246 = isnan(_2060);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan(8000.0);
    bool _2252 = _2248 || _2250;
    float _2254 = float(_2252);
    float _2256 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2222);
    float _2258 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2202);
    float _2260 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2240);
    float _2262 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2220);
    float _2264 = _2254 * _2256;
    float _2266 = fma(_2144, _2242, _2228);
    float _2268 = fma(_2144, _2258, _2230);
    float _2270 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2218);
    float _2272 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    float _2274 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1808);
    float _2276 = fma(_2144, _2260, _2232);
    float _2278 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2280 = _2262 + _2268;
    float _2282 = _2274 + _1527;
    float _2284 = _2270 + _2266;
    float _2286 = _2272 + _2276;
    float _2288 = _2270;
    float _2290 = _2274;
    if (!_2014)
    {
        _2288 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2292 = _2288;
    float _2294 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2296 = _2282 * 0.5;
    out.gl_Position.x = _1549;
    out.gl_Position.y = _1553;
    out.gl_Position.z = _2274;
    out.gl_Position.w = _1527;
    float _2298 = _2292;
    float _2300 = _1527;
    if (!_2014)
    {
        float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2304 = _2060 + _2302;
        _2150 = _2304;
    }
    float _2306 = _2150;
    float _2308 = _2306;
    if (_2014)
    {
        _2178 = 1.0;
    }
    float _2310 = _2178;
    float _2312 = _2310;
    if (!_2014)
    {
        float _2314 = _2162 * _2182;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        _2312 = _2316;
    }
    float _2318 = _2312;
    out.m_74.z = _2296;
    out.m_74.w = _1527;
    out.m_76.x = _2284;
    out.m_76.y = _2280;
    out.m_76.z = _2286;
    if (!_2014)
    {
        float _2320 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2322 = _2292 + _2320;
        _2290 = _2322;
    }
    float _2324 = _2290;
    if (!_2192)
    {
        _2298 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2326 = _2298;
    float _2328 = _2326;
    float _2330 = _2326;
    if (!_2192)
    {
        _2300 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2332 = _2300;
    float _2334 = _2296;
    float _2336 = _2332;
    float _2338 = _2332;
    if (!_2014)
    {
        float _2340 = 1.0 / _2324;
        _2334 = _2340;
    }
    float _2342 = _2334;
    float _2344 = -_1561;
    float _2346 = _2344 + 1.0;
    float _2348 = _2346 * _2278;
    float _2350 = precise::clamp(_2348, 0.0, 1.0);
    if (!_2014)
    {
        float _2352 = _2306 * _2342;
        float _2354 = precise::clamp(_2352, 0.0, 1.0);
        _2308 = _2354;
    }
    float _2356 = _2308;
    float _2358 = -_2350;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2362 = _2360 * _2238;
    float _2364 = _2294 * _1587;
    float _2366 = -_2294;
    float _2368 = _2366 + 1.0;
    float _2370 = _1598 * _2364;
    float _2372 = _1608 * _2364;
    float _2374 = _1598 * _2368;
    float _2376 = _2368;
    float _2378 = _2362;
    if (!_2192)
    {
        _2376 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2380 = _2376;
    float _2382 = fma(_1604, _2370, _1592);
    float _2384 = _2362 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2386 = _2382;
    float _2388 = _2380;
    float _2390 = _2380;
    if (_2014)
    {
        _2378 = 1.0;
    }
    float _2392 = _2378;
    float _2394 = _2392;
    if (!_2014)
    {
        float _2396 = -_2356;
        float _2398 = _2396 + 1.0;
        _2394 = _2398;
    }
    float _2400 = _2394;
    float _2402 = fma(_1606, _2370, _1594);
    float _2404 = fma(_1598, _2372, _1596);
    out.m_78.x = _2384;
    float _2406 = _2318 * _2400;
    out.m_80.x = _2382;
    out.m_80.y = _2402;
    out.m_80.z = _2404;
    out.m_80.w = _2374;
    float _2408 = _2406 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2410 = _2406;
    float _2412 = _2402;
    if (!_2192)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2414 = _2410;
    float _2416 = _2414;
    float _2418 = _2414;
    if (!_2192)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2420 = _2412;
    float _2422 = _2420;
    float _2424 = _2420;
    if (!_2192)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2426 = _2386;
    bool _2428 = !_2192;
    float _2430 = _2426;
    float _2432 = _2426;
    if (!_2428)
    {
        bool _2434 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2436 = isnan(_1285);
        bool _2438 = _2434 || _2436;
        bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2442 = _2438 || _2440;
        if (!_2442)
        {
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2446 = _1285 + _2444;
            float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2450 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2448;
            float _2452 = 1.0 / _2450;
            float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2474 = _2446 * _2452;
            float _2476 = precise::clamp(_2474, 0.0, 1.0);
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2482 = fma(_2476, _2456, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2484 = fma(_2476, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2486 = fma(_2476, _2460, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2488 = fma(_2476, _2464, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2490 = fma(_2476, _2468, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2492 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2390 = _2484;
            _2424 = _2490;
            _2330 = _2482;
            _2418 = _2488;
            _2338 = _2486;
            _2432 = _2492;
            _2494 = true;
        }
        else
        {
            bool _2496 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2498 = isnan(_1285);
            bool _2500 = _2496 || _2498;
            bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2504 = _2500 || _2502;
            if (!_2504)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2506 = _2328;
            _2330 = _2506;
            if (!_2504)
            {
                _2388 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2508 = _2388;
            _2390 = _2508;
            if (!_2504)
            {
                _2336 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2510 = _2336;
            _2338 = _2510;
            if (!_2504)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2512 = _2416;
            _2418 = _2512;
            if (!_2504)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2514 = _2422;
            _2424 = _2514;
            if (!_2504)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2516 = _2430;
            bool _2518 = !_2504;
            _2432 = _2516;
            if (!_2518)
            {
                bool _2520 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2522 = isnan(_1285);
                bool _2524 = _2520 || _2522;
                bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2528 = _2524 || _2526;
                if (!_2528)
                {
                    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2532 = _1285 + _2530;
                    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2536 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2534;
                    float _2538 = 1.0 / _2536;
                    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2560 = _2532 * _2538;
                    float _2562 = precise::clamp(_2560, 0.0, 1.0);
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2568 = fma(_2562, _2542, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2570 = fma(_2562, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2572 = fma(_2562, _2546, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2574 = fma(_2562, _2550, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2576 = fma(_2562, _2554, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2578 = fma(_2562, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2390 = _2570;
                    _2424 = _2576;
                    _2330 = _2568;
                    _2418 = _2574;
                    _2338 = _2572;
                    _2432 = _2578;
                    _2494 = true;
                }
                else
                {
                    _2390 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2338 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2494 = false;
    float _2580 = _2390;
    float _2582 = _2424;
    float _2584 = _2330;
    float _2586 = _2418;
    float _2588 = _2338;
    float _2590 = _2432;
    float _2592 = fma(_2280, -0.5, 0.5);
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    float _2596 = -_2580;
    float _2598 = _2596 + _2582;
    float _2600 = -_2584;
    float _2602 = _2600 + _2586;
    out.m_82.x = 0.0;
    float _2604 = fma(_2594, _2598, _2580);
    float _2606 = -_2588;
    float _2608 = _2606 + _2590;
    float _2610 = fma(_2594, _2602, _2584);
    float _2612 = _2604 * 0.586610972881317138671875;
    bool _2614 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2616 = fma(_2594, _2608, _2588);
    float _2618 = _2408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2620 = fma(_2610, 0.298911988735198974609375, _2612);
    bool _2622 = _2318 > 0.0;
    bool _2624 = isnan(_2318);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan(0.0);
    bool _2630 = _2626 || _2628;
    float _2632 = fma(_2616, 0.114477999508380889892578125, _2620);
    out.m_49.x = _2618;
    bool _2634 = _2400 <= 0.0;
    bool _2636 = !_2630;
    bool _2638 = _2634 || _2636;
    float _2640 = -_2632;
    float _2642 = _2610 + _2640;
    float _2644 = -_2632;
    float _2646 = _2616 + _2644;
    float _2648 = fma(_2642, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2632);
    float _2650 = -_2632;
    float _2652 = _2604 + _2650;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2632);
    float _2656 = fma(_2646, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2632);
    bool _2658 = !_2614;
    if (!_2658)
    {
        float _2660 = -_1253;
        float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2664 = -_1255;
        float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2668 = -_1257;
        float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2672 = _2662 * _2662;
        float _2674 = fma(_2666, _2666, _2672);
        float _2676 = fma(_2670, _2670, _2674);
        float _2678 = sqrt(_2676);
        float _2680 = rsqrt(_2676);
        float _2682 = -_2678;
        float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2686 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2688 = precise::clamp(_2686, 0.0, 1.0);
        float _2690 = _2666 * _2680;
        float _2692 = _2662 * _2680;
        float _2694 = abs(_2688);
        float _2696 = log2(_2694);
        float _2698 = _2670 * _2680;
        float _2700 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2702 = _2280 * _2692;
        float _2704 = -_2692;
        float _2706 = -_2700;
        float _2708 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2706);
        float _2710 = fma(_2284, _2690, _2702);
        float _2712 = -_2698;
        float _2714 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2708);
        float _2716 = fma(_2286, _2698, _2710);
        float _2718 = precise::clamp(_2716, 0.0, 1.0);
        float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2722 = _2714 + _2720;
        float _2724 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2726 = _2722 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2728 = precise::clamp(_2726, 0.0, 1.0);
        float _2730 = exp2(_2724);
        float _2732 = _2730 * _2728;
        float _2734 = _2718 * _2732;
        float _2736 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2738 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2740 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2736;
        out.m_82.y = _2738;
        out.m_82.z = _2740;
    }
    out.m_84.x = _2648;
    out.m_84.y = _2654;
    out.m_84.z = _2656;
    if (!_2638)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2742 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2742;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2494 = false;
    bool _301 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_107)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2798 = as_type<float>(_117);
        out.gl_Position.z = _2798;
    }
    if (!_107)
    {
        return out;
    }
    float _121 = in.m_51.w;
    float _123 = float(_103);
    float _125 = -_121;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_121);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    bool _139 = _127 >= _123;
    bool _141 = !_137;
    bool _143 = _139 || _141;
    float _145 = _121;
    float _147 = _127;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2863 = as_type<float>(_153);
        out.gl_Position.z = _2863;
    }
    if (_143)
    {
        return out;
    }
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    float _161 = 1.0 / _123;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = _127 * _161;
    float _167 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _171 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _173 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    float _177 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _171);
    float _179 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _173);
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _175);
    float _183 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _177);
    bool _185 = !_163;
    float _203;
    if (!_185)
    {
        float _187 = in.m_55.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        _203 = _165;
    }
    _205 = false;
    float _207 = _203;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -_223;
    float _231 = _229 + 1.0;
    bool _233 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _235 = isnan(_207);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _227;
    float _253 = _243 * _231;
    float _255 = -_243;
    float _257 = _255 + 1.0;
    float _259 = _211 * _251;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = fma(_247, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = fma(_263, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _269 = _265 * _253;
    float _271 = _267 * _253;
    float _273 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_249;
    float _299;
    if (!_281)
    {
        float _283 = in.m_55.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        _299 = _165;
    }
    _301 = false;
    float _303 = _299;
    float _305 = in.m_55.x;
    float _307 = in.m_55.y;
    float _309 = in.m_55.z;
    float _311 = in.m_55.w;
    float _313 = as_type<float>(int(gl_VertexIndex));
    float _315 = in.m_60.x;
    float _317 = in.m_60.y;
    float _319 = in.m_46.x;
    float _321 = in.m_46.y;
    float _323 = in.m_46.z;
    float _325 = _305 * 2.0;
    float _327 = _309 * 2.0;
    int _329 = as_type<int>(_313) & 1;
    bool _331 = _329 != 0;
    int _333 = as_type<int>(_313) & 2;
    bool _335 = _333 != 0;
    float _337 = floor(_325);
    float _339 = _277 * _315;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _351 = _349 != 0;
    float _353 = _279 * _317;
    float _355 = _321 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _321 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = floor(_327);
    float _361 = _321 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _367 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _369 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _371 = _307 + _309;
    bool _373 = _337 >= 0.0;
    bool _375 = isnan(_337);
    bool _377 = _373 || _375;
    bool _379 = isnan(0.0);
    bool _381 = _377 || _379;
    float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _385 = log2(_383);
    float _387 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _363);
    float _389 = _371 + (-1.0);
    int _391 = _381 ? 0 : 1;
    float _393 = _307 + _305;
    bool _395 = _337 > 0.0;
    float _397 = _307 * 2.0;
    bool _399 = _359 >= 0.0;
    bool _401 = isnan(_359);
    bool _403 = _399 || _401;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    float _409 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _411 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _413 = _393 + (-1.0);
    float _415 = floor(_397);
    int _417 = _407 ? 0 : 1;
    float _419 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _409);
    bool _421 = _359 > 0.0;
    float _423 = _309 + _305;
    float _425 = _385 * _127;
    int _427 = ~_391;
    int _429 = _427 + 1;
    int _431 = _429 + 1;
    float _433 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _435 = _423 + (-1.0);
    int _437 = _431;
    if (!_395)
    {
        int _439 = ~_391;
        int _441 = _439 + 1;
        _437 = _441;
    }
    int _443 = _437;
    float _445 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _447 = exp2(_425);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _451 = ~_417;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    float _457 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _459 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    int _461 = _455;
    if (!_421)
    {
        int _463 = ~_417;
        int _465 = _463 + 1;
        _461 = _465;
    }
    int _467 = _461;
    float _469 = _307 + (-0.5);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _473 = 1.0 + _471;
    bool _475 = _415 > 0.0;
    float _477 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _479 = _415 >= 0.0;
    bool _481 = isnan(_415);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _419);
    float _491 = in.m_62.x;
    float _493 = in.m_62.y;
    float _495 = in.m_62.z;
    bool _497 = !_343;
    int _499 = _497 ? 0 : 1;
    float _501 = 1.0 / _473;
    float _503 = float(_467);
    float _505 = -_447;
    float _507 = _505 + 1.0;
    int _509 = abs(_499);
    float _511 = _445 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _513 = !_347;
    int _515 = _513 ? 0 : 1;
    float _517 = _353 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _519 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _521 = isnan(1.0);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _527 = _523 || _525;
    float _529 = rsqrt(_489);
    int _531 = abs(_515);
    float _533 = _459 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _535 = float(_509);
    float _537 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _539 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    int _549 = _487 ? 0 : 1;
    float _551 = _535 * _503;
    float _553 = _547 ? _507 : 0.0;
    int _555 = ~_549;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = float(_531);
    int _563 = _559;
    if (_527)
    {
        float _565 = _553 * _501;
        _147 = _565;
    }
    float _567 = _147;
    float _569 = float(_443);
    float _571 = _305 + (-0.5);
    if (!_475)
    {
        int _573 = ~_549;
        int _575 = _573 + 1;
        _563 = _575;
    }
    int _577 = _563;
    float _579 = _551 * (-2.0);
    float _581 = _561 * _569;
    float _583 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _585 = fma(_579, _491, _491);
    float _587 = fma(_433, _579, _433);
    bool _589 = !_351;
    int _591 = _589 ? 0 : 1;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _593;
    float _597 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[196].x, _585);
    float _599 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _601 = abs(_591);
    float _603 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _605 = _581 * (-2.0);
    float _607 = _599 * _599;
    float _609 = fma(_587, _567, _597);
    float _611 = 1.0 / _595;
    float _613 = fma(_605, _493, _493);
    float _615 = fma(_603, _603, _607);
    float _617 = float(_601);
    float _619 = fma(_411, _605, _411);
    float _621 = float(_577);
    float _623 = fma(_583, _583, _615);
    float _625 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[196].y, _613);
    float _627 = _309 + (-0.5);
    float _629 = _617 * _621;
    float _631 = rsqrt(_623);
    float _633 = fma(_619, _567, _625);
    float _635 = _477 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _637 = _629 * (-2.0);
    float _639 = _609 * 0.15915493667125701904296875;
    float _641 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _635);
    float _643 = fma(_637, _495, _495);
    float _645 = fma(_449, _637, _449);
    bool _647 = !_335;
    float _649 = _647 ? (-0.5) : 0.5;
    float _651 = _633 * 0.15915493667125701904296875;
    float _653 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[196].z, _643);
    float _655 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _387);
    float _657 = _639 * 6.283185482025146484375;
    float _659 = sin(_657);
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _649);
    float _663 = fma(_645, _567, _653);
    float _665 = _603 * _631;
    float _667 = _599 * _631;
    float _669 = _517 * _661;
    float _671 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[0].z, _641);
    float _673 = _655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _675 = _663 * 0.15915493667125701904296875;
    float _677 = -_511;
    float _679 = _677 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _681 = _671 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _683 = -_477;
    float _685 = _683 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _687 = _639 * 6.283185482025146484375;
    float _689 = cos(_687);
    float _691 = _583 * _631;
    float _693 = -_681;
    float _695 = _673 + _693;
    float _697 = _685 * _685;
    float _699 = abs(_695);
    float _701 = precise::max(_699, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _703 = _651 * 6.283185482025146484375;
    float _705 = sin(_703);
    float _707 = fma(_679, _679, _697);
    bool _709 = !_331;
    float _711 = _709 ? (-0.5) : 0.5;
    float _713 = -_533;
    float _715 = _713 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _717 = _681 >= _673;
    bool _719 = isnan(_681);
    bool _721 = _717 || _719;
    bool _723 = isnan(_673);
    bool _725 = _721 || _723;
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _711);
    float _729 = _651 * 6.283185482025146484375;
    float _731 = cos(_729);
    float _733 = _675 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = precise::min(_701, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _739 = _537 * _727;
    float _741 = fma(_715, _715, _707);
    float _743 = _659 * _705;
    bool _745 = !_725;
    float _747 = _745 ? 1.0 : (-1.0);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _751 = _737 + _749;
    float _753 = _675 * 6.283185482025146484375;
    float _755 = sin(_753);
    float _757 = _689 * _731;
    float _759 = _751 * _611;
    float _761 = _689 * _705;
    float _763 = _659 * _731;
    float _765 = _747 * _759;
    float _767 = _477 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _769 = _689 * _735;
    float _771 = _659 * _735;
    float _773 = _731 * _735;
    float _775 = _705 * _735;
    float _777 = sqrt(_741);
    float _779 = fma(_755, _757, _743);
    float _781 = fma(_755, _743, _757);
    float _783 = _769 * _669;
    float _785 = -_761;
    float _787 = fma(_755, _763, _785);
    float _789 = -_763;
    float _791 = fma(_755, _761, _789);
    float _793 = -_669;
    float _795 = _755 * _793;
    float _797 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _799 = fma(_779, _739, _783);
    float _801 = _771 * _669;
    float _803 = fma(_773, _739, _795);
    float _805 = fma(_791, _797, _799);
    float _807 = fma(_787, _739, _801);
    float _809 = fma(_775, _797, _803);
    float _811 = _805 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _813 = fma(_781, _797, _807);
    float _815 = _165 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _817 = _805 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = _805 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].x, _811);
    float _823 = _815 * _765;
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _827 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _821);
    float _831 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _767);
    float _833 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _825);
    float _835 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _827);
    float _837 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _839 = _823 * 0.15915493667125701904296875;
    float _841 = _833 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _843 = abs(_777);
    float _845 = precise::max(0.0, _843);
    float _847 = _477 + _837;
    float _849 = _835 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _851 = _511 + _841;
    float _853 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[2].z, _831);
    float _855 = _847 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _857 = _847 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _847 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _861 = precise::min(_845, 40.0);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _855);
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _857);
    float _867 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _859);
    float _869 = _533 + _849;
    float _871 = _839 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = fma(_861, -0.02500000037252902984619140625, 1.0);
    float _877 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _867);
    float _879 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _865);
    float _881 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _863);
    float _883 = _853 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _887 = _839 * 6.283185482025146484375;
    float _889 = cos(_887);
    float _891 = _879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _893 = _881 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _895 = -_885;
    float _897 = _895 + _883;
    float _899 = _691 * _691;
    float _901 = _891 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _903 = _891 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _905 = fma(_875, _897, _885);
    float _907 = _891 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _909 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[13].x, _901);
    float _911 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[12].x, _903);
    float _913 = _665 * _873;
    float _915 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[14].x, _907);
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[13].z, _909);
    float _919 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[12].z, _911);
    float _921 = _667 * _873;
    float _923 = -_889;
    float _925 = _923 + 1.0;
    float _927 = _917 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _929 = _919 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _931 = _691 * _873;
    float _933 = _667 * _925;
    float _935 = _665 * _925;
    float _937 = -_477;
    float _939 = _937 + _927;
    float _941 = -_511;
    float _943 = _941 + _929;
    float _945 = fma(_691, _933, _913);
    float _947 = -_921;
    float _949 = fma(_691, _935, _947);
    float _951 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[14].z, _915);
    float _953 = -_931;
    float _955 = fma(_667, _935, _953);
    float _957 = _945 * _939;
    float _959 = fma(_925, _899, _889);
    float _961 = _955 * _939;
    float _963 = fma(_949, _943, _957);
    float _965 = _951 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _967 = fma(_665, _935, _889);
    float _969 = fma(_691, _935, _921);
    float _971 = fma(_667, _933, _889);
    float _973 = -_533;
    float _975 = _973 + _965;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _981 = fma(_967, _943, _961);
    float _983 = fma(_667, _935, _931);
    float _985 = fma(_959, _975, _963);
    float _987 = fma(_165, _979, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _989 = fma(_969, _975, _981);
    float _991 = _971 * _939;
    float _993 = -_913;
    float _995 = fma(_691, _933, _993);
    float _997 = fma(_985, _987, _533);
    float _999 = fma(_989, _987, _511);
    float _1001 = fma(_983, _943, _991);
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _997 + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1009 = _999 + _1007;
    float _1011 = fma(_995, _975, _1001);
    float _1013 = _1005 * _1005;
    float _1015 = _477 + _1011;
    float _1017 = fma(_1009, _1009, _1013);
    float _1019 = sqrt(_1017);
    bool _1021 = _1019 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1023 = _691;
    float _1025 = _975;
    float _1027 = _931;
    float _1029 = _1019;
    float _1031 = _1005;
    if (!_1021)
    {
        _1023 = _999;
    }
    float _1033 = _1023;
    float _1035 = _1033;
    if (!_1021)
    {
        _1025 = _997;
    }
    float _1037 = _1025;
    float _1039 = _1037;
    if (!_1021)
    {
        _1027 = _1015;
    }
    float _1041 = _1027;
    bool _1043 = !_1021;
    float _1045 = _1041;
    if (!_1043)
    {
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1051 = _1019 + _1049;
        float _1053 = _1015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = rsqrt(_1017);
        float _1057 = _1051 * _1047;
        float _1059 = _1057 * 0.15915493667125701904296875;
        float _1061 = _1059 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = _1059 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1063 + (-1.0);
        float _1071 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = fma(_1067, _1053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1075 = fma(_1015, _1063, _1071);
        float _1077 = _1055 * _1073;
        float _1079 = fma(_1009, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1081 = fma(_1005, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1045 = _1075;
        _1035 = _1079;
        _1039 = _1081;
        _1029 = _1051;
    }
    float _1083 = _1045;
    float _1085 = _1035;
    float _1087 = _1039;
    float _1089 = _1029;
    float _1091 = -_477;
    float _1093 = _1091 + _1083;
    float _1095 = -_511;
    float _1097 = _1095 + _1085;
    float _1099 = -_533;
    float _1101 = _1099 + _1087;
    float _1103 = _1093 * _1093;
    float _1105 = fma(_1097, _1097, _1103);
    float _1107 = fma(_1101, _1101, _1105);
    float _1109 = sqrt(_1107);
    bool _1111 = _1109 > 0.0;
    bool _1113 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(0.5);
    bool _1121 = _1117 || _1119;
    float _1123 = _1087;
    float _1125 = _1085;
    float _1127 = _1097;
    float _1129 = _1089;
    if (!_1111)
    {
        _1031 = _1083;
    }
    float _1131 = _1031;
    bool _1133 = !_1111;
    float _1135 = _1131;
    float _1137 = _1131;
    if (!_1133)
    {
        float _1139 = _181 * _181;
        float _1141 = fma(_179, _179, _1139);
        float _1143 = fma(_183, _183, _1141);
        float _1145 = rsqrt(_1107);
        float _1147 = sqrt(_1143);
        float _1149 = _1093 * _1145;
        float _1151 = _1101 * _1145;
        bool _1153 = _1147 > 0.0;
        float _1155 = _1097 * _1145;
        if (!_1153)
        {
            _1135 = _1083;
        }
        float _1157 = _1135;
        bool _1159 = !_1153;
        _1137 = _1157;
        if (!_1159)
        {
            float _1161 = rsqrt(_1143);
            float _1163 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1165 = _181 * _1161;
            float _1167 = _179 * _1161;
            float _1169 = _1149 * _1165;
            float _1171 = _183 * _1161;
            float _1173 = fma(_1155, _1167, _1169);
            float _1175 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1177 = fma(_1151, _1171, _1173);
            float _1179 = _1177 * _1175;
            float _1181 = fma(_179, _1179, _1085);
            float _1183 = fma(_181, _1179, _1083);
            float _1185 = fma(_183, _1179, _1087);
            _1137 = _1183;
            _1123 = _1185;
            _1125 = _1181;
            _1127 = _1171;
        }
    }
    float _1187 = _1137;
    float _1189 = _1123;
    float _1191 = _1125;
    float _1193 = _1127;
    float _1195 = _1187;
    float _1197 = _1191;
    float _1199 = _1189;
    float _1201 = _1193;
    if (!_1121)
    {
        float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1205 = _477 + _1203;
        float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1209 = _511 + _1207;
        float _1211 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1213 = -_477;
        float _1215 = _1213 + _1187;
        float _1217 = _1205 * _1205;
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1221 = _533 + _1219;
        float _1223 = -_533;
        float _1225 = _1223 + _1189;
        float _1227 = fma(_1209, _1209, _1217);
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1231 = fma(_1221, _1221, _1227);
        float _1233 = sqrt(_1231);
        float _1235 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = -_511;
        float _1239 = _1237 + _1191;
        float _1241 = precise::min(_1233, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1243 = _1241 * _1229;
        float _1245 = _1235 * _1243;
        float _1247 = fma(_1239, _1245, _511);
        float _1249 = fma(_1215, _1245, _477);
        float _1251 = fma(_1225, _1245, _533);
        _1195 = _1249;
        _1197 = _1247;
        _1199 = _1251;
    }
    float _1253 = _1195;
    float _1255 = _1197;
    float _1257 = _1199;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1261 = _1253 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1265 = _1255 + _1263;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1269 = _1257 + _1267;
    float _1271 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1273 = _1261 * _1261;
    float _1275 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1271);
    float _1277 = fma(_1265, _1265, _1273);
    float _1279 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1281 = fma(_1269, _1269, _1277);
    float _1283 = rsqrt(_1281);
    float _1285 = sqrt(_1281);
    float _1287 = _1283 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1289 = _1265 * _1287;
    float _1291 = _1269 * _1287;
    float _1293 = _1289 * _1289;
    float _1295 = _1291 * _1291;
    float _1297 = _1293 + _1295;
    float _1299 = sqrt(_1297);
    bool _1301 = _1299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1305 = _1299 + _1303;
    float _1307 = _1269;
    float _1309 = _1297;
    float _1311 = _1305;
    float _1313 = _1261;
    if (_1301)
    {
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1315;
    }
    float _1317 = _1307;
    if (_1301)
    {
        float _1319 = rsqrt(_1297);
        _1309 = _1319;
    }
    float _1321 = _1309;
    float _1323 = _1321;
    if (_1301)
    {
        float _1325 = _1305 * _1317;
        _1311 = _1325;
    }
    float _1327 = _1311;
    if (_1301)
    {
        float _1329 = _1327 * 0.15915493667125701904296875;
        _1201 = _1329;
    }
    float _1331 = _1201;
    float _1333 = _1317;
    float _1335 = _1331;
    if (_1301)
    {
        float _1337 = _1331 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        _1333 = _1339;
    }
    float _1341 = _1333;
    float _1343 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1345 = precise::max(0.0, _1343);
    float _1347 = _1283;
    float _1349 = _1345;
    if (_1301)
    {
        float _1351 = _1331 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        _1347 = _1353;
    }
    float _1355 = _1347;
    float _1357 = -_1287;
    float _1359 = -_1345;
    float _1361 = fma(_1261, _1357, _1359);
    float _1363 = _1361;
    if (_1301)
    {
        float _1365 = _1361 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1349 = _1365;
    }
    float _1367 = _1349;
    if (!_1301)
    {
        _1335 = _1295;
    }
    float _1369 = _1335;
    float _1371 = _1341;
    float _1373 = _1369;
    if (_1301)
    {
        float _1375 = fma(_1341, _1367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1371 = _1375;
    }
    float _1377 = _1371;
    float _1379 = _1377;
    float _1381 = _1355;
    if (_1301)
    {
        float _1383 = _1355 + (-1.0);
        _1313 = _1383;
    }
    float _1385 = _1313;
    float _1387 = _1385;
    if (_1301)
    {
        float _1389 = _1321 * _1377;
        _1129 = _1389;
    }
    float _1391 = _1129;
    if (!_1301)
    {
        _1379 = _1289;
    }
    float _1393 = _1379;
    float _1395 = _1393;
    if (_1301)
    {
        float _1397 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1387 = _1397;
    }
    float _1399 = _1387;
    if (_1301)
    {
        float _1401 = _1289 * _1391;
        _1395 = _1401;
    }
    float _1403 = _1395;
    if (!_1301)
    {
        _1323 = _1291;
    }
    float _1405 = _1323;
    float _1407 = _1405;
    if (_1301)
    {
        float _1409 = _1291 * _1391;
        _1407 = _1409;
    }
    float _1411 = _1407;
    if (_1301)
    {
        float _1413 = fma(_1361, _1355, _1399);
        _1363 = _1413;
    }
    float _1415 = _1363;
    if (!_1301)
    {
        _1381 = _1293;
    }
    float _1417 = _1381;
    float _1419 = _1417;
    if (_1301)
    {
        float _1421 = _1403 * _1403;
        _1419 = _1421;
    }
    float _1423 = _1419;
    if (_1301)
    {
        float _1425 = _1411 * _1411;
        _1373 = _1425;
    }
    float _1427 = _1373;
    float _1429 = fma(_511, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1431 = fma(_1415, _1415, _1423);
    float _1433 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1435 = floor(_1429);
    float _1437 = _1431 + _1427;
    float _1439 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1433);
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1443 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1441);
    float _1445 = precise::clamp(_1443, 0.0, 1.0);
    float _1447 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1449 = rsqrt(_1437);
    float _1451 = -_1445;
    float _1453 = _1451 + 1.0;
    float _1455 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1457 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1459 = fma(_533, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1461 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1463 = abs(_1453);
    float _1465 = log2(_1463);
    float _1467 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1469 = -_1461;
    float _1471 = fma(_1469, _1457, 1.0);
    float _1473 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1475 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1467);
    float _1477 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1473);
    float _1479 = _1449 * _1403;
    float _1481 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1475);
    float _1483 = _1449 * _1415;
    float _1485 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1477);
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1491 = _1449 * _1411;
    float _1493 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1495 = -_1487;
    float _1497 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1495);
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1501 = floor(_1459);
    float _1503 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1505 = -_1491;
    float _1507 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1497);
    float _1509 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1499);
    float _1511 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1513 = -_1435;
    float _1515 = _1429 + _1513;
    float _1517 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1519 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1509);
    float _1521 = log2(_1471);
    float _1523 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1525 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1517);
    float _1527 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1519);
    float _1529 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1523);
    float _1531 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1525);
    float _1533 = exp2(_1511);
    float _1535 = fma(_1507, -0.5, 0.5);
    float _1537 = fma(_1507, 0.5, 0.5);
    float _1539 = -_1501;
    float _1541 = _1459 + _1539;
    float _1543 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1529);
    float _1545 = _1483 + 1.0;
    float _1547 = fma(_1537, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1531);
    float _1551 = 1.0 / _1527;
    float _1553 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1543);
    float _1555 = fma(_1537, _1547, -0.212114393711090087890625);
    float _1557 = _1521 * 0.693147182464599609375;
    float _1559 = sqrt(_1535);
    float2 _5116 = float2(_1515, _1541);
    float _1561 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5116, float2(0.0), isnan(_5116)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5116, float2(0.0), isnan(_5116)), level(0.0)).x;
    float _1563 = fma(_1537, _1555, 1.570728778839111328125);
    float _1565 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1567 = _1553 * _1551;
    float _1569 = -_1483;
    float _1571 = fma(_1533, _1545, _1569);
    float _1573 = _1549 * _1551;
    float _1575 = fma(_1571, 0.5, 0.5);
    float _1577 = fma(_1573, 0.5, 0.5);
    float _1579 = fma(_1567, -0.5, 0.5);
    float _1581 = _1559 * 0.636619746685028076171875;
    float _1583 = -_1563;
    float _1585 = fma(_1581, _1583, 1.0);
    float3 _5161 = float3(_1577, _1579, _1565);
    float _1587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5161, float3(0.0), isnan(_5161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5161, float3(0.0), isnan(_5161)), level(0.0)).x;
    float3 _5172 = float3(_1577, _1579, _1565);
    float4 _1590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).xyzw;
    float _1592 = _1590.x;
    float _1594 = _1590.y;
    float _1596 = _1590.z;
    float _1598 = _1590.w;
    float2 _5188 = float2(_1585, _1575);
    float3 _1602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5188, float2(0.0), isnan(_5188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5188, float2(0.0), isnan(_5188)), level(0.0)).xyz;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1612 = _165 + _1610;
    float _1614 = _477 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1620 = _311 > 0.5;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1630 = 1.0 / _1618;
    bool _1632 = _305 > 0.5;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1642 = _477 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1644 = _307 > 0.5;
    float _1646 = 1.0 / _1624;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1652 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1656 = _1654 != 0;
    float _1658 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1662 = _1660 != 0;
    float _1664 = 1.0 / _1628;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1668 = _1666 != 0;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1670;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1676 = _1674 != 0;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1680 = _1678 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1682 = -_711;
    int _1684 = _1632 ? as_type<int>(_1682) : as_type<int>(_711);
    float _1686 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1658);
    bool _1688 = _309 > 0.5;
    float _1690 = 1.0 / _1636;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1700 = _1672 * _1646;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1702;
    float _1706 = _1698 * _1630;
    float _1708 = 1.0 / _1640;
    bool _1710 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1712 = isnan(_165);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = _1704 * _1664;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1728 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1730 = isnan(_165);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = -_1720;
    float _1742 = _1740 + 1.0;
    bool _1744 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1746 = isnan(_165);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = 1.0 / _1650;
    float _1758 = _1694 * _1690;
    float _1760 = _1738 * _1742;
    float _1762 = -_1738;
    float _1764 = _1762 + 1.0;
    bool _1766 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1768 = isnan(_165);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1782 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1784 = isnan(_165);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = _1754 * _1764;
    float _1796 = _1680 * _1708;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1798;
    float _1802 = 1.0 / _1726;
    float _1804 = -_1776;
    float _1806 = _1804 + 1.0;
    float _1808 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1686);
    bool _1810 = !_1656;
    float _1812 = _1810 ? _711 : as_type<float>(_1684);
    float _1814 = _1792 * _1806;
    float _1816 = _1800 * _1756;
    float _1818 = -_1754;
    float _1820 = _1818 + 1.0;
    float _1822 = -_1792;
    float _1824 = _1822 + 1.0;
    bool _1826 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1828 = isnan(_165);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1834 = _1830 || _1832;
    float _1836 = float(_1834);
    float _1838 = _1776 * _1820;
    float _1840 = exp2(_1652);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1846 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1848 = isnan(_165);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = -_1836;
    float _1860 = _1858 + 1.0;
    float _1862 = _1780 * _1802;
    float _1864 = fma(_1758, _1612, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1866 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1868 = isnan(_165);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = _1856 * _1824;
    float _1880 = 1.0 / _1844;
    float _1882 = -_1856;
    float _1884 = _1882 + 1.0;
    float _1886 = _1836 * _1884;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1888;
    float _1892 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1614);
    float _1894 = _1876 * _1860;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1898 = _303 + _1896;
    float _1900 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1642);
    float _1902 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1892);
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1906 = _165 + _1904;
    float _1908 = fma(_1722, _1898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1910 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1900);
    float _1912 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1914 = _165 + _1912;
    float _1916 = _1890 * _1880;
    float _1918 = _1864 * _1894;
    float _1920 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1922 = -_1876;
    float _1924 = _1922 + 1.0;
    float _1926 = fma(_1706, _1906, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1928 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1930 = 1.0 / _1920;
    float _1932 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1918);
    float _1934 = fma(_1700, _1914, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1938 = _165 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1942 = _165 + _1940;
    float _1944 = fma(_1926, _1886, _1932);
    float _1946 = _1928 + _1920;
    float _1948 = fma(_1796, _1938, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1950 = fma(_1816, _1942, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1952 = fma(_1934, _1878, _1944);
    float _1954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1958 = _165 + _1956;
    float _1960 = fma(_1948, _1814, _1952);
    bool _1962 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1964 = isnan(_303);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1970 = _1966 || _1968;
    float _1972 = float(_1970);
    float _1974 = -_1840;
    float _1976 = _1974 + 1.0;
    float _1978 = _1946 * _1930;
    float _1980 = _1978 * 0.5;
    float _1982 = fma(_1950, _1838, _1960);
    float _1984 = fma(_1862, _1958, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1988 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1986);
    bool _1990 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1992 = isnan(_303);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = -_1972;
    float _2004 = _2002 + 1.0;
    bool _2006 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    float _2016 = 1.0 / _1988;
    float _2018 = _1812 + 0.5;
    float _2020 = fma(_1984, _1794, _1982);
    float _2022 = -_711;
    int _2024 = _1688 ? as_type<int>(_2022) : as_type<int>(_711);
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2028 = _165 + _2026;
    float _2030 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2032 = _2000 * _2004;
    bool _2034 = !_1668;
    float _2036 = _2034 ? _711 : as_type<float>(_2024);
    float _2038 = fma(_1916, _2028, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2040 = _2030 * _1954;
    float _2042 = _1908 * _2032;
    float _2044 = -_2000;
    float _2046 = _2044 + 1.0;
    float _2048 = fma(_2038, _1760, _2020);
    float _2050 = -_649;
    int _2052 = _1620 ? as_type<int>(_2050) : as_type<int>(_649);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2056 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2042);
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2060 = _2016 * _2058;
    bool _2062 = !_1676;
    float _2064 = _2062 ? _649 : as_type<float>(_2052);
    float _2066 = _2036 + 0.5;
    float _2068 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2056);
    float _2070 = -_649;
    int _2072 = _1644 ? as_type<int>(_2070) : as_type<int>(_649);
    float _2074 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2048);
    float _2076 = abs(_2060);
    float _2078 = log2(_2076);
    float _2080 = -_2064;
    float _2082 = _2080 + 0.5;
    bool _2084 = !_1662;
    float _2086 = _2084 ? _649 : as_type<float>(_2072);
    float _2088 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2092 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2094 = -_2086;
    float _2096 = _2094 + 0.5;
    float _2098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2100 = _2088 * _2054;
    float _2102 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2104 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2106 = _2068 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2112 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2114 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2116 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2118 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _2074;
    float _2120 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2122 = -_755;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2116);
    float _2126 = exp2(_2112);
    float _2128 = _2090 * _2098;
    float _2130 = -_755;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2092);
    float _2134 = -_755;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2104);
    float _2138 = _779 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2142 = _2102 * _2110;
    float _2144 = _711 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2146 = _2110;
    float _2148 = _2082;
    float _2150 = _2060;
    if (!_2014)
    {
        _2146 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2152 = _2146;
    float _2154 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _2040;
    out.m_66.y = _2142;
    out.m_66.z = _2100;
    out.m_66.w = _2128;
    float _2156 = _2152;
    if (!_2014)
    {
        float _2158 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2160 = _2060 + _2158;
        _2148 = _2160;
    }
    float _2162 = _2148;
    if (!_2014)
    {
        float _2164 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2166 = _2152 + _2164;
        _2156 = _2166;
    }
    float _2168 = _2156;
    float _2170 = fma(_2126, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2172 = precise::clamp(_2170, 0.0, 1.0);
    out.m_68.x = _2154;
    out.m_68.y = _2118;
    out.m_68.z = _2120;
    out.m_68.w = _2106;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2176 = _1984;
    float _2178 = _2168;
    if (!_2014)
    {
        float _2180 = 1.0 / _2168;
        _2176 = _2180;
    }
    float _2182 = _2176;
    bool _2184 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2186 = isnan(_1285);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2192 = _2188 || _2190;
    out.m_70.w = _2174;
    float _2194 = _779 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2196 = _649 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2198 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2200 = fma(_2172, -2.0, 3.0);
    float _2202 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2194);
    float _2204 = _791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2206 = _791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2208 = _2172 * _2172;
    float _2210 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2124);
    float _2212 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2132);
    float _2214 = _791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2216 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2136);
    float _2218 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2204);
    float _2220 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2206);
    float _2222 = _2208 * _2200;
    float _2224 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2214);
    float _2226 = _779 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2228 = _2196 * _2210;
    float _2230 = _2196 * _2212;
    float _2232 = _2196 * _2216;
    float _2234 = -_2222;
    float _2236 = _2234 + 1.0;
    float _2238 = in.m_72.x;
    float _2240 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2242 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2198);
    bool _2244 = _2060 <= 8000.0;
    bool _2246 = isnan(_2060);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan(8000.0);
    bool _2252 = _2248 || _2250;
    float _2254 = float(_2252);
    float _2256 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2222);
    float _2258 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2202);
    float _2260 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2240);
    float _2262 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2220);
    float _2264 = _2254 * _2256;
    float _2266 = fma(_2144, _2242, _2228);
    float _2268 = fma(_2144, _2258, _2230);
    float _2270 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2218);
    float _2272 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    float _2274 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1808);
    float _2276 = fma(_2144, _2260, _2232);
    float _2278 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2280 = _2262 + _2268;
    float _2282 = _2274 + _1527;
    float _2284 = _2270 + _2266;
    float _2286 = _2272 + _2276;
    float _2288 = _2270;
    float _2290 = _2274;
    if (!_2014)
    {
        _2288 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2292 = _2288;
    float _2294 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2296 = _2282 * 0.5;
    out.gl_Position.x = _1549;
    out.gl_Position.y = _1553;
    out.gl_Position.z = _2274;
    out.gl_Position.w = _1527;
    float _2298 = _2292;
    float _2300 = _1527;
    if (!_2014)
    {
        float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2304 = _2060 + _2302;
        _2150 = _2304;
    }
    float _2306 = _2150;
    float _2308 = _2306;
    if (_2014)
    {
        _2178 = 1.0;
    }
    float _2310 = _2178;
    float _2312 = _2310;
    if (!_2014)
    {
        float _2314 = _2162 * _2182;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        _2312 = _2316;
    }
    float _2318 = _2312;
    out.m_74.z = _2296;
    out.m_74.w = _1527;
    out.m_76.x = _2284;
    out.m_76.y = _2280;
    out.m_76.z = _2286;
    if (!_2014)
    {
        float _2320 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2322 = _2292 + _2320;
        _2290 = _2322;
    }
    float _2324 = _2290;
    if (!_2192)
    {
        _2298 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2326 = _2298;
    float _2328 = _2326;
    float _2330 = _2326;
    if (!_2192)
    {
        _2300 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2332 = _2300;
    float _2334 = _2296;
    float _2336 = _2332;
    float _2338 = _2332;
    if (!_2014)
    {
        float _2340 = 1.0 / _2324;
        _2334 = _2340;
    }
    float _2342 = _2334;
    float _2344 = -_1561;
    float _2346 = _2344 + 1.0;
    float _2348 = _2346 * _2278;
    float _2350 = precise::clamp(_2348, 0.0, 1.0);
    if (!_2014)
    {
        float _2352 = _2306 * _2342;
        float _2354 = precise::clamp(_2352, 0.0, 1.0);
        _2308 = _2354;
    }
    float _2356 = _2308;
    float _2358 = -_2350;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2362 = _2360 * _2238;
    float _2364 = _2294 * _1587;
    float _2366 = -_2294;
    float _2368 = _2366 + 1.0;
    float _2370 = _1598 * _2364;
    float _2372 = _1608 * _2364;
    float _2374 = _1598 * _2368;
    float _2376 = _2368;
    float _2378 = _2362;
    if (!_2192)
    {
        _2376 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2380 = _2376;
    float _2382 = fma(_1604, _2370, _1592);
    float _2384 = _2362 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2386 = _2382;
    float _2388 = _2380;
    float _2390 = _2380;
    if (_2014)
    {
        _2378 = 1.0;
    }
    float _2392 = _2378;
    float _2394 = _2392;
    if (!_2014)
    {
        float _2396 = -_2356;
        float _2398 = _2396 + 1.0;
        _2394 = _2398;
    }
    float _2400 = _2394;
    float _2402 = fma(_1606, _2370, _1594);
    float _2404 = fma(_1598, _2372, _1596);
    out.m_78.x = _2384;
    float _2406 = _2318 * _2400;
    out.m_80.x = _2382;
    out.m_80.y = _2402;
    out.m_80.z = _2404;
    out.m_80.w = _2374;
    float _2408 = _2406 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2410 = _2406;
    float _2412 = _2402;
    if (!_2192)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2414 = _2410;
    float _2416 = _2414;
    float _2418 = _2414;
    if (!_2192)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2420 = _2412;
    float _2422 = _2420;
    float _2424 = _2420;
    if (!_2192)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2426 = _2386;
    bool _2428 = !_2192;
    float _2430 = _2426;
    float _2432 = _2426;
    if (!_2428)
    {
        bool _2434 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2436 = isnan(_1285);
        bool _2438 = _2434 || _2436;
        bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2442 = _2438 || _2440;
        if (!_2442)
        {
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2446 = _1285 + _2444;
            float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2450 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2448;
            float _2452 = 1.0 / _2450;
            float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2474 = _2446 * _2452;
            float _2476 = precise::clamp(_2474, 0.0, 1.0);
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2482 = fma(_2476, _2456, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2484 = fma(_2476, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2486 = fma(_2476, _2460, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2488 = fma(_2476, _2464, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2490 = fma(_2476, _2468, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2492 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2390 = _2484;
            _2424 = _2490;
            _2330 = _2482;
            _2418 = _2488;
            _2338 = _2486;
            _2432 = _2492;
            _2494 = true;
        }
        else
        {
            bool _2496 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2498 = isnan(_1285);
            bool _2500 = _2496 || _2498;
            bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2504 = _2500 || _2502;
            if (!_2504)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2506 = _2328;
            _2330 = _2506;
            if (!_2504)
            {
                _2388 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2508 = _2388;
            _2390 = _2508;
            if (!_2504)
            {
                _2336 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2510 = _2336;
            _2338 = _2510;
            if (!_2504)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2512 = _2416;
            _2418 = _2512;
            if (!_2504)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2514 = _2422;
            _2424 = _2514;
            if (!_2504)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2516 = _2430;
            bool _2518 = !_2504;
            _2432 = _2516;
            if (!_2518)
            {
                bool _2520 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2522 = isnan(_1285);
                bool _2524 = _2520 || _2522;
                bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2528 = _2524 || _2526;
                if (!_2528)
                {
                    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2532 = _1285 + _2530;
                    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2536 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2534;
                    float _2538 = 1.0 / _2536;
                    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2560 = _2532 * _2538;
                    float _2562 = precise::clamp(_2560, 0.0, 1.0);
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2568 = fma(_2562, _2542, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2570 = fma(_2562, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2572 = fma(_2562, _2546, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2574 = fma(_2562, _2550, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2576 = fma(_2562, _2554, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2578 = fma(_2562, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2390 = _2570;
                    _2424 = _2576;
                    _2330 = _2568;
                    _2418 = _2574;
                    _2338 = _2572;
                    _2432 = _2578;
                    _2494 = true;
                }
                else
                {
                    _2390 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2338 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2494 = false;
    float _2580 = _2390;
    float _2582 = _2424;
    float _2584 = _2330;
    float _2586 = _2418;
    float _2588 = _2338;
    float _2590 = _2432;
    float _2592 = fma(_2280, -0.5, 0.5);
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    float _2596 = -_2580;
    float _2598 = _2596 + _2582;
    float _2600 = -_2584;
    float _2602 = _2600 + _2586;
    out.m_82.x = 0.0;
    float _2604 = fma(_2594, _2598, _2580);
    float _2606 = -_2588;
    float _2608 = _2606 + _2590;
    float _2610 = fma(_2594, _2602, _2584);
    float _2612 = _2604 * 0.586610972881317138671875;
    bool _2614 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2616 = fma(_2594, _2608, _2588);
    float _2618 = _2408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2620 = fma(_2610, 0.298911988735198974609375, _2612);
    bool _2622 = _2318 > 0.0;
    bool _2624 = isnan(_2318);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan(0.0);
    bool _2630 = _2626 || _2628;
    float _2632 = fma(_2616, 0.114477999508380889892578125, _2620);
    out.m_49.x = _2618;
    bool _2634 = _2400 <= 0.0;
    bool _2636 = !_2630;
    bool _2638 = _2634 || _2636;
    float _2640 = -_2632;
    float _2642 = _2610 + _2640;
    float _2644 = -_2632;
    float _2646 = _2616 + _2644;
    float _2648 = fma(_2642, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2632);
    float _2650 = -_2632;
    float _2652 = _2604 + _2650;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2632);
    float _2656 = fma(_2646, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2632);
    bool _2658 = !_2614;
    if (!_2658)
    {
        float _2660 = -_1253;
        float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2664 = -_1255;
        float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2668 = -_1257;
        float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2672 = _2662 * _2662;
        float _2674 = fma(_2666, _2666, _2672);
        float _2676 = fma(_2670, _2670, _2674);
        float _2678 = sqrt(_2676);
        float _2680 = rsqrt(_2676);
        float _2682 = -_2678;
        float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2686 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2688 = precise::clamp(_2686, 0.0, 1.0);
        float _2690 = _2666 * _2680;
        float _2692 = _2662 * _2680;
        float _2694 = abs(_2688);
        float _2696 = log2(_2694);
        float _2698 = _2670 * _2680;
        float _2700 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2702 = _2280 * _2692;
        float _2704 = -_2692;
        float _2706 = -_2700;
        float _2708 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2706);
        float _2710 = fma(_2284, _2690, _2702);
        float _2712 = -_2698;
        float _2714 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2708);
        float _2716 = fma(_2286, _2698, _2710);
        float _2718 = precise::clamp(_2716, 0.0, 1.0);
        float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2722 = _2714 + _2720;
        float _2724 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2726 = _2722 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2728 = precise::clamp(_2726, 0.0, 1.0);
        float _2730 = exp2(_2724);
        float _2732 = _2730 * _2728;
        float _2734 = _2718 * _2732;
        float _2736 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2738 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2740 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2736;
        out.m_82.y = _2738;
        out.m_82.z = _2740;
    }
    out.m_84.x = _2648;
    out.m_84.y = _2654;
    out.m_84.z = _2656;
    if (!_2638)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2742 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2742;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2494 = false;
    bool _301 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_107)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2798 = as_type<float>(_117);
        out.gl_Position.z = _2798;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_51.w;
    float _123 = float(_103);
    float _125 = -_121;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_121);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    bool _139 = _127 >= _123;
    bool _141 = !_137;
    bool _143 = _139 || _141;
    float _145 = _121;
    float _147 = _127;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2863 = as_type<float>(_153);
        out.gl_Position.z = _2863;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    float _161 = 1.0 / _123;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = _127 * _161;
    float _167 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _171 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _173 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    float _177 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _171);
    float _179 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _173);
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _175);
    float _183 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _177);
    bool _185 = !_163;
    float _203;
    if (!_185)
    {
        float _187 = in.m_55.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        _203 = _165;
    }
    _205 = false;
    float _207 = _203;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -_223;
    float _231 = _229 + 1.0;
    bool _233 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _235 = isnan(_207);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _227;
    float _253 = _243 * _231;
    float _255 = -_243;
    float _257 = _255 + 1.0;
    float _259 = _211 * _251;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = fma(_247, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = fma(_263, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _269 = _265 * _253;
    float _271 = _267 * _253;
    float _273 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_249;
    float _299;
    if (!_281)
    {
        float _283 = in.m_55.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        _299 = _165;
    }
    _301 = false;
    float _303 = _299;
    float _305 = in.m_55.x;
    float _307 = in.m_55.y;
    float _309 = in.m_55.z;
    float _311 = in.m_55.w;
    float _313 = as_type<float>(int(gl_VertexIndex));
    float _315 = in.m_60.x;
    float _317 = in.m_60.y;
    float _319 = in.m_46.x;
    float _321 = in.m_46.y;
    float _323 = in.m_46.z;
    float _325 = _305 * 2.0;
    float _327 = _309 * 2.0;
    int _329 = as_type<int>(_313) & 1;
    bool _331 = _329 != 0;
    int _333 = as_type<int>(_313) & 2;
    bool _335 = _333 != 0;
    float _337 = floor(_325);
    float _339 = _277 * _315;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _351 = _349 != 0;
    float _353 = _279 * _317;
    float _355 = _321 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _321 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = floor(_327);
    float _361 = _321 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _367 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _369 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _371 = _307 + _309;
    bool _373 = _337 >= 0.0;
    bool _375 = isnan(_337);
    bool _377 = _373 || _375;
    bool _379 = isnan(0.0);
    bool _381 = _377 || _379;
    float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _385 = log2(_383);
    float _387 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _363);
    float _389 = _371 + (-1.0);
    int _391 = _381 ? 0 : 1;
    float _393 = _307 + _305;
    bool _395 = _337 > 0.0;
    float _397 = _307 * 2.0;
    bool _399 = _359 >= 0.0;
    bool _401 = isnan(_359);
    bool _403 = _399 || _401;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    float _409 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _411 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _413 = _393 + (-1.0);
    float _415 = floor(_397);
    int _417 = _407 ? 0 : 1;
    float _419 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _409);
    bool _421 = _359 > 0.0;
    float _423 = _309 + _305;
    float _425 = _385 * _127;
    int _427 = ~_391;
    int _429 = _427 + 1;
    int _431 = _429 + 1;
    float _433 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _435 = _423 + (-1.0);
    int _437 = _431;
    if (!_395)
    {
        int _439 = ~_391;
        int _441 = _439 + 1;
        _437 = _441;
    }
    int _443 = _437;
    float _445 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _447 = exp2(_425);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _451 = ~_417;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    float _457 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _459 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    int _461 = _455;
    if (!_421)
    {
        int _463 = ~_417;
        int _465 = _463 + 1;
        _461 = _465;
    }
    int _467 = _461;
    float _469 = _307 + (-0.5);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _473 = 1.0 + _471;
    bool _475 = _415 > 0.0;
    float _477 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _479 = _415 >= 0.0;
    bool _481 = isnan(_415);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _419);
    float _491 = in.m_62.x;
    float _493 = in.m_62.y;
    float _495 = in.m_62.z;
    bool _497 = !_343;
    int _499 = _497 ? 0 : 1;
    float _501 = 1.0 / _473;
    float _503 = float(_467);
    float _505 = -_447;
    float _507 = _505 + 1.0;
    int _509 = abs(_499);
    float _511 = _445 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _513 = !_347;
    int _515 = _513 ? 0 : 1;
    float _517 = _353 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _519 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _521 = isnan(1.0);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _527 = _523 || _525;
    float _529 = rsqrt(_489);
    int _531 = abs(_515);
    float _533 = _459 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _535 = float(_509);
    float _537 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _539 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    int _549 = _487 ? 0 : 1;
    float _551 = _535 * _503;
    float _553 = _547 ? _507 : 0.0;
    int _555 = ~_549;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = float(_531);
    int _563 = _559;
    if (_527)
    {
        float _565 = _553 * _501;
        _147 = _565;
    }
    float _567 = _147;
    float _569 = float(_443);
    float _571 = _305 + (-0.5);
    if (!_475)
    {
        int _573 = ~_549;
        int _575 = _573 + 1;
        _563 = _575;
    }
    int _577 = _563;
    float _579 = _551 * (-2.0);
    float _581 = _561 * _569;
    float _583 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _585 = fma(_579, _491, _491);
    float _587 = fma(_433, _579, _433);
    bool _589 = !_351;
    int _591 = _589 ? 0 : 1;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _593;
    float _597 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[196].x, _585);
    float _599 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _601 = abs(_591);
    float _603 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _605 = _581 * (-2.0);
    float _607 = _599 * _599;
    float _609 = fma(_587, _567, _597);
    float _611 = 1.0 / _595;
    float _613 = fma(_605, _493, _493);
    float _615 = fma(_603, _603, _607);
    float _617 = float(_601);
    float _619 = fma(_411, _605, _411);
    float _621 = float(_577);
    float _623 = fma(_583, _583, _615);
    float _625 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[196].y, _613);
    float _627 = _309 + (-0.5);
    float _629 = _617 * _621;
    float _631 = rsqrt(_623);
    float _633 = fma(_619, _567, _625);
    float _635 = _477 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _637 = _629 * (-2.0);
    float _639 = _609 * 0.15915493667125701904296875;
    float _641 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _635);
    float _643 = fma(_637, _495, _495);
    float _645 = fma(_449, _637, _449);
    bool _647 = !_335;
    float _649 = _647 ? (-0.5) : 0.5;
    float _651 = _633 * 0.15915493667125701904296875;
    float _653 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[196].z, _643);
    float _655 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _387);
    float _657 = _639 * 6.283185482025146484375;
    float _659 = sin(_657);
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _649);
    float _663 = fma(_645, _567, _653);
    float _665 = _603 * _631;
    float _667 = _599 * _631;
    float _669 = _517 * _661;
    float _671 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[0].z, _641);
    float _673 = _655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _675 = _663 * 0.15915493667125701904296875;
    float _677 = -_511;
    float _679 = _677 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _681 = _671 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _683 = -_477;
    float _685 = _683 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _687 = _639 * 6.283185482025146484375;
    float _689 = cos(_687);
    float _691 = _583 * _631;
    float _693 = -_681;
    float _695 = _673 + _693;
    float _697 = _685 * _685;
    float _699 = abs(_695);
    float _701 = precise::max(_699, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _703 = _651 * 6.283185482025146484375;
    float _705 = sin(_703);
    float _707 = fma(_679, _679, _697);
    bool _709 = !_331;
    float _711 = _709 ? (-0.5) : 0.5;
    float _713 = -_533;
    float _715 = _713 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _717 = _681 >= _673;
    bool _719 = isnan(_681);
    bool _721 = _717 || _719;
    bool _723 = isnan(_673);
    bool _725 = _721 || _723;
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _711);
    float _729 = _651 * 6.283185482025146484375;
    float _731 = cos(_729);
    float _733 = _675 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = precise::min(_701, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _739 = _537 * _727;
    float _741 = fma(_715, _715, _707);
    float _743 = _659 * _705;
    bool _745 = !_725;
    float _747 = _745 ? 1.0 : (-1.0);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _751 = _737 + _749;
    float _753 = _675 * 6.283185482025146484375;
    float _755 = sin(_753);
    float _757 = _689 * _731;
    float _759 = _751 * _611;
    float _761 = _689 * _705;
    float _763 = _659 * _731;
    float _765 = _747 * _759;
    float _767 = _477 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _769 = _689 * _735;
    float _771 = _659 * _735;
    float _773 = _731 * _735;
    float _775 = _705 * _735;
    float _777 = sqrt(_741);
    float _779 = fma(_755, _757, _743);
    float _781 = fma(_755, _743, _757);
    float _783 = _769 * _669;
    float _785 = -_761;
    float _787 = fma(_755, _763, _785);
    float _789 = -_763;
    float _791 = fma(_755, _761, _789);
    float _793 = -_669;
    float _795 = _755 * _793;
    float _797 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _799 = fma(_779, _739, _783);
    float _801 = _771 * _669;
    float _803 = fma(_773, _739, _795);
    float _805 = fma(_791, _797, _799);
    float _807 = fma(_787, _739, _801);
    float _809 = fma(_775, _797, _803);
    float _811 = _805 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _813 = fma(_781, _797, _807);
    float _815 = _165 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _817 = _805 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = _805 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].x, _811);
    float _823 = _815 * _765;
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _827 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _821);
    float _831 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _767);
    float _833 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _825);
    float _835 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _827);
    float _837 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _839 = _823 * 0.15915493667125701904296875;
    float _841 = _833 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _843 = abs(_777);
    float _845 = precise::max(0.0, _843);
    float _847 = _477 + _837;
    float _849 = _835 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _851 = _511 + _841;
    float _853 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[2].z, _831);
    float _855 = _847 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _857 = _847 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _847 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _861 = precise::min(_845, 40.0);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _855);
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _857);
    float _867 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _859);
    float _869 = _533 + _849;
    float _871 = _839 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = fma(_861, -0.02500000037252902984619140625, 1.0);
    float _877 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _867);
    float _879 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _865);
    float _881 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _863);
    float _883 = _853 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _887 = _839 * 6.283185482025146484375;
    float _889 = cos(_887);
    float _891 = _879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _893 = _881 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _895 = -_885;
    float _897 = _895 + _883;
    float _899 = _691 * _691;
    float _901 = _891 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _903 = _891 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _905 = fma(_875, _897, _885);
    float _907 = _891 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _909 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[13].x, _901);
    float _911 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[12].x, _903);
    float _913 = _665 * _873;
    float _915 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[14].x, _907);
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[13].z, _909);
    float _919 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[12].z, _911);
    float _921 = _667 * _873;
    float _923 = -_889;
    float _925 = _923 + 1.0;
    float _927 = _917 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _929 = _919 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _931 = _691 * _873;
    float _933 = _667 * _925;
    float _935 = _665 * _925;
    float _937 = -_477;
    float _939 = _937 + _927;
    float _941 = -_511;
    float _943 = _941 + _929;
    float _945 = fma(_691, _933, _913);
    float _947 = -_921;
    float _949 = fma(_691, _935, _947);
    float _951 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[14].z, _915);
    float _953 = -_931;
    float _955 = fma(_667, _935, _953);
    float _957 = _945 * _939;
    float _959 = fma(_925, _899, _889);
    float _961 = _955 * _939;
    float _963 = fma(_949, _943, _957);
    float _965 = _951 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _967 = fma(_665, _935, _889);
    float _969 = fma(_691, _935, _921);
    float _971 = fma(_667, _933, _889);
    float _973 = -_533;
    float _975 = _973 + _965;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _981 = fma(_967, _943, _961);
    float _983 = fma(_667, _935, _931);
    float _985 = fma(_959, _975, _963);
    float _987 = fma(_165, _979, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _989 = fma(_969, _975, _981);
    float _991 = _971 * _939;
    float _993 = -_913;
    float _995 = fma(_691, _933, _993);
    float _997 = fma(_985, _987, _533);
    float _999 = fma(_989, _987, _511);
    float _1001 = fma(_983, _943, _991);
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _997 + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1009 = _999 + _1007;
    float _1011 = fma(_995, _975, _1001);
    float _1013 = _1005 * _1005;
    float _1015 = _477 + _1011;
    float _1017 = fma(_1009, _1009, _1013);
    float _1019 = sqrt(_1017);
    bool _1021 = _1019 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1023 = _691;
    float _1025 = _975;
    float _1027 = _931;
    float _1029 = _1019;
    float _1031 = _1005;
    if (!_1021)
    {
        _1023 = _999;
    }
    float _1033 = _1023;
    float _1035 = _1033;
    if (!_1021)
    {
        _1025 = _997;
    }
    float _1037 = _1025;
    float _1039 = _1037;
    if (!_1021)
    {
        _1027 = _1015;
    }
    float _1041 = _1027;
    bool _1043 = !_1021;
    float _1045 = _1041;
    if (!_1043)
    {
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1051 = _1019 + _1049;
        float _1053 = _1015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = rsqrt(_1017);
        float _1057 = _1051 * _1047;
        float _1059 = _1057 * 0.15915493667125701904296875;
        float _1061 = _1059 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = _1059 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1063 + (-1.0);
        float _1071 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = fma(_1067, _1053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1075 = fma(_1015, _1063, _1071);
        float _1077 = _1055 * _1073;
        float _1079 = fma(_1009, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1081 = fma(_1005, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1045 = _1075;
        _1035 = _1079;
        _1039 = _1081;
        _1029 = _1051;
    }
    float _1083 = _1045;
    float _1085 = _1035;
    float _1087 = _1039;
    float _1089 = _1029;
    float _1091 = -_477;
    float _1093 = _1091 + _1083;
    float _1095 = -_511;
    float _1097 = _1095 + _1085;
    float _1099 = -_533;
    float _1101 = _1099 + _1087;
    float _1103 = _1093 * _1093;
    float _1105 = fma(_1097, _1097, _1103);
    float _1107 = fma(_1101, _1101, _1105);
    float _1109 = sqrt(_1107);
    bool _1111 = _1109 > 0.0;
    bool _1113 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(0.5);
    bool _1121 = _1117 || _1119;
    float _1123 = _1087;
    float _1125 = _1085;
    float _1127 = _1097;
    float _1129 = _1089;
    if (!_1111)
    {
        _1031 = _1083;
    }
    float _1131 = _1031;
    bool _1133 = !_1111;
    float _1135 = _1131;
    float _1137 = _1131;
    if (!_1133)
    {
        float _1139 = _181 * _181;
        float _1141 = fma(_179, _179, _1139);
        float _1143 = fma(_183, _183, _1141);
        float _1145 = rsqrt(_1107);
        float _1147 = sqrt(_1143);
        float _1149 = _1093 * _1145;
        float _1151 = _1101 * _1145;
        bool _1153 = _1147 > 0.0;
        float _1155 = _1097 * _1145;
        if (!_1153)
        {
            _1135 = _1083;
        }
        float _1157 = _1135;
        bool _1159 = !_1153;
        _1137 = _1157;
        if (!_1159)
        {
            float _1161 = rsqrt(_1143);
            float _1163 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1165 = _181 * _1161;
            float _1167 = _179 * _1161;
            float _1169 = _1149 * _1165;
            float _1171 = _183 * _1161;
            float _1173 = fma(_1155, _1167, _1169);
            float _1175 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1177 = fma(_1151, _1171, _1173);
            float _1179 = _1177 * _1175;
            float _1181 = fma(_179, _1179, _1085);
            float _1183 = fma(_181, _1179, _1083);
            float _1185 = fma(_183, _1179, _1087);
            _1137 = _1183;
            _1123 = _1185;
            _1125 = _1181;
            _1127 = _1171;
        }
    }
    float _1187 = _1137;
    float _1189 = _1123;
    float _1191 = _1125;
    float _1193 = _1127;
    float _1195 = _1187;
    float _1197 = _1191;
    float _1199 = _1189;
    float _1201 = _1193;
    if (!_1121)
    {
        float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1205 = _477 + _1203;
        float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1209 = _511 + _1207;
        float _1211 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1213 = -_477;
        float _1215 = _1213 + _1187;
        float _1217 = _1205 * _1205;
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1221 = _533 + _1219;
        float _1223 = -_533;
        float _1225 = _1223 + _1189;
        float _1227 = fma(_1209, _1209, _1217);
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1231 = fma(_1221, _1221, _1227);
        float _1233 = sqrt(_1231);
        float _1235 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = -_511;
        float _1239 = _1237 + _1191;
        float _1241 = precise::min(_1233, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1243 = _1241 * _1229;
        float _1245 = _1235 * _1243;
        float _1247 = fma(_1239, _1245, _511);
        float _1249 = fma(_1215, _1245, _477);
        float _1251 = fma(_1225, _1245, _533);
        _1195 = _1249;
        _1197 = _1247;
        _1199 = _1251;
    }
    float _1253 = _1195;
    float _1255 = _1197;
    float _1257 = _1199;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1261 = _1253 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1265 = _1255 + _1263;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1269 = _1257 + _1267;
    float _1271 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1273 = _1261 * _1261;
    float _1275 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1271);
    float _1277 = fma(_1265, _1265, _1273);
    float _1279 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1281 = fma(_1269, _1269, _1277);
    float _1283 = rsqrt(_1281);
    float _1285 = sqrt(_1281);
    float _1287 = _1283 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1289 = _1265 * _1287;
    float _1291 = _1269 * _1287;
    float _1293 = _1289 * _1289;
    float _1295 = _1291 * _1291;
    float _1297 = _1293 + _1295;
    float _1299 = sqrt(_1297);
    bool _1301 = _1299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1305 = _1299 + _1303;
    float _1307 = _1269;
    float _1309 = _1297;
    float _1311 = _1305;
    float _1313 = _1261;
    if (_1301)
    {
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1315;
    }
    float _1317 = _1307;
    if (_1301)
    {
        float _1319 = rsqrt(_1297);
        _1309 = _1319;
    }
    float _1321 = _1309;
    float _1323 = _1321;
    if (_1301)
    {
        float _1325 = _1305 * _1317;
        _1311 = _1325;
    }
    float _1327 = _1311;
    if (_1301)
    {
        float _1329 = _1327 * 0.15915493667125701904296875;
        _1201 = _1329;
    }
    float _1331 = _1201;
    float _1333 = _1317;
    float _1335 = _1331;
    if (_1301)
    {
        float _1337 = _1331 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        _1333 = _1339;
    }
    float _1341 = _1333;
    float _1343 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1345 = precise::max(0.0, _1343);
    float _1347 = _1283;
    float _1349 = _1345;
    if (_1301)
    {
        float _1351 = _1331 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        _1347 = _1353;
    }
    float _1355 = _1347;
    float _1357 = -_1287;
    float _1359 = -_1345;
    float _1361 = fma(_1261, _1357, _1359);
    float _1363 = _1361;
    if (_1301)
    {
        float _1365 = _1361 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1349 = _1365;
    }
    float _1367 = _1349;
    if (!_1301)
    {
        _1335 = _1295;
    }
    float _1369 = _1335;
    float _1371 = _1341;
    float _1373 = _1369;
    if (_1301)
    {
        float _1375 = fma(_1341, _1367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1371 = _1375;
    }
    float _1377 = _1371;
    float _1379 = _1377;
    float _1381 = _1355;
    if (_1301)
    {
        float _1383 = _1355 + (-1.0);
        _1313 = _1383;
    }
    float _1385 = _1313;
    float _1387 = _1385;
    if (_1301)
    {
        float _1389 = _1321 * _1377;
        _1129 = _1389;
    }
    float _1391 = _1129;
    if (!_1301)
    {
        _1379 = _1289;
    }
    float _1393 = _1379;
    float _1395 = _1393;
    if (_1301)
    {
        float _1397 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1387 = _1397;
    }
    float _1399 = _1387;
    if (_1301)
    {
        float _1401 = _1289 * _1391;
        _1395 = _1401;
    }
    float _1403 = _1395;
    if (!_1301)
    {
        _1323 = _1291;
    }
    float _1405 = _1323;
    float _1407 = _1405;
    if (_1301)
    {
        float _1409 = _1291 * _1391;
        _1407 = _1409;
    }
    float _1411 = _1407;
    if (_1301)
    {
        float _1413 = fma(_1361, _1355, _1399);
        _1363 = _1413;
    }
    float _1415 = _1363;
    if (!_1301)
    {
        _1381 = _1293;
    }
    float _1417 = _1381;
    float _1419 = _1417;
    if (_1301)
    {
        float _1421 = _1403 * _1403;
        _1419 = _1421;
    }
    float _1423 = _1419;
    if (_1301)
    {
        float _1425 = _1411 * _1411;
        _1373 = _1425;
    }
    float _1427 = _1373;
    float _1429 = fma(_511, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1431 = fma(_1415, _1415, _1423);
    float _1433 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1435 = floor(_1429);
    float _1437 = _1431 + _1427;
    float _1439 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1433);
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1443 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1441);
    float _1445 = precise::clamp(_1443, 0.0, 1.0);
    float _1447 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1449 = rsqrt(_1437);
    float _1451 = -_1445;
    float _1453 = _1451 + 1.0;
    float _1455 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1457 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1459 = fma(_533, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1461 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1463 = abs(_1453);
    float _1465 = log2(_1463);
    float _1467 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1469 = -_1461;
    float _1471 = fma(_1469, _1457, 1.0);
    float _1473 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1475 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1467);
    float _1477 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1473);
    float _1479 = _1449 * _1403;
    float _1481 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1475);
    float _1483 = _1449 * _1415;
    float _1485 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1477);
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1491 = _1449 * _1411;
    float _1493 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1495 = -_1487;
    float _1497 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1495);
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1501 = floor(_1459);
    float _1503 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1505 = -_1491;
    float _1507 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1497);
    float _1509 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1499);
    float _1511 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1513 = -_1435;
    float _1515 = _1429 + _1513;
    float _1517 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1519 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1509);
    float _1521 = log2(_1471);
    float _1523 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1525 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1517);
    float _1527 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1519);
    float _1529 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1523);
    float _1531 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1525);
    float _1533 = exp2(_1511);
    float _1535 = fma(_1507, -0.5, 0.5);
    float _1537 = fma(_1507, 0.5, 0.5);
    float _1539 = -_1501;
    float _1541 = _1459 + _1539;
    float _1543 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1529);
    float _1545 = _1483 + 1.0;
    float _1547 = fma(_1537, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1531);
    float _1551 = 1.0 / _1527;
    float _1553 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1543);
    float _1555 = fma(_1537, _1547, -0.212114393711090087890625);
    float _1557 = _1521 * 0.693147182464599609375;
    float _1559 = sqrt(_1535);
    float2 _5116 = float2(_1515, _1541);
    float _1561 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5116, float2(0.0), isnan(_5116)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5116, float2(0.0), isnan(_5116)), level(0.0)).x;
    float _1563 = fma(_1537, _1555, 1.570728778839111328125);
    float _1565 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1567 = _1553 * _1551;
    float _1569 = -_1483;
    float _1571 = fma(_1533, _1545, _1569);
    float _1573 = _1549 * _1551;
    float _1575 = fma(_1571, 0.5, 0.5);
    float _1577 = fma(_1573, 0.5, 0.5);
    float _1579 = fma(_1567, -0.5, 0.5);
    float _1581 = _1559 * 0.636619746685028076171875;
    float _1583 = -_1563;
    float _1585 = fma(_1581, _1583, 1.0);
    float3 _5161 = float3(_1577, _1579, _1565);
    float _1587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5161, float3(0.0), isnan(_5161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5161, float3(0.0), isnan(_5161)), level(0.0)).x;
    float3 _5172 = float3(_1577, _1579, _1565);
    float4 _1590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).xyzw;
    float _1592 = _1590.x;
    float _1594 = _1590.y;
    float _1596 = _1590.z;
    float _1598 = _1590.w;
    float2 _5188 = float2(_1585, _1575);
    float3 _1602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5188, float2(0.0), isnan(_5188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5188, float2(0.0), isnan(_5188)), level(0.0)).xyz;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1612 = _165 + _1610;
    float _1614 = _477 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1620 = _311 > 0.5;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1630 = 1.0 / _1618;
    bool _1632 = _305 > 0.5;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1642 = _477 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1644 = _307 > 0.5;
    float _1646 = 1.0 / _1624;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1652 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1656 = _1654 != 0;
    float _1658 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1662 = _1660 != 0;
    float _1664 = 1.0 / _1628;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1668 = _1666 != 0;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1670;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1676 = _1674 != 0;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1680 = _1678 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1682 = -_711;
    int _1684 = _1632 ? as_type<int>(_1682) : as_type<int>(_711);
    float _1686 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1658);
    bool _1688 = _309 > 0.5;
    float _1690 = 1.0 / _1636;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1700 = _1672 * _1646;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1702;
    float _1706 = _1698 * _1630;
    float _1708 = 1.0 / _1640;
    bool _1710 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1712 = isnan(_165);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = _1704 * _1664;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1728 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1730 = isnan(_165);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = -_1720;
    float _1742 = _1740 + 1.0;
    bool _1744 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1746 = isnan(_165);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = 1.0 / _1650;
    float _1758 = _1694 * _1690;
    float _1760 = _1738 * _1742;
    float _1762 = -_1738;
    float _1764 = _1762 + 1.0;
    bool _1766 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1768 = isnan(_165);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1782 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1784 = isnan(_165);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = _1754 * _1764;
    float _1796 = _1680 * _1708;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1798;
    float _1802 = 1.0 / _1726;
    float _1804 = -_1776;
    float _1806 = _1804 + 1.0;
    float _1808 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1686);
    bool _1810 = !_1656;
    float _1812 = _1810 ? _711 : as_type<float>(_1684);
    float _1814 = _1792 * _1806;
    float _1816 = _1800 * _1756;
    float _1818 = -_1754;
    float _1820 = _1818 + 1.0;
    float _1822 = -_1792;
    float _1824 = _1822 + 1.0;
    bool _1826 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1828 = isnan(_165);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1834 = _1830 || _1832;
    float _1836 = float(_1834);
    float _1838 = _1776 * _1820;
    float _1840 = exp2(_1652);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1846 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1848 = isnan(_165);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = -_1836;
    float _1860 = _1858 + 1.0;
    float _1862 = _1780 * _1802;
    float _1864 = fma(_1758, _1612, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1866 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1868 = isnan(_165);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = _1856 * _1824;
    float _1880 = 1.0 / _1844;
    float _1882 = -_1856;
    float _1884 = _1882 + 1.0;
    float _1886 = _1836 * _1884;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1888;
    float _1892 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1614);
    float _1894 = _1876 * _1860;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1898 = _303 + _1896;
    float _1900 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1642);
    float _1902 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1892);
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1906 = _165 + _1904;
    float _1908 = fma(_1722, _1898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1910 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1900);
    float _1912 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1914 = _165 + _1912;
    float _1916 = _1890 * _1880;
    float _1918 = _1864 * _1894;
    float _1920 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1922 = -_1876;
    float _1924 = _1922 + 1.0;
    float _1926 = fma(_1706, _1906, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1928 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1930 = 1.0 / _1920;
    float _1932 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1918);
    float _1934 = fma(_1700, _1914, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1938 = _165 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1942 = _165 + _1940;
    float _1944 = fma(_1926, _1886, _1932);
    float _1946 = _1928 + _1920;
    float _1948 = fma(_1796, _1938, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1950 = fma(_1816, _1942, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1952 = fma(_1934, _1878, _1944);
    float _1954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1958 = _165 + _1956;
    float _1960 = fma(_1948, _1814, _1952);
    bool _1962 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1964 = isnan(_303);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1970 = _1966 || _1968;
    float _1972 = float(_1970);
    float _1974 = -_1840;
    float _1976 = _1974 + 1.0;
    float _1978 = _1946 * _1930;
    float _1980 = _1978 * 0.5;
    float _1982 = fma(_1950, _1838, _1960);
    float _1984 = fma(_1862, _1958, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1988 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1986);
    bool _1990 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1992 = isnan(_303);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = -_1972;
    float _2004 = _2002 + 1.0;
    bool _2006 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    float _2016 = 1.0 / _1988;
    float _2018 = _1812 + 0.5;
    float _2020 = fma(_1984, _1794, _1982);
    float _2022 = -_711;
    int _2024 = _1688 ? as_type<int>(_2022) : as_type<int>(_711);
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2028 = _165 + _2026;
    float _2030 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2032 = _2000 * _2004;
    bool _2034 = !_1668;
    float _2036 = _2034 ? _711 : as_type<float>(_2024);
    float _2038 = fma(_1916, _2028, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2040 = _2030 * _1954;
    float _2042 = _1908 * _2032;
    float _2044 = -_2000;
    float _2046 = _2044 + 1.0;
    float _2048 = fma(_2038, _1760, _2020);
    float _2050 = -_649;
    int _2052 = _1620 ? as_type<int>(_2050) : as_type<int>(_649);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2056 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2042);
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2060 = _2016 * _2058;
    bool _2062 = !_1676;
    float _2064 = _2062 ? _649 : as_type<float>(_2052);
    float _2066 = _2036 + 0.5;
    float _2068 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2056);
    float _2070 = -_649;
    int _2072 = _1644 ? as_type<int>(_2070) : as_type<int>(_649);
    float _2074 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2048);
    float _2076 = abs(_2060);
    float _2078 = log2(_2076);
    float _2080 = -_2064;
    float _2082 = _2080 + 0.5;
    bool _2084 = !_1662;
    float _2086 = _2084 ? _649 : as_type<float>(_2072);
    float _2088 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2092 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2094 = -_2086;
    float _2096 = _2094 + 0.5;
    float _2098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2100 = _2088 * _2054;
    float _2102 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2104 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2106 = _2068 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2112 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2114 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2116 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2118 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _2074;
    float _2120 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2122 = -_755;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2116);
    float _2126 = exp2(_2112);
    float _2128 = _2090 * _2098;
    float _2130 = -_755;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2092);
    float _2134 = -_755;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2104);
    float _2138 = _779 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2142 = _2102 * _2110;
    float _2144 = _711 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2146 = _2110;
    float _2148 = _2082;
    float _2150 = _2060;
    if (!_2014)
    {
        _2146 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2152 = _2146;
    float _2154 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _2040;
    out.m_66.y = _2142;
    out.m_66.z = _2100;
    out.m_66.w = _2128;
    float _2156 = _2152;
    if (!_2014)
    {
        float _2158 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2160 = _2060 + _2158;
        _2148 = _2160;
    }
    float _2162 = _2148;
    if (!_2014)
    {
        float _2164 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2166 = _2152 + _2164;
        _2156 = _2166;
    }
    float _2168 = _2156;
    float _2170 = fma(_2126, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2172 = precise::clamp(_2170, 0.0, 1.0);
    out.m_68.x = _2154;
    out.m_68.y = _2118;
    out.m_68.z = _2120;
    out.m_68.w = _2106;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2176 = _1984;
    float _2178 = _2168;
    if (!_2014)
    {
        float _2180 = 1.0 / _2168;
        _2176 = _2180;
    }
    float _2182 = _2176;
    bool _2184 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2186 = isnan(_1285);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2192 = _2188 || _2190;
    out.m_70.w = _2174;
    float _2194 = _779 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2196 = _649 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2198 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2200 = fma(_2172, -2.0, 3.0);
    float _2202 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2194);
    float _2204 = _791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2206 = _791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2208 = _2172 * _2172;
    float _2210 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2124);
    float _2212 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2132);
    float _2214 = _791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2216 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2136);
    float _2218 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2204);
    float _2220 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2206);
    float _2222 = _2208 * _2200;
    float _2224 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2214);
    float _2226 = _779 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2228 = _2196 * _2210;
    float _2230 = _2196 * _2212;
    float _2232 = _2196 * _2216;
    float _2234 = -_2222;
    float _2236 = _2234 + 1.0;
    float _2238 = in.m_72.x;
    float _2240 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2242 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2198);
    bool _2244 = _2060 <= 8000.0;
    bool _2246 = isnan(_2060);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan(8000.0);
    bool _2252 = _2248 || _2250;
    float _2254 = float(_2252);
    float _2256 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2222);
    float _2258 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2202);
    float _2260 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2240);
    float _2262 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2220);
    float _2264 = _2254 * _2256;
    float _2266 = fma(_2144, _2242, _2228);
    float _2268 = fma(_2144, _2258, _2230);
    float _2270 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2218);
    float _2272 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    float _2274 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1808);
    float _2276 = fma(_2144, _2260, _2232);
    float _2278 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2280 = _2262 + _2268;
    float _2282 = _2274 + _1527;
    float _2284 = _2270 + _2266;
    float _2286 = _2272 + _2276;
    float _2288 = _2270;
    float _2290 = _2274;
    if (!_2014)
    {
        _2288 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2292 = _2288;
    float _2294 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2296 = _2282 * 0.5;
    out.gl_Position.x = _1549;
    out.gl_Position.y = _1553;
    out.gl_Position.z = _2274;
    out.gl_Position.w = _1527;
    float _2298 = _2292;
    float _2300 = _1527;
    if (!_2014)
    {
        float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2304 = _2060 + _2302;
        _2150 = _2304;
    }
    float _2306 = _2150;
    float _2308 = _2306;
    if (_2014)
    {
        _2178 = 1.0;
    }
    float _2310 = _2178;
    float _2312 = _2310;
    if (!_2014)
    {
        float _2314 = _2162 * _2182;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        _2312 = _2316;
    }
    float _2318 = _2312;
    out.m_74.z = _2296;
    out.m_74.w = _1527;
    out.m_76.x = _2284;
    out.m_76.y = _2280;
    out.m_76.z = _2286;
    if (!_2014)
    {
        float _2320 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2322 = _2292 + _2320;
        _2290 = _2322;
    }
    float _2324 = _2290;
    if (!_2192)
    {
        _2298 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2326 = _2298;
    float _2328 = _2326;
    float _2330 = _2326;
    if (!_2192)
    {
        _2300 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2332 = _2300;
    float _2334 = _2296;
    float _2336 = _2332;
    float _2338 = _2332;
    if (!_2014)
    {
        float _2340 = 1.0 / _2324;
        _2334 = _2340;
    }
    float _2342 = _2334;
    float _2344 = -_1561;
    float _2346 = _2344 + 1.0;
    float _2348 = _2346 * _2278;
    float _2350 = precise::clamp(_2348, 0.0, 1.0);
    if (!_2014)
    {
        float _2352 = _2306 * _2342;
        float _2354 = precise::clamp(_2352, 0.0, 1.0);
        _2308 = _2354;
    }
    float _2356 = _2308;
    float _2358 = -_2350;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2362 = _2360 * _2238;
    float _2364 = _2294 * _1587;
    float _2366 = -_2294;
    float _2368 = _2366 + 1.0;
    float _2370 = _1598 * _2364;
    float _2372 = _1608 * _2364;
    float _2374 = _1598 * _2368;
    float _2376 = _2368;
    float _2378 = _2362;
    if (!_2192)
    {
        _2376 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2380 = _2376;
    float _2382 = fma(_1604, _2370, _1592);
    float _2384 = _2362 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2386 = _2382;
    float _2388 = _2380;
    float _2390 = _2380;
    if (_2014)
    {
        _2378 = 1.0;
    }
    float _2392 = _2378;
    float _2394 = _2392;
    if (!_2014)
    {
        float _2396 = -_2356;
        float _2398 = _2396 + 1.0;
        _2394 = _2398;
    }
    float _2400 = _2394;
    float _2402 = fma(_1606, _2370, _1594);
    float _2404 = fma(_1598, _2372, _1596);
    out.m_78.x = _2384;
    float _2406 = _2318 * _2400;
    out.m_80.x = _2382;
    out.m_80.y = _2402;
    out.m_80.z = _2404;
    out.m_80.w = _2374;
    float _2408 = _2406 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2410 = _2406;
    float _2412 = _2402;
    if (!_2192)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2414 = _2410;
    float _2416 = _2414;
    float _2418 = _2414;
    if (!_2192)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2420 = _2412;
    float _2422 = _2420;
    float _2424 = _2420;
    if (!_2192)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2426 = _2386;
    bool _2428 = !_2192;
    float _2430 = _2426;
    float _2432 = _2426;
    if (!_2428)
    {
        bool _2434 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2436 = isnan(_1285);
        bool _2438 = _2434 || _2436;
        bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2442 = _2438 || _2440;
        if (!_2442)
        {
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2446 = _1285 + _2444;
            float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2450 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2448;
            float _2452 = 1.0 / _2450;
            float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2474 = _2446 * _2452;
            float _2476 = precise::clamp(_2474, 0.0, 1.0);
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2482 = fma(_2476, _2456, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2484 = fma(_2476, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2486 = fma(_2476, _2460, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2488 = fma(_2476, _2464, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2490 = fma(_2476, _2468, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2492 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2390 = _2484;
            _2424 = _2490;
            _2330 = _2482;
            _2418 = _2488;
            _2338 = _2486;
            _2432 = _2492;
            _2494 = true;
        }
        else
        {
            bool _2496 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2498 = isnan(_1285);
            bool _2500 = _2496 || _2498;
            bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2504 = _2500 || _2502;
            if (!_2504)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2506 = _2328;
            _2330 = _2506;
            if (!_2504)
            {
                _2388 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2508 = _2388;
            _2390 = _2508;
            if (!_2504)
            {
                _2336 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2510 = _2336;
            _2338 = _2510;
            if (!_2504)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2512 = _2416;
            _2418 = _2512;
            if (!_2504)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2514 = _2422;
            _2424 = _2514;
            if (!_2504)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2516 = _2430;
            bool _2518 = !_2504;
            _2432 = _2516;
            if (!_2518)
            {
                bool _2520 = _1285 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2522 = isnan(_1285);
                bool _2524 = _2520 || _2522;
                bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2528 = _2524 || _2526;
                if (!_2528)
                {
                    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2532 = _1285 + _2530;
                    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2536 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2534;
                    float _2538 = 1.0 / _2536;
                    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2560 = _2532 * _2538;
                    float _2562 = precise::clamp(_2560, 0.0, 1.0);
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2568 = fma(_2562, _2542, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2570 = fma(_2562, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2572 = fma(_2562, _2546, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2574 = fma(_2562, _2550, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2576 = fma(_2562, _2554, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2578 = fma(_2562, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2390 = _2570;
                    _2424 = _2576;
                    _2330 = _2568;
                    _2418 = _2574;
                    _2338 = _2572;
                    _2432 = _2578;
                    _2494 = true;
                }
                else
                {
                    _2390 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2338 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2494 = false;
    float _2580 = _2390;
    float _2582 = _2424;
    float _2584 = _2330;
    float _2586 = _2418;
    float _2588 = _2338;
    float _2590 = _2432;
    float _2592 = fma(_2280, -0.5, 0.5);
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    float _2596 = -_2580;
    float _2598 = _2596 + _2582;
    float _2600 = -_2584;
    float _2602 = _2600 + _2586;
    out.m_82.x = 0.0;
    float _2604 = fma(_2594, _2598, _2580);
    float _2606 = -_2588;
    float _2608 = _2606 + _2590;
    float _2610 = fma(_2594, _2602, _2584);
    float _2612 = _2604 * 0.586610972881317138671875;
    bool _2614 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2616 = fma(_2594, _2608, _2588);
    float _2618 = _2408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2620 = fma(_2610, 0.298911988735198974609375, _2612);
    bool _2622 = _2318 > 0.0;
    bool _2624 = isnan(_2318);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan(0.0);
    bool _2630 = _2626 || _2628;
    float _2632 = fma(_2616, 0.114477999508380889892578125, _2620);
    out.m_49.x = _2618;
    bool _2634 = _2400 <= 0.0;
    bool _2636 = !_2630;
    bool _2638 = _2634 || _2636;
    float _2640 = -_2632;
    float _2642 = _2610 + _2640;
    float _2644 = -_2632;
    float _2646 = _2616 + _2644;
    float _2648 = fma(_2642, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2632);
    float _2650 = -_2632;
    float _2652 = _2604 + _2650;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2632);
    float _2656 = fma(_2646, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2632);
    bool _2658 = !_2614;
    if (!_2658)
    {
        float _2660 = -_1253;
        float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2664 = -_1255;
        float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2668 = -_1257;
        float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2672 = _2662 * _2662;
        float _2674 = fma(_2666, _2666, _2672);
        float _2676 = fma(_2670, _2670, _2674);
        float _2678 = sqrt(_2676);
        float _2680 = rsqrt(_2676);
        float _2682 = -_2678;
        float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2686 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2688 = precise::clamp(_2686, 0.0, 1.0);
        float _2690 = _2666 * _2680;
        float _2692 = _2662 * _2680;
        float _2694 = abs(_2688);
        float _2696 = log2(_2694);
        float _2698 = _2670 * _2680;
        float _2700 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2702 = _2280 * _2692;
        float _2704 = -_2692;
        float _2706 = -_2700;
        float _2708 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2706);
        float _2710 = fma(_2284, _2690, _2702);
        float _2712 = -_2698;
        float _2714 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2708);
        float _2716 = fma(_2286, _2698, _2710);
        float _2718 = precise::clamp(_2716, 0.0, 1.0);
        float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2722 = _2714 + _2720;
        float _2724 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2726 = _2722 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2728 = precise::clamp(_2726, 0.0, 1.0);
        float _2730 = exp2(_2724);
        float _2732 = _2730 * _2728;
        float _2734 = _2718 * _2732;
        float _2736 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2738 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2740 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2736;
        out.m_82.y = _2738;
        out.m_82.z = _2740;
    }
    out.m_84.x = _2648;
    out.m_84.y = _2654;
    out.m_84.z = _2656;
    if (!_2638)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2742 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2742;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

