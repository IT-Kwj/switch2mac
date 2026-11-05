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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_66 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_70 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 m_80 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3287 = false;
    bool _589 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3533 = as_type<float>(_117);
        out.gl_Position.z = _3533;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_49.w;
    float _123 = float(_103);
    float _125 = 1.0 / _123;
    float _127 = -_121;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_121);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = _129 * _125;
    bool _143 = _129 >= _123;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    out.m_51.x = _141;
    float _149 = _121;
    float _151 = _141;
    float _153 = _129;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _149;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _157 = _155 * 5.0;
        _119 = as_type<int>(_157);
    }
    int _159 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3606 = as_type<float>(_159);
        out.gl_Position.z = _3606;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = in.m_56.w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_49.x;
    float _179 = in.m_49.y;
    float _181 = in.m_49.z;
    float _183 = in.m_44.x;
    float _185 = in.m_44.y;
    float _187 = in.m_44.z;
    int _189 = as_type<int>(_161) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_161) & 2;
    bool _195 = _193 != 0;
    float _197 = _161;
    float _199 = _163;
    if (!_175)
    {
        float _201 = _163 * _163;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _205;
    if (!_175)
    {
        float _213 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_195;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_175;
    float _223 = _215;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _163 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _163);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _259 = !_175;
    float _261 = _257;
    float _263 = _255;
    if (!_259)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _163 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _199 = _283;
    }
    float _285 = _199;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _257 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _291 = _257 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _293 = _257 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_175)
    {
        float _295 = _129 * _129;
        float _297 = _295 * 0.5;
        _261 = _297;
    }
    float _299 = _261;
    float _301 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _289);
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].y, _291);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].z, _293);
    float _307 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_175)
    {
        float _309 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _309;
    }
    float _311 = _263;
    bool _313 = !_175;
    float _315 = _311;
    if (!_313)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = _129 * _319;
        float _329 = exp2(_327);
        float _331 = _325 * 0.693147182464599609375;
        float _333 = 1.0 / _331;
        float _335 = 1.0 / _323;
        float _337 = _329 + (-1.0);
        float _339 = -_337;
        float _341 = fma(_339, _333, _129);
        float _343 = _341 * _335;
        float _345 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _345;
    }
    float _347 = _315;
    float _349 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _351 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[10].x, _301);
    float _353 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[10].y, _303);
    float _355 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _349 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _359 = _349 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _361 = _349 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _363 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[10].z, _305);
    float _365 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[8].x, _357);
    float _367 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[8].y, _359);
    float _369 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[8].z, _361);
    float _371 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = fma(_285, _177, _351);
    float _375 = fma(_285, _179, _353);
    float _377 = fma(_285, _181, _363);
    float _379 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[10].x, _365);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[10].y, _367);
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[10].z, _369);
    float _385 = _371;
    if (!_175)
    {
        _385 = _129;
    }
    float _387 = _385;
    bool _389 = !_175;
    float _391 = _387;
    if (!_389)
    {
        float _393 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _395 = log2(_393);
        float _397 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _399 = _397 + 1.0;
        float _401 = 1.0 / _399;
        float _403 = _129 * _395;
        float _405 = exp2(_403);
        float _407 = -_405;
        float _409 = _407 + 1.0;
        float _411 = _409 * _401;
        _391 = _411;
    }
    float _413 = _391;
    float _415 = fma(_413, _179, _381);
    float _417 = fma(_413, _177, _379);
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _421 = fma(_375, _165, _185);
    float _423 = -_415;
    float _425 = _375 + _423;
    float _427 = fma(_413, _181, _383);
    float _429 = fma(_373, _165, _183);
    float _431 = -_417;
    float _433 = _373 + _431;
    float _435 = _425 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _425 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _439 = _425 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _441 = -_427;
    float _443 = _377 + _441;
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _447 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
    float _451 = fma(_377, _165, _187);
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _455 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    bool _459 = !_419;
    float _461 = _455;
    float _463 = _453;
    float _465 = _457;
    float _483;
    if (!_459)
    {
        float _467 = in.m_58.x;
        float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _471 = _467 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _475 = _473 * _469;
        float _477 = floor(_475);
        float _479 = -_477;
        float _481 = _475 + _479;
        _483 = _481;
        _485 = true;
    }
    else
    {
        _483 = _141;
    }
    _485 = false;
    float _487 = _483;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = _487 + _489;
    float _493 = in.m_56.x;
    float _495 = in.m_56.y;
    bool _497 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_487);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    bool _513 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _515 = isnan(_487);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _529;
    float _533 = 1.0 / _511;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _537 = _523 * _527;
    float _539 = -_523;
    float _541 = _539 + 1.0;
    float _543 = _491 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _545;
    float _549 = fma(_531, _543, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _551 = fma(_547, _543, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _553 = _549 * _537;
    float _555 = _551 * _537;
    float _557 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].x, _553);
    float _559 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].y, _555);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].x, _557);
    float _563 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].y, _559);
    float _565 = _561 * _493;
    float _567 = _563 * _495;
    bool _569 = !_535;
    float _587;
    if (!_569)
    {
        float _571 = in.m_58.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        _587 = _141;
    }
    _589 = false;
    float _591 = _587;
    bool _593 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _595 = isnan(_591);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _611 = isnan(_591);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _591 + _625;
    float _629 = -_603;
    float _631 = _629 + 1.0;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _635 = 1.0 / _607;
    float _637 = _619 * _631;
    float _639 = -_619;
    float _641 = _639 + 1.0;
    float _643 = _623 * _635;
    float _645 = fma(_643, _627, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _647 = _645 * _637;
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[115].x, _647);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[116].x, _649);
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_60.x = _659;
    out.m_60.y = _661;
    out.m_60.z = _663;
    out.m_60.w = _665;
    bool _667 = !_633;
    float _669 = _661;
    float _671 = _659;
    if (!_667)
    {
        float _673 = in.m_58.x;
        float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _677 = _673 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _681 = _679 * _675;
        float _683 = floor(_681);
        float _685 = -_683;
        float _687 = _681 + _685;
        _151 = _687;
    }
    float _689 = _151;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _693 = int(_691);
    float _695 = _421 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _697 = _421 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _699 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _701 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _695);
    float _703 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _705 = int(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _715 = float(_693);
    float _717 = 1.0 / _709;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _723 = float(uint(_705));
    float _725 = 1.0 / _715;
    int _727 = ~_705;
    int _729 = _727 + 1;
    int _731 = ~_705;
    int _733 = _731 + 1;
    float _735 = float(_705);
    float _737 = 1.0 / _723;
    float _739 = _129 * _725;
    float _741 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _743 = log2(_741);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _747 = _745 != 0;
    int _749 = as_type<int>(_737) + (-2);
    float _751 = trunc(_739);
    int _753 = int(_751);
    bool _755 = !_747;
    float _757 = _755 ? 7.345489978790283203125 : 1.0;
    float _759 = float(uint(_753));
    float _761 = as_type<float>(_749) * _759;
    float _763 = in.m_58.x;
    float _765 = in.m_58.y;
    float _767 = in.m_58.z;
    float _769 = in.m_58.w;
    float _771 = trunc(_761);
    float _773 = precise::max(_771, 0.0);
    uint _776 = uint(_773);
    int _778 = _729 * int(_776);
    int _780 = _778 + _753;
    float _782 = _757 * _763;
    float _784 = float(uint(_780));
    float _786 = _765 * 2.0;
    float _788 = as_type<float>(_749) * _784;
    float _790 = float(_753);
    float _792 = floor(_786);
    float _794 = trunc(_788);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    int _800 = int(_776) + int(_798);
    bool _802 = _790 >= _735;
    bool _804 = isnan(_790);
    bool _806 = _802 || _804;
    bool _808 = isnan(_735);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = floor(_782);
    int _816 = _733 * _800;
    int _818 = _816 + _753;
    bool _820 = uint(_818) >= uint(_705);
    float _822 = trunc(_812);
    int _824 = int(_822);
    bool _826 = !_820;
    int _828 = _826 ? 0 : (-1);
    bool _830 = _705 == 0;
    int _832 = ~_800;
    int _834 = _832 + _828;
    int _836 = _834 + 1;
    float _838 = -_814;
    float _840 = _782 + _838;
    int _842 = _705 * _836;
    int _844 = _842 + _753;
    float _846 = _840 * _735;
    int _848 = ~_824;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = trunc(_846);
    int _856 = int(_854);
    bool _858 = !_830;
    int _860 = _858 ? _844 : (-1);
    int _862 = _860 * _852;
    float _864 = _129 * _735;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _876 = _874 != 0;
    int _878 = _705 + (-1);
    float _880 = _864 * _125;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _884 = _882 != 0;
    bool _886 = !_872;
    int _888 = _886 ? 0 : 1;
    int _890 = _824 * _878;
    int _892 = _890 + _862;
    bool _894 = !_868;
    int _896 = _894 ? 0 : 1;
    float _898 = trunc(_880);
    int _900 = int(_898);
    bool _902 = !_884;
    int _904 = _902 ? 0 : 1;
    int _906 = abs(_888);
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _910 = _908 != 0;
    bool _912 = !_876;
    int _914 = _912 ? 0 : 1;
    int _916 = _892 * _906;
    int _918 = abs(_896);
    float _920 = _421 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _922 = abs(_904);
    bool _924 = !_910;
    int _926 = _924 ? 0 : 1;
    float _928 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _920);
    int _930 = abs(_914);
    int _932 = _856 * _922;
    int _934 = _932 + _753;
    float _936 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _697);
    int _938 = abs(_926);
    float _940 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _701);
    int _942 = _900 * _918;
    int _944 = _942 + _916;
    float _946 = float(uint(_934));
    float _948 = _940 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _950 = _769 > 0.5;
    int _952 = _934 * _930;
    int _954 = _952 + _944;
    int _956 = ~_705;
    int _958 = _956 + 1;
    float _960 = as_type<float>(_749) * _946;
    int _962 = _856 * _938;
    int _964 = _962 + _954;
    float _966 = _763 * 2.0;
    float _968 = trunc(_960);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    float _974 = float(uint(_964));
    float _976 = as_type<float>(_749) * _974;
    float _978 = floor(_966);
    float _980 = trunc(_976);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    int _986 = ~_705;
    int _988 = _986 + 1;
    int _990 = _958 * int(_984);
    int _992 = _990 + _964;
    float _994 = float(uint(_992));
    int _996 = ~_705;
    int _998 = _996 + 1;
    float _1000 = as_type<float>(_749) * _994;
    int _1002 = _998 * int(_972);
    int _1004 = _1002 + _934;
    float _1006 = trunc(_1000);
    float _1008 = precise::max(_1006, 0.0);
    uint _1010 = uint(_1008);
    float _1012 = float(uint(_1004));
    float _1014 = as_type<float>(_749) * _1012;
    float _1016 = -_219;
    int _1018 = _950 ? as_type<int>(_1016) : as_type<int>(_219);
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1022 = _1020 != 0;
    float _1024 = trunc(_1014);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    int _1030 = int(_984) + int(_1010);
    int _1032 = ~_705;
    int _1034 = _1032 + 1;
    int _1036 = _988 * _1030;
    int _1038 = _1036 + _964;
    bool _1040 = uint(_1038) >= uint(_705);
    int _1042 = int(_972) + int(_1028);
    bool _1044 = !_1040;
    int _1046 = _1044 ? 0 : (-1);
    int _1048 = _1034 * _1042;
    int _1050 = _1048 + _934;
    int _1052 = ~_1030;
    int _1054 = _1052 + _1046;
    int _1056 = _1054 + 1;
    bool _1058 = !_1022;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = _705 * _1056;
    int _1064 = _1062 + _964;
    bool _1066 = !_830;
    int _1068 = _1066 ? _1064 : (-1);
    int _1070 = _1068 & 3;
    bool _1072 = _1070 != 0;
    int _1074 = _1068 & 3;
    bool _1076 = _1074 != 0;
    bool _1078 = uint(_1070) > 1u;
    int _1080 = _1076 ? 0 : 1;
    bool _1082 = _1070 != 3;
    int _1084 = ~_1080;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    bool _1090 = uint(_1070) >= 2u;
    int _1092 = _1088;
    float _1094 = as_type<float>(_1070);
    float _1096 = as_type<float>(_705);
    float _1098 = as_type<float>(_934);
    if (!_1078)
    {
        int _1100 = ~_1080;
        int _1102 = _1100 + 1;
        _1092 = _1102;
    }
    int _1104 = _1092;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1108 = _1106 != 0;
    int _1110 = _1090 ? 0 : 1;
    bool _1112 = !_1108;
    float _1114 = _1112 ? _219 : as_type<float>(_1018);
    bool _1116 = _767 > 0.5;
    int _1118 = ~_1110;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    int _1124 = _1122;
    if (_1082)
    {
        int _1126 = ~_1110;
        int _1128 = _1126 + 1;
        _1124 = _1128;
    }
    int _1130 = _1124;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1134 = _1132 != 0;
    float _1136 = -_209;
    int _1138 = _1116 ? as_type<int>(_1136) : as_type<int>(_209);
    int _1140 = _1068 >> 31;
    bool _1142 = !_1134;
    float _1144 = _1142 ? _209 : as_type<float>(_1138);
    int _1146 = _1140 & 3;
    bool _1148 = _978 >= 0.0;
    bool _1150 = isnan(_978);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    int _1158 = _1068 + _1146;
    int _1160 = _1156 ? 0 : 1;
    int _1162 = _1158 >> 2;
    bool _1164 = _978 > 0.0;
    int _1166 = _1162 << 4;
    int _1168 = _1166 + 368;
    float _1170 = _763 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    uint _1172 = uint(int(uint(_1168) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    bool _1188 = uint(_1050) >= uint(_705);
    float _1190 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1194 = -_711;
    float _1196 = fma(_1170, 2.0, _1194);
    float _1198 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _936);
    int _1200 = ~_1160;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = fma(_1190, -2.0, _1192);
    float _1208 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _928);
    int _1210 = _1204;
    if (!_1164)
    {
        int _1212 = ~_1160;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    int _1218 = _1168 + 8;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
    int _1224 = int(_1220) & 3;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[int(_1222)][_1224];
    int _1228 = int(_1220) + 1;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    int _1232 = _1228 & 3;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[int(_1230)][_1232];
    float _1236 = _765 + _763;
    bool _1238 = _792 >= 0.0;
    bool _1240 = isnan(_792);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(0.0);
    bool _1246 = _1242 || _1244;
    float _1248 = _1208 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1250 = _1236 + (-1.0);
    int _1252 = _1246 ? 0 : 1;
    float _1254 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1256 = _792 > 0.0;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1258;
    bool _1262 = !_1188;
    int _1264 = _1262 ? 0 : (-1);
    float _1266 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1268 = abs(_1104);
    float _1270 = _1260 * _717;
    float _1272 = _767 * 2.0;
    int _1274 = ~_1042;
    int _1276 = _1274 + _1264;
    int _1278 = _1276 + 1;
    float _1280 = _129 * _743;
    int _1282 = ~_1252;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = _765 + _767;
    bool _1290 = !_1072;
    int _1292 = _1290 ? 0 : 1;
    float _1294 = floor(_1272);
    int _1296 = _1286;
    float _1298 = _1254;
    if (!_1256)
    {
        int _1300 = ~_1252;
        int _1302 = _1300 + 1;
        _1296 = _1302;
    }
    int _1304 = _1296;
    float _1306 = _1288 + (-1.0);
    int _1308 = _705 * _1278;
    int _1310 = _1308 + _934;
    float _1312 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1206);
    int _1314 = ~_1268;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    float _1320 = exp2(_1280);
    bool _1322 = _1070 != 3;
    float _1324 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_747)
    {
        _1094 = _765;
    }
    float _1326 = _1094;
    float _1328 = _1326;
    if (!_747)
    {
        _1096 = _767;
    }
    float _1330 = _1096;
    float _1332 = _1330;
    if (!_747)
    {
        _1098 = _767;
    }
    float _1334 = _1098;
    int _1336 = abs(_1130);
    int _1338 = _1318 * as_type<int>(_1186);
    int _1340 = abs(_1292);
    float _1342 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1344 = int(_1342);
    float _1346 = _1334;
    if (_747)
    {
        _1328 = _763;
    }
    float _1348 = _1328;
    if (_747)
    {
        _1332 = _765;
    }
    float _1350 = _1332;
    float _1352 = -_1320;
    float _1354 = _1352 + 1.0;
    if (_747)
    {
        _1346 = _765;
    }
    float _1356 = _1346;
    bool _1358 = _1294 >= 0.0;
    bool _1360 = isnan(_1294);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan(0.0);
    bool _1366 = _1362 || _1364;
    int _1368 = ~_1340;
    int _1370 = _1368 + 1;
    int _1372 = _1370 + 1;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1376 = _1374 != 0;
    bool _1378 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1386 = _1382 || _1384;
    int _1388 = _1372 * as_type<int>(_1178);
    int _1390 = _1388 + _1338;
    bool _1392 = !_830;
    int _1394 = _1392 ? _1310 : (-1);
    bool _1396 = !_1322;
    int _1398 = _1396 ? 0 : (-1);
    int _1400 = _1366 ? 0 : 1;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1412 = _1410 != 0;
    int _1414 = ~_1336;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    int _1420 = abs(_1398);
    int _1422 = abs(_1060);
    int _1424 = _1418 * as_type<int>(_1226);
    int _1426 = _1424 + _1390;
    int _1428 = ~_1420;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1436 = abs(_1344);
    float _1438 = float(uint(_1344));
    int _1440 = _1432 * as_type<int>(_1234);
    int _1442 = _1440 + _1426;
    float _1444 = float(uint(_1436));
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1448 = _689 + _1446;
    bool _1450 = _1294 > 0.0;
    float _1452 = 1.0 / _1438;
    int _1454 = ~_1422;
    int _1456 = _1454 + 1;
    int _1458 = _1456 + 1;
    float _1460 = fma(_1270, _1448, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1462 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1464 = isnan(_689);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    bool _1474 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1476 = isnan(_689);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    int _1486 = _1442 * _1458;
    float _1488 = 1.0 / _1444;
    float _1490 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[83].w, _713);
    int _1492 = _1394 * _1422;
    int _1494 = _1492 + _1486;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1498 = 1.0 + _1496;
    float _1500 = _1386 ? _1354 : 0.0;
    float _1502 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1504 = abs(_1494);
    float _1506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1508 = as_type<int>(_1452) + (-2);
    float _1510 = -_1484;
    float _1512 = _1510 + 1.0;
    float _1514 = float(uint(_1504));
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1518 = float(uint(_1494));
    float _1520 = _1472 * _1512;
    float _1522 = -_1472;
    float _1524 = _1522 + 1.0;
    int _1526 = as_type<int>(_1488) + (-2);
    float _1528 = 1.0 / _1498;
    float _1530 = as_type<float>(_1508) * _1518;
    float _1532 = _1460 * _1520;
    float _1534 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[83].z, _719);
    float _1536 = as_type<float>(_1526) * _1514;
    float _1538 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1540 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1542 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1532);
    float _1544 = trunc(_1536);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    float _1550 = -_721;
    float _1552 = fma(_1538, 2.0, _1550);
    int _1554 = ~_1344;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1540, -2.0, _1516);
    int _1560 = ~_1400;
    int _1562 = _1560 + 1;
    int _1564 = _1562 + 1;
    float _1566 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1542);
    float _1568 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1570 = trunc(_1530);
    float _1572 = precise::max(_1570, 0.0);
    uint _1574 = uint(_1572);
    float _1576 = _1500 * _1528;
    float _1578 = _1114 + (-0.5);
    float _1580 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1558);
    int _1582 = _1564;
    if (!_1450)
    {
        int _1584 = ~_1400;
        int _1586 = _1584 + 1;
        _1582 = _1586;
    }
    int _1588 = _1582;
    float _1590 = -_129;
    float _1592 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1552);
    float _1594 = _1144 + 0.5;
    float _1596 = -_1568;
    float _1598 = -_1580;
    float _1600 = fma(_1596, _1578, _1598);
    float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1604 = _948 + _1602;
    int _1606 = ~_1436;
    int _1608 = _1606 + 1;
    float _1610 = fma(_1502, _1594, _1592);
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1614 = _1248 + _1612;
    bool _1616 = !_1408;
    int _1618 = _1616 ? 0 : 1;
    float _1620 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1534);
    int _1622 = _1608 * int(_1548);
    int _1624 = _1622 + _1504;
    float _1626 = _1604 * _1604;
    int _1628 = _1556 * int(_1574);
    int _1630 = _1628 + _1494;
    float _1632 = float(_1588);
    float _1634 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1490);
    float _1636 = float(uint(_1624));
    float _1638 = fma(_1614, _1614, _1626);
    float _1640 = float(uint(_1630));
    float _1642 = -_1634;
    float _1644 = _1642 + 1.0;
    int _1646 = abs(_1618);
    float _1648 = as_type<float>(_1526) * _1636;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1254 + _1650;
    float _1654 = as_type<float>(_1508) * _1640;
    bool _1656 = !_1404;
    int _1658 = _1656 ? 0 : 1;
    float _1660 = in.m_62.x;
    float _1662 = in.m_62.y;
    float _1664 = in.m_62.z;
    float _1666 = fma(_1652, _1652, _1638);
    float _1668 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1670 = abs(_1658);
    float _1672 = trunc(_1654);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = float(_1216);
    float _1680 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1668);
    float _1682 = float(_1670);
    float _1684 = fma(_1114, _1644, _1600);
    float _1686 = float(_1646);
    float _1688 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1680);
    bool _1690 = _763 > 0.5;
    float _1692 = rsqrt(_1666);
    float _1694 = _1682 * _1632;
    float _1696 = _699 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1698 = _1688 >= 0.0;
    float _1700 = _1686 * _1678;
    int _1702 = ~_1344;
    int _1704 = _1702 + 1;
    float _1706 = _1694 * (-2.0);
    int _1708 = ~_1436;
    int _1710 = _1708 + 1;
    float _1712 = trunc(_1648);
    float _1714 = precise::max(_1712, 0.0);
    uint _1716 = uint(_1714);
    int _1718 = int(_1574) + int(_1676);
    float _1720 = fma(_1266, _1706, _1266);
    float _1722 = fma(_1706, _1660, _1660);
    float _1724 = -_209;
    int _1726 = _1690 ? as_type<int>(_1724) : as_type<int>(_209);
    float _1728 = _1700 * (-2.0);
    bool _1730 = _1344 == 0;
    float _1732 = _1696 * _1692;
    int _1734 = _1704 * _1718;
    int _1736 = _1734 + _1494;
    float _1738 = fma(_1728, _1662, _1662);
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1742 = _1740 != 0;
    float _1744 = _1604 * _1732;
    float _1746 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1748 = uint(_1736) >= uint(_1344);
    float _1750 = as_type<float>(_1718);
    float _1752 = _1746;
    if (_1698)
    {
        out.m_47.x = 0.0;
    }
    int _1754 = int(_1548) + int(_1716);
    float _1756 = _1614 * _1732;
    float _1758 = -_1744;
    float _1760 = _1604 + _1758;
    float _1762 = _1652 * _1732;
    bool _1764 = !_1742;
    float _1766 = _1764 ? _209 : as_type<float>(_1726);
    int _1768 = _1710 * _1754;
    int _1770 = _1768 + _1504;
    float _1772 = -_1756;
    float _1774 = _1614 + _1772;
    float _1776 = _1760 * _1760;
    bool _1778 = !_1748;
    int _1780 = _1778 ? 0 : (-1);
    float _1782 = -_1762;
    float _1784 = _1652 + _1782;
    bool _1786 = _765 > 0.5;
    float _1788 = fma(_1774, _1774, _1776);
    int _1790 = ~_1718;
    int _1792 = _1790 + _1780;
    int _1794 = _1792 + 1;
    float _1796 = fma(_1324, _1728, _1324);
    float _1798 = -_219;
    int _1800 = _1786 ? as_type<int>(_1798) : as_type<int>(_219);
    float _1802 = fma(_1784, _1784, _1788);
    bool _1804 = uint(_1770) >= uint(_1436);
    int _1806 = _1344 * _1794;
    int _1808 = _1806 + _1494;
    float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1698)
    {
        _1750 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1812 = _1750;
    bool _1814 = !_1804;
    int _1816 = _1814 ? 0 : (-1);
    bool _1818 = _1344 == 0;
    int _1820 = as_type<int>(_1812);
    if (_1698)
    {
        float _1822 = _1812 * 5.0;
        _1820 = as_type<int>(_1822);
    }
    int _1824 = _1820;
    int _1826 = _1494 ^ _1344;
    int _1828 = ~_1816;
    int _1830 = _1754 + _1828;
    int _1832 = _1830 + 1;
    float _1834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1836 = uint(int(uint(_1826) >> uint(31)));
    if (_1698)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6111 = as_type<float>(_1824);
        out.gl_Position.z = _6111;
    }
    bool _1838 = !_1818;
    int _1840 = _1838 ? _1808 : (-1);
    float _1842 = _763 + (-0.5);
    int _1844 = ~int(_1836);
    int _1846 = _1844 + 1;
    float _1848 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1850 = float(_1840);
    float _1852 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1722);
    int _1854 = _1832 ^ _1846;
    float _1856 = sqrt(_1802);
    bool _1858 = !_1376;
    float _1860 = _1858 ? _219 : as_type<float>(_1800);
    bool _1862 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1864 = isnan(1.0);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1870 = _1866 || _1868;
    float _1872 = -_129;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1196);
    int _1876 = ~_1846;
    int _1878 = _1876 + _1854;
    int _1880 = _1878 + 1;
    float _1882 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1884 = _1766 + 0.5;
    float _1886 = fma(_1848, _1850, _1874);
    bool _1888 = !_1730;
    int _1890 = _1888 ? _1880 : (-1);
    float _1892 = fma(_1848, _1884, _1886);
    float _1894 = float(_1890);
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1898 = -_1312;
    float _1900 = fma(_1882, _1894, _1898);
    float _1902 = _1860 + (-0.5);
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1906 = _1692 * _1856;
    bool _1908 = !_1870;
    float _1910 = _1908 ? _129 : _1576;
    float _1912 = -_1882;
    float _1914 = fma(_1912, _1902, _1900);
    float _1916 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1896);
    float _1918 = -_1620;
    float _1920 = _1918 + 1.0;
    float _1922 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1904);
    float _1924 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1916);
    float _1926 = -_1920;
    float _1928 = fma(_1144, _1926, _1610);
    float _1930 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1922);
    float _1932 = -_1924;
    float _1934 = _1932 + 1.0;
    float _1936 = fma(_1910, _1720, _1852);
    float _1938 = -_1930;
    float _1940 = _1938 + 1.0;
    float _1942 = -_1934;
    float _1944 = fma(_1766, _1942, _1892);
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1952 = fma(_1860, _1940, _1914);
    float _1954 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = _699 * _1906;
    out.m_64.x = _1944;
    out.m_64.y = _1952;
    out.m_64.z = _1928;
    out.m_64.w = _1684;
    bool _1962 = !_1412;
    int _1964 = _1962 ? 0 : 1;
    out.m_66.x = _1954;
    out.m_66.y = _1956;
    out.m_66.z = _1958;
    out.m_66.w = _1746;
    out.m_68.x = _1960;
    float _1966 = _1954;
    float _1968 = _1958;
    float _1970 = _1954;
    float _1972 = _1958;
    if (_1698)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1974 = -_1744;
    float _1976 = _948 + _1974;
    int _1978 = abs(_1964);
    float _1980 = -_1756;
    float _1982 = _1248 + _1980;
    float _1984 = _765 + (-0.5);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1976 + _1986;
    float _1990 = -_1762;
    float _1992 = _1254 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1996 = _1982 + _1994;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2000 = float(_1304);
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2004 = _1992 + _2002;
    float _2006 = float(_1978);
    float _2008 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1998);
    float _2010 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1738);
    float _2012 = _767 + _763;
    float _2014 = _767 + (-0.5);
    float _2016 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2008);
    float _2018 = _2006 * _2000;
    float _2020 = fma(_1910, _1796, _2010);
    float _2022 = _2012 + (-1.0);
    float _2024 = _1936 * 0.15915493667125701904296875;
    bool _2026 = _2016 >= 0.0;
    float _2028 = _2018 * (-2.0);
    float _2030 = _2020 * 0.15915493667125701904296875;
    float _2032 = _2024 * 6.283185482025146484375;
    float _2034 = sin(_2032);
    float _2036 = fma(_2028, _1664, _1664);
    float _2038 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2040 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2036);
    float _2042 = fma(_2038, _2028, _2038);
    float _2044 = _2024 * 6.283185482025146484375;
    float _2046 = cos(_2044);
    float _2048 = _2014;
    if (_2026)
    {
        _2048 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2050 = _2048;
    int _2052 = as_type<int>(_2050);
    if (_2026)
    {
        out.m_47.x = 0.0;
    }
    float _2054 = fma(_1910, _2042, _2040);
    if (_2026)
    {
        float _2056 = _2050 * 5.0;
        _2052 = as_type<int>(_2056);
    }
    int _2058 = _2052;
    float _2060 = _2054 * 0.15915493667125701904296875;
    float _2062 = _2030 * 6.283185482025146484375;
    float _2064 = sin(_2062);
    if (_2026)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6491 = as_type<float>(_2058);
        out.gl_Position.z = _6491;
    }
    float _2066 = _2030 * 6.283185482025146484375;
    float _2068 = cos(_2066);
    float _2070 = _2060 * 6.283185482025146484375;
    float _2072 = sin(_2070);
    if (_2026)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2074 = _2060 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    float _2078 = _2034 * _2064;
    float _2080 = _2046 * _2068;
    float _2082 = _2046 * _2064;
    float _2084 = _2034 * _2068;
    float _2086 = fma(_2072, _2080, _2078);
    float _2088 = fma(_2072, _2078, _2080);
    float _2090 = -_2082;
    float _2092 = fma(_2072, _2084, _2090);
    float _2094 = -_2084;
    float _2096 = fma(_2072, _2082, _2094);
    float _2098 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2100 = (*spvDescriptorSet0.vp_c10)._m0[9].w + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _2102 = _2046 * _2076;
    float _2104 = _2068 * _2076;
    float _2106 = _2034 * _2076;
    float _2108 = _2064 * _2076;
    float _2110 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _2114 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2098);
    float _2118 = _2110 * _1906;
    float _2120 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2122 = _1960 * _2114;
    float _2124 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2126 = _2118 * _2112;
    float _2128 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2130 = _2128 * 0.5;
    float _2132 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2120);
    float _2134 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2124);
    float _2136 = _2102 * _2126;
    float _2138 = -_2126;
    float _2140 = _2072 * _2138;
    float _2142 = _2106 * _2126;
    float _2144 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2146 = fma(_2086, _2122, _2136);
    float _2148 = fma(_2104, _2122, _2140);
    float _2150 = fma(_2092, _2122, _2142);
    float _2152 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2154 = fma(_2096, _2130, _2146);
    float _2156 = fma(_2108, _2130, _2148);
    float _2158 = fma(_2088, _2130, _2150);
    float _2160 = -_2072;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2144);
    float _2164 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2166 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2168 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2170 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2172 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2164);
    float _2174 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2166);
    float _2176 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2168);
    float _2178 = -_2072;
    float _2180 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2152);
    float _2182 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    float _2184 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2174);
    float _2186 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2188 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2190 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2194 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2186);
    float _2196 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2188);
    float _2198 = _1254 + _2190;
    float _2200 = _1248 + _2192;
    float _2202 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2176);
    float _2204 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2208 = _2198 + _2206;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2212 = _2200 + _2210;
    float _2214 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2216 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2218 = _2208 * _2208;
    float _2220 = _948 + _2214;
    float _2222 = -_2072;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2170);
    float _2226 = fma(_2212, _2212, _2218);
    float _2228 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2162);
    float _2230 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2180);
    float _2232 = sqrt(_2226);
    float _2234 = (*spvDescriptorSet0.vp_c10)._m0[8].w + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2236 = -_2100;
    float _2238 = _2220 + _2236;
    float _2240 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2216);
    float _2242 = (*spvDescriptorSet0.vp_c10)._m0[10].w + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2244 = -_2234;
    float _2246 = _2200 + _2244;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2116);
    float _2252 = -_2242;
    float _2254 = _2198 + _2252;
    float _2256 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    float _2258 = fma(_2246, _2246, _2248);
    float _2260 = fma(_2204, _2204, 1.0);
    float _2262 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2132);
    float _2264 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2134);
    float _2266 = fma(_2254, _2254, _2258);
    float _2268 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2196);
    bool _2270 = _2232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = rsqrt(_2260);
    float _2274 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2276 = _2204 * _2228;
    float _2278 = _2204 * _2230;
    float _2280 = _2204 * _2256;
    float _2282 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2194);
    float _2284 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2240);
    float _2286 = fma(_2274, _2250, _2276);
    float _2288 = rsqrt(_2266);
    float _2290 = fma(_2274, _2262, _2278);
    float _2292 = fma(_2274, _2264, _2280);
    bool _2294 = !_2270;
    float _2296 = _2220;
    float _2298 = _2200;
    float _2300 = _2198;
    if (!_2294)
    {
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2306 = _2232 + _2304;
        float _2308 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2310 = rsqrt(_2226);
        float _2312 = _2306 * _2302;
        float _2314 = _2312 * 0.15915493667125701904296875;
        float _2316 = _2314 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = _2314 * 6.283185482025146484375;
        float _2322 = sin(_2320);
        float _2324 = _2318 + (-1.0);
        float _2326 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2328 = fma(_2322, _2308, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2330 = fma(_2220, _2318, _2326);
        float _2332 = _2310 * _2328;
        float _2334 = fma(_2212, _2332, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2336 = fma(_2208, _2332, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2296 = _2330;
        _2298 = _2334;
        _2300 = _2336;
    }
    float _2338 = _2296;
    float _2340 = _2298;
    float _2342 = _2300;
    float _2344 = -_948;
    float _2346 = _2344 + _2338;
    float _2348 = -_1248;
    float _2350 = _2348 + _2340;
    float _2352 = _2204 * _2272;
    float _2354 = -_1254;
    float _2356 = _2354 + _2342;
    float _2358 = _2346 * _2346;
    float _2360 = _2282 + _2286;
    float _2362 = _2268 + _2290;
    float _2364 = -_2282;
    float _2366 = _2352 * _2364;
    float _2368 = fma(_2350, _2350, _2358);
    float _2370 = -_2268;
    float _2372 = _2352 * _2370;
    float _2374 = -_2284;
    float _2376 = _2352 * _2374;
    float _2378 = _2284 + _2292;
    float _2380 = fma(_2356, _2356, _2368);
    float _2382 = _2246 * _2288;
    float _2384 = _2238 * _2288;
    float _2386 = _2254 * _2288;
    float _2388 = fma(_2272, _2228, _2366);
    float _2390 = sqrt(_2380);
    float _2392 = -_2382;
    float _2394 = _2360 + _2392;
    float _2396 = -_2384;
    float _2398 = _2362 + _2396;
    float _2400 = -_2386;
    float _2402 = _2378 + _2400;
    float _2404 = fma(_2272, _2230, _2372);
    float _2406 = fma(_2272, _2256, _2376);
    float _2408 = fma(_2394, 0.5, _2382);
    float _2410 = fma(_2398, 0.5, _2384);
    float _2412 = fma(_2402, 0.5, _2386);
    out.m_60.x = _659;
    out.m_60.y = _661;
    out.m_60.z = _663;
    out.m_60.w = _665;
    out.m_66.x = _1954;
    out.m_66.y = _1956;
    out.m_66.z = _1958;
    out.m_66.w = _1746;
    bool _2414 = _2390 > 0.0;
    out.m_70.x = _2250;
    out.m_70.y = _2262;
    out.m_70.z = _2264;
    out.m_72.x = _2388;
    out.m_72.y = _2404;
    out.m_72.z = _2406;
    out.m_74.x = _2408;
    out.m_74.y = _2410;
    out.m_74.z = _2412;
    bool _2416 = !_2414;
    float _2418 = _2338;
    float _2420 = _2342;
    float _2422 = _2340;
    if (!_2416)
    {
        bool _2424 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2426 = _665;
        if (_2424)
        {
            float _2428 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2426 = _2428;
        }
        float _2430 = _2426;
        float _2432 = _2430;
        if (_2424)
        {
            float _2434 = _453 * _2430;
            _669 = _2434;
        }
        float _2436 = _669;
        float _2438 = _2436;
        if (_2424)
        {
            float _2440 = _455 * _2430;
            _671 = _2440;
        }
        float _2442 = _671;
        float _2444 = _2442;
        if (_2424)
        {
            float _2446 = _457 * _2430;
            _2432 = _2446;
        }
        float _2448 = _2432;
        float _2450 = _2448;
        if (!_2424)
        {
            float _2452 = _129 + 1.0;
            if (!_175)
            {
                float _2454 = _2452 * _2452;
                float _2456 = _2454 * 0.5;
                _153 = _2456;
            }
            float _2458 = _153;
            float _2460 = _2458;
            if (!_175)
            {
                float _2462 = _2458 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2460 = _2462;
            }
            float _2464 = _2460;
            bool _2466 = !_175;
            float _2468 = _2464;
            if (!_2466)
            {
                float _2470 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2472 = log2(_2470);
                float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2476 = _2474 + 1.0;
                float _2478 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2480 = _2472 * _2452;
                float _2482 = 1.0 / _2476;
                float _2484 = _2478 * 0.693147182464599609375;
                float _2486 = exp2(_2480);
                float _2488 = 1.0 / _2484;
                float _2490 = _2486 + (-1.0);
                float _2492 = -_2490;
                float _2494 = fma(_2492, _2488, _2452);
                float _2496 = _2494 * _2482;
                float _2498 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2468 = _2498;
            }
            float _2500 = _2468;
            float _2502 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2504 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2506 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2508 = _2500;
            if (!_175)
            {
                _2508 = _2452;
            }
            float _2510 = _2508;
            float _2512 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2514 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2516 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2518 = fma(_2504, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2512);
            float _2520 = fma(_2504, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2514);
            float _2522 = fma(_2506, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2518);
            bool _2524 = !_175;
            float _2526 = _2510;
            _1966 = _2520;
            _1968 = _2522;
            if (!_2524)
            {
                float _2528 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2530 = log2(_2528);
                float _2532 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2534 = _2532 + 1.0;
                float _2536 = 1.0 / _2534;
                float _2538 = _2530 * _2452;
                float _2540 = exp2(_2538);
                float _2542 = -_2540;
                float _2544 = _2542 + 1.0;
                float _2546 = _2544 * _2536;
                _2526 = _2546;
            }
            float _2548 = _2526;
            float _2550 = fma(_2504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2516);
            float _2552 = fma(_2506, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2520);
            float _2554 = fma(_2548, _179, _2522);
            float _2556 = fma(_2506, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2550);
            float _2558 = fma(_2548, _177, _2552);
            float _2560 = -_415;
            float _2562 = _2560 + _2554;
            float _2564 = fma(_2548, _181, _2556);
            float _2566 = -_417;
            float _2568 = _2566 + _2558;
            float _2570 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2572 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2574 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2576 = -_427;
            float _2578 = _2576 + _2564;
            float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2570);
            float _2582 = fma(_2568, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2572);
            float _2584 = fma(_2568, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2574);
            float _2586 = fma(_2578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2580);
            float _2588 = fma(_2578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2582);
            float _2590 = fma(_2578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2584);
            _461 = _2588;
            _463 = _2586;
            _465 = _2590;
            _2438 = _2586;
            _2444 = _2588;
            _2450 = _2590;
        }
        float _2592 = _461;
        float _2594 = _463;
        float _2596 = _465;
        float _2598 = _2438;
        float _2600 = _2444;
        float _2602 = _2450;
        float _2604 = _1966;
        float _2606 = _1968;
        float _2608 = _2592 * _2592;
        float _2610 = rsqrt(_2380);
        float _2612 = fma(_2594, _2594, _2608);
        float _2614 = fma(_2596, _2596, _2612);
        float _2616 = sqrt(_2614);
        float _2618 = _2350 * _2610;
        float _2620 = _2346 * _2610;
        float _2622 = _2356 * _2610;
        bool _2624 = _2616 > 0.0;
        bool _2626 = !_2624;
        _1970 = _2604;
        _1972 = _2606;
        if (!_2626)
        {
            float _2628 = rsqrt(_2614);
            float _2630 = _2628 * _2592;
            float _2632 = _2628 * _2594;
            float _2634 = _2628 * _2596;
            float _2636 = _2620 * _2630;
            float _2638 = fma(_2618, _2632, _2636);
            float _2640 = fma(_2622, _2634, _2638);
            float _2642 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2644 = fma(_2598, _2642, _2340);
            float _2646 = fma(_2600, _2642, _2338);
            float _2648 = fma(_2602, _2642, _2342);
            _2418 = _2646;
            _2420 = _2648;
            _2422 = _2644;
        }
    }
    float _2650 = _2418;
    float _2652 = _2420;
    float _2654 = _2422;
    float _2656 = _1970;
    float _2658 = _1972;
    float _2660 = -_1744;
    float _2662 = _2660 + _2650;
    float _2664 = -_1762;
    float _2666 = _2664 + _2652;
    bool _2668 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2672 = _2668 || _2670;
    bool _2674 = isnan(0.5);
    bool _2676 = _2672 || _2674;
    float _2678 = -_1756;
    float _2680 = _2678 + _2654;
    float _2682 = _2662;
    float _2684 = _2680;
    float _2686 = _2666;
    float _2688 = _2658;
    if (!_2676)
    {
        float _2690 = _1988 * _1988;
        float _2692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2694 = -_948;
        float _2696 = _2694 + _2650;
        float _2698 = -_1254;
        float _2700 = _2698 + _2652;
        float _2702 = fma(_1996, _1996, _2690);
        float _2704 = fma(_2004, _2004, _2702);
        float _2706 = 1.0 / _1906;
        float _2708 = sqrt(_2704);
        float _2710 = precise::min(_2708, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2712 = _2710 * _2692;
        float _2714 = -_1248;
        float _2716 = _2714 + _2654;
        float _2718 = _2712 * _2706;
        float _2720 = fma(_2716, _2718, _1982);
        float _2722 = fma(_2696, _2718, _1976);
        float _2724 = fma(_2700, _2718, _1992);
        _2682 = _2722;
        _2684 = _2720;
        _2686 = _2724;
        _1298 = _2700;
    }
    float _2726 = _2682;
    float _2728 = _2684;
    float _2730 = _2686;
    float _2732 = _1298;
    float _2734 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2736 = _2726 + _2734;
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2740 = _2728 + _2738;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2744 = _2730 + _2742;
    float _2746 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2748 = _2736 * _2736;
    float _2750 = fma(_2740, _2740, _2748);
    float _2752 = fma(_2744, _2744, _2750);
    float _2754 = rsqrt(_2752);
    float _2756 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2758 = _2740 * _2756;
    float _2760 = _2744 * _2756;
    float _2762 = _2758 * _2758;
    float _2764 = _2760 * _2760;
    float _2766 = _2762 + _2764;
    float _2768 = sqrt(_2766);
    bool _2770 = _2768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2774 = _2768 + _2772;
    float _2776 = _2656;
    float _2778 = _2766;
    float _2780 = _2774;
    float _2782 = _2736;
    float _2784 = _2732;
    float _2786 = _2758;
    if (_2770)
    {
        float _2788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2776 = _2788;
    }
    float _2790 = _2776;
    if (_2770)
    {
        float _2792 = rsqrt(_2766);
        _2778 = _2792;
    }
    float _2794 = _2778;
    float _2796 = _2794;
    if (_2770)
    {
        float _2798 = _2774 * _2790;
        _2780 = _2798;
    }
    float _2800 = _2780;
    if (_2770)
    {
        float _2802 = _2800 * 0.15915493667125701904296875;
        _2688 = _2802;
    }
    float _2804 = _2688;
    float _2806 = _2744;
    if (_2770)
    {
        float _2808 = _2804 * 6.283185482025146484375;
        float _2810 = sin(_2808);
        _2806 = _2810;
    }
    float _2812 = _2806;
    float _2814 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2816 = precise::max(0.0, _2814);
    float _2818 = _2790;
    if (_2770)
    {
        float _2820 = _2804 * 6.283185482025146484375;
        float _2822 = cos(_2820);
        _2818 = _2822;
    }
    float _2824 = _2818;
    float _2826 = -_2756;
    float _2828 = -_2816;
    float _2830 = fma(_2736, _2826, _2828);
    if (_2770)
    {
        float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2832;
    }
    float _2834 = _2782;
    float _2836 = sqrt(_2752);
    float _2838 = _2812;
    float _2840 = _2834;
    if (_2770)
    {
        float _2842 = fma(_2812, _2834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2838 = _2842;
    }
    float _2844 = _2838;
    float _2846 = _2844;
    float _2848 = _2824;
    if (_2770)
    {
        float _2850 = _2824 + (-1.0);
        _2840 = _2850;
    }
    float _2852 = _2840;
    float _2854 = _2852;
    if (_2770)
    {
        float _2856 = _2794 * _2844;
        _2784 = _2856;
    }
    float _2858 = _2784;
    if (!_2770)
    {
        _2846 = _2830;
    }
    float _2860 = _2846;
    float _2862 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2864 = _2860;
    if (_2770)
    {
        float _2866 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1752 = _2866;
    }
    float _2868 = _1752;
    if (_2770)
    {
        float _2870 = _2758 * _2858;
        _2786 = _2870;
    }
    float _2872 = _2786;
    if (!_2770)
    {
        _2854 = _2760;
    }
    float _2874 = _2854;
    float _2876 = _2874;
    if (_2770)
    {
        float _2878 = _2760 * _2858;
        _2876 = _2878;
    }
    float _2880 = _2876;
    if (!_2770)
    {
        _2796 = _2762;
    }
    float _2882 = _2796;
    float _2884 = _2882;
    if (_2770)
    {
        float _2886 = fma(_2830, _2824, _2868);
        _2864 = _2886;
    }
    float _2888 = _2864;
    if (_2770)
    {
        float _2890 = _2872 * _2872;
        _2884 = _2890;
    }
    float _2892 = _2884;
    if (!_2770)
    {
        _2848 = _2764;
    }
    float _2894 = _2848;
    float _2896 = _2894;
    if (_2770)
    {
        float _2898 = _2880 * _2880;
        _2896 = _2898;
    }
    float _2900 = _2896;
    float _2902 = fma(_2888, _2888, _2892);
    float _2904 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2862);
    float _2906 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2908 = _2902 + _2900;
    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2912 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2910);
    float _2914 = precise::clamp(_2912, 0.0, 1.0);
    float _2916 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2918 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2904);
    float _2920 = rsqrt(_2908);
    float _2922 = -_2914;
    float _2924 = _2922 + 1.0;
    float _2926 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2928 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2916);
    float _2930 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2932 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2906);
    float _2934 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2926);
    float _2936 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2928);
    float _2938 = abs(_2924);
    float _2940 = log2(_2938);
    float _2942 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2944 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2934);
    float _2946 = _2936 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2948 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2932);
    float _2950 = -_2942;
    float _2952 = fma(_2950, _2746, 1.0);
    float _2954 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2956 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2958 = _2920 * _2872;
    float _2960 = _2920 * _2888;
    float _2962 = _2920 * _2880;
    float _2964 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2956);
    float _2966 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2968 = _2948 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = log2(_2952);
    float _2972 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2964);
    float _2974 = -_2966;
    float _2976 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2974);
    float _2978 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2980 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2982 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2972);
    float _2984 = -_2962;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2976);
    float _2988 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2990 = exp2(_2978);
    float _2992 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2980);
    float _2994 = fma(_2986, -0.5, 0.5);
    float _2996 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2988);
    float _2998 = fma(_2986, 0.5, 0.5);
    float _3000 = _2960 + 1.0;
    float _3002 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2992);
    float _3004 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2996);
    float _3006 = 1.0 / _2982;
    float _3008 = fma(_2998, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3010 = _2970 * 0.693147182464599609375;
    float _3012 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3004);
    float _3014 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3016 = sqrt(_2994);
    float _3018 = -_2960;
    float _3020 = fma(_2990, _3000, _3018);
    float _3022 = fma(_2998, _3008, -0.212114393711090087890625);
    float _3024 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3002);
    float _3026 = fma(_3020, 0.5, 0.5);
    float _3028 = fma(_2998, _3022, 1.570728778839111328125);
    float _3030 = _3012 * _3006;
    float _3032 = _3024 * _3006;
    float _3034 = fma(_3030, 0.5, 0.5);
    float _3036 = fma(_3032, -0.5, 0.5);
    float _3038 = _3016 * 0.636619746685028076171875;
    float3 _8120 = float3(_3034, _3036, _3014);
    float _3040 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8120, float3(0.0), isnan(_8120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8120, float3(0.0), isnan(_8120)), level(0.0)).x;
    float3 _8131 = float3(_3034, _3036, _3014);
    float4 _3043 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8131, float3(0.0), isnan(_8131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8131, float3(0.0), isnan(_8131)), level(0.0)).xyzw;
    float _3045 = _3043.x;
    float _3047 = _3043.y;
    float _3049 = _3043.z;
    float _3051 = _3043.w;
    float _3053 = -_3028;
    float _3055 = fma(_3038, _3053, 1.0);
    float2 _8153 = float2(_3055, _3026);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8153, float2(0.0), isnan(_8153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8153, float2(0.0), isnan(_8153)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3069 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_76.x = _2728;
    out.m_76.y = _2726;
    out.m_76.z = _2730;
    bool _3071 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3073 = isnan(_2836);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3079 = _3075 || _3077;
    float _3081 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3067);
    float _3083 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3085 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3069);
    float _3087 = _3012 + _2982;
    float _3089 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3081);
    float _3091 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3083);
    float _3093 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3085);
    float _3095 = _3089 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3097 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3091);
    float _3099 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3093);
    float _3101 = 1.0 / _3095;
    bool _3103 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3105 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3107 = _3103 || _3105;
    bool _3109 = isnan(0.5);
    bool _3111 = _3107 || _3109;
    float _3113 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3115 = _3097 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3117 = _3087 * 0.5;
    out.gl_Position.x = _3012;
    out.gl_Position.y = _3024;
    out.gl_Position.z = _3099;
    out.gl_Position.w = _2982;
    float _3119 = _3115 + _3095;
    float _3121 = exp2(_3113);
    float _3123 = _2940;
    float _3125 = _3095;
    float _3127 = _3085;
    float _3129 = _2982;
    float _3131 = _3099;
    float _3133 = _3012;
    if (!_3111)
    {
        _3123 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3135 = _3123;
    float _3137 = _3119 * _3101;
    float _3139 = _3137 * 0.5;
    float _3141 = _3099 + _2982;
    if (!_3111)
    {
        _3125 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3143 = _3125;
    if (!_3111)
    {
        float _3145 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3147 = fma(_3139, _3135, _3145);
        _3127 = _3147;
    }
    float _3149 = _3127;
    float _3151 = _2982 * 0.5;
    float _3153 = _3141 * 0.5;
    if (_3111)
    {
        _3129 = 1.0;
    }
    float _3155 = _3129;
    float _3157 = -_3121;
    float _3159 = _3157 + 1.0;
    float _3161 = fma(_3024, -0.5, _3151);
    float _3163 = _3149;
    float _3165 = _3155;
    if (!_3111)
    {
        float _3167 = 1.0 / _3149;
        _3163 = _3167;
    }
    float _3169 = _3163;
    if (!_3079)
    {
        _3131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3171 = _3131;
    float _3173 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3175 = _3171;
    float _3177 = _3171;
    if (!_3079)
    {
        _3133 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3179 = _3133;
    out.m_78.x = _3117;
    out.m_78.y = _3161;
    out.m_78.z = _3153;
    out.m_78.w = _2982;
    float _3181 = -_3173;
    float _3183 = _3181 + 1.0;
    float _3185 = _3173 * _3040;
    float _3187 = _3051 * _3185;
    float _3189 = _3051 * _3183;
    float _3191 = _3065 * _3185;
    float _3193 = fma(_3061, _3187, _3045);
    float _3195 = fma(_3063, _3187, _3047);
    float _3197 = _3061;
    float _3199 = _3045;
    float _3201 = _3179;
    float _3203 = _3179;
    if (!_3111)
    {
        float _3205 = -_3143;
        float _3207 = _3205 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3197 = _3207;
    }
    float _3209 = _3197;
    float _3211 = fma(_3051, _3191, _3049);
    if (!_3111)
    {
        float _3213 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3215 = -_3143;
        float _3217 = fma(_3169, _3213, _3215);
        _3199 = _3217;
    }
    float _3219 = _3199;
    float _3221 = _3024;
    if (!_3111)
    {
        float _3223 = 1.0 / _3209;
        _3221 = _3223;
    }
    float _3225 = _3221;
    out.m_80.x = _3193;
    out.m_80.y = _3195;
    out.m_80.z = _3211;
    out.m_80.w = _3189;
    float _3227 = _3225;
    if (!_3111)
    {
        float _3229 = _3219 * _3225;
        float _3231 = precise::clamp(_3229, 0.0, 1.0);
        _3165 = _3231;
    }
    float _3233 = _3165;
    if (!_3079)
    {
        _3227 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3235 = _3227;
    float _3237 = _3233 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3239 = !_3079;
    float _3241 = _3235;
    float _3243 = _3235;
    if (!_3239)
    {
        bool _3245 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3247 = isnan(_2836);
        bool _3249 = _3245 || _3247;
        bool _3251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3253 = _3249 || _3251;
        if (!_3253)
        {
            float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3257 = _2836 + _3255;
            float _3259 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3261 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3259;
            float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3271 = 1.0 / _3261;
            float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3277 = _3257 * _3271;
            float _3279 = precise::clamp(_3277, 0.0, 1.0);
            float _3281 = fma(_3279, _3265, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3283 = fma(_3279, _3269, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3285 = fma(_3279, _3275, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3243 = _3283;
            _3177 = _3281;
            _3203 = _3285;
            _3287 = true;
        }
        else
        {
            bool _3289 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3291 = isnan(_2836);
            bool _3293 = _3289 || _3291;
            bool _3295 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3297 = _3293 || _3295;
            if (!_3297)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3299 = _3175;
            _3177 = _3299;
            if (!_3297)
            {
                _3241 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3301 = _3241;
            _3243 = _3301;
            if (!_3297)
            {
                _3201 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3303 = _3201;
            bool _3305 = !_3297;
            _3203 = _3303;
            if (!_3305)
            {
                bool _3307 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3309 = isnan(_2836);
                bool _3311 = _3307 || _3309;
                bool _3313 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3315 = _3311 || _3313;
                if (!_3315)
                {
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3319 = _2836 + _3317;
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3323 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3321;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3333 = 1.0 / _3323;
                    float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3339 = _3319 * _3333;
                    float _3341 = precise::clamp(_3339, 0.0, 1.0);
                    float _3343 = fma(_3341, _3327, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3345 = fma(_3341, _3331, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3347 = fma(_3341, _3337, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3243 = _3345;
                    _3177 = _3343;
                    _3203 = _3347;
                    _3287 = true;
                }
                else
                {
                    _3243 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3203 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3287 = false;
    float _3349 = _3243;
    float _3351 = _3177;
    float _3353 = _3203;
    float _3355 = _3237 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_82.x = 0.0;
    float _3357 = _3349 * 0.586610972881317138671875;
    bool _3359 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3355;
    float _3361 = fma(_3351, 0.298911988735198974609375, _3357);
    bool _3363 = _3233 > 0.0;
    bool _3365 = isnan(_3233);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = fma(_3353, 0.114477999508380889892578125, _3361);
    float _3375 = -_3373;
    float _3377 = _3375 + _3351;
    float _3379 = -_3373;
    float _3381 = _3379 + _3349;
    float _3383 = -_3373;
    float _3385 = _3383 + _3353;
    float _3387 = fma(_3377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3373);
    float _3389 = fma(_3381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3373);
    float _3391 = fma(_3385, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3373);
    bool _3393 = !_3359;
    if (!_3393)
    {
        float _3395 = -_2726;
        float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3399 = -_2728;
        float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3403 = -_2730;
        float _3405 = _3403 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3407 = _3397 * _3397;
        float _3409 = fma(_3401, _3401, _3407);
        float _3411 = fma(_3405, _3405, _3409);
        float _3413 = sqrt(_3411);
        float _3415 = rsqrt(_3411);
        float _3417 = -_3413;
        float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3421 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3423 = precise::clamp(_3421, 0.0, 1.0);
        float _3425 = _3401 * _3415;
        float _3427 = _3397 * _3415;
        float _3429 = abs(_3423);
        float _3431 = log2(_3429);
        float _3433 = _3405 * _3415;
        float _3435 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3437 = _2410 * _3427;
        float _3439 = -_3427;
        float _3441 = -_3435;
        float _3443 = fma(_3439, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3441);
        float _3445 = fma(_2408, _3425, _3437);
        float _3447 = -_3433;
        float _3449 = fma(_3447, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3443);
        float _3451 = fma(_2412, _3433, _3445);
        float _3453 = precise::clamp(_3451, 0.0, 1.0);
        float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3457 = _3449 + _3455;
        float _3459 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3461 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3463 = precise::clamp(_3461, 0.0, 1.0);
        float _3465 = exp2(_3459);
        float _3467 = _3465 * _3463;
        float _3469 = _3453 * _3467;
        float _3471 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3473 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3475 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3471;
        out.m_82.y = _3473;
        out.m_82.z = _3475;
    }
    out.m_84.x = _3387;
    out.m_84.y = _3389;
    out.m_84.z = _3391;
    if (_3371)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3477 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3477;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3287 = false;
    bool _589 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3533 = as_type<float>(_117);
        out.gl_Position.z = _3533;
    }
    if (!_107)
    {
        return out;
    }
    float _121 = in.m_49.w;
    float _123 = float(_103);
    float _125 = 1.0 / _123;
    float _127 = -_121;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_121);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = _129 * _125;
    bool _143 = _129 >= _123;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    out.m_51.x = _141;
    float _149 = _121;
    float _151 = _141;
    float _153 = _129;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _149;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _157 = _155 * 5.0;
        _119 = as_type<int>(_157);
    }
    int _159 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3606 = as_type<float>(_159);
        out.gl_Position.z = _3606;
    }
    if (_147)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = in.m_56.w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_49.x;
    float _179 = in.m_49.y;
    float _181 = in.m_49.z;
    float _183 = in.m_44.x;
    float _185 = in.m_44.y;
    float _187 = in.m_44.z;
    int _189 = as_type<int>(_161) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_161) & 2;
    bool _195 = _193 != 0;
    float _197 = _161;
    float _199 = _163;
    if (!_175)
    {
        float _201 = _163 * _163;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _205;
    if (!_175)
    {
        float _213 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_195;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_175;
    float _223 = _215;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _163 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _163);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _259 = !_175;
    float _261 = _257;
    float _263 = _255;
    if (!_259)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _163 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _199 = _283;
    }
    float _285 = _199;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _257 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _291 = _257 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _293 = _257 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_175)
    {
        float _295 = _129 * _129;
        float _297 = _295 * 0.5;
        _261 = _297;
    }
    float _299 = _261;
    float _301 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _289);
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].y, _291);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].z, _293);
    float _307 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_175)
    {
        float _309 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _309;
    }
    float _311 = _263;
    bool _313 = !_175;
    float _315 = _311;
    if (!_313)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = _129 * _319;
        float _329 = exp2(_327);
        float _331 = _325 * 0.693147182464599609375;
        float _333 = 1.0 / _331;
        float _335 = 1.0 / _323;
        float _337 = _329 + (-1.0);
        float _339 = -_337;
        float _341 = fma(_339, _333, _129);
        float _343 = _341 * _335;
        float _345 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _345;
    }
    float _347 = _315;
    float _349 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _351 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[10].x, _301);
    float _353 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[10].y, _303);
    float _355 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _349 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _359 = _349 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _361 = _349 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _363 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[10].z, _305);
    float _365 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[8].x, _357);
    float _367 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[8].y, _359);
    float _369 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[8].z, _361);
    float _371 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = fma(_285, _177, _351);
    float _375 = fma(_285, _179, _353);
    float _377 = fma(_285, _181, _363);
    float _379 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[10].x, _365);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[10].y, _367);
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[10].z, _369);
    float _385 = _371;
    if (!_175)
    {
        _385 = _129;
    }
    float _387 = _385;
    bool _389 = !_175;
    float _391 = _387;
    if (!_389)
    {
        float _393 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _395 = log2(_393);
        float _397 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _399 = _397 + 1.0;
        float _401 = 1.0 / _399;
        float _403 = _129 * _395;
        float _405 = exp2(_403);
        float _407 = -_405;
        float _409 = _407 + 1.0;
        float _411 = _409 * _401;
        _391 = _411;
    }
    float _413 = _391;
    float _415 = fma(_413, _179, _381);
    float _417 = fma(_413, _177, _379);
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _421 = fma(_375, _165, _185);
    float _423 = -_415;
    float _425 = _375 + _423;
    float _427 = fma(_413, _181, _383);
    float _429 = fma(_373, _165, _183);
    float _431 = -_417;
    float _433 = _373 + _431;
    float _435 = _425 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _425 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _439 = _425 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _441 = -_427;
    float _443 = _377 + _441;
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _447 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
    float _451 = fma(_377, _165, _187);
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _455 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    bool _459 = !_419;
    float _461 = _455;
    float _463 = _453;
    float _465 = _457;
    float _483;
    if (!_459)
    {
        float _467 = in.m_58.x;
        float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _471 = _467 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _475 = _473 * _469;
        float _477 = floor(_475);
        float _479 = -_477;
        float _481 = _475 + _479;
        _483 = _481;
        _485 = true;
    }
    else
    {
        _483 = _141;
    }
    _485 = false;
    float _487 = _483;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = _487 + _489;
    float _493 = in.m_56.x;
    float _495 = in.m_56.y;
    bool _497 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_487);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    bool _513 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _515 = isnan(_487);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _529;
    float _533 = 1.0 / _511;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _537 = _523 * _527;
    float _539 = -_523;
    float _541 = _539 + 1.0;
    float _543 = _491 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _545;
    float _549 = fma(_531, _543, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _551 = fma(_547, _543, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _553 = _549 * _537;
    float _555 = _551 * _537;
    float _557 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].x, _553);
    float _559 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].y, _555);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].x, _557);
    float _563 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].y, _559);
    float _565 = _561 * _493;
    float _567 = _563 * _495;
    bool _569 = !_535;
    float _587;
    if (!_569)
    {
        float _571 = in.m_58.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        _587 = _141;
    }
    _589 = false;
    float _591 = _587;
    bool _593 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _595 = isnan(_591);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _611 = isnan(_591);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _591 + _625;
    float _629 = -_603;
    float _631 = _629 + 1.0;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _635 = 1.0 / _607;
    float _637 = _619 * _631;
    float _639 = -_619;
    float _641 = _639 + 1.0;
    float _643 = _623 * _635;
    float _645 = fma(_643, _627, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _647 = _645 * _637;
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[115].x, _647);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[116].x, _649);
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_60.x = _659;
    out.m_60.y = _661;
    out.m_60.z = _663;
    out.m_60.w = _665;
    bool _667 = !_633;
    float _669 = _661;
    float _671 = _659;
    if (!_667)
    {
        float _673 = in.m_58.x;
        float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _677 = _673 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _681 = _679 * _675;
        float _683 = floor(_681);
        float _685 = -_683;
        float _687 = _681 + _685;
        _151 = _687;
    }
    float _689 = _151;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _693 = int(_691);
    float _695 = _421 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _697 = _421 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _699 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _701 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _695);
    float _703 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _705 = int(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _715 = float(_693);
    float _717 = 1.0 / _709;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _723 = float(uint(_705));
    float _725 = 1.0 / _715;
    int _727 = ~_705;
    int _729 = _727 + 1;
    int _731 = ~_705;
    int _733 = _731 + 1;
    float _735 = float(_705);
    float _737 = 1.0 / _723;
    float _739 = _129 * _725;
    float _741 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _743 = log2(_741);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _747 = _745 != 0;
    int _749 = as_type<int>(_737) + (-2);
    float _751 = trunc(_739);
    int _753 = int(_751);
    bool _755 = !_747;
    float _757 = _755 ? 7.345489978790283203125 : 1.0;
    float _759 = float(uint(_753));
    float _761 = as_type<float>(_749) * _759;
    float _763 = in.m_58.x;
    float _765 = in.m_58.y;
    float _767 = in.m_58.z;
    float _769 = in.m_58.w;
    float _771 = trunc(_761);
    float _773 = precise::max(_771, 0.0);
    uint _776 = uint(_773);
    int _778 = _729 * int(_776);
    int _780 = _778 + _753;
    float _782 = _757 * _763;
    float _784 = float(uint(_780));
    float _786 = _765 * 2.0;
    float _788 = as_type<float>(_749) * _784;
    float _790 = float(_753);
    float _792 = floor(_786);
    float _794 = trunc(_788);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    int _800 = int(_776) + int(_798);
    bool _802 = _790 >= _735;
    bool _804 = isnan(_790);
    bool _806 = _802 || _804;
    bool _808 = isnan(_735);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = floor(_782);
    int _816 = _733 * _800;
    int _818 = _816 + _753;
    bool _820 = uint(_818) >= uint(_705);
    float _822 = trunc(_812);
    int _824 = int(_822);
    bool _826 = !_820;
    int _828 = _826 ? 0 : (-1);
    bool _830 = _705 == 0;
    int _832 = ~_800;
    int _834 = _832 + _828;
    int _836 = _834 + 1;
    float _838 = -_814;
    float _840 = _782 + _838;
    int _842 = _705 * _836;
    int _844 = _842 + _753;
    float _846 = _840 * _735;
    int _848 = ~_824;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = trunc(_846);
    int _856 = int(_854);
    bool _858 = !_830;
    int _860 = _858 ? _844 : (-1);
    int _862 = _860 * _852;
    float _864 = _129 * _735;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _876 = _874 != 0;
    int _878 = _705 + (-1);
    float _880 = _864 * _125;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _884 = _882 != 0;
    bool _886 = !_872;
    int _888 = _886 ? 0 : 1;
    int _890 = _824 * _878;
    int _892 = _890 + _862;
    bool _894 = !_868;
    int _896 = _894 ? 0 : 1;
    float _898 = trunc(_880);
    int _900 = int(_898);
    bool _902 = !_884;
    int _904 = _902 ? 0 : 1;
    int _906 = abs(_888);
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _910 = _908 != 0;
    bool _912 = !_876;
    int _914 = _912 ? 0 : 1;
    int _916 = _892 * _906;
    int _918 = abs(_896);
    float _920 = _421 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _922 = abs(_904);
    bool _924 = !_910;
    int _926 = _924 ? 0 : 1;
    float _928 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _920);
    int _930 = abs(_914);
    int _932 = _856 * _922;
    int _934 = _932 + _753;
    float _936 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _697);
    int _938 = abs(_926);
    float _940 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _701);
    int _942 = _900 * _918;
    int _944 = _942 + _916;
    float _946 = float(uint(_934));
    float _948 = _940 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _950 = _769 > 0.5;
    int _952 = _934 * _930;
    int _954 = _952 + _944;
    int _956 = ~_705;
    int _958 = _956 + 1;
    float _960 = as_type<float>(_749) * _946;
    int _962 = _856 * _938;
    int _964 = _962 + _954;
    float _966 = _763 * 2.0;
    float _968 = trunc(_960);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    float _974 = float(uint(_964));
    float _976 = as_type<float>(_749) * _974;
    float _978 = floor(_966);
    float _980 = trunc(_976);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    int _986 = ~_705;
    int _988 = _986 + 1;
    int _990 = _958 * int(_984);
    int _992 = _990 + _964;
    float _994 = float(uint(_992));
    int _996 = ~_705;
    int _998 = _996 + 1;
    float _1000 = as_type<float>(_749) * _994;
    int _1002 = _998 * int(_972);
    int _1004 = _1002 + _934;
    float _1006 = trunc(_1000);
    float _1008 = precise::max(_1006, 0.0);
    uint _1010 = uint(_1008);
    float _1012 = float(uint(_1004));
    float _1014 = as_type<float>(_749) * _1012;
    float _1016 = -_219;
    int _1018 = _950 ? as_type<int>(_1016) : as_type<int>(_219);
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1022 = _1020 != 0;
    float _1024 = trunc(_1014);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    int _1030 = int(_984) + int(_1010);
    int _1032 = ~_705;
    int _1034 = _1032 + 1;
    int _1036 = _988 * _1030;
    int _1038 = _1036 + _964;
    bool _1040 = uint(_1038) >= uint(_705);
    int _1042 = int(_972) + int(_1028);
    bool _1044 = !_1040;
    int _1046 = _1044 ? 0 : (-1);
    int _1048 = _1034 * _1042;
    int _1050 = _1048 + _934;
    int _1052 = ~_1030;
    int _1054 = _1052 + _1046;
    int _1056 = _1054 + 1;
    bool _1058 = !_1022;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = _705 * _1056;
    int _1064 = _1062 + _964;
    bool _1066 = !_830;
    int _1068 = _1066 ? _1064 : (-1);
    int _1070 = _1068 & 3;
    bool _1072 = _1070 != 0;
    int _1074 = _1068 & 3;
    bool _1076 = _1074 != 0;
    bool _1078 = uint(_1070) > 1u;
    int _1080 = _1076 ? 0 : 1;
    bool _1082 = _1070 != 3;
    int _1084 = ~_1080;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    bool _1090 = uint(_1070) >= 2u;
    int _1092 = _1088;
    float _1094 = as_type<float>(_1070);
    float _1096 = as_type<float>(_705);
    float _1098 = as_type<float>(_934);
    if (!_1078)
    {
        int _1100 = ~_1080;
        int _1102 = _1100 + 1;
        _1092 = _1102;
    }
    int _1104 = _1092;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1108 = _1106 != 0;
    int _1110 = _1090 ? 0 : 1;
    bool _1112 = !_1108;
    float _1114 = _1112 ? _219 : as_type<float>(_1018);
    bool _1116 = _767 > 0.5;
    int _1118 = ~_1110;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    int _1124 = _1122;
    if (_1082)
    {
        int _1126 = ~_1110;
        int _1128 = _1126 + 1;
        _1124 = _1128;
    }
    int _1130 = _1124;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1134 = _1132 != 0;
    float _1136 = -_209;
    int _1138 = _1116 ? as_type<int>(_1136) : as_type<int>(_209);
    int _1140 = _1068 >> 31;
    bool _1142 = !_1134;
    float _1144 = _1142 ? _209 : as_type<float>(_1138);
    int _1146 = _1140 & 3;
    bool _1148 = _978 >= 0.0;
    bool _1150 = isnan(_978);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    int _1158 = _1068 + _1146;
    int _1160 = _1156 ? 0 : 1;
    int _1162 = _1158 >> 2;
    bool _1164 = _978 > 0.0;
    int _1166 = _1162 << 4;
    int _1168 = _1166 + 368;
    float _1170 = _763 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    uint _1172 = uint(int(uint(_1168) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    bool _1188 = uint(_1050) >= uint(_705);
    float _1190 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1194 = -_711;
    float _1196 = fma(_1170, 2.0, _1194);
    float _1198 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _936);
    int _1200 = ~_1160;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = fma(_1190, -2.0, _1192);
    float _1208 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _928);
    int _1210 = _1204;
    if (!_1164)
    {
        int _1212 = ~_1160;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    int _1218 = _1168 + 8;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
    int _1224 = int(_1220) & 3;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[int(_1222)][_1224];
    int _1228 = int(_1220) + 1;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    int _1232 = _1228 & 3;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[int(_1230)][_1232];
    float _1236 = _765 + _763;
    bool _1238 = _792 >= 0.0;
    bool _1240 = isnan(_792);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(0.0);
    bool _1246 = _1242 || _1244;
    float _1248 = _1208 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1250 = _1236 + (-1.0);
    int _1252 = _1246 ? 0 : 1;
    float _1254 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1256 = _792 > 0.0;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1258;
    bool _1262 = !_1188;
    int _1264 = _1262 ? 0 : (-1);
    float _1266 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1268 = abs(_1104);
    float _1270 = _1260 * _717;
    float _1272 = _767 * 2.0;
    int _1274 = ~_1042;
    int _1276 = _1274 + _1264;
    int _1278 = _1276 + 1;
    float _1280 = _129 * _743;
    int _1282 = ~_1252;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = _765 + _767;
    bool _1290 = !_1072;
    int _1292 = _1290 ? 0 : 1;
    float _1294 = floor(_1272);
    int _1296 = _1286;
    float _1298 = _1254;
    if (!_1256)
    {
        int _1300 = ~_1252;
        int _1302 = _1300 + 1;
        _1296 = _1302;
    }
    int _1304 = _1296;
    float _1306 = _1288 + (-1.0);
    int _1308 = _705 * _1278;
    int _1310 = _1308 + _934;
    float _1312 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1206);
    int _1314 = ~_1268;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    float _1320 = exp2(_1280);
    bool _1322 = _1070 != 3;
    float _1324 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_747)
    {
        _1094 = _765;
    }
    float _1326 = _1094;
    float _1328 = _1326;
    if (!_747)
    {
        _1096 = _767;
    }
    float _1330 = _1096;
    float _1332 = _1330;
    if (!_747)
    {
        _1098 = _767;
    }
    float _1334 = _1098;
    int _1336 = abs(_1130);
    int _1338 = _1318 * as_type<int>(_1186);
    int _1340 = abs(_1292);
    float _1342 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1344 = int(_1342);
    float _1346 = _1334;
    if (_747)
    {
        _1328 = _763;
    }
    float _1348 = _1328;
    if (_747)
    {
        _1332 = _765;
    }
    float _1350 = _1332;
    float _1352 = -_1320;
    float _1354 = _1352 + 1.0;
    if (_747)
    {
        _1346 = _765;
    }
    float _1356 = _1346;
    bool _1358 = _1294 >= 0.0;
    bool _1360 = isnan(_1294);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan(0.0);
    bool _1366 = _1362 || _1364;
    int _1368 = ~_1340;
    int _1370 = _1368 + 1;
    int _1372 = _1370 + 1;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1376 = _1374 != 0;
    bool _1378 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1386 = _1382 || _1384;
    int _1388 = _1372 * as_type<int>(_1178);
    int _1390 = _1388 + _1338;
    bool _1392 = !_830;
    int _1394 = _1392 ? _1310 : (-1);
    bool _1396 = !_1322;
    int _1398 = _1396 ? 0 : (-1);
    int _1400 = _1366 ? 0 : 1;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1412 = _1410 != 0;
    int _1414 = ~_1336;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    int _1420 = abs(_1398);
    int _1422 = abs(_1060);
    int _1424 = _1418 * as_type<int>(_1226);
    int _1426 = _1424 + _1390;
    int _1428 = ~_1420;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1436 = abs(_1344);
    float _1438 = float(uint(_1344));
    int _1440 = _1432 * as_type<int>(_1234);
    int _1442 = _1440 + _1426;
    float _1444 = float(uint(_1436));
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1448 = _689 + _1446;
    bool _1450 = _1294 > 0.0;
    float _1452 = 1.0 / _1438;
    int _1454 = ~_1422;
    int _1456 = _1454 + 1;
    int _1458 = _1456 + 1;
    float _1460 = fma(_1270, _1448, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1462 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1464 = isnan(_689);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    bool _1474 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1476 = isnan(_689);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    int _1486 = _1442 * _1458;
    float _1488 = 1.0 / _1444;
    float _1490 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[83].w, _713);
    int _1492 = _1394 * _1422;
    int _1494 = _1492 + _1486;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1498 = 1.0 + _1496;
    float _1500 = _1386 ? _1354 : 0.0;
    float _1502 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1504 = abs(_1494);
    float _1506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1508 = as_type<int>(_1452) + (-2);
    float _1510 = -_1484;
    float _1512 = _1510 + 1.0;
    float _1514 = float(uint(_1504));
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1518 = float(uint(_1494));
    float _1520 = _1472 * _1512;
    float _1522 = -_1472;
    float _1524 = _1522 + 1.0;
    int _1526 = as_type<int>(_1488) + (-2);
    float _1528 = 1.0 / _1498;
    float _1530 = as_type<float>(_1508) * _1518;
    float _1532 = _1460 * _1520;
    float _1534 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[83].z, _719);
    float _1536 = as_type<float>(_1526) * _1514;
    float _1538 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1540 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1542 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1532);
    float _1544 = trunc(_1536);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    float _1550 = -_721;
    float _1552 = fma(_1538, 2.0, _1550);
    int _1554 = ~_1344;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1540, -2.0, _1516);
    int _1560 = ~_1400;
    int _1562 = _1560 + 1;
    int _1564 = _1562 + 1;
    float _1566 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1542);
    float _1568 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1570 = trunc(_1530);
    float _1572 = precise::max(_1570, 0.0);
    uint _1574 = uint(_1572);
    float _1576 = _1500 * _1528;
    float _1578 = _1114 + (-0.5);
    float _1580 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1558);
    int _1582 = _1564;
    if (!_1450)
    {
        int _1584 = ~_1400;
        int _1586 = _1584 + 1;
        _1582 = _1586;
    }
    int _1588 = _1582;
    float _1590 = -_129;
    float _1592 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1552);
    float _1594 = _1144 + 0.5;
    float _1596 = -_1568;
    float _1598 = -_1580;
    float _1600 = fma(_1596, _1578, _1598);
    float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1604 = _948 + _1602;
    int _1606 = ~_1436;
    int _1608 = _1606 + 1;
    float _1610 = fma(_1502, _1594, _1592);
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1614 = _1248 + _1612;
    bool _1616 = !_1408;
    int _1618 = _1616 ? 0 : 1;
    float _1620 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1534);
    int _1622 = _1608 * int(_1548);
    int _1624 = _1622 + _1504;
    float _1626 = _1604 * _1604;
    int _1628 = _1556 * int(_1574);
    int _1630 = _1628 + _1494;
    float _1632 = float(_1588);
    float _1634 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1490);
    float _1636 = float(uint(_1624));
    float _1638 = fma(_1614, _1614, _1626);
    float _1640 = float(uint(_1630));
    float _1642 = -_1634;
    float _1644 = _1642 + 1.0;
    int _1646 = abs(_1618);
    float _1648 = as_type<float>(_1526) * _1636;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1254 + _1650;
    float _1654 = as_type<float>(_1508) * _1640;
    bool _1656 = !_1404;
    int _1658 = _1656 ? 0 : 1;
    float _1660 = in.m_62.x;
    float _1662 = in.m_62.y;
    float _1664 = in.m_62.z;
    float _1666 = fma(_1652, _1652, _1638);
    float _1668 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1670 = abs(_1658);
    float _1672 = trunc(_1654);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = float(_1216);
    float _1680 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1668);
    float _1682 = float(_1670);
    float _1684 = fma(_1114, _1644, _1600);
    float _1686 = float(_1646);
    float _1688 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1680);
    bool _1690 = _763 > 0.5;
    float _1692 = rsqrt(_1666);
    float _1694 = _1682 * _1632;
    float _1696 = _699 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1698 = _1688 >= 0.0;
    float _1700 = _1686 * _1678;
    int _1702 = ~_1344;
    int _1704 = _1702 + 1;
    float _1706 = _1694 * (-2.0);
    int _1708 = ~_1436;
    int _1710 = _1708 + 1;
    float _1712 = trunc(_1648);
    float _1714 = precise::max(_1712, 0.0);
    uint _1716 = uint(_1714);
    int _1718 = int(_1574) + int(_1676);
    float _1720 = fma(_1266, _1706, _1266);
    float _1722 = fma(_1706, _1660, _1660);
    float _1724 = -_209;
    int _1726 = _1690 ? as_type<int>(_1724) : as_type<int>(_209);
    float _1728 = _1700 * (-2.0);
    bool _1730 = _1344 == 0;
    float _1732 = _1696 * _1692;
    int _1734 = _1704 * _1718;
    int _1736 = _1734 + _1494;
    float _1738 = fma(_1728, _1662, _1662);
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1742 = _1740 != 0;
    float _1744 = _1604 * _1732;
    float _1746 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1748 = uint(_1736) >= uint(_1344);
    float _1750 = as_type<float>(_1718);
    float _1752 = _1746;
    if (_1698)
    {
        out.m_47.x = 0.0;
    }
    int _1754 = int(_1548) + int(_1716);
    float _1756 = _1614 * _1732;
    float _1758 = -_1744;
    float _1760 = _1604 + _1758;
    float _1762 = _1652 * _1732;
    bool _1764 = !_1742;
    float _1766 = _1764 ? _209 : as_type<float>(_1726);
    int _1768 = _1710 * _1754;
    int _1770 = _1768 + _1504;
    float _1772 = -_1756;
    float _1774 = _1614 + _1772;
    float _1776 = _1760 * _1760;
    bool _1778 = !_1748;
    int _1780 = _1778 ? 0 : (-1);
    float _1782 = -_1762;
    float _1784 = _1652 + _1782;
    bool _1786 = _765 > 0.5;
    float _1788 = fma(_1774, _1774, _1776);
    int _1790 = ~_1718;
    int _1792 = _1790 + _1780;
    int _1794 = _1792 + 1;
    float _1796 = fma(_1324, _1728, _1324);
    float _1798 = -_219;
    int _1800 = _1786 ? as_type<int>(_1798) : as_type<int>(_219);
    float _1802 = fma(_1784, _1784, _1788);
    bool _1804 = uint(_1770) >= uint(_1436);
    int _1806 = _1344 * _1794;
    int _1808 = _1806 + _1494;
    float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1698)
    {
        _1750 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1812 = _1750;
    bool _1814 = !_1804;
    int _1816 = _1814 ? 0 : (-1);
    bool _1818 = _1344 == 0;
    int _1820 = as_type<int>(_1812);
    if (_1698)
    {
        float _1822 = _1812 * 5.0;
        _1820 = as_type<int>(_1822);
    }
    int _1824 = _1820;
    int _1826 = _1494 ^ _1344;
    int _1828 = ~_1816;
    int _1830 = _1754 + _1828;
    int _1832 = _1830 + 1;
    float _1834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1836 = uint(int(uint(_1826) >> uint(31)));
    if (_1698)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6111 = as_type<float>(_1824);
        out.gl_Position.z = _6111;
    }
    bool _1838 = !_1818;
    int _1840 = _1838 ? _1808 : (-1);
    float _1842 = _763 + (-0.5);
    int _1844 = ~int(_1836);
    int _1846 = _1844 + 1;
    float _1848 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1850 = float(_1840);
    float _1852 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1722);
    int _1854 = _1832 ^ _1846;
    float _1856 = sqrt(_1802);
    bool _1858 = !_1376;
    float _1860 = _1858 ? _219 : as_type<float>(_1800);
    bool _1862 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1864 = isnan(1.0);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1870 = _1866 || _1868;
    float _1872 = -_129;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1196);
    int _1876 = ~_1846;
    int _1878 = _1876 + _1854;
    int _1880 = _1878 + 1;
    float _1882 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1884 = _1766 + 0.5;
    float _1886 = fma(_1848, _1850, _1874);
    bool _1888 = !_1730;
    int _1890 = _1888 ? _1880 : (-1);
    float _1892 = fma(_1848, _1884, _1886);
    float _1894 = float(_1890);
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1898 = -_1312;
    float _1900 = fma(_1882, _1894, _1898);
    float _1902 = _1860 + (-0.5);
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1906 = _1692 * _1856;
    bool _1908 = !_1870;
    float _1910 = _1908 ? _129 : _1576;
    float _1912 = -_1882;
    float _1914 = fma(_1912, _1902, _1900);
    float _1916 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1896);
    float _1918 = -_1620;
    float _1920 = _1918 + 1.0;
    float _1922 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1904);
    float _1924 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1916);
    float _1926 = -_1920;
    float _1928 = fma(_1144, _1926, _1610);
    float _1930 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1922);
    float _1932 = -_1924;
    float _1934 = _1932 + 1.0;
    float _1936 = fma(_1910, _1720, _1852);
    float _1938 = -_1930;
    float _1940 = _1938 + 1.0;
    float _1942 = -_1934;
    float _1944 = fma(_1766, _1942, _1892);
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1952 = fma(_1860, _1940, _1914);
    float _1954 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = _699 * _1906;
    out.m_64.x = _1944;
    out.m_64.y = _1952;
    out.m_64.z = _1928;
    out.m_64.w = _1684;
    bool _1962 = !_1412;
    int _1964 = _1962 ? 0 : 1;
    out.m_66.x = _1954;
    out.m_66.y = _1956;
    out.m_66.z = _1958;
    out.m_66.w = _1746;
    out.m_68.x = _1960;
    float _1966 = _1954;
    float _1968 = _1958;
    float _1970 = _1954;
    float _1972 = _1958;
    if (_1698)
    {
        return out;
    }
    float _1974 = -_1744;
    float _1976 = _948 + _1974;
    int _1978 = abs(_1964);
    float _1980 = -_1756;
    float _1982 = _1248 + _1980;
    float _1984 = _765 + (-0.5);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1976 + _1986;
    float _1990 = -_1762;
    float _1992 = _1254 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1996 = _1982 + _1994;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2000 = float(_1304);
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2004 = _1992 + _2002;
    float _2006 = float(_1978);
    float _2008 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1998);
    float _2010 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1738);
    float _2012 = _767 + _763;
    float _2014 = _767 + (-0.5);
    float _2016 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2008);
    float _2018 = _2006 * _2000;
    float _2020 = fma(_1910, _1796, _2010);
    float _2022 = _2012 + (-1.0);
    float _2024 = _1936 * 0.15915493667125701904296875;
    bool _2026 = _2016 >= 0.0;
    float _2028 = _2018 * (-2.0);
    float _2030 = _2020 * 0.15915493667125701904296875;
    float _2032 = _2024 * 6.283185482025146484375;
    float _2034 = sin(_2032);
    float _2036 = fma(_2028, _1664, _1664);
    float _2038 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2040 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2036);
    float _2042 = fma(_2038, _2028, _2038);
    float _2044 = _2024 * 6.283185482025146484375;
    float _2046 = cos(_2044);
    float _2048 = _2014;
    if (_2026)
    {
        _2048 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2050 = _2048;
    int _2052 = as_type<int>(_2050);
    if (_2026)
    {
        out.m_47.x = 0.0;
    }
    float _2054 = fma(_1910, _2042, _2040);
    if (_2026)
    {
        float _2056 = _2050 * 5.0;
        _2052 = as_type<int>(_2056);
    }
    int _2058 = _2052;
    float _2060 = _2054 * 0.15915493667125701904296875;
    float _2062 = _2030 * 6.283185482025146484375;
    float _2064 = sin(_2062);
    if (_2026)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6491 = as_type<float>(_2058);
        out.gl_Position.z = _6491;
    }
    float _2066 = _2030 * 6.283185482025146484375;
    float _2068 = cos(_2066);
    float _2070 = _2060 * 6.283185482025146484375;
    float _2072 = sin(_2070);
    if (_2026)
    {
        return out;
    }
    float _2074 = _2060 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    float _2078 = _2034 * _2064;
    float _2080 = _2046 * _2068;
    float _2082 = _2046 * _2064;
    float _2084 = _2034 * _2068;
    float _2086 = fma(_2072, _2080, _2078);
    float _2088 = fma(_2072, _2078, _2080);
    float _2090 = -_2082;
    float _2092 = fma(_2072, _2084, _2090);
    float _2094 = -_2084;
    float _2096 = fma(_2072, _2082, _2094);
    float _2098 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2100 = (*spvDescriptorSet0.vp_c10)._m0[9].w + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _2102 = _2046 * _2076;
    float _2104 = _2068 * _2076;
    float _2106 = _2034 * _2076;
    float _2108 = _2064 * _2076;
    float _2110 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _2114 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2098);
    float _2118 = _2110 * _1906;
    float _2120 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2122 = _1960 * _2114;
    float _2124 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2126 = _2118 * _2112;
    float _2128 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2130 = _2128 * 0.5;
    float _2132 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2120);
    float _2134 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2124);
    float _2136 = _2102 * _2126;
    float _2138 = -_2126;
    float _2140 = _2072 * _2138;
    float _2142 = _2106 * _2126;
    float _2144 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2146 = fma(_2086, _2122, _2136);
    float _2148 = fma(_2104, _2122, _2140);
    float _2150 = fma(_2092, _2122, _2142);
    float _2152 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2154 = fma(_2096, _2130, _2146);
    float _2156 = fma(_2108, _2130, _2148);
    float _2158 = fma(_2088, _2130, _2150);
    float _2160 = -_2072;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2144);
    float _2164 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2166 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2168 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2170 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2172 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2164);
    float _2174 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2166);
    float _2176 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2168);
    float _2178 = -_2072;
    float _2180 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2152);
    float _2182 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    float _2184 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2174);
    float _2186 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2188 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2190 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2194 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2186);
    float _2196 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2188);
    float _2198 = _1254 + _2190;
    float _2200 = _1248 + _2192;
    float _2202 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2176);
    float _2204 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2208 = _2198 + _2206;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2212 = _2200 + _2210;
    float _2214 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2216 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2218 = _2208 * _2208;
    float _2220 = _948 + _2214;
    float _2222 = -_2072;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2170);
    float _2226 = fma(_2212, _2212, _2218);
    float _2228 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2162);
    float _2230 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2180);
    float _2232 = sqrt(_2226);
    float _2234 = (*spvDescriptorSet0.vp_c10)._m0[8].w + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2236 = -_2100;
    float _2238 = _2220 + _2236;
    float _2240 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2216);
    float _2242 = (*spvDescriptorSet0.vp_c10)._m0[10].w + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2244 = -_2234;
    float _2246 = _2200 + _2244;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2116);
    float _2252 = -_2242;
    float _2254 = _2198 + _2252;
    float _2256 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    float _2258 = fma(_2246, _2246, _2248);
    float _2260 = fma(_2204, _2204, 1.0);
    float _2262 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2132);
    float _2264 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2134);
    float _2266 = fma(_2254, _2254, _2258);
    float _2268 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2196);
    bool _2270 = _2232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = rsqrt(_2260);
    float _2274 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2276 = _2204 * _2228;
    float _2278 = _2204 * _2230;
    float _2280 = _2204 * _2256;
    float _2282 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2194);
    float _2284 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2240);
    float _2286 = fma(_2274, _2250, _2276);
    float _2288 = rsqrt(_2266);
    float _2290 = fma(_2274, _2262, _2278);
    float _2292 = fma(_2274, _2264, _2280);
    bool _2294 = !_2270;
    float _2296 = _2220;
    float _2298 = _2200;
    float _2300 = _2198;
    if (!_2294)
    {
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2306 = _2232 + _2304;
        float _2308 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2310 = rsqrt(_2226);
        float _2312 = _2306 * _2302;
        float _2314 = _2312 * 0.15915493667125701904296875;
        float _2316 = _2314 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = _2314 * 6.283185482025146484375;
        float _2322 = sin(_2320);
        float _2324 = _2318 + (-1.0);
        float _2326 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2328 = fma(_2322, _2308, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2330 = fma(_2220, _2318, _2326);
        float _2332 = _2310 * _2328;
        float _2334 = fma(_2212, _2332, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2336 = fma(_2208, _2332, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2296 = _2330;
        _2298 = _2334;
        _2300 = _2336;
    }
    float _2338 = _2296;
    float _2340 = _2298;
    float _2342 = _2300;
    float _2344 = -_948;
    float _2346 = _2344 + _2338;
    float _2348 = -_1248;
    float _2350 = _2348 + _2340;
    float _2352 = _2204 * _2272;
    float _2354 = -_1254;
    float _2356 = _2354 + _2342;
    float _2358 = _2346 * _2346;
    float _2360 = _2282 + _2286;
    float _2362 = _2268 + _2290;
    float _2364 = -_2282;
    float _2366 = _2352 * _2364;
    float _2368 = fma(_2350, _2350, _2358);
    float _2370 = -_2268;
    float _2372 = _2352 * _2370;
    float _2374 = -_2284;
    float _2376 = _2352 * _2374;
    float _2378 = _2284 + _2292;
    float _2380 = fma(_2356, _2356, _2368);
    float _2382 = _2246 * _2288;
    float _2384 = _2238 * _2288;
    float _2386 = _2254 * _2288;
    float _2388 = fma(_2272, _2228, _2366);
    float _2390 = sqrt(_2380);
    float _2392 = -_2382;
    float _2394 = _2360 + _2392;
    float _2396 = -_2384;
    float _2398 = _2362 + _2396;
    float _2400 = -_2386;
    float _2402 = _2378 + _2400;
    float _2404 = fma(_2272, _2230, _2372);
    float _2406 = fma(_2272, _2256, _2376);
    float _2408 = fma(_2394, 0.5, _2382);
    float _2410 = fma(_2398, 0.5, _2384);
    float _2412 = fma(_2402, 0.5, _2386);
    out.m_60.x = _659;
    out.m_60.y = _661;
    out.m_60.z = _663;
    out.m_60.w = _665;
    out.m_66.x = _1954;
    out.m_66.y = _1956;
    out.m_66.z = _1958;
    out.m_66.w = _1746;
    bool _2414 = _2390 > 0.0;
    out.m_70.x = _2250;
    out.m_70.y = _2262;
    out.m_70.z = _2264;
    out.m_72.x = _2388;
    out.m_72.y = _2404;
    out.m_72.z = _2406;
    out.m_74.x = _2408;
    out.m_74.y = _2410;
    out.m_74.z = _2412;
    bool _2416 = !_2414;
    float _2418 = _2338;
    float _2420 = _2342;
    float _2422 = _2340;
    if (!_2416)
    {
        bool _2424 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2426 = _665;
        if (_2424)
        {
            float _2428 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2426 = _2428;
        }
        float _2430 = _2426;
        float _2432 = _2430;
        if (_2424)
        {
            float _2434 = _453 * _2430;
            _669 = _2434;
        }
        float _2436 = _669;
        float _2438 = _2436;
        if (_2424)
        {
            float _2440 = _455 * _2430;
            _671 = _2440;
        }
        float _2442 = _671;
        float _2444 = _2442;
        if (_2424)
        {
            float _2446 = _457 * _2430;
            _2432 = _2446;
        }
        float _2448 = _2432;
        float _2450 = _2448;
        if (!_2424)
        {
            float _2452 = _129 + 1.0;
            if (!_175)
            {
                float _2454 = _2452 * _2452;
                float _2456 = _2454 * 0.5;
                _153 = _2456;
            }
            float _2458 = _153;
            float _2460 = _2458;
            if (!_175)
            {
                float _2462 = _2458 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2460 = _2462;
            }
            float _2464 = _2460;
            bool _2466 = !_175;
            float _2468 = _2464;
            if (!_2466)
            {
                float _2470 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2472 = log2(_2470);
                float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2476 = _2474 + 1.0;
                float _2478 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2480 = _2472 * _2452;
                float _2482 = 1.0 / _2476;
                float _2484 = _2478 * 0.693147182464599609375;
                float _2486 = exp2(_2480);
                float _2488 = 1.0 / _2484;
                float _2490 = _2486 + (-1.0);
                float _2492 = -_2490;
                float _2494 = fma(_2492, _2488, _2452);
                float _2496 = _2494 * _2482;
                float _2498 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2468 = _2498;
            }
            float _2500 = _2468;
            float _2502 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2504 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2506 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2508 = _2500;
            if (!_175)
            {
                _2508 = _2452;
            }
            float _2510 = _2508;
            float _2512 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2514 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2516 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2518 = fma(_2504, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2512);
            float _2520 = fma(_2504, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2514);
            float _2522 = fma(_2506, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2518);
            bool _2524 = !_175;
            float _2526 = _2510;
            _1966 = _2520;
            _1968 = _2522;
            if (!_2524)
            {
                float _2528 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2530 = log2(_2528);
                float _2532 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2534 = _2532 + 1.0;
                float _2536 = 1.0 / _2534;
                float _2538 = _2530 * _2452;
                float _2540 = exp2(_2538);
                float _2542 = -_2540;
                float _2544 = _2542 + 1.0;
                float _2546 = _2544 * _2536;
                _2526 = _2546;
            }
            float _2548 = _2526;
            float _2550 = fma(_2504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2516);
            float _2552 = fma(_2506, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2520);
            float _2554 = fma(_2548, _179, _2522);
            float _2556 = fma(_2506, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2550);
            float _2558 = fma(_2548, _177, _2552);
            float _2560 = -_415;
            float _2562 = _2560 + _2554;
            float _2564 = fma(_2548, _181, _2556);
            float _2566 = -_417;
            float _2568 = _2566 + _2558;
            float _2570 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2572 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2574 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2576 = -_427;
            float _2578 = _2576 + _2564;
            float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2570);
            float _2582 = fma(_2568, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2572);
            float _2584 = fma(_2568, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2574);
            float _2586 = fma(_2578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2580);
            float _2588 = fma(_2578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2582);
            float _2590 = fma(_2578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2584);
            _461 = _2588;
            _463 = _2586;
            _465 = _2590;
            _2438 = _2586;
            _2444 = _2588;
            _2450 = _2590;
        }
        float _2592 = _461;
        float _2594 = _463;
        float _2596 = _465;
        float _2598 = _2438;
        float _2600 = _2444;
        float _2602 = _2450;
        float _2604 = _1966;
        float _2606 = _1968;
        float _2608 = _2592 * _2592;
        float _2610 = rsqrt(_2380);
        float _2612 = fma(_2594, _2594, _2608);
        float _2614 = fma(_2596, _2596, _2612);
        float _2616 = sqrt(_2614);
        float _2618 = _2350 * _2610;
        float _2620 = _2346 * _2610;
        float _2622 = _2356 * _2610;
        bool _2624 = _2616 > 0.0;
        bool _2626 = !_2624;
        _1970 = _2604;
        _1972 = _2606;
        if (!_2626)
        {
            float _2628 = rsqrt(_2614);
            float _2630 = _2628 * _2592;
            float _2632 = _2628 * _2594;
            float _2634 = _2628 * _2596;
            float _2636 = _2620 * _2630;
            float _2638 = fma(_2618, _2632, _2636);
            float _2640 = fma(_2622, _2634, _2638);
            float _2642 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2644 = fma(_2598, _2642, _2340);
            float _2646 = fma(_2600, _2642, _2338);
            float _2648 = fma(_2602, _2642, _2342);
            _2418 = _2646;
            _2420 = _2648;
            _2422 = _2644;
        }
    }
    float _2650 = _2418;
    float _2652 = _2420;
    float _2654 = _2422;
    float _2656 = _1970;
    float _2658 = _1972;
    float _2660 = -_1744;
    float _2662 = _2660 + _2650;
    float _2664 = -_1762;
    float _2666 = _2664 + _2652;
    bool _2668 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2672 = _2668 || _2670;
    bool _2674 = isnan(0.5);
    bool _2676 = _2672 || _2674;
    float _2678 = -_1756;
    float _2680 = _2678 + _2654;
    float _2682 = _2662;
    float _2684 = _2680;
    float _2686 = _2666;
    float _2688 = _2658;
    if (!_2676)
    {
        float _2690 = _1988 * _1988;
        float _2692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2694 = -_948;
        float _2696 = _2694 + _2650;
        float _2698 = -_1254;
        float _2700 = _2698 + _2652;
        float _2702 = fma(_1996, _1996, _2690);
        float _2704 = fma(_2004, _2004, _2702);
        float _2706 = 1.0 / _1906;
        float _2708 = sqrt(_2704);
        float _2710 = precise::min(_2708, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2712 = _2710 * _2692;
        float _2714 = -_1248;
        float _2716 = _2714 + _2654;
        float _2718 = _2712 * _2706;
        float _2720 = fma(_2716, _2718, _1982);
        float _2722 = fma(_2696, _2718, _1976);
        float _2724 = fma(_2700, _2718, _1992);
        _2682 = _2722;
        _2684 = _2720;
        _2686 = _2724;
        _1298 = _2700;
    }
    float _2726 = _2682;
    float _2728 = _2684;
    float _2730 = _2686;
    float _2732 = _1298;
    float _2734 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2736 = _2726 + _2734;
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2740 = _2728 + _2738;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2744 = _2730 + _2742;
    float _2746 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2748 = _2736 * _2736;
    float _2750 = fma(_2740, _2740, _2748);
    float _2752 = fma(_2744, _2744, _2750);
    float _2754 = rsqrt(_2752);
    float _2756 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2758 = _2740 * _2756;
    float _2760 = _2744 * _2756;
    float _2762 = _2758 * _2758;
    float _2764 = _2760 * _2760;
    float _2766 = _2762 + _2764;
    float _2768 = sqrt(_2766);
    bool _2770 = _2768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2774 = _2768 + _2772;
    float _2776 = _2656;
    float _2778 = _2766;
    float _2780 = _2774;
    float _2782 = _2736;
    float _2784 = _2732;
    float _2786 = _2758;
    if (_2770)
    {
        float _2788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2776 = _2788;
    }
    float _2790 = _2776;
    if (_2770)
    {
        float _2792 = rsqrt(_2766);
        _2778 = _2792;
    }
    float _2794 = _2778;
    float _2796 = _2794;
    if (_2770)
    {
        float _2798 = _2774 * _2790;
        _2780 = _2798;
    }
    float _2800 = _2780;
    if (_2770)
    {
        float _2802 = _2800 * 0.15915493667125701904296875;
        _2688 = _2802;
    }
    float _2804 = _2688;
    float _2806 = _2744;
    if (_2770)
    {
        float _2808 = _2804 * 6.283185482025146484375;
        float _2810 = sin(_2808);
        _2806 = _2810;
    }
    float _2812 = _2806;
    float _2814 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2816 = precise::max(0.0, _2814);
    float _2818 = _2790;
    if (_2770)
    {
        float _2820 = _2804 * 6.283185482025146484375;
        float _2822 = cos(_2820);
        _2818 = _2822;
    }
    float _2824 = _2818;
    float _2826 = -_2756;
    float _2828 = -_2816;
    float _2830 = fma(_2736, _2826, _2828);
    if (_2770)
    {
        float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2832;
    }
    float _2834 = _2782;
    float _2836 = sqrt(_2752);
    float _2838 = _2812;
    float _2840 = _2834;
    if (_2770)
    {
        float _2842 = fma(_2812, _2834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2838 = _2842;
    }
    float _2844 = _2838;
    float _2846 = _2844;
    float _2848 = _2824;
    if (_2770)
    {
        float _2850 = _2824 + (-1.0);
        _2840 = _2850;
    }
    float _2852 = _2840;
    float _2854 = _2852;
    if (_2770)
    {
        float _2856 = _2794 * _2844;
        _2784 = _2856;
    }
    float _2858 = _2784;
    if (!_2770)
    {
        _2846 = _2830;
    }
    float _2860 = _2846;
    float _2862 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2864 = _2860;
    if (_2770)
    {
        float _2866 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1752 = _2866;
    }
    float _2868 = _1752;
    if (_2770)
    {
        float _2870 = _2758 * _2858;
        _2786 = _2870;
    }
    float _2872 = _2786;
    if (!_2770)
    {
        _2854 = _2760;
    }
    float _2874 = _2854;
    float _2876 = _2874;
    if (_2770)
    {
        float _2878 = _2760 * _2858;
        _2876 = _2878;
    }
    float _2880 = _2876;
    if (!_2770)
    {
        _2796 = _2762;
    }
    float _2882 = _2796;
    float _2884 = _2882;
    if (_2770)
    {
        float _2886 = fma(_2830, _2824, _2868);
        _2864 = _2886;
    }
    float _2888 = _2864;
    if (_2770)
    {
        float _2890 = _2872 * _2872;
        _2884 = _2890;
    }
    float _2892 = _2884;
    if (!_2770)
    {
        _2848 = _2764;
    }
    float _2894 = _2848;
    float _2896 = _2894;
    if (_2770)
    {
        float _2898 = _2880 * _2880;
        _2896 = _2898;
    }
    float _2900 = _2896;
    float _2902 = fma(_2888, _2888, _2892);
    float _2904 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2862);
    float _2906 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2908 = _2902 + _2900;
    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2912 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2910);
    float _2914 = precise::clamp(_2912, 0.0, 1.0);
    float _2916 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2918 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2904);
    float _2920 = rsqrt(_2908);
    float _2922 = -_2914;
    float _2924 = _2922 + 1.0;
    float _2926 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2928 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2916);
    float _2930 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2932 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2906);
    float _2934 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2926);
    float _2936 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2928);
    float _2938 = abs(_2924);
    float _2940 = log2(_2938);
    float _2942 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2944 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2934);
    float _2946 = _2936 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2948 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2932);
    float _2950 = -_2942;
    float _2952 = fma(_2950, _2746, 1.0);
    float _2954 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2956 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2958 = _2920 * _2872;
    float _2960 = _2920 * _2888;
    float _2962 = _2920 * _2880;
    float _2964 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2956);
    float _2966 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2968 = _2948 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = log2(_2952);
    float _2972 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2964);
    float _2974 = -_2966;
    float _2976 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2974);
    float _2978 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2980 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2982 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2972);
    float _2984 = -_2962;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2976);
    float _2988 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2990 = exp2(_2978);
    float _2992 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2980);
    float _2994 = fma(_2986, -0.5, 0.5);
    float _2996 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2988);
    float _2998 = fma(_2986, 0.5, 0.5);
    float _3000 = _2960 + 1.0;
    float _3002 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2992);
    float _3004 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2996);
    float _3006 = 1.0 / _2982;
    float _3008 = fma(_2998, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3010 = _2970 * 0.693147182464599609375;
    float _3012 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3004);
    float _3014 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3016 = sqrt(_2994);
    float _3018 = -_2960;
    float _3020 = fma(_2990, _3000, _3018);
    float _3022 = fma(_2998, _3008, -0.212114393711090087890625);
    float _3024 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3002);
    float _3026 = fma(_3020, 0.5, 0.5);
    float _3028 = fma(_2998, _3022, 1.570728778839111328125);
    float _3030 = _3012 * _3006;
    float _3032 = _3024 * _3006;
    float _3034 = fma(_3030, 0.5, 0.5);
    float _3036 = fma(_3032, -0.5, 0.5);
    float _3038 = _3016 * 0.636619746685028076171875;
    float3 _8120 = float3(_3034, _3036, _3014);
    float _3040 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8120, float3(0.0), isnan(_8120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8120, float3(0.0), isnan(_8120)), level(0.0)).x;
    float3 _8131 = float3(_3034, _3036, _3014);
    float4 _3043 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8131, float3(0.0), isnan(_8131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8131, float3(0.0), isnan(_8131)), level(0.0)).xyzw;
    float _3045 = _3043.x;
    float _3047 = _3043.y;
    float _3049 = _3043.z;
    float _3051 = _3043.w;
    float _3053 = -_3028;
    float _3055 = fma(_3038, _3053, 1.0);
    float2 _8153 = float2(_3055, _3026);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8153, float2(0.0), isnan(_8153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8153, float2(0.0), isnan(_8153)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3069 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_76.x = _2728;
    out.m_76.y = _2726;
    out.m_76.z = _2730;
    bool _3071 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3073 = isnan(_2836);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3079 = _3075 || _3077;
    float _3081 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3067);
    float _3083 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3085 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3069);
    float _3087 = _3012 + _2982;
    float _3089 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3081);
    float _3091 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3083);
    float _3093 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3085);
    float _3095 = _3089 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3097 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3091);
    float _3099 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3093);
    float _3101 = 1.0 / _3095;
    bool _3103 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3105 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3107 = _3103 || _3105;
    bool _3109 = isnan(0.5);
    bool _3111 = _3107 || _3109;
    float _3113 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3115 = _3097 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3117 = _3087 * 0.5;
    out.gl_Position.x = _3012;
    out.gl_Position.y = _3024;
    out.gl_Position.z = _3099;
    out.gl_Position.w = _2982;
    float _3119 = _3115 + _3095;
    float _3121 = exp2(_3113);
    float _3123 = _2940;
    float _3125 = _3095;
    float _3127 = _3085;
    float _3129 = _2982;
    float _3131 = _3099;
    float _3133 = _3012;
    if (!_3111)
    {
        _3123 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3135 = _3123;
    float _3137 = _3119 * _3101;
    float _3139 = _3137 * 0.5;
    float _3141 = _3099 + _2982;
    if (!_3111)
    {
        _3125 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3143 = _3125;
    if (!_3111)
    {
        float _3145 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3147 = fma(_3139, _3135, _3145);
        _3127 = _3147;
    }
    float _3149 = _3127;
    float _3151 = _2982 * 0.5;
    float _3153 = _3141 * 0.5;
    if (_3111)
    {
        _3129 = 1.0;
    }
    float _3155 = _3129;
    float _3157 = -_3121;
    float _3159 = _3157 + 1.0;
    float _3161 = fma(_3024, -0.5, _3151);
    float _3163 = _3149;
    float _3165 = _3155;
    if (!_3111)
    {
        float _3167 = 1.0 / _3149;
        _3163 = _3167;
    }
    float _3169 = _3163;
    if (!_3079)
    {
        _3131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3171 = _3131;
    float _3173 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3175 = _3171;
    float _3177 = _3171;
    if (!_3079)
    {
        _3133 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3179 = _3133;
    out.m_78.x = _3117;
    out.m_78.y = _3161;
    out.m_78.z = _3153;
    out.m_78.w = _2982;
    float _3181 = -_3173;
    float _3183 = _3181 + 1.0;
    float _3185 = _3173 * _3040;
    float _3187 = _3051 * _3185;
    float _3189 = _3051 * _3183;
    float _3191 = _3065 * _3185;
    float _3193 = fma(_3061, _3187, _3045);
    float _3195 = fma(_3063, _3187, _3047);
    float _3197 = _3061;
    float _3199 = _3045;
    float _3201 = _3179;
    float _3203 = _3179;
    if (!_3111)
    {
        float _3205 = -_3143;
        float _3207 = _3205 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3197 = _3207;
    }
    float _3209 = _3197;
    float _3211 = fma(_3051, _3191, _3049);
    if (!_3111)
    {
        float _3213 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3215 = -_3143;
        float _3217 = fma(_3169, _3213, _3215);
        _3199 = _3217;
    }
    float _3219 = _3199;
    float _3221 = _3024;
    if (!_3111)
    {
        float _3223 = 1.0 / _3209;
        _3221 = _3223;
    }
    float _3225 = _3221;
    out.m_80.x = _3193;
    out.m_80.y = _3195;
    out.m_80.z = _3211;
    out.m_80.w = _3189;
    float _3227 = _3225;
    if (!_3111)
    {
        float _3229 = _3219 * _3225;
        float _3231 = precise::clamp(_3229, 0.0, 1.0);
        _3165 = _3231;
    }
    float _3233 = _3165;
    if (!_3079)
    {
        _3227 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3235 = _3227;
    float _3237 = _3233 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3239 = !_3079;
    float _3241 = _3235;
    float _3243 = _3235;
    if (!_3239)
    {
        bool _3245 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3247 = isnan(_2836);
        bool _3249 = _3245 || _3247;
        bool _3251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3253 = _3249 || _3251;
        if (!_3253)
        {
            float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3257 = _2836 + _3255;
            float _3259 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3261 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3259;
            float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3271 = 1.0 / _3261;
            float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3277 = _3257 * _3271;
            float _3279 = precise::clamp(_3277, 0.0, 1.0);
            float _3281 = fma(_3279, _3265, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3283 = fma(_3279, _3269, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3285 = fma(_3279, _3275, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3243 = _3283;
            _3177 = _3281;
            _3203 = _3285;
            _3287 = true;
        }
        else
        {
            bool _3289 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3291 = isnan(_2836);
            bool _3293 = _3289 || _3291;
            bool _3295 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3297 = _3293 || _3295;
            if (!_3297)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3299 = _3175;
            _3177 = _3299;
            if (!_3297)
            {
                _3241 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3301 = _3241;
            _3243 = _3301;
            if (!_3297)
            {
                _3201 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3303 = _3201;
            bool _3305 = !_3297;
            _3203 = _3303;
            if (!_3305)
            {
                bool _3307 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3309 = isnan(_2836);
                bool _3311 = _3307 || _3309;
                bool _3313 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3315 = _3311 || _3313;
                if (!_3315)
                {
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3319 = _2836 + _3317;
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3323 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3321;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3333 = 1.0 / _3323;
                    float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3339 = _3319 * _3333;
                    float _3341 = precise::clamp(_3339, 0.0, 1.0);
                    float _3343 = fma(_3341, _3327, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3345 = fma(_3341, _3331, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3347 = fma(_3341, _3337, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3243 = _3345;
                    _3177 = _3343;
                    _3203 = _3347;
                    _3287 = true;
                }
                else
                {
                    _3243 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3203 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3287 = false;
    float _3349 = _3243;
    float _3351 = _3177;
    float _3353 = _3203;
    float _3355 = _3237 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_82.x = 0.0;
    float _3357 = _3349 * 0.586610972881317138671875;
    bool _3359 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3355;
    float _3361 = fma(_3351, 0.298911988735198974609375, _3357);
    bool _3363 = _3233 > 0.0;
    bool _3365 = isnan(_3233);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = fma(_3353, 0.114477999508380889892578125, _3361);
    float _3375 = -_3373;
    float _3377 = _3375 + _3351;
    float _3379 = -_3373;
    float _3381 = _3379 + _3349;
    float _3383 = -_3373;
    float _3385 = _3383 + _3353;
    float _3387 = fma(_3377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3373);
    float _3389 = fma(_3381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3373);
    float _3391 = fma(_3385, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3373);
    bool _3393 = !_3359;
    if (!_3393)
    {
        float _3395 = -_2726;
        float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3399 = -_2728;
        float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3403 = -_2730;
        float _3405 = _3403 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3407 = _3397 * _3397;
        float _3409 = fma(_3401, _3401, _3407);
        float _3411 = fma(_3405, _3405, _3409);
        float _3413 = sqrt(_3411);
        float _3415 = rsqrt(_3411);
        float _3417 = -_3413;
        float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3421 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3423 = precise::clamp(_3421, 0.0, 1.0);
        float _3425 = _3401 * _3415;
        float _3427 = _3397 * _3415;
        float _3429 = abs(_3423);
        float _3431 = log2(_3429);
        float _3433 = _3405 * _3415;
        float _3435 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3437 = _2410 * _3427;
        float _3439 = -_3427;
        float _3441 = -_3435;
        float _3443 = fma(_3439, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3441);
        float _3445 = fma(_2408, _3425, _3437);
        float _3447 = -_3433;
        float _3449 = fma(_3447, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3443);
        float _3451 = fma(_2412, _3433, _3445);
        float _3453 = precise::clamp(_3451, 0.0, 1.0);
        float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3457 = _3449 + _3455;
        float _3459 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3461 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3463 = precise::clamp(_3461, 0.0, 1.0);
        float _3465 = exp2(_3459);
        float _3467 = _3465 * _3463;
        float _3469 = _3453 * _3467;
        float _3471 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3473 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3475 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3471;
        out.m_82.y = _3473;
        out.m_82.z = _3475;
    }
    out.m_84.x = _3387;
    out.m_84.y = _3389;
    out.m_84.z = _3391;
    if (_3371)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3477 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3477;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3287 = false;
    bool _589 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3533 = as_type<float>(_117);
        out.gl_Position.z = _3533;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_49.w;
    float _123 = float(_103);
    float _125 = 1.0 / _123;
    float _127 = -_121;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_121);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = _129 * _125;
    bool _143 = _129 >= _123;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    out.m_51.x = _141;
    float _149 = _121;
    float _151 = _141;
    float _153 = _129;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _149;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _157 = _155 * 5.0;
        _119 = as_type<int>(_157);
    }
    int _159 = _119;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3606 = as_type<float>(_159);
        out.gl_Position.z = _3606;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = in.m_56.w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_49.x;
    float _179 = in.m_49.y;
    float _181 = in.m_49.z;
    float _183 = in.m_44.x;
    float _185 = in.m_44.y;
    float _187 = in.m_44.z;
    int _189 = as_type<int>(_161) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_161) & 2;
    bool _195 = _193 != 0;
    float _197 = _161;
    float _199 = _163;
    if (!_175)
    {
        float _201 = _163 * _163;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _205;
    if (!_175)
    {
        float _213 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_195;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_175;
    float _223 = _215;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _163 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _163);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _259 = !_175;
    float _261 = _257;
    float _263 = _255;
    if (!_259)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _163 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _199 = _283;
    }
    float _285 = _199;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _257 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _291 = _257 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _293 = _257 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_175)
    {
        float _295 = _129 * _129;
        float _297 = _295 * 0.5;
        _261 = _297;
    }
    float _299 = _261;
    float _301 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].x, _289);
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].y, _291);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[8].z, _293);
    float _307 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_175)
    {
        float _309 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _309;
    }
    float _311 = _263;
    bool _313 = !_175;
    float _315 = _311;
    if (!_313)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = _129 * _319;
        float _329 = exp2(_327);
        float _331 = _325 * 0.693147182464599609375;
        float _333 = 1.0 / _331;
        float _335 = 1.0 / _323;
        float _337 = _329 + (-1.0);
        float _339 = -_337;
        float _341 = fma(_339, _333, _129);
        float _343 = _341 * _335;
        float _345 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _345;
    }
    float _347 = _315;
    float _349 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _351 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[10].x, _301);
    float _353 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[10].y, _303);
    float _355 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _349 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _359 = _349 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _361 = _349 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _363 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[10].z, _305);
    float _365 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[8].x, _357);
    float _367 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[8].y, _359);
    float _369 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[8].z, _361);
    float _371 = _347 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = fma(_285, _177, _351);
    float _375 = fma(_285, _179, _353);
    float _377 = fma(_285, _181, _363);
    float _379 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[10].x, _365);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[10].y, _367);
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[10].z, _369);
    float _385 = _371;
    if (!_175)
    {
        _385 = _129;
    }
    float _387 = _385;
    bool _389 = !_175;
    float _391 = _387;
    if (!_389)
    {
        float _393 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _395 = log2(_393);
        float _397 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _399 = _397 + 1.0;
        float _401 = 1.0 / _399;
        float _403 = _129 * _395;
        float _405 = exp2(_403);
        float _407 = -_405;
        float _409 = _407 + 1.0;
        float _411 = _409 * _401;
        _391 = _411;
    }
    float _413 = _391;
    float _415 = fma(_413, _179, _381);
    float _417 = fma(_413, _177, _379);
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _421 = fma(_375, _165, _185);
    float _423 = -_415;
    float _425 = _375 + _423;
    float _427 = fma(_413, _181, _383);
    float _429 = fma(_373, _165, _183);
    float _431 = -_417;
    float _433 = _373 + _431;
    float _435 = _425 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _425 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _439 = _425 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _441 = -_427;
    float _443 = _377 + _441;
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _447 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
    float _451 = fma(_377, _165, _187);
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _455 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    bool _459 = !_419;
    float _461 = _455;
    float _463 = _453;
    float _465 = _457;
    float _483;
    if (!_459)
    {
        float _467 = in.m_58.x;
        float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _471 = _467 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _475 = _473 * _469;
        float _477 = floor(_475);
        float _479 = -_477;
        float _481 = _475 + _479;
        _483 = _481;
        _485 = true;
    }
    else
    {
        _483 = _141;
    }
    _485 = false;
    float _487 = _483;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = _487 + _489;
    float _493 = in.m_56.x;
    float _495 = in.m_56.y;
    bool _497 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_487);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    bool _513 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _515 = isnan(_487);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _529;
    float _533 = 1.0 / _511;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _537 = _523 * _527;
    float _539 = -_523;
    float _541 = _539 + 1.0;
    float _543 = _491 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _545;
    float _549 = fma(_531, _543, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _551 = fma(_547, _543, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _553 = _549 * _537;
    float _555 = _551 * _537;
    float _557 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].x, _553);
    float _559 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].y, _555);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].x, _557);
    float _563 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].y, _559);
    float _565 = _561 * _493;
    float _567 = _563 * _495;
    bool _569 = !_535;
    float _587;
    if (!_569)
    {
        float _571 = in.m_58.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        _587 = _141;
    }
    _589 = false;
    float _591 = _587;
    bool _593 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _595 = isnan(_591);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _611 = isnan(_591);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _627 = _591 + _625;
    float _629 = -_603;
    float _631 = _629 + 1.0;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _635 = 1.0 / _607;
    float _637 = _619 * _631;
    float _639 = -_619;
    float _641 = _639 + 1.0;
    float _643 = _623 * _635;
    float _645 = fma(_643, _627, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _647 = _645 * _637;
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[115].x, _647);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[116].x, _649);
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_60.x = _659;
    out.m_60.y = _661;
    out.m_60.z = _663;
    out.m_60.w = _665;
    bool _667 = !_633;
    float _669 = _661;
    float _671 = _659;
    if (!_667)
    {
        float _673 = in.m_58.x;
        float _675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _677 = _673 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _681 = _679 * _675;
        float _683 = floor(_681);
        float _685 = -_683;
        float _687 = _681 + _685;
        _151 = _687;
    }
    float _689 = _151;
    float _691 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _693 = int(_691);
    float _695 = _421 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _697 = _421 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _699 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _701 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _695);
    float _703 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _705 = int(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _715 = float(_693);
    float _717 = 1.0 / _709;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _723 = float(uint(_705));
    float _725 = 1.0 / _715;
    int _727 = ~_705;
    int _729 = _727 + 1;
    int _731 = ~_705;
    int _733 = _731 + 1;
    float _735 = float(_705);
    float _737 = 1.0 / _723;
    float _739 = _129 * _725;
    float _741 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _743 = log2(_741);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _747 = _745 != 0;
    int _749 = as_type<int>(_737) + (-2);
    float _751 = trunc(_739);
    int _753 = int(_751);
    bool _755 = !_747;
    float _757 = _755 ? 7.345489978790283203125 : 1.0;
    float _759 = float(uint(_753));
    float _761 = as_type<float>(_749) * _759;
    float _763 = in.m_58.x;
    float _765 = in.m_58.y;
    float _767 = in.m_58.z;
    float _769 = in.m_58.w;
    float _771 = trunc(_761);
    float _773 = precise::max(_771, 0.0);
    uint _776 = uint(_773);
    int _778 = _729 * int(_776);
    int _780 = _778 + _753;
    float _782 = _757 * _763;
    float _784 = float(uint(_780));
    float _786 = _765 * 2.0;
    float _788 = as_type<float>(_749) * _784;
    float _790 = float(_753);
    float _792 = floor(_786);
    float _794 = trunc(_788);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    int _800 = int(_776) + int(_798);
    bool _802 = _790 >= _735;
    bool _804 = isnan(_790);
    bool _806 = _802 || _804;
    bool _808 = isnan(_735);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = floor(_782);
    int _816 = _733 * _800;
    int _818 = _816 + _753;
    bool _820 = uint(_818) >= uint(_705);
    float _822 = trunc(_812);
    int _824 = int(_822);
    bool _826 = !_820;
    int _828 = _826 ? 0 : (-1);
    bool _830 = _705 == 0;
    int _832 = ~_800;
    int _834 = _832 + _828;
    int _836 = _834 + 1;
    float _838 = -_814;
    float _840 = _782 + _838;
    int _842 = _705 * _836;
    int _844 = _842 + _753;
    float _846 = _840 * _735;
    int _848 = ~_824;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = trunc(_846);
    int _856 = int(_854);
    bool _858 = !_830;
    int _860 = _858 ? _844 : (-1);
    int _862 = _860 * _852;
    float _864 = _129 * _735;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _876 = _874 != 0;
    int _878 = _705 + (-1);
    float _880 = _864 * _125;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _884 = _882 != 0;
    bool _886 = !_872;
    int _888 = _886 ? 0 : 1;
    int _890 = _824 * _878;
    int _892 = _890 + _862;
    bool _894 = !_868;
    int _896 = _894 ? 0 : 1;
    float _898 = trunc(_880);
    int _900 = int(_898);
    bool _902 = !_884;
    int _904 = _902 ? 0 : 1;
    int _906 = abs(_888);
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _910 = _908 != 0;
    bool _912 = !_876;
    int _914 = _912 ? 0 : 1;
    int _916 = _892 * _906;
    int _918 = abs(_896);
    float _920 = _421 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _922 = abs(_904);
    bool _924 = !_910;
    int _926 = _924 ? 0 : 1;
    float _928 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _920);
    int _930 = abs(_914);
    int _932 = _856 * _922;
    int _934 = _932 + _753;
    float _936 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _697);
    int _938 = abs(_926);
    float _940 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _701);
    int _942 = _900 * _918;
    int _944 = _942 + _916;
    float _946 = float(uint(_934));
    float _948 = _940 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _950 = _769 > 0.5;
    int _952 = _934 * _930;
    int _954 = _952 + _944;
    int _956 = ~_705;
    int _958 = _956 + 1;
    float _960 = as_type<float>(_749) * _946;
    int _962 = _856 * _938;
    int _964 = _962 + _954;
    float _966 = _763 * 2.0;
    float _968 = trunc(_960);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    float _974 = float(uint(_964));
    float _976 = as_type<float>(_749) * _974;
    float _978 = floor(_966);
    float _980 = trunc(_976);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    int _986 = ~_705;
    int _988 = _986 + 1;
    int _990 = _958 * int(_984);
    int _992 = _990 + _964;
    float _994 = float(uint(_992));
    int _996 = ~_705;
    int _998 = _996 + 1;
    float _1000 = as_type<float>(_749) * _994;
    int _1002 = _998 * int(_972);
    int _1004 = _1002 + _934;
    float _1006 = trunc(_1000);
    float _1008 = precise::max(_1006, 0.0);
    uint _1010 = uint(_1008);
    float _1012 = float(uint(_1004));
    float _1014 = as_type<float>(_749) * _1012;
    float _1016 = -_219;
    int _1018 = _950 ? as_type<int>(_1016) : as_type<int>(_219);
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1022 = _1020 != 0;
    float _1024 = trunc(_1014);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    int _1030 = int(_984) + int(_1010);
    int _1032 = ~_705;
    int _1034 = _1032 + 1;
    int _1036 = _988 * _1030;
    int _1038 = _1036 + _964;
    bool _1040 = uint(_1038) >= uint(_705);
    int _1042 = int(_972) + int(_1028);
    bool _1044 = !_1040;
    int _1046 = _1044 ? 0 : (-1);
    int _1048 = _1034 * _1042;
    int _1050 = _1048 + _934;
    int _1052 = ~_1030;
    int _1054 = _1052 + _1046;
    int _1056 = _1054 + 1;
    bool _1058 = !_1022;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = _705 * _1056;
    int _1064 = _1062 + _964;
    bool _1066 = !_830;
    int _1068 = _1066 ? _1064 : (-1);
    int _1070 = _1068 & 3;
    bool _1072 = _1070 != 0;
    int _1074 = _1068 & 3;
    bool _1076 = _1074 != 0;
    bool _1078 = uint(_1070) > 1u;
    int _1080 = _1076 ? 0 : 1;
    bool _1082 = _1070 != 3;
    int _1084 = ~_1080;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    bool _1090 = uint(_1070) >= 2u;
    int _1092 = _1088;
    float _1094 = as_type<float>(_1070);
    float _1096 = as_type<float>(_705);
    float _1098 = as_type<float>(_934);
    if (!_1078)
    {
        int _1100 = ~_1080;
        int _1102 = _1100 + 1;
        _1092 = _1102;
    }
    int _1104 = _1092;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1108 = _1106 != 0;
    int _1110 = _1090 ? 0 : 1;
    bool _1112 = !_1108;
    float _1114 = _1112 ? _219 : as_type<float>(_1018);
    bool _1116 = _767 > 0.5;
    int _1118 = ~_1110;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    int _1124 = _1122;
    if (_1082)
    {
        int _1126 = ~_1110;
        int _1128 = _1126 + 1;
        _1124 = _1128;
    }
    int _1130 = _1124;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1134 = _1132 != 0;
    float _1136 = -_209;
    int _1138 = _1116 ? as_type<int>(_1136) : as_type<int>(_209);
    int _1140 = _1068 >> 31;
    bool _1142 = !_1134;
    float _1144 = _1142 ? _209 : as_type<float>(_1138);
    int _1146 = _1140 & 3;
    bool _1148 = _978 >= 0.0;
    bool _1150 = isnan(_978);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    int _1158 = _1068 + _1146;
    int _1160 = _1156 ? 0 : 1;
    int _1162 = _1158 >> 2;
    bool _1164 = _978 > 0.0;
    int _1166 = _1162 << 4;
    int _1168 = _1166 + 368;
    float _1170 = _763 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    uint _1172 = uint(int(uint(_1168) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    bool _1188 = uint(_1050) >= uint(_705);
    float _1190 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1194 = -_711;
    float _1196 = fma(_1170, 2.0, _1194);
    float _1198 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _936);
    int _1200 = ~_1160;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = fma(_1190, -2.0, _1192);
    float _1208 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _928);
    int _1210 = _1204;
    if (!_1164)
    {
        int _1212 = ~_1160;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    int _1218 = _1168 + 8;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
    int _1224 = int(_1220) & 3;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[int(_1222)][_1224];
    int _1228 = int(_1220) + 1;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    int _1232 = _1228 & 3;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[int(_1230)][_1232];
    float _1236 = _765 + _763;
    bool _1238 = _792 >= 0.0;
    bool _1240 = isnan(_792);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(0.0);
    bool _1246 = _1242 || _1244;
    float _1248 = _1208 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1250 = _1236 + (-1.0);
    int _1252 = _1246 ? 0 : 1;
    float _1254 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1256 = _792 > 0.0;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1258;
    bool _1262 = !_1188;
    int _1264 = _1262 ? 0 : (-1);
    float _1266 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1268 = abs(_1104);
    float _1270 = _1260 * _717;
    float _1272 = _767 * 2.0;
    int _1274 = ~_1042;
    int _1276 = _1274 + _1264;
    int _1278 = _1276 + 1;
    float _1280 = _129 * _743;
    int _1282 = ~_1252;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = _765 + _767;
    bool _1290 = !_1072;
    int _1292 = _1290 ? 0 : 1;
    float _1294 = floor(_1272);
    int _1296 = _1286;
    float _1298 = _1254;
    if (!_1256)
    {
        int _1300 = ~_1252;
        int _1302 = _1300 + 1;
        _1296 = _1302;
    }
    int _1304 = _1296;
    float _1306 = _1288 + (-1.0);
    int _1308 = _705 * _1278;
    int _1310 = _1308 + _934;
    float _1312 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1206);
    int _1314 = ~_1268;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    float _1320 = exp2(_1280);
    bool _1322 = _1070 != 3;
    float _1324 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_747)
    {
        _1094 = _765;
    }
    float _1326 = _1094;
    float _1328 = _1326;
    if (!_747)
    {
        _1096 = _767;
    }
    float _1330 = _1096;
    float _1332 = _1330;
    if (!_747)
    {
        _1098 = _767;
    }
    float _1334 = _1098;
    int _1336 = abs(_1130);
    int _1338 = _1318 * as_type<int>(_1186);
    int _1340 = abs(_1292);
    float _1342 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1344 = int(_1342);
    float _1346 = _1334;
    if (_747)
    {
        _1328 = _763;
    }
    float _1348 = _1328;
    if (_747)
    {
        _1332 = _765;
    }
    float _1350 = _1332;
    float _1352 = -_1320;
    float _1354 = _1352 + 1.0;
    if (_747)
    {
        _1346 = _765;
    }
    float _1356 = _1346;
    bool _1358 = _1294 >= 0.0;
    bool _1360 = isnan(_1294);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan(0.0);
    bool _1366 = _1362 || _1364;
    int _1368 = ~_1340;
    int _1370 = _1368 + 1;
    int _1372 = _1370 + 1;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1376 = _1374 != 0;
    bool _1378 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1386 = _1382 || _1384;
    int _1388 = _1372 * as_type<int>(_1178);
    int _1390 = _1388 + _1338;
    bool _1392 = !_830;
    int _1394 = _1392 ? _1310 : (-1);
    bool _1396 = !_1322;
    int _1398 = _1396 ? 0 : (-1);
    int _1400 = _1366 ? 0 : 1;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1412 = _1410 != 0;
    int _1414 = ~_1336;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    int _1420 = abs(_1398);
    int _1422 = abs(_1060);
    int _1424 = _1418 * as_type<int>(_1226);
    int _1426 = _1424 + _1390;
    int _1428 = ~_1420;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1436 = abs(_1344);
    float _1438 = float(uint(_1344));
    int _1440 = _1432 * as_type<int>(_1234);
    int _1442 = _1440 + _1426;
    float _1444 = float(uint(_1436));
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1448 = _689 + _1446;
    bool _1450 = _1294 > 0.0;
    float _1452 = 1.0 / _1438;
    int _1454 = ~_1422;
    int _1456 = _1454 + 1;
    int _1458 = _1456 + 1;
    float _1460 = fma(_1270, _1448, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1462 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1464 = isnan(_689);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    bool _1474 = _689 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1476 = isnan(_689);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    int _1486 = _1442 * _1458;
    float _1488 = 1.0 / _1444;
    float _1490 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[83].w, _713);
    int _1492 = _1394 * _1422;
    int _1494 = _1492 + _1486;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1498 = 1.0 + _1496;
    float _1500 = _1386 ? _1354 : 0.0;
    float _1502 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1504 = abs(_1494);
    float _1506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1508 = as_type<int>(_1452) + (-2);
    float _1510 = -_1484;
    float _1512 = _1510 + 1.0;
    float _1514 = float(uint(_1504));
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1518 = float(uint(_1494));
    float _1520 = _1472 * _1512;
    float _1522 = -_1472;
    float _1524 = _1522 + 1.0;
    int _1526 = as_type<int>(_1488) + (-2);
    float _1528 = 1.0 / _1498;
    float _1530 = as_type<float>(_1508) * _1518;
    float _1532 = _1460 * _1520;
    float _1534 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[83].z, _719);
    float _1536 = as_type<float>(_1526) * _1514;
    float _1538 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1540 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1542 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1532);
    float _1544 = trunc(_1536);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    float _1550 = -_721;
    float _1552 = fma(_1538, 2.0, _1550);
    int _1554 = ~_1344;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1540, -2.0, _1516);
    int _1560 = ~_1400;
    int _1562 = _1560 + 1;
    int _1564 = _1562 + 1;
    float _1566 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1542);
    float _1568 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1570 = trunc(_1530);
    float _1572 = precise::max(_1570, 0.0);
    uint _1574 = uint(_1572);
    float _1576 = _1500 * _1528;
    float _1578 = _1114 + (-0.5);
    float _1580 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1558);
    int _1582 = _1564;
    if (!_1450)
    {
        int _1584 = ~_1400;
        int _1586 = _1584 + 1;
        _1582 = _1586;
    }
    int _1588 = _1582;
    float _1590 = -_129;
    float _1592 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1552);
    float _1594 = _1144 + 0.5;
    float _1596 = -_1568;
    float _1598 = -_1580;
    float _1600 = fma(_1596, _1578, _1598);
    float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1604 = _948 + _1602;
    int _1606 = ~_1436;
    int _1608 = _1606 + 1;
    float _1610 = fma(_1502, _1594, _1592);
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1614 = _1248 + _1612;
    bool _1616 = !_1408;
    int _1618 = _1616 ? 0 : 1;
    float _1620 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1534);
    int _1622 = _1608 * int(_1548);
    int _1624 = _1622 + _1504;
    float _1626 = _1604 * _1604;
    int _1628 = _1556 * int(_1574);
    int _1630 = _1628 + _1494;
    float _1632 = float(_1588);
    float _1634 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1490);
    float _1636 = float(uint(_1624));
    float _1638 = fma(_1614, _1614, _1626);
    float _1640 = float(uint(_1630));
    float _1642 = -_1634;
    float _1644 = _1642 + 1.0;
    int _1646 = abs(_1618);
    float _1648 = as_type<float>(_1526) * _1636;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1254 + _1650;
    float _1654 = as_type<float>(_1508) * _1640;
    bool _1656 = !_1404;
    int _1658 = _1656 ? 0 : 1;
    float _1660 = in.m_62.x;
    float _1662 = in.m_62.y;
    float _1664 = in.m_62.z;
    float _1666 = fma(_1652, _1652, _1638);
    float _1668 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1670 = abs(_1658);
    float _1672 = trunc(_1654);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = float(_1216);
    float _1680 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1668);
    float _1682 = float(_1670);
    float _1684 = fma(_1114, _1644, _1600);
    float _1686 = float(_1646);
    float _1688 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1680);
    bool _1690 = _763 > 0.5;
    float _1692 = rsqrt(_1666);
    float _1694 = _1682 * _1632;
    float _1696 = _699 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1698 = _1688 >= 0.0;
    float _1700 = _1686 * _1678;
    int _1702 = ~_1344;
    int _1704 = _1702 + 1;
    float _1706 = _1694 * (-2.0);
    int _1708 = ~_1436;
    int _1710 = _1708 + 1;
    float _1712 = trunc(_1648);
    float _1714 = precise::max(_1712, 0.0);
    uint _1716 = uint(_1714);
    int _1718 = int(_1574) + int(_1676);
    float _1720 = fma(_1266, _1706, _1266);
    float _1722 = fma(_1706, _1660, _1660);
    float _1724 = -_209;
    int _1726 = _1690 ? as_type<int>(_1724) : as_type<int>(_209);
    float _1728 = _1700 * (-2.0);
    bool _1730 = _1344 == 0;
    float _1732 = _1696 * _1692;
    int _1734 = _1704 * _1718;
    int _1736 = _1734 + _1494;
    float _1738 = fma(_1728, _1662, _1662);
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1742 = _1740 != 0;
    float _1744 = _1604 * _1732;
    float _1746 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1748 = uint(_1736) >= uint(_1344);
    float _1750 = as_type<float>(_1718);
    float _1752 = _1746;
    if (_1698)
    {
        out.m_47.x = 0.0;
    }
    int _1754 = int(_1548) + int(_1716);
    float _1756 = _1614 * _1732;
    float _1758 = -_1744;
    float _1760 = _1604 + _1758;
    float _1762 = _1652 * _1732;
    bool _1764 = !_1742;
    float _1766 = _1764 ? _209 : as_type<float>(_1726);
    int _1768 = _1710 * _1754;
    int _1770 = _1768 + _1504;
    float _1772 = -_1756;
    float _1774 = _1614 + _1772;
    float _1776 = _1760 * _1760;
    bool _1778 = !_1748;
    int _1780 = _1778 ? 0 : (-1);
    float _1782 = -_1762;
    float _1784 = _1652 + _1782;
    bool _1786 = _765 > 0.5;
    float _1788 = fma(_1774, _1774, _1776);
    int _1790 = ~_1718;
    int _1792 = _1790 + _1780;
    int _1794 = _1792 + 1;
    float _1796 = fma(_1324, _1728, _1324);
    float _1798 = -_219;
    int _1800 = _1786 ? as_type<int>(_1798) : as_type<int>(_219);
    float _1802 = fma(_1784, _1784, _1788);
    bool _1804 = uint(_1770) >= uint(_1436);
    int _1806 = _1344 * _1794;
    int _1808 = _1806 + _1494;
    float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1698)
    {
        _1750 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1812 = _1750;
    bool _1814 = !_1804;
    int _1816 = _1814 ? 0 : (-1);
    bool _1818 = _1344 == 0;
    int _1820 = as_type<int>(_1812);
    if (_1698)
    {
        float _1822 = _1812 * 5.0;
        _1820 = as_type<int>(_1822);
    }
    int _1824 = _1820;
    int _1826 = _1494 ^ _1344;
    int _1828 = ~_1816;
    int _1830 = _1754 + _1828;
    int _1832 = _1830 + 1;
    float _1834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1836 = uint(int(uint(_1826) >> uint(31)));
    if (_1698)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6111 = as_type<float>(_1824);
        out.gl_Position.z = _6111;
    }
    bool _1838 = !_1818;
    int _1840 = _1838 ? _1808 : (-1);
    float _1842 = _763 + (-0.5);
    int _1844 = ~int(_1836);
    int _1846 = _1844 + 1;
    float _1848 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1850 = float(_1840);
    float _1852 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1722);
    int _1854 = _1832 ^ _1846;
    float _1856 = sqrt(_1802);
    bool _1858 = !_1376;
    float _1860 = _1858 ? _219 : as_type<float>(_1800);
    bool _1862 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1864 = isnan(1.0);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1870 = _1866 || _1868;
    float _1872 = -_129;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1196);
    int _1876 = ~_1846;
    int _1878 = _1876 + _1854;
    int _1880 = _1878 + 1;
    float _1882 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1884 = _1766 + 0.5;
    float _1886 = fma(_1848, _1850, _1874);
    bool _1888 = !_1730;
    int _1890 = _1888 ? _1880 : (-1);
    float _1892 = fma(_1848, _1884, _1886);
    float _1894 = float(_1890);
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1898 = -_1312;
    float _1900 = fma(_1882, _1894, _1898);
    float _1902 = _1860 + (-0.5);
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1906 = _1692 * _1856;
    bool _1908 = !_1870;
    float _1910 = _1908 ? _129 : _1576;
    float _1912 = -_1882;
    float _1914 = fma(_1912, _1902, _1900);
    float _1916 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1896);
    float _1918 = -_1620;
    float _1920 = _1918 + 1.0;
    float _1922 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1904);
    float _1924 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1916);
    float _1926 = -_1920;
    float _1928 = fma(_1144, _1926, _1610);
    float _1930 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1922);
    float _1932 = -_1924;
    float _1934 = _1932 + 1.0;
    float _1936 = fma(_1910, _1720, _1852);
    float _1938 = -_1930;
    float _1940 = _1938 + 1.0;
    float _1942 = -_1934;
    float _1944 = fma(_1766, _1942, _1892);
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1952 = fma(_1860, _1940, _1914);
    float _1954 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = _699 * _1906;
    out.m_64.x = _1944;
    out.m_64.y = _1952;
    out.m_64.z = _1928;
    out.m_64.w = _1684;
    bool _1962 = !_1412;
    int _1964 = _1962 ? 0 : 1;
    out.m_66.x = _1954;
    out.m_66.y = _1956;
    out.m_66.z = _1958;
    out.m_66.w = _1746;
    out.m_68.x = _1960;
    float _1966 = _1954;
    float _1968 = _1958;
    float _1970 = _1954;
    float _1972 = _1958;
    if (_1698)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1974 = -_1744;
    float _1976 = _948 + _1974;
    int _1978 = abs(_1964);
    float _1980 = -_1756;
    float _1982 = _1248 + _1980;
    float _1984 = _765 + (-0.5);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1976 + _1986;
    float _1990 = -_1762;
    float _1992 = _1254 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1996 = _1982 + _1994;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2000 = float(_1304);
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2004 = _1992 + _2002;
    float _2006 = float(_1978);
    float _2008 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1998);
    float _2010 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1738);
    float _2012 = _767 + _763;
    float _2014 = _767 + (-0.5);
    float _2016 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2008);
    float _2018 = _2006 * _2000;
    float _2020 = fma(_1910, _1796, _2010);
    float _2022 = _2012 + (-1.0);
    float _2024 = _1936 * 0.15915493667125701904296875;
    bool _2026 = _2016 >= 0.0;
    float _2028 = _2018 * (-2.0);
    float _2030 = _2020 * 0.15915493667125701904296875;
    float _2032 = _2024 * 6.283185482025146484375;
    float _2034 = sin(_2032);
    float _2036 = fma(_2028, _1664, _1664);
    float _2038 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2040 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2036);
    float _2042 = fma(_2038, _2028, _2038);
    float _2044 = _2024 * 6.283185482025146484375;
    float _2046 = cos(_2044);
    float _2048 = _2014;
    if (_2026)
    {
        _2048 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2050 = _2048;
    int _2052 = as_type<int>(_2050);
    if (_2026)
    {
        out.m_47.x = 0.0;
    }
    float _2054 = fma(_1910, _2042, _2040);
    if (_2026)
    {
        float _2056 = _2050 * 5.0;
        _2052 = as_type<int>(_2056);
    }
    int _2058 = _2052;
    float _2060 = _2054 * 0.15915493667125701904296875;
    float _2062 = _2030 * 6.283185482025146484375;
    float _2064 = sin(_2062);
    if (_2026)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6491 = as_type<float>(_2058);
        out.gl_Position.z = _6491;
    }
    float _2066 = _2030 * 6.283185482025146484375;
    float _2068 = cos(_2066);
    float _2070 = _2060 * 6.283185482025146484375;
    float _2072 = sin(_2070);
    if (_2026)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2074 = _2060 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    float _2078 = _2034 * _2064;
    float _2080 = _2046 * _2068;
    float _2082 = _2046 * _2064;
    float _2084 = _2034 * _2068;
    float _2086 = fma(_2072, _2080, _2078);
    float _2088 = fma(_2072, _2078, _2080);
    float _2090 = -_2082;
    float _2092 = fma(_2072, _2084, _2090);
    float _2094 = -_2084;
    float _2096 = fma(_2072, _2082, _2094);
    float _2098 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2100 = (*spvDescriptorSet0.vp_c10)._m0[9].w + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _2102 = _2046 * _2076;
    float _2104 = _2068 * _2076;
    float _2106 = _2034 * _2076;
    float _2108 = _2064 * _2076;
    float _2110 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _2114 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2098);
    float _2118 = _2110 * _1906;
    float _2120 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2122 = _1960 * _2114;
    float _2124 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2126 = _2118 * _2112;
    float _2128 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2130 = _2128 * 0.5;
    float _2132 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2120);
    float _2134 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2124);
    float _2136 = _2102 * _2126;
    float _2138 = -_2126;
    float _2140 = _2072 * _2138;
    float _2142 = _2106 * _2126;
    float _2144 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2146 = fma(_2086, _2122, _2136);
    float _2148 = fma(_2104, _2122, _2140);
    float _2150 = fma(_2092, _2122, _2142);
    float _2152 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2154 = fma(_2096, _2130, _2146);
    float _2156 = fma(_2108, _2130, _2148);
    float _2158 = fma(_2088, _2130, _2150);
    float _2160 = -_2072;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2144);
    float _2164 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2166 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2168 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2170 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2172 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2164);
    float _2174 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2166);
    float _2176 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2168);
    float _2178 = -_2072;
    float _2180 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2152);
    float _2182 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    float _2184 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2174);
    float _2186 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2188 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2190 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2194 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2186);
    float _2196 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2188);
    float _2198 = _1254 + _2190;
    float _2200 = _1248 + _2192;
    float _2202 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2176);
    float _2204 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2208 = _2198 + _2206;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2212 = _2200 + _2210;
    float _2214 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2216 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2218 = _2208 * _2208;
    float _2220 = _948 + _2214;
    float _2222 = -_2072;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2170);
    float _2226 = fma(_2212, _2212, _2218);
    float _2228 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2162);
    float _2230 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2180);
    float _2232 = sqrt(_2226);
    float _2234 = (*spvDescriptorSet0.vp_c10)._m0[8].w + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2236 = -_2100;
    float _2238 = _2220 + _2236;
    float _2240 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2216);
    float _2242 = (*spvDescriptorSet0.vp_c10)._m0[10].w + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2244 = -_2234;
    float _2246 = _2200 + _2244;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2116);
    float _2252 = -_2242;
    float _2254 = _2198 + _2252;
    float _2256 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    float _2258 = fma(_2246, _2246, _2248);
    float _2260 = fma(_2204, _2204, 1.0);
    float _2262 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2132);
    float _2264 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2134);
    float _2266 = fma(_2254, _2254, _2258);
    float _2268 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2196);
    bool _2270 = _2232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = rsqrt(_2260);
    float _2274 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2276 = _2204 * _2228;
    float _2278 = _2204 * _2230;
    float _2280 = _2204 * _2256;
    float _2282 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2194);
    float _2284 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2240);
    float _2286 = fma(_2274, _2250, _2276);
    float _2288 = rsqrt(_2266);
    float _2290 = fma(_2274, _2262, _2278);
    float _2292 = fma(_2274, _2264, _2280);
    bool _2294 = !_2270;
    float _2296 = _2220;
    float _2298 = _2200;
    float _2300 = _2198;
    if (!_2294)
    {
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2306 = _2232 + _2304;
        float _2308 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2310 = rsqrt(_2226);
        float _2312 = _2306 * _2302;
        float _2314 = _2312 * 0.15915493667125701904296875;
        float _2316 = _2314 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = _2314 * 6.283185482025146484375;
        float _2322 = sin(_2320);
        float _2324 = _2318 + (-1.0);
        float _2326 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2328 = fma(_2322, _2308, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2330 = fma(_2220, _2318, _2326);
        float _2332 = _2310 * _2328;
        float _2334 = fma(_2212, _2332, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2336 = fma(_2208, _2332, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2296 = _2330;
        _2298 = _2334;
        _2300 = _2336;
    }
    float _2338 = _2296;
    float _2340 = _2298;
    float _2342 = _2300;
    float _2344 = -_948;
    float _2346 = _2344 + _2338;
    float _2348 = -_1248;
    float _2350 = _2348 + _2340;
    float _2352 = _2204 * _2272;
    float _2354 = -_1254;
    float _2356 = _2354 + _2342;
    float _2358 = _2346 * _2346;
    float _2360 = _2282 + _2286;
    float _2362 = _2268 + _2290;
    float _2364 = -_2282;
    float _2366 = _2352 * _2364;
    float _2368 = fma(_2350, _2350, _2358);
    float _2370 = -_2268;
    float _2372 = _2352 * _2370;
    float _2374 = -_2284;
    float _2376 = _2352 * _2374;
    float _2378 = _2284 + _2292;
    float _2380 = fma(_2356, _2356, _2368);
    float _2382 = _2246 * _2288;
    float _2384 = _2238 * _2288;
    float _2386 = _2254 * _2288;
    float _2388 = fma(_2272, _2228, _2366);
    float _2390 = sqrt(_2380);
    float _2392 = -_2382;
    float _2394 = _2360 + _2392;
    float _2396 = -_2384;
    float _2398 = _2362 + _2396;
    float _2400 = -_2386;
    float _2402 = _2378 + _2400;
    float _2404 = fma(_2272, _2230, _2372);
    float _2406 = fma(_2272, _2256, _2376);
    float _2408 = fma(_2394, 0.5, _2382);
    float _2410 = fma(_2398, 0.5, _2384);
    float _2412 = fma(_2402, 0.5, _2386);
    out.m_60.x = _659;
    out.m_60.y = _661;
    out.m_60.z = _663;
    out.m_60.w = _665;
    out.m_66.x = _1954;
    out.m_66.y = _1956;
    out.m_66.z = _1958;
    out.m_66.w = _1746;
    bool _2414 = _2390 > 0.0;
    out.m_70.x = _2250;
    out.m_70.y = _2262;
    out.m_70.z = _2264;
    out.m_72.x = _2388;
    out.m_72.y = _2404;
    out.m_72.z = _2406;
    out.m_74.x = _2408;
    out.m_74.y = _2410;
    out.m_74.z = _2412;
    bool _2416 = !_2414;
    float _2418 = _2338;
    float _2420 = _2342;
    float _2422 = _2340;
    if (!_2416)
    {
        bool _2424 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2426 = _665;
        if (_2424)
        {
            float _2428 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2426 = _2428;
        }
        float _2430 = _2426;
        float _2432 = _2430;
        if (_2424)
        {
            float _2434 = _453 * _2430;
            _669 = _2434;
        }
        float _2436 = _669;
        float _2438 = _2436;
        if (_2424)
        {
            float _2440 = _455 * _2430;
            _671 = _2440;
        }
        float _2442 = _671;
        float _2444 = _2442;
        if (_2424)
        {
            float _2446 = _457 * _2430;
            _2432 = _2446;
        }
        float _2448 = _2432;
        float _2450 = _2448;
        if (!_2424)
        {
            float _2452 = _129 + 1.0;
            if (!_175)
            {
                float _2454 = _2452 * _2452;
                float _2456 = _2454 * 0.5;
                _153 = _2456;
            }
            float _2458 = _153;
            float _2460 = _2458;
            if (!_175)
            {
                float _2462 = _2458 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2460 = _2462;
            }
            float _2464 = _2460;
            bool _2466 = !_175;
            float _2468 = _2464;
            if (!_2466)
            {
                float _2470 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2472 = log2(_2470);
                float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2476 = _2474 + 1.0;
                float _2478 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2480 = _2472 * _2452;
                float _2482 = 1.0 / _2476;
                float _2484 = _2478 * 0.693147182464599609375;
                float _2486 = exp2(_2480);
                float _2488 = 1.0 / _2484;
                float _2490 = _2486 + (-1.0);
                float _2492 = -_2490;
                float _2494 = fma(_2492, _2488, _2452);
                float _2496 = _2494 * _2482;
                float _2498 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2468 = _2498;
            }
            float _2500 = _2468;
            float _2502 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2504 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2506 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2508 = _2500;
            if (!_175)
            {
                _2508 = _2452;
            }
            float _2510 = _2508;
            float _2512 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2514 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2516 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2518 = fma(_2504, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2512);
            float _2520 = fma(_2504, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2514);
            float _2522 = fma(_2506, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2518);
            bool _2524 = !_175;
            float _2526 = _2510;
            _1966 = _2520;
            _1968 = _2522;
            if (!_2524)
            {
                float _2528 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2530 = log2(_2528);
                float _2532 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2534 = _2532 + 1.0;
                float _2536 = 1.0 / _2534;
                float _2538 = _2530 * _2452;
                float _2540 = exp2(_2538);
                float _2542 = -_2540;
                float _2544 = _2542 + 1.0;
                float _2546 = _2544 * _2536;
                _2526 = _2546;
            }
            float _2548 = _2526;
            float _2550 = fma(_2504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2516);
            float _2552 = fma(_2506, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2520);
            float _2554 = fma(_2548, _179, _2522);
            float _2556 = fma(_2506, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2550);
            float _2558 = fma(_2548, _177, _2552);
            float _2560 = -_415;
            float _2562 = _2560 + _2554;
            float _2564 = fma(_2548, _181, _2556);
            float _2566 = -_417;
            float _2568 = _2566 + _2558;
            float _2570 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2572 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2574 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2576 = -_427;
            float _2578 = _2576 + _2564;
            float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2570);
            float _2582 = fma(_2568, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2572);
            float _2584 = fma(_2568, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2574);
            float _2586 = fma(_2578, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2580);
            float _2588 = fma(_2578, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2582);
            float _2590 = fma(_2578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2584);
            _461 = _2588;
            _463 = _2586;
            _465 = _2590;
            _2438 = _2586;
            _2444 = _2588;
            _2450 = _2590;
        }
        float _2592 = _461;
        float _2594 = _463;
        float _2596 = _465;
        float _2598 = _2438;
        float _2600 = _2444;
        float _2602 = _2450;
        float _2604 = _1966;
        float _2606 = _1968;
        float _2608 = _2592 * _2592;
        float _2610 = rsqrt(_2380);
        float _2612 = fma(_2594, _2594, _2608);
        float _2614 = fma(_2596, _2596, _2612);
        float _2616 = sqrt(_2614);
        float _2618 = _2350 * _2610;
        float _2620 = _2346 * _2610;
        float _2622 = _2356 * _2610;
        bool _2624 = _2616 > 0.0;
        bool _2626 = !_2624;
        _1970 = _2604;
        _1972 = _2606;
        if (!_2626)
        {
            float _2628 = rsqrt(_2614);
            float _2630 = _2628 * _2592;
            float _2632 = _2628 * _2594;
            float _2634 = _2628 * _2596;
            float _2636 = _2620 * _2630;
            float _2638 = fma(_2618, _2632, _2636);
            float _2640 = fma(_2622, _2634, _2638);
            float _2642 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2644 = fma(_2598, _2642, _2340);
            float _2646 = fma(_2600, _2642, _2338);
            float _2648 = fma(_2602, _2642, _2342);
            _2418 = _2646;
            _2420 = _2648;
            _2422 = _2644;
        }
    }
    float _2650 = _2418;
    float _2652 = _2420;
    float _2654 = _2422;
    float _2656 = _1970;
    float _2658 = _1972;
    float _2660 = -_1744;
    float _2662 = _2660 + _2650;
    float _2664 = -_1762;
    float _2666 = _2664 + _2652;
    bool _2668 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2672 = _2668 || _2670;
    bool _2674 = isnan(0.5);
    bool _2676 = _2672 || _2674;
    float _2678 = -_1756;
    float _2680 = _2678 + _2654;
    float _2682 = _2662;
    float _2684 = _2680;
    float _2686 = _2666;
    float _2688 = _2658;
    if (!_2676)
    {
        float _2690 = _1988 * _1988;
        float _2692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2694 = -_948;
        float _2696 = _2694 + _2650;
        float _2698 = -_1254;
        float _2700 = _2698 + _2652;
        float _2702 = fma(_1996, _1996, _2690);
        float _2704 = fma(_2004, _2004, _2702);
        float _2706 = 1.0 / _1906;
        float _2708 = sqrt(_2704);
        float _2710 = precise::min(_2708, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2712 = _2710 * _2692;
        float _2714 = -_1248;
        float _2716 = _2714 + _2654;
        float _2718 = _2712 * _2706;
        float _2720 = fma(_2716, _2718, _1982);
        float _2722 = fma(_2696, _2718, _1976);
        float _2724 = fma(_2700, _2718, _1992);
        _2682 = _2722;
        _2684 = _2720;
        _2686 = _2724;
        _1298 = _2700;
    }
    float _2726 = _2682;
    float _2728 = _2684;
    float _2730 = _2686;
    float _2732 = _1298;
    float _2734 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2736 = _2726 + _2734;
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2740 = _2728 + _2738;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2744 = _2730 + _2742;
    float _2746 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2748 = _2736 * _2736;
    float _2750 = fma(_2740, _2740, _2748);
    float _2752 = fma(_2744, _2744, _2750);
    float _2754 = rsqrt(_2752);
    float _2756 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2758 = _2740 * _2756;
    float _2760 = _2744 * _2756;
    float _2762 = _2758 * _2758;
    float _2764 = _2760 * _2760;
    float _2766 = _2762 + _2764;
    float _2768 = sqrt(_2766);
    bool _2770 = _2768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2774 = _2768 + _2772;
    float _2776 = _2656;
    float _2778 = _2766;
    float _2780 = _2774;
    float _2782 = _2736;
    float _2784 = _2732;
    float _2786 = _2758;
    if (_2770)
    {
        float _2788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2776 = _2788;
    }
    float _2790 = _2776;
    if (_2770)
    {
        float _2792 = rsqrt(_2766);
        _2778 = _2792;
    }
    float _2794 = _2778;
    float _2796 = _2794;
    if (_2770)
    {
        float _2798 = _2774 * _2790;
        _2780 = _2798;
    }
    float _2800 = _2780;
    if (_2770)
    {
        float _2802 = _2800 * 0.15915493667125701904296875;
        _2688 = _2802;
    }
    float _2804 = _2688;
    float _2806 = _2744;
    if (_2770)
    {
        float _2808 = _2804 * 6.283185482025146484375;
        float _2810 = sin(_2808);
        _2806 = _2810;
    }
    float _2812 = _2806;
    float _2814 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2816 = precise::max(0.0, _2814);
    float _2818 = _2790;
    if (_2770)
    {
        float _2820 = _2804 * 6.283185482025146484375;
        float _2822 = cos(_2820);
        _2818 = _2822;
    }
    float _2824 = _2818;
    float _2826 = -_2756;
    float _2828 = -_2816;
    float _2830 = fma(_2736, _2826, _2828);
    if (_2770)
    {
        float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2832;
    }
    float _2834 = _2782;
    float _2836 = sqrt(_2752);
    float _2838 = _2812;
    float _2840 = _2834;
    if (_2770)
    {
        float _2842 = fma(_2812, _2834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2838 = _2842;
    }
    float _2844 = _2838;
    float _2846 = _2844;
    float _2848 = _2824;
    if (_2770)
    {
        float _2850 = _2824 + (-1.0);
        _2840 = _2850;
    }
    float _2852 = _2840;
    float _2854 = _2852;
    if (_2770)
    {
        float _2856 = _2794 * _2844;
        _2784 = _2856;
    }
    float _2858 = _2784;
    if (!_2770)
    {
        _2846 = _2830;
    }
    float _2860 = _2846;
    float _2862 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2864 = _2860;
    if (_2770)
    {
        float _2866 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1752 = _2866;
    }
    float _2868 = _1752;
    if (_2770)
    {
        float _2870 = _2758 * _2858;
        _2786 = _2870;
    }
    float _2872 = _2786;
    if (!_2770)
    {
        _2854 = _2760;
    }
    float _2874 = _2854;
    float _2876 = _2874;
    if (_2770)
    {
        float _2878 = _2760 * _2858;
        _2876 = _2878;
    }
    float _2880 = _2876;
    if (!_2770)
    {
        _2796 = _2762;
    }
    float _2882 = _2796;
    float _2884 = _2882;
    if (_2770)
    {
        float _2886 = fma(_2830, _2824, _2868);
        _2864 = _2886;
    }
    float _2888 = _2864;
    if (_2770)
    {
        float _2890 = _2872 * _2872;
        _2884 = _2890;
    }
    float _2892 = _2884;
    if (!_2770)
    {
        _2848 = _2764;
    }
    float _2894 = _2848;
    float _2896 = _2894;
    if (_2770)
    {
        float _2898 = _2880 * _2880;
        _2896 = _2898;
    }
    float _2900 = _2896;
    float _2902 = fma(_2888, _2888, _2892);
    float _2904 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2862);
    float _2906 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2908 = _2902 + _2900;
    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2912 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2910);
    float _2914 = precise::clamp(_2912, 0.0, 1.0);
    float _2916 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2918 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2904);
    float _2920 = rsqrt(_2908);
    float _2922 = -_2914;
    float _2924 = _2922 + 1.0;
    float _2926 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2928 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2916);
    float _2930 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2932 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2906);
    float _2934 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2926);
    float _2936 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2928);
    float _2938 = abs(_2924);
    float _2940 = log2(_2938);
    float _2942 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2944 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2934);
    float _2946 = _2936 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2948 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2932);
    float _2950 = -_2942;
    float _2952 = fma(_2950, _2746, 1.0);
    float _2954 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2956 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2958 = _2920 * _2872;
    float _2960 = _2920 * _2888;
    float _2962 = _2920 * _2880;
    float _2964 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2956);
    float _2966 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2968 = _2948 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = log2(_2952);
    float _2972 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2964);
    float _2974 = -_2966;
    float _2976 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2974);
    float _2978 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2980 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2982 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2972);
    float _2984 = -_2962;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2976);
    float _2988 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2990 = exp2(_2978);
    float _2992 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2980);
    float _2994 = fma(_2986, -0.5, 0.5);
    float _2996 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2988);
    float _2998 = fma(_2986, 0.5, 0.5);
    float _3000 = _2960 + 1.0;
    float _3002 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2992);
    float _3004 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2996);
    float _3006 = 1.0 / _2982;
    float _3008 = fma(_2998, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3010 = _2970 * 0.693147182464599609375;
    float _3012 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3004);
    float _3014 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3016 = sqrt(_2994);
    float _3018 = -_2960;
    float _3020 = fma(_2990, _3000, _3018);
    float _3022 = fma(_2998, _3008, -0.212114393711090087890625);
    float _3024 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3002);
    float _3026 = fma(_3020, 0.5, 0.5);
    float _3028 = fma(_2998, _3022, 1.570728778839111328125);
    float _3030 = _3012 * _3006;
    float _3032 = _3024 * _3006;
    float _3034 = fma(_3030, 0.5, 0.5);
    float _3036 = fma(_3032, -0.5, 0.5);
    float _3038 = _3016 * 0.636619746685028076171875;
    float3 _8120 = float3(_3034, _3036, _3014);
    float _3040 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8120, float3(0.0), isnan(_8120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8120, float3(0.0), isnan(_8120)), level(0.0)).x;
    float3 _8131 = float3(_3034, _3036, _3014);
    float4 _3043 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8131, float3(0.0), isnan(_8131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8131, float3(0.0), isnan(_8131)), level(0.0)).xyzw;
    float _3045 = _3043.x;
    float _3047 = _3043.y;
    float _3049 = _3043.z;
    float _3051 = _3043.w;
    float _3053 = -_3028;
    float _3055 = fma(_3038, _3053, 1.0);
    float2 _8153 = float2(_3055, _3026);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8153, float2(0.0), isnan(_8153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8153, float2(0.0), isnan(_8153)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3069 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_76.x = _2728;
    out.m_76.y = _2726;
    out.m_76.z = _2730;
    bool _3071 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3073 = isnan(_2836);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3079 = _3075 || _3077;
    float _3081 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3067);
    float _3083 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3085 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3069);
    float _3087 = _3012 + _2982;
    float _3089 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3081);
    float _3091 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3083);
    float _3093 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3085);
    float _3095 = _3089 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3097 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3091);
    float _3099 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3093);
    float _3101 = 1.0 / _3095;
    bool _3103 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3105 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3107 = _3103 || _3105;
    bool _3109 = isnan(0.5);
    bool _3111 = _3107 || _3109;
    float _3113 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3115 = _3097 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3117 = _3087 * 0.5;
    out.gl_Position.x = _3012;
    out.gl_Position.y = _3024;
    out.gl_Position.z = _3099;
    out.gl_Position.w = _2982;
    float _3119 = _3115 + _3095;
    float _3121 = exp2(_3113);
    float _3123 = _2940;
    float _3125 = _3095;
    float _3127 = _3085;
    float _3129 = _2982;
    float _3131 = _3099;
    float _3133 = _3012;
    if (!_3111)
    {
        _3123 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3135 = _3123;
    float _3137 = _3119 * _3101;
    float _3139 = _3137 * 0.5;
    float _3141 = _3099 + _2982;
    if (!_3111)
    {
        _3125 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3143 = _3125;
    if (!_3111)
    {
        float _3145 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3147 = fma(_3139, _3135, _3145);
        _3127 = _3147;
    }
    float _3149 = _3127;
    float _3151 = _2982 * 0.5;
    float _3153 = _3141 * 0.5;
    if (_3111)
    {
        _3129 = 1.0;
    }
    float _3155 = _3129;
    float _3157 = -_3121;
    float _3159 = _3157 + 1.0;
    float _3161 = fma(_3024, -0.5, _3151);
    float _3163 = _3149;
    float _3165 = _3155;
    if (!_3111)
    {
        float _3167 = 1.0 / _3149;
        _3163 = _3167;
    }
    float _3169 = _3163;
    if (!_3079)
    {
        _3131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3171 = _3131;
    float _3173 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3175 = _3171;
    float _3177 = _3171;
    if (!_3079)
    {
        _3133 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3179 = _3133;
    out.m_78.x = _3117;
    out.m_78.y = _3161;
    out.m_78.z = _3153;
    out.m_78.w = _2982;
    float _3181 = -_3173;
    float _3183 = _3181 + 1.0;
    float _3185 = _3173 * _3040;
    float _3187 = _3051 * _3185;
    float _3189 = _3051 * _3183;
    float _3191 = _3065 * _3185;
    float _3193 = fma(_3061, _3187, _3045);
    float _3195 = fma(_3063, _3187, _3047);
    float _3197 = _3061;
    float _3199 = _3045;
    float _3201 = _3179;
    float _3203 = _3179;
    if (!_3111)
    {
        float _3205 = -_3143;
        float _3207 = _3205 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3197 = _3207;
    }
    float _3209 = _3197;
    float _3211 = fma(_3051, _3191, _3049);
    if (!_3111)
    {
        float _3213 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3215 = -_3143;
        float _3217 = fma(_3169, _3213, _3215);
        _3199 = _3217;
    }
    float _3219 = _3199;
    float _3221 = _3024;
    if (!_3111)
    {
        float _3223 = 1.0 / _3209;
        _3221 = _3223;
    }
    float _3225 = _3221;
    out.m_80.x = _3193;
    out.m_80.y = _3195;
    out.m_80.z = _3211;
    out.m_80.w = _3189;
    float _3227 = _3225;
    if (!_3111)
    {
        float _3229 = _3219 * _3225;
        float _3231 = precise::clamp(_3229, 0.0, 1.0);
        _3165 = _3231;
    }
    float _3233 = _3165;
    if (!_3079)
    {
        _3227 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3235 = _3227;
    float _3237 = _3233 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3239 = !_3079;
    float _3241 = _3235;
    float _3243 = _3235;
    if (!_3239)
    {
        bool _3245 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3247 = isnan(_2836);
        bool _3249 = _3245 || _3247;
        bool _3251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3253 = _3249 || _3251;
        if (!_3253)
        {
            float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3257 = _2836 + _3255;
            float _3259 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3261 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3259;
            float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3271 = 1.0 / _3261;
            float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3277 = _3257 * _3271;
            float _3279 = precise::clamp(_3277, 0.0, 1.0);
            float _3281 = fma(_3279, _3265, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3283 = fma(_3279, _3269, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3285 = fma(_3279, _3275, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3243 = _3283;
            _3177 = _3281;
            _3203 = _3285;
            _3287 = true;
        }
        else
        {
            bool _3289 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3291 = isnan(_2836);
            bool _3293 = _3289 || _3291;
            bool _3295 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3297 = _3293 || _3295;
            if (!_3297)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3299 = _3175;
            _3177 = _3299;
            if (!_3297)
            {
                _3241 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3301 = _3241;
            _3243 = _3301;
            if (!_3297)
            {
                _3201 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3303 = _3201;
            bool _3305 = !_3297;
            _3203 = _3303;
            if (!_3305)
            {
                bool _3307 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3309 = isnan(_2836);
                bool _3311 = _3307 || _3309;
                bool _3313 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3315 = _3311 || _3313;
                if (!_3315)
                {
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3319 = _2836 + _3317;
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3323 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3321;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3333 = 1.0 / _3323;
                    float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3339 = _3319 * _3333;
                    float _3341 = precise::clamp(_3339, 0.0, 1.0);
                    float _3343 = fma(_3341, _3327, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3345 = fma(_3341, _3331, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3347 = fma(_3341, _3337, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3243 = _3345;
                    _3177 = _3343;
                    _3203 = _3347;
                    _3287 = true;
                }
                else
                {
                    _3243 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3203 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3287 = false;
    float _3349 = _3243;
    float _3351 = _3177;
    float _3353 = _3203;
    float _3355 = _3237 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_82.x = 0.0;
    float _3357 = _3349 * 0.586610972881317138671875;
    bool _3359 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3355;
    float _3361 = fma(_3351, 0.298911988735198974609375, _3357);
    bool _3363 = _3233 > 0.0;
    bool _3365 = isnan(_3233);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = fma(_3353, 0.114477999508380889892578125, _3361);
    float _3375 = -_3373;
    float _3377 = _3375 + _3351;
    float _3379 = -_3373;
    float _3381 = _3379 + _3349;
    float _3383 = -_3373;
    float _3385 = _3383 + _3353;
    float _3387 = fma(_3377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3373);
    float _3389 = fma(_3381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3373);
    float _3391 = fma(_3385, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3373);
    bool _3393 = !_3359;
    if (!_3393)
    {
        float _3395 = -_2726;
        float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3399 = -_2728;
        float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3403 = -_2730;
        float _3405 = _3403 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3407 = _3397 * _3397;
        float _3409 = fma(_3401, _3401, _3407);
        float _3411 = fma(_3405, _3405, _3409);
        float _3413 = sqrt(_3411);
        float _3415 = rsqrt(_3411);
        float _3417 = -_3413;
        float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3421 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3423 = precise::clamp(_3421, 0.0, 1.0);
        float _3425 = _3401 * _3415;
        float _3427 = _3397 * _3415;
        float _3429 = abs(_3423);
        float _3431 = log2(_3429);
        float _3433 = _3405 * _3415;
        float _3435 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3437 = _2410 * _3427;
        float _3439 = -_3427;
        float _3441 = -_3435;
        float _3443 = fma(_3439, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3441);
        float _3445 = fma(_2408, _3425, _3437);
        float _3447 = -_3433;
        float _3449 = fma(_3447, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3443);
        float _3451 = fma(_2412, _3433, _3445);
        float _3453 = precise::clamp(_3451, 0.0, 1.0);
        float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3457 = _3449 + _3455;
        float _3459 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3461 = _3457 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3463 = precise::clamp(_3461, 0.0, 1.0);
        float _3465 = exp2(_3459);
        float _3467 = _3465 * _3463;
        float _3469 = _3453 * _3467;
        float _3471 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3473 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3475 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3471;
        out.m_82.y = _3473;
        out.m_82.z = _3475;
    }
    out.m_84.x = _3387;
    out.m_84.y = _3389;
    out.m_84.z = _3391;
    if (_3371)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3477 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3477;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

