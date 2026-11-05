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
    float4 m_64 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_76 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
    float4 m_62 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _707 = false;
    bool _595 = false;
    bool _421 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3246 = as_type<float>(_111);
        out.gl_Position.z = _3246;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3316 = as_type<float>(_149);
        out.gl_Position.z = _3316;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_49.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = in.m_54.x;
    float _161 = in.m_54.y;
    float _163 = in.m_54.z;
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    float _177 = _155 * _153;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    int _187 = as_type<int>(_157) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_157) & 2;
    bool _193 = _191 != 0;
    float _195 = _185 * 6.283185482025146484375;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = floor(_185);
    float _203 = _195 * 0.15915493667125701904296875;
    bool _205 = !_193;
    float _207 = _205 ? (-0.5) : 0.5;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _215 = _213 != 0;
    float _217 = _161 * _167;
    bool _219 = !_199;
    int _221 = _219 ? 0 : 1;
    float _223 = _203 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = _161 * _173;
    bool _229 = !_211;
    int _231 = _229 ? 0 : 1;
    float _233 = fma(_159, _165, _217);
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _237 = _161 * _181;
    int _239 = abs(_231);
    float _241 = fma(_159, _171, _227);
    int _243 = abs(_221);
    float _245 = fma(_159, _179, _237);
    float _247 = -_201;
    float _249 = _185 + _247;
    bool _251 = !_215;
    int _253 = _251 ? 0 : 1;
    float _255 = fma(_163, _175, _241);
    float _257 = float(_239);
    float _259 = -_249;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _263 = abs(_253);
    float _265 = fma(_225, 0.5, 0.5);
    bool _267 = _249 < 0.5;
    float _269 = float(_267);
    float _271 = abs(_261);
    float _273 = _257 * _271;
    float _275 = float(_243);
    float _277 = -_265;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _281 = -_269;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = fma(_163, _169, _233);
    float _287 = fma(_275, _279, _273);
    float _289 = float(_263);
    float _291 = fma(_163, _183, _245);
    bool _293 = !_189;
    float _295 = _293 ? (-0.5) : 0.5;
    float _297 = abs(_283);
    float _299 = fma(_289, _297, _287);
    bool _301 = !_235;
    float _303 = _179;
    float _319;
    if (!_301)
    {
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_95);
        float _325 = 1.0 / _323;
        float _327 = _129 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = _329 + _331;
    bool _335 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_329);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _347;
    float _351 = -_345;
    float _353 = _351 + 1.0;
    bool _355 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _357 = isnan(_329);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _373 = 1.0 / _349;
    float _375 = _365 * _353;
    float _377 = -_365;
    float _379 = _377 + 1.0;
    float _381 = _333 * _373;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = fma(_369, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _389 = fma(_385, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = _387 * _375;
    float _393 = _389 * _375;
    float _395 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].x, _391);
    float _397 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].y, _393);
    float _399 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[144].x, _395);
    float _401 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[144].y, _397);
    bool _403 = !_371;
    float _419;
    if (!_403)
    {
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_95);
        float _425 = 1.0 / _423;
        float _427 = _129 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_62.x;
    float _433 = in.m_62.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = _429 + _435;
    bool _439 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _441 = isnan(_429);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _457 = 1.0 / _453;
    float _459 = _401 * _433;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _467 = _429 + _465;
    float _469 = _399 * _431;
    float _471 = _437 * _457;
    bool _473 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _475 = isnan(_429);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = 1.0 / _463;
    bool _487 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _489 = isnan(_429);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _499;
    float _503 = -_483;
    float _505 = _503 + 1.0;
    float _507 = -_497;
    float _509 = _507 + 1.0;
    float _511 = fma(_501, _471, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _513 = _497 * _505;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _519;
    float _523 = _449 * _509;
    float _525 = -_449;
    float _527 = _525 + 1.0;
    float _529 = fma(_517, _471, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _531 = fma(_521, _471, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _533 = _511 * _523;
    float _535 = _467 * _485;
    float _537 = _529 * _523;
    float _539 = _531 * _523;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _553 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].x, _537);
    float _555 = fma(_543, _535, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _557 = fma(_547, _535, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _559 = fma(_551, _535, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _561 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].y, _533);
    float _563 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].z, _539);
    float _565 = fma(_555, _513, _553);
    float _567 = fma(_557, _513, _561);
    float _569 = fma(_559, _513, _563);
    float _571 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[109].x, _565);
    float _573 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[109].y, _567);
    float _575 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[109].z, _569);
    bool _577 = !_455;
    float _593;
    if (!_577)
    {
        float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _581 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _585 = _583 * _579;
        float _587 = floor(_585);
        float _589 = -_587;
        float _591 = _585 + _589;
        _593 = _591;
        _595 = true;
    }
    else
    {
        float _597 = float(_95);
        float _599 = 1.0 / _597;
        float _601 = _129 * _599;
        _593 = _601;
    }
    _595 = false;
    float _603 = _593;
    bool _605 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _607 = isnan(_603);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _621 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_603);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _639 = _603 + _637;
    float _641 = -_615;
    float _643 = _641 + 1.0;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _647 = 1.0 / _619;
    float _649 = _631 * _643;
    float _651 = -_631;
    float _653 = _651 + 1.0;
    float _655 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = _635 * _647;
    float _659 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _661 = fma(_657, _639, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _663 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _665 = _661 * _649;
    float _667 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[115].x, _665);
    float _669 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[116].x, _667);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _671;
    out.m_64.y = _673;
    out.m_64.z = _675;
    out.m_64.w = _677;
    bool _679 = !_645;
    float _701;
    float _703;
    float _705;
    if (!_679)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _683 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _685 = float(_95);
        float _687 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _689 = 1.0 / _685;
        float _691 = _687 * _681;
        float _693 = floor(_691);
        float _695 = _129 * _689;
        float _697 = -_693;
        float _699 = _691 + _697;
        _701 = _695;
        _703 = _685;
        _705 = _699;
        _707 = true;
    }
    else
    {
        float _709 = float(_95);
        float _711 = 1.0 / _709;
        float _713 = _129 * _711;
        _701 = _713;
        _703 = _709;
        _705 = _713;
    }
    _707 = false;
    float _715 = _701;
    float _717 = _703;
    float _719 = _705;
    float _721 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _723 = int(_721);
    float _725 = in.m_49.y;
    float _727 = in.m_49.w;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _731 = _729 != 0;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _735 = int(_733);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = float(_723);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _749 = 1.0 / _743;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _755 = float(uint(_735));
    float _757 = _725 * 2.0;
    bool _759 = !_731;
    float _761 = _759 ? _725 : _151;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _767 = 1.0 / _755;
    int _769 = ~_735;
    int _771 = _769 + 1;
    int _773 = ~_735;
    int _775 = _773 + 1;
    bool _777 = _735 == 0;
    float _779 = _749 * _129;
    float _781 = float(_735);
    float _783 = 1.0 / _741;
    bool _785 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _787 = isnan(_715);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    int _797 = as_type<int>(_767) + (-2);
    float _799 = trunc(_779);
    int _801 = int(_799);
    bool _803 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _805 = isnan(_715);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = 1.0 / _747;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _819 = float(uint(_801));
    float _821 = floor(_757);
    float _823 = float(_801);
    float _825 = as_type<float>(_797) * _819;
    bool _827 = _823 >= _781;
    bool _829 = isnan(_823);
    bool _831 = _827 || _829;
    bool _833 = isnan(_781);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = 1.0 / _753;
    float _841 = trunc(_825);
    float _843 = precise::max(_841, 0.0);
    uint _846 = uint(_843);
    float _848 = trunc(_837);
    int _850 = int(_848);
    int _852 = _771 * int(_846);
    int _854 = _852 + _801;
    float _856 = 1.0 / _765;
    float _858 = float(uint(_854));
    float _860 = as_type<float>(_797) * _858;
    float _862 = trunc(_860);
    float _864 = precise::max(_862, 0.0);
    uint _866 = uint(_864);
    bool _868 = !_731;
    float _870 = _868 ? 1.2345600128173828125 : 1.0;
    float _872 = _870 * _761;
    float _874 = floor(_872);
    int _876 = int(_846) + int(_866);
    int _878 = _775 * _876;
    int _880 = _878 + _801;
    float _882 = -_874;
    float _884 = _872 + _882;
    bool _886 = uint(_880) >= uint(_735);
    float _888 = _884 * _781;
    float _890 = 1.0 / _717;
    float _892 = _781 * _129;
    bool _894 = !_886;
    int _896 = _894 ? 0 : (-1);
    int _898 = ~_850;
    int _900 = _898 + 1;
    int _902 = _900 + 1;
    int _904 = ~_876;
    int _906 = _904 + _896;
    int _908 = _906 + 1;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _924 = _922 != 0;
    float _926 = trunc(_888);
    int _928 = int(_926);
    int _930 = _735 + (-1);
    int _932 = _735 * _908;
    int _934 = _932 + _801;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _938 = _936 != 0;
    bool _940 = !_777;
    int _942 = _940 ? _934 : (-1);
    float _944 = _892 * _890;
    bool _946 = !_916;
    int _948 = _946 ? 0 : 1;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _954 = !_938;
    int _956 = _954 ? 0 : 1;
    int _958 = _942 * _902;
    int _960 = abs(_948);
    float _962 = trunc(_944);
    int _964 = int(_962);
    bool _966 = !_920;
    int _968 = _966 ? 0 : 1;
    int _970 = _850 * _930;
    int _972 = _970 + _958;
    bool _974 = !_912;
    int _976 = _974 ? 0 : 1;
    int _978 = abs(_968);
    int _980 = _972 * _960;
    int _982 = abs(_976);
    float _984 = 1.0 / _952;
    bool _986 = !_924;
    int _988 = _986 ? 0 : 1;
    int _990 = abs(_956);
    int _992 = abs(_988);
    int _994 = _928 * _990;
    int _996 = _994 + _801;
    int _998 = _964 * _982;
    int _1000 = _998 + _980;
    int _1002 = ~_735;
    int _1004 = _1002 + 1;
    int _1006 = _996 * _978;
    int _1008 = _1006 + _1000;
    float _1010 = float(uint(_996));
    int _1012 = ~_735;
    int _1014 = _1012 + 1;
    int _1016 = _928 * _992;
    int _1018 = _1016 + _1008;
    int _1020 = ~_735;
    int _1022 = _1020 + 1;
    float _1024 = as_type<float>(_797) * _1010;
    float _1026 = float(uint(_1018));
    float _1028 = trunc(_1024);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = as_type<float>(_797) * _1026;
    float _1036 = trunc(_1034);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    int _1042 = _1004 * int(_1032);
    int _1044 = _1042 + _996;
    float _1046 = float(uint(_1044));
    int _1048 = _1022 * int(_1040);
    int _1050 = _1048 + _1018;
    float _1052 = float(uint(_1050));
    float _1054 = as_type<float>(_797) * _1052;
    float _1056 = trunc(_1054);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    int _1062 = int(_1040) + int(_1060);
    int _1064 = _1014 * _1062;
    int _1066 = _1064 + _1018;
    float _1068 = as_type<float>(_797) * _1046;
    bool _1070 = uint(_1066) >= uint(_735);
    float _1072 = trunc(_1068);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    bool _1078 = !_1070;
    int _1080 = _1078 ? 0 : (-1);
    int _1082 = ~_1062;
    int _1084 = _1082 + _1080;
    int _1086 = _1084 + 1;
    int _1088 = ~_735;
    int _1090 = _1088 + 1;
    int _1092 = _735 * _1086;
    int _1094 = _1092 + _1018;
    bool _1096 = !_777;
    int _1098 = _1096 ? _1094 : (-1);
    int _1100 = int(_1032) + int(_1076);
    int _1102 = _1098 & 3;
    bool _1104 = _1102 != 0;
    int _1106 = _1098 & 3;
    bool _1108 = _1106 != 0;
    int _1110 = _1090 * _1100;
    int _1112 = _1110 + _996;
    bool _1114 = uint(_1102) > 1u;
    int _1116 = _1108 ? 0 : 1;
    bool _1118 = uint(_1112) >= uint(_735);
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1122 = _1120 != 0;
    bool _1124 = !_1118;
    int _1126 = _1124 ? 0 : (-1);
    int _1128 = ~_1116;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    bool _1134 = !_1122;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _1132;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_1114)
    {
        int _1142 = ~_1116;
        int _1144 = _1142 + 1;
        _1138 = _1144;
    }
    int _1146 = _1138;
    int _1148 = ~_1100;
    int _1150 = _1148 + _1126;
    int _1152 = _1150 + 1;
    bool _1154 = uint(_1102) >= 2u;
    bool _1156 = _1102 != 3;
    int _1158 = _735 * _1152;
    int _1160 = _1158 + _996;
    int _1162 = _1154 ? 0 : 1;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1174 = _1172 != 0;
    float _1176 = _151 * 2.0;
    bool _1178 = _1102 != 3;
    float _1180 = in.m_42.x;
    float _1182 = in.m_42.y;
    float _1184 = in.m_42.z;
    int _1186 = ~_1162;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    bool _1192 = !_1104;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = floor(_1176);
    int _1198 = _1190;
    if (_1156)
    {
        int _1200 = ~_1162;
        int _1202 = _1200 + 1;
        _1198 = _1202;
    }
    int _1204 = _1198;
    float _1206 = in.m_49.z;
    bool _1208 = _151 > 0.5;
    bool _1210 = _735 == 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1214 = _1212 != 0;
    float _1216 = -_295;
    int _1218 = _1208 ? as_type<int>(_1216) : as_type<int>(_295);
    bool _1220 = _725 > 0.5;
    bool _1222 = !_1210;
    int _1224 = _1222 ? _1160 : (-1);
    bool _1226 = !_1214;
    float _1228 = _1226 ? _295 : as_type<float>(_1218);
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1232 = _1230 != 0;
    float _1234 = _173 * _1182;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1238 = _1236 != 0;
    float _1240 = _167 * _1182;
    float _1242 = -_207;
    int _1244 = _1220 ? as_type<int>(_1242) : as_type<int>(_207);
    float _1246 = fma(_171, _1180, _1234);
    bool _1248 = !_1178;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = _181 * _1182;
    int _1254 = _1098 >> 31;
    float _1256 = fma(_165, _1180, _1240);
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1260 = _1258 != 0;
    float _1262 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1266 = _1264 != 0;
    float _1268 = fma(_179, _1180, _1252);
    bool _1270 = !_1238;
    float _1272 = _1270 ? _207 : as_type<float>(_1244);
    float _1274 = _725 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1276 = -_737;
    float _1278 = fma(_1262, 2.0, _1276);
    int _1280 = _1254 & 3;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1284 = _1098 + _1280;
    float _1286 = fma(_175, _1184, _1246);
    float _1288 = _1262;
    if (!_1232)
    {
        _1288 = _725;
    }
    float _1290 = _1288;
    float _1292 = fma(_1274, -2.0, _1282);
    float _1294 = _1290;
    if (!_1232)
    {
        _303 = _1206;
    }
    float _1296 = _303;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1302 = _1296;
    if (!_1232)
    {
        _1140 = _1206;
    }
    float _1304 = _1140;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1310 = _1304;
    if (_1232)
    {
        _1294 = _151;
    }
    float _1312 = _1294;
    if (_1232)
    {
        _1302 = _725;
    }
    float _1314 = _1302;
    float _1316 = _1308 * _984;
    if (_1232)
    {
        _1310 = _725;
    }
    float _1318 = _1310;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1320;
    bool _1324 = _1196 >= 0.0;
    bool _1326 = isnan(_1196);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    float _1334 = 1.0 / _1300;
    int _1336 = _1284 >> 2;
    int _1338 = _1332 ? 0 : 1;
    int _1340 = _1336 << 4;
    int _1342 = _1340 + 512;
    bool _1344 = _1196 > 0.0;
    float _1346 = fma(_169, _1184, _1256);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1350 = _1348 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1352 = fma(_183, _1184, _1268);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1354;
    uint _1358 = uint(int(uint(_1342) >> uint(2)));
    uint _1360 = uint(int(uint(int(_1358)) >> uint(2)));
    int _1362 = int(_1358) & 3;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[int(_1360)][_1362];
    int _1366 = int(_1358) + 1;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    int _1370 = _1366 & 3;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[int(_1368)][_1370];
    bool _1374 = _727 > 0.5;
    float _1376 = _1322 * _1334;
    float _1378 = _1356 * _783;
    float _1380 = 1.0 / _1350;
    int _1382 = _1342 + 8;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    uint _1386 = uint(int(uint(int(_1384)) >> uint(2)));
    int _1388 = int(_1384) & 3;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[int(_1386)][_1388];
    int _1392 = int(_1384) + 1;
    uint _1394 = uint(int(uint(_1392) >> uint(2)));
    int _1396 = _1392 & 3;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[int(_1394)][_1396];
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1410 = _1408 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1414 = _1412 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1416 = _1406 * _839;
    float _1418 = 1.0 / _1402;
    float _1420 = _1410 * _815;
    int _1422 = ~_1338;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1428;
    int _1432 = _1426;
    if (!_1344)
    {
        int _1434 = ~_1338;
        int _1436 = _1434 + 1;
        _1432 = _1436;
    }
    int _1438 = _1432;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    bool _1444 = _821 >= 0.0;
    bool _1446 = isnan(_821);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.0);
    bool _1452 = _1448 || _1450;
    float _1454 = _1430 * _856;
    float _1456 = 1.0 / _1414;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _1462 = _1452 ? 0 : 1;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1464;
    bool _1468 = _821 > 0.0;
    float _1470 = _1460 * _1380;
    int _1472 = abs(_1146);
    float _1474 = _725 + _1206;
    float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1478 = _1442 * _1418;
    float _1480 = _1206 * 2.0;
    int _1482 = abs(_1194);
    float _1484 = _1474 + (-1.0);
    int _1486 = ~_1472;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    int _1492 = ~_1482;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    float _1498 = floor(_1480);
    int _1500 = ~_1462;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    float _1506 = _1466 * _1456;
    int _1508 = _1504;
    if (!_1468)
    {
        int _1510 = ~_1462;
        int _1512 = _1510 + 1;
        _1508 = _1512;
    }
    int _1514 = _1508;
    float _1516 = _151 + _725;
    int _1518 = abs(_1204);
    float _1520 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1522 = int(_1520);
    int _1524 = _1490 * as_type<int>(_1372);
    float _1526 = _1516 + (-1.0);
    int _1528 = _1496 * as_type<int>(_1364);
    int _1530 = _1528 + _1524;
    float _1532 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1534 = -_129;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1278);
    float _1538 = _1228 + 0.5;
    bool _1540 = _1498 >= 0.0;
    bool _1542 = isnan(_1498);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan(0.0);
    bool _1548 = _1544 || _1546;
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1552 = ~_1518;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1532, _1538, _1536);
    int _1560 = abs(_1250);
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1564 = _719 + _1562;
    int _1566 = _1548 ? 0 : 1;
    int _1568 = _1556 * as_type<int>(_1390);
    int _1570 = _1568 + _1530;
    float _1572 = fma(_1378, _1564, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1574 = float(uint(_1522));
    float _1576 = in.m_56.w;
    bool _1578 = _1498 > 0.0;
    float _1580 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1582 = ~_1560;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    float _1588 = in.m_58.w;
    int _1590 = abs(_1136);
    float _1592 = 1.0 / _1574;
    int _1594 = abs(_1522);
    int _1596 = _1586 * as_type<int>(_1398);
    int _1598 = _1596 + _1570;
    int _1600 = ~_1590;
    int _1602 = _1600 + 1;
    int _1604 = _1602 + 1;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1608 = _715 + _1606;
    float _1610 = float(uint(_1594));
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1614 = _719 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1618 = _715 + _1616;
    int _1620 = _1598 * _1604;
    float _1622 = fma(_1416, _1608, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1624 = 1.0 / _1610;
    float _1626 = fma(_1316, _1614, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1628 = _1224 * _1590;
    int _1630 = _1628 + _1620;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1634 = _715 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1638 = _715 + _1636;
    float _1640 = fma(_1478, _1618, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _1642 = as_type<int>(_1592) + (-2);
    float _1644 = fma(_1454, _1634, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1646 = float(uint(_1630));
    float _1648 = in.m_60.w;
    int _1650 = abs(_1630);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1654 = _715 + _1652;
    float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1658 = as_type<float>(_1642) * _1646;
    float _1660 = float(uint(_1650));
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1664 = _715 + _1662;
    int _1666 = as_type<int>(_1624) + (-2);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1670 = _715 + _1668;
    float _1672 = fma(_1420, _1638, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1674 = fma(_1376, _1654, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1676 = trunc(_1658);
    float _1678 = precise::max(_1676, 0.0);
    uint _1680 = uint(_1678);
    float _1682 = as_type<float>(_1666) * _1660;
    float _1684 = fma(_1470, _1664, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1688 = fma(_1506, _1670, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1690 = ~_1522;
    int _1692 = _1690 + 1;
    float _1694 = _1286 + _1588;
    int _1696 = ~_1594;
    int _1698 = _1696 + 1;
    float _1700 = trunc(_1682);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    float _1706 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1686);
    float _1708 = _1346 + _1576;
    float _1710 = _1352 + _1648;
    float _1712 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1292);
    float _1714 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1716 = _1692 * int(_1680);
    int _1718 = _1716 + _1630;
    float _1720 = _1272 + (-0.5);
    bool _1722 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1724 = isnan(_715);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1706);
    bool _1736 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1738 = isnan(_719);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = -_1714;
    float _1750 = -_1712;
    float _1752 = fma(_1748, _1720, _1750);
    float _1754 = float(uint(_1718));
    float _1756 = -_1732;
    float _1758 = _1756 + 1.0;
    int _1760 = _1698 * int(_1704);
    int _1762 = _1760 + _1650;
    bool _1764 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1766 = isnan(_715);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1772 = _1768 || _1770;
    float _1774 = float(_1772);
    float _1776 = -_1734;
    float _1778 = _1776 + 1.0;
    bool _1780 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1782 = isnan(_715);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = as_type<float>(_1642) * _1754;
    float _1794 = float(uint(_1762));
    float _1796 = _1774 * _1758;
    float _1798 = -_1774;
    float _1800 = _1798 + 1.0;
    bool _1802 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1804 = isnan(_715);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = as_type<float>(_1666) * _1794;
    float _1816 = -_1790;
    float _1818 = _1816 + 1.0;
    bool _1820 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1822 = isnan(_719);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1828 = _1824 || _1826;
    float _1830 = float(_1828);
    float _1832 = _1790 * _1800;
    bool _1834 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1836 = isnan(_719);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = _1812 * _1818;
    bool _1848 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1850 = isnan(_715);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1856 = _1852 || _1854;
    float _1858 = float(_1856);
    float _1860 = -_1812;
    float _1862 = _1860 + 1.0;
    bool _1864 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1866 = isnan(_715);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = -_1844;
    float _1878 = _1876 + 1.0;
    float _1880 = trunc(_1814);
    float _1882 = precise::max(_1880, 0.0);
    uint _1884 = uint(_1882);
    float _1886 = _1858 * _1862;
    float _1888 = -_1858;
    float _1890 = _1888 + 1.0;
    float _1892 = -_1830;
    float _1894 = _1892 + 1.0;
    float _1896 = _1830 * _1878;
    float _1898 = -_1874;
    float _1900 = _1898 + 1.0;
    float _1902 = _1874 * _1890;
    float _1904 = _1746 * _1894;
    float _1906 = _813 * _1900;
    float _1908 = -_813;
    float _1910 = _1908 + 1.0;
    float _1912 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1914 = _1572 * _1904;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1918 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[83].z, _817);
    float _1920 = _795 * _1910;
    float _1922 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1924 = log2(_1922);
    float _1926 = -_795;
    float _1928 = _1926 + 1.0;
    float _1930 = -_1746;
    float _1932 = _1930 + 1.0;
    float _1934 = _1622 * _1920;
    float _1936 = -_1916;
    float _1938 = fma(_1912, 2.0, _1936);
    float _1940 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1914);
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1934);
    float _1944 = trunc(_1792);
    float _1946 = precise::max(_1944, 0.0);
    uint _1948 = uint(_1946);
    float _1950 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1952 = fma(_1626, _1896, _1940);
    float _1954 = fma(_1672, _1906, _1942);
    int _1956 = int(_1704) + int(_1884);
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1960 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1918);
    float _1962 = _1924 * _129;
    float _1964 = fma(_1950, -2.0, _1958);
    int _1966 = ~_1566;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    float _1972 = -_129;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1938);
    int _1976 = _1970;
    if (!_1578)
    {
        int _1978 = ~_1566;
        int _1980 = _1978 + 1;
        _1976 = _1980;
    }
    int _1982 = _1976;
    float _1984 = exp2(_1962);
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1988 = int(_1680) + int(_1948);
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1992 = 1.0 + _1990;
    bool _1994 = !_1170;
    int _1996 = _1994 ? 0 : 1;
    float _1998 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1986);
    bool _2000 = !_1166;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2006 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2008 = isnan(1.0);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2014 = _2010 || _2012;
    float _2016 = 1.0 / _1992;
    int _2018 = ~_1522;
    int _2020 = _2018 + 1;
    float _2022 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2004);
    int _2024 = abs(_1996);
    float _2026 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1964);
    bool _2028 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2030 = isnan(0.0);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2036 = _2032 || _2034;
    float _2038 = -_1984;
    float _2040 = _2038 + 1.0;
    float _2042 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1998);
    int _2044 = ~_1594;
    int _2046 = _2044 + 1;
    float _2048 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2022);
    float _2050 = _2036 ? _2040 : 0.0;
    int _2052 = _2020 * _1988;
    int _2054 = _2052 + _1630;
    float _2056 = float(_1438);
    int _2058 = _2046 * _1956;
    int _2060 = _2058 + _1650;
    int _2062 = abs(_2002);
    if (_2014)
    {
        float _2064 = _2050 * _2016;
        _131 = _2064;
    }
    float _2066 = _131;
    float _2068 = fma(_1644, _1902, _1954);
    bool _2070 = uint(_2054) >= uint(_1522);
    float _2072 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1952);
    float _2074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2076 = !_2070;
    int _2078 = _2076 ? 0 : (-1);
    float _2080 = fma(_1640, _1886, _2068);
    bool _2082 = uint(_2060) >= uint(_1594);
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _1708 + _2084;
    float _2088 = float(_2062);
    float _2090 = fma(_1674, _1846, _2080);
    float _2092 = float(_1982);
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2096 = in.m_66.x;
    float _2098 = in.m_66.y;
    float _2100 = in.m_66.z;
    int _2102 = ~_1988;
    int _2104 = _2102 + _2078;
    int _2106 = _2104 + 1;
    float _2108 = -_1960;
    float _2110 = _2108 + 1.0;
    float _2112 = float(_2024);
    float _2114 = _2088 * _2092;
    int _2116 = _1630 ^ _1522;
    int _2118 = _1522 * _2106;
    int _2120 = _2118 + _1630;
    bool _2122 = _1522 == 0;
    float _2124 = _2112 * _2056;
    bool _2126 = !_2082;
    int _2128 = _2126 ? 0 : (-1);
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2132 = _1694 + _2130;
    uint _2134 = uint(int(uint(_2116) >> uint(31)));
    float _2136 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2138 = !_2122;
    int _2140 = _2138 ? _2120 : (-1);
    float _2142 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2144 = ~_2128;
    int _2146 = _1956 + _2144;
    int _2148 = _2146 + 1;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2152 = _1710 + _2150;
    bool _2154 = _1206 > 0.5;
    float _2156 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2142);
    int _2158 = ~int(_2134);
    int _2160 = _2158 + 1;
    float _2162 = _2124 * (-2.0);
    bool _2164 = _1522 == 0;
    float _2166 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2168 = -_295;
    int _2170 = _2154 ? as_type<int>(_2168) : as_type<int>(_295);
    float _2172 = fma(_1580, _2162, _1580);
    int _2174 = _2148 ^ _2160;
    float _2176 = fma(_1684, _1832, _2090);
    float _2178 = float(_2140);
    float _2180 = fma(_2162, _2098, _2098);
    bool _2182 = !_1260;
    float _2184 = _2182 ? _295 : as_type<float>(_2170);
    float _2186 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2156);
    int _2188 = ~_2160;
    int _2190 = _2188 + _2174;
    int _2192 = _2190 + 1;
    float _2194 = fma(_2136, _2178, _1974);
    float _2196 = -_207;
    int _2198 = _1374 ? as_type<int>(_2196) : as_type<int>(_207);
    float _2200 = _2184 + 0.5;
    bool _2202 = !_2164;
    int _2204 = _2202 ? _2192 : (-1);
    float _2206 = -_2048;
    float _2208 = _2206 + 1.0;
    bool _2210 = !_1266;
    float _2212 = _2210 ? _207 : as_type<float>(_2198);
    float _2214 = fma(_2136, _2200, _2194);
    float _2216 = _2132 * _2132;
    float _2218 = float(_2204);
    float _2220 = -_2208;
    float _2222 = fma(_1228, _2220, _1558);
    bool _2224 = _2186 >= 0.0;
    float _2226 = fma(_2086, _2086, _2216);
    float _2228 = fma(_1688, _1796, _2176);
    float _2230 = -_2026;
    float _2232 = fma(_2166, _2218, _2230);
    float _2234 = _2212 + (-0.5);
    float _2236 = fma(_2152, _2152, _2226);
    float _2238 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2228);
    float _2240 = -_2166;
    float _2242 = fma(_2240, _2234, _2232);
    float _2244 = -_2042;
    float _2246 = _2244 + 1.0;
    float _2248 = rsqrt(_2236);
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_2224)
    {
        _2254 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2256 = _2254;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2260 = fma(_1272, _2246, _1752);
    float _2262 = _2250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2264 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2266 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2072 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2270 = as_type<int>(_2256);
    if (_2224)
    {
        float _2272 = _2256 * 5.0;
        _2270 = as_type<int>(_2272);
    }
    int _2274 = _2270;
    float _2276 = -_2110;
    float _2278 = fma(_2184, _2276, _2214);
    float _2280 = fma(_2212, _1778, _2242);
    float _2282 = _2114 * (-2.0);
    out.m_68.x = _2262;
    out.m_68.y = _2264;
    out.m_68.z = _2266;
    out.m_68.w = _2268;
    bool _2284 = !_1174;
    int _2286 = _2284 ? 0 : 1;
    float _2288 = _2132 * _2248;
    float _2290 = fma(_1550, _2282, _1550);
    if (_2224)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6487 = as_type<float>(_2274);
        out.gl_Position.z = _6487;
    }
    float _2292 = _2086 * _2248;
    out.m_70.x = _2238;
    out.m_72.x = _2222;
    out.m_72.y = _2260;
    out.m_72.z = _2278;
    out.m_72.w = _2280;
    if (_2224)
    {
        out.m_45.x = 0.0;
    }
    if (_2224)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2294 = -_2288;
    float _2296 = fma(_2294, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1694);
    float _2298 = -_2292;
    float _2300 = fma(_2298, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1708);
    float _2302 = _725 + (-0.5);
    float _2304 = fma(_2282, _2096, _2096);
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2308 = _2296 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2312 = _2300 + _2310;
    float _2314 = fma(_2302, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2180);
    float _2316 = _151 + (-0.5);
    float _2318 = _2308 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2320 = -_2288;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2132);
    float _2324 = fma(_2172, _2066, _2314);
    float _2326 = fma(_2316, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2304);
    float _2328 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2318);
    float _2330 = _2152 * _2248;
    int _2332 = abs(_2286);
    float _2334 = _2324 * 0.15915493667125701904296875;
    float _2336 = float(_1514);
    float _2338 = -_2330;
    float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1710);
    float _2342 = float(_2332);
    float _2344 = -_2292;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2086);
    float _2348 = _2322 * _2322;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2352 = _2340 + _2350;
    float _2354 = _151 + _1206;
    float _2356 = _2342 * _2336;
    float _2358 = fma(_2346, _2346, _2348);
    float _2360 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2328);
    float _2362 = _2354 + (-1.0);
    float _2364 = _1206 + (-0.5);
    float _2366 = -_2330;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2152);
    bool _2370 = _2360 >= 0.0;
    float _2372 = _2356 * (-2.0);
    float _2374 = fma(_2362, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2376 = fma(_2368, _2368, _2358);
    float _2378 = fma(_2290, _2066, _2326);
    float _2380 = fma(_2372, _2100, _2100);
    float _2382 = fma(_2374, _2372, _2374);
    float _2384 = _2334 * 6.283185482025146484375;
    float _2386 = sin(_2384);
    float _2388 = _2378 * 0.15915493667125701904296875;
    float _2390 = fma(_2364, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2380);
    float _2392 = _299 * _459;
    float _2394 = fma(_2382, _2066, _2390);
    float _2396 = _2380;
    float _2398 = _2340;
    if (_2370)
    {
        _2396 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2400 = _2396;
    float _2402 = sqrt(_2376);
    float _2404 = _2394 * 0.15915493667125701904296875;
    int _2406 = as_type<int>(_2400);
    if (_2370)
    {
        out.m_45.x = 0.0;
    }
    if (_2370)
    {
        float _2408 = _2400 * 5.0;
        _2406 = as_type<int>(_2408);
    }
    int _2410 = _2406;
    float _2412 = _2334 * 6.283185482025146484375;
    float _2414 = cos(_2412);
    if (_2370)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6715 = as_type<float>(_2410);
        out.gl_Position.z = _6715;
    }
    float _2416 = _2388 * 6.283185482025146484375;
    float _2418 = sin(_2416);
    float _2420 = _2248 * _2402;
    float _2422 = _2388 * 6.283185482025146484375;
    float _2424 = cos(_2422);
    float _2426 = _2404 * 6.283185482025146484375;
    float _2428 = sin(_2426);
    if (_2370)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2430 = _2404 * 6.283185482025146484375;
    float _2432 = cos(_2430);
    float _2434 = _2392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2436 = _299 * _469;
    float _2438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2440 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _295);
    float _2442 = _2420 * _2434;
    float _2444 = _2436 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2446 = _2424 * _2414;
    float _2448 = _2424 * _2386;
    float _2450 = _2438 * _2442;
    float _2452 = _2420 * _2444;
    float _2454 = _2418 * _2386;
    float _2456 = _2440 * _2452;
    float _2458 = fma(_2428, _2446, _2454);
    float _2460 = _2432 * _2450;
    float _2462 = -_2450;
    float _2464 = _2428 * _2462;
    float _2466 = fma(_2428, _2454, _2446);
    float _2468 = _2424 * _2460;
    float _2470 = _2386 * _2432;
    float _2472 = _2414 * _2432;
    float _2474 = _2418 * _2414;
    float _2476 = fma(_2458, _2456, _2468);
    float _2478 = _2420 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2480 = _2478 * 0.5;
    float _2482 = fma(_2472, _2456, _2464);
    float _2484 = -_2474;
    float _2486 = fma(_2428, _2448, _2484);
    float _2488 = -_2448;
    float _2490 = fma(_2428, _2474, _2488);
    float _2492 = _2418 * _2460;
    float _2494 = fma(_2470, _2480, _2482);
    float _2496 = fma(_2486, _2480, _2476);
    float _2498 = fma(_2490, _2456, _2492);
    float _2500 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2502 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2504 = fma(_2466, _2480, _2498);
    float _2506 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2508 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2500);
    float _2510 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2502);
    float _2512 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2506);
    float _2514 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2508);
    float _2516 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2510);
    float _2518 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2512);
    float _2520 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2522 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2524 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2526 = _1710 + _2520;
    float _2528 = _1708 + _2522;
    float _2530 = _1694 + _2524;
    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2534 = _2526 + _2532;
    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2538 = _2528 + _2536;
    float _2540 = _2534 * _2534;
    float _2542 = fma(_2538, _2538, _2540);
    float _2544 = sqrt(_2542);
    bool _2546 = _2544 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2548 = _2540;
    float _2550 = _2522;
    float _2552 = _2528;
    float _2554 = _2530;
    if (!_2546)
    {
        _2548 = _2526;
    }
    float _2556 = _2548;
    float _2558 = _2556;
    if (!_2546)
    {
        _2550 = _2530;
    }
    float _2560 = _2550;
    bool _2562 = !_2546;
    float _2564 = _2560;
    if (!_2562)
    {
        float _2566 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2570 = _2544 + _2568;
        float _2572 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2574 = rsqrt(_2542);
        float _2576 = _2570 * _2566;
        float _2578 = _2576 * 0.15915493667125701904296875;
        float _2580 = _2578 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        float _2584 = _2578 * 6.283185482025146484375;
        float _2586 = sin(_2584);
        float _2588 = _2582 + (-1.0);
        float _2590 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2592 = fma(_2586, _2572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2594 = fma(_2530, _2582, _2590);
        float _2596 = _2574 * _2592;
        float _2598 = fma(_2538, _2596, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2600 = fma(_2534, _2596, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2564 = _2594;
        _2552 = _2598;
        _2558 = _2600;
    }
    float _2602 = _2564;
    float _2604 = _2552;
    float _2606 = _2558;
    float _2608 = -_1694;
    float _2610 = _2608 + _2602;
    float _2612 = -_1708;
    float _2614 = _2612 + _2604;
    float _2616 = -_1710;
    float _2618 = _2616 + _2606;
    float _2620 = _2610 * _2610;
    float _2622 = fma(_2614, _2614, _2620);
    float _2624 = fma(_2618, _2618, _2622);
    float _2626 = sqrt(_2624);
    bool _2628 = _2626 > 0.0;
    bool _2630 = !_2628;
    float _2632 = _2602;
    float _2634 = _2604;
    float _2636 = _2606;
    float _2638 = _2610;
    if (!_2630)
    {
        float _2640 = _255 * _255;
        float _2642 = fma(_285, _285, _2640);
        float _2644 = fma(_291, _291, _2642);
        float _2646 = rsqrt(_2624);
        float _2648 = sqrt(_2644);
        float _2650 = _2614 * _2646;
        float _2652 = _2610 * _2646;
        float _2654 = _2618 * _2646;
        bool _2656 = _2648 > 0.0;
        bool _2658 = !_2656;
        _2554 = _2648;
        if (!_2658)
        {
            float _2660 = rsqrt(_2644);
            float _2662 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2664 = _255 * _2660;
            float _2666 = _285 * _2660;
            float _2668 = _291 * _2660;
            float _2670 = _2652 * _2664;
            float _2672 = fma(_2650, _2666, _2670);
            float _2674 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2676 = fma(_2654, _2668, _2672);
            float _2678 = _2676 * _2674;
            float _2680 = fma(_285, _2678, _2604);
            float _2682 = fma(_255, _2678, _2602);
            float _2684 = fma(_291, _2678, _2606);
            _2632 = _2682;
            _2634 = _2680;
            _2636 = _2684;
            _2554 = _2662;
            _2638 = _2672;
        }
    }
    float _2686 = _2632;
    float _2688 = _2634;
    float _2690 = _2636;
    float _2692 = _2554;
    float _2694 = _2638;
    float _2696 = -_2288;
    float _2698 = fma(_2696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2686);
    float _2700 = -_2292;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2688);
    float _2704 = -_2330;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2690);
    float _2708 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2710 = _2698 + _2708;
    float _2712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2714 = _2702 + _2712;
    float _2716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2718 = _2706 + _2716;
    float _2720 = _2710 * _2710;
    float _2722 = fma(_2714, _2714, _2720);
    float _2724 = fma(_2718, _2718, _2722);
    float _2726 = rsqrt(_2724);
    float _2728 = sqrt(_2724);
    float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2732 = _2714 * _2730;
    float _2734 = _2718 * _2730;
    float _2736 = _2732 * _2732;
    float _2738 = _2734 * _2734;
    float _2740 = _2736 + _2738;
    float _2742 = sqrt(_2740);
    bool _2744 = _2742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2748 = _2742 + _2746;
    float _2750 = _2718;
    float _2752 = _2722;
    float _2754 = _2748;
    float _2756 = _2692;
    float _2758 = _2730;
    float _2760 = _2732;
    if (_2744)
    {
        float _2762 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2750 = _2762;
    }
    float _2764 = _2750;
    if (_2744)
    {
        float _2766 = rsqrt(_2740);
        _2752 = _2766;
    }
    float _2768 = _2752;
    float _2770 = _2768;
    if (_2744)
    {
        float _2772 = _2748 * _2764;
        _2754 = _2772;
    }
    float _2774 = _2754;
    if (_2744)
    {
        float _2776 = _2774 * 0.15915493667125701904296875;
        _2756 = _2776;
    }
    float _2778 = _2756;
    float _2780 = _2726;
    float _2782 = _2778;
    if (_2744)
    {
        float _2784 = _2778 * 6.283185482025146484375;
        float _2786 = sin(_2784);
        _2780 = _2786;
    }
    float _2788 = _2780;
    float _2790 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2792 = precise::max(0.0, _2790);
    float _2794 = _2694;
    float _2796 = _2792;
    float _2798 = _2790;
    if (_2744)
    {
        float _2800 = _2778 * 6.283185482025146484375;
        float _2802 = cos(_2800);
        _2794 = _2802;
    }
    float _2804 = _2794;
    float _2806 = -_2730;
    float _2808 = -_2792;
    float _2810 = fma(_2710, _2806, _2808);
    if (!_2744)
    {
        _2796 = _2734;
    }
    float _2812 = _2796;
    float _2814 = _2812;
    if (_2744)
    {
        float _2816 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2798 = _2816;
    }
    float _2818 = _2798;
    float _2820 = _2788;
    float _2822 = _2818;
    if (_2744)
    {
        float _2824 = fma(_2788, _2818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2820 = _2824;
    }
    float _2826 = _2820;
    float _2828 = _2826;
    if (_2744)
    {
        float _2830 = _2804 + (-1.0);
        _2822 = _2830;
    }
    float _2832 = _2822;
    float _2834 = _2832;
    if (_2744)
    {
        float _2836 = _2768 * _2826;
        _2758 = _2836;
    }
    float _2838 = _2758;
    if (!_2744)
    {
        _2770 = _2810;
    }
    float _2840 = _2770;
    float _2842 = _2840;
    if (_2744)
    {
        float _2844 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2844;
    }
    float _2846 = _2782;
    if (_2744)
    {
        float _2848 = _2732 * _2838;
        _2760 = _2848;
    }
    float _2850 = _2760;
    if (!_2744)
    {
        _2828 = _2736;
    }
    float _2852 = _2828;
    float _2854 = _2852;
    if (_2744)
    {
        float _2856 = _2734 * _2838;
        _2814 = _2856;
    }
    float _2858 = _2814;
    if (_2744)
    {
        float _2860 = fma(_2810, _2804, _2846);
        _2842 = _2860;
    }
    float _2862 = _2842;
    if (_2744)
    {
        float _2864 = _2850 * _2850;
        _2854 = _2864;
    }
    float _2866 = _2854;
    if (!_2744)
    {
        _2834 = _2738;
    }
    float _2868 = _2834;
    float _2870 = _2868;
    if (_2744)
    {
        float _2872 = _2858 * _2858;
        _2870 = _2872;
    }
    float _2874 = _2870;
    float _2876 = fma(_2862, _2862, _2866);
    float _2878 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2880 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2882 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2884 = _2876 + _2874;
    float _2886 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2878);
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2890 = fma(_2728, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2888);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2896 = rsqrt(_2884);
    float _2898 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2886);
    float _2900 = -_2892;
    float _2902 = _2900 + 1.0;
    float _2904 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2894);
    float _2906 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2880);
    float _2908 = _2898 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2910 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2912 = abs(_2902);
    float _2914 = log2(_2912);
    float _2916 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2904);
    float _2918 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2906);
    float _2920 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2922 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2910);
    float _2924 = _2916 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2926 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2928 = -_2920;
    float _2930 = fma(_2928, _2882, 1.0);
    float _2932 = _2896 * _2850;
    float _2934 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2936 = _2896 * _2862;
    float _2938 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2922);
    float _2940 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2942 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2934);
    float _2944 = _2896 * _2858;
    float _2946 = _2938 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2948 = -_2940;
    float _2950 = fma(_2936, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2948);
    float _2952 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2954 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2942);
    float _2956 = log2(_2930);
    float _2958 = -_2944;
    float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2950);
    float _2962 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2964 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2954);
    float _2966 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2968 = fma(_2960, -0.5, 0.5);
    float _2970 = fma(_2960, 0.5, 0.5);
    float _2972 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2962);
    float _2974 = exp2(_2952);
    float _2976 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2966);
    float _2978 = fma(_2970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2980 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2972);
    float _2982 = _2936 + 1.0;
    float _2984 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2976);
    float _2986 = fma(_2970, _2978, -0.212114393711090087890625);
    float _2988 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2980);
    float _2990 = 1.0 / _2964;
    float _2992 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2984);
    float _2994 = fma(_2970, _2986, 1.570728778839111328125);
    float _2996 = sqrt(_2968);
    float _2998 = -_2936;
    float _3000 = fma(_2974, _2982, _2998);
    float _3002 = _2956 * 0.693147182464599609375;
    float _3004 = fma(_3000, 0.5, 0.5);
    float _3006 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3008 = _2988 * _2990;
    float _3010 = _2992 * _2990;
    float _3012 = fma(_3008, 0.5, 0.5);
    float _3014 = fma(_3010, -0.5, 0.5);
    float _3016 = _2996 * 0.636619746685028076171875;
    float3 _7692 = float3(_3012, _3014, _3006);
    float _3018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7692, float3(0.0), isnan(_7692)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7692, float3(0.0), isnan(_7692)), level(0.0)).x;
    float3 _7703 = float3(_3012, _3014, _3006);
    float4 _3021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7703, float3(0.0), isnan(_7703)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7703, float3(0.0), isnan(_7703)), level(0.0)).xyzw;
    float _3023 = _3021.x;
    float _3025 = _3021.y;
    float _3027 = _3021.z;
    float _3029 = _3021.w;
    float _3031 = -_2994;
    float _3033 = fma(_3016, _3031, 1.0);
    float2 _7725 = float2(_3033, _3004);
    float3 _3037 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7725, float2(0.0), isnan(_7725)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7725, float2(0.0), isnan(_7725)), level(0.0)).xyz;
    float _3039 = _3037.x;
    float _3041 = _3037.y;
    float _3043 = _3037.z;
    float _3045 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3047 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3049 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3051 = isnan(0.5);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3057 = _3053 || _3055;
    float _3059 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3061 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3045);
    float _3063 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3047);
    float _3065 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3067 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3061);
    float _3069 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3063);
    float _3071 = exp2(_3059);
    float _3073 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3065);
    float _3075 = _3067 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3077 = _3069 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3079 = _3012;
    float _3081 = _3067;
    float _3083 = _3065;
    if (!_3057)
    {
        _2398 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3085 = _2398;
    float _3087 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3073);
    float _3089 = _3077 + _3075;
    float _3091 = 1.0 / _3075;
    float _3093 = _3085;
    if (!_3057)
    {
        _3079 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3095 = _3079;
    float _3097 = _3089 * _3091;
    float _3099 = _3097 * 0.5;
    float _3101 = _3091;
    float _3103 = _3099;
    if (_3057)
    {
        _3101 = 1.0;
    }
    float _3105 = _3101;
    float _3107 = _3105;
    if (!_3057)
    {
        float _3109 = -_3085;
        float _3111 = fma(_3099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3109);
        _3103 = _3111;
    }
    float _3113 = _3103;
    if (!_3057)
    {
        float _3115 = -_3095;
        float _3117 = _3115 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3093 = _3117;
    }
    float _3119 = _3093;
    if (!_3057)
    {
        float _3121 = 1.0 / _3119;
        _3081 = _3121;
    }
    float _3123 = _3081;
    float _3125 = _3113;
    if (!_3057)
    {
        float _3127 = 1.0 / _3113;
        _3125 = _3127;
    }
    float _3129 = _3125;
    if (!_3057)
    {
        float _3131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3133 = -_3095;
        float _3135 = fma(_3129, _3131, _3133);
        _3083 = _3135;
    }
    float _3137 = _3083;
    if (!_3057)
    {
        float _3139 = _3137 * _3123;
        float _3141 = precise::clamp(_3139, 0.0, 1.0);
        _3107 = _3141;
    }
    float _3143 = _3107;
    float _3145 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3087);
    float _3147 = -_3071;
    float _3149 = _3147 + 1.0;
    float _3151 = _3143 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3153 = _3145 + _2964;
    float _3155 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3157 = _3143 > 0.0;
    bool _3159 = isnan(_3143);
    bool _3161 = _3157 || _3159;
    bool _3163 = isnan(0.0);
    bool _3165 = _3161 || _3163;
    out.gl_Position.x = _2988;
    out.gl_Position.y = _2992;
    out.gl_Position.z = _3145;
    out.gl_Position.w = _2964;
    float _3167 = _3153 * 0.5;
    float _3169 = _3151 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_74.z = _3167;
    out.m_74.w = _2964;
    out.m_45.x = _3169;
    float _3171 = _3155 * _3018;
    float _3173 = -_3155;
    float _3175 = _3173 + 1.0;
    float _3177 = _3029 * _3171;
    float _3179 = _3043 * _3171;
    float _3181 = fma(_3039, _3177, _3023);
    float _3183 = fma(_3041, _3177, _3025);
    float _3185 = _3029 * _3175;
    float _3187 = fma(_3029, _3179, _3027);
    out.m_76.x = _3181;
    out.m_76.y = _3183;
    out.m_76.z = _3187;
    out.m_76.w = _3185;
    if (_3165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3189 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3189;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _707 = false;
    bool _595 = false;
    bool _421 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3246 = as_type<float>(_111);
        out.gl_Position.z = _3246;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3316 = as_type<float>(_149);
        out.gl_Position.z = _3316;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_49.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = in.m_54.x;
    float _161 = in.m_54.y;
    float _163 = in.m_54.z;
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    float _177 = _155 * _153;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    int _187 = as_type<int>(_157) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_157) & 2;
    bool _193 = _191 != 0;
    float _195 = _185 * 6.283185482025146484375;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = floor(_185);
    float _203 = _195 * 0.15915493667125701904296875;
    bool _205 = !_193;
    float _207 = _205 ? (-0.5) : 0.5;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _215 = _213 != 0;
    float _217 = _161 * _167;
    bool _219 = !_199;
    int _221 = _219 ? 0 : 1;
    float _223 = _203 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = _161 * _173;
    bool _229 = !_211;
    int _231 = _229 ? 0 : 1;
    float _233 = fma(_159, _165, _217);
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _237 = _161 * _181;
    int _239 = abs(_231);
    float _241 = fma(_159, _171, _227);
    int _243 = abs(_221);
    float _245 = fma(_159, _179, _237);
    float _247 = -_201;
    float _249 = _185 + _247;
    bool _251 = !_215;
    int _253 = _251 ? 0 : 1;
    float _255 = fma(_163, _175, _241);
    float _257 = float(_239);
    float _259 = -_249;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _263 = abs(_253);
    float _265 = fma(_225, 0.5, 0.5);
    bool _267 = _249 < 0.5;
    float _269 = float(_267);
    float _271 = abs(_261);
    float _273 = _257 * _271;
    float _275 = float(_243);
    float _277 = -_265;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _281 = -_269;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = fma(_163, _169, _233);
    float _287 = fma(_275, _279, _273);
    float _289 = float(_263);
    float _291 = fma(_163, _183, _245);
    bool _293 = !_189;
    float _295 = _293 ? (-0.5) : 0.5;
    float _297 = abs(_283);
    float _299 = fma(_289, _297, _287);
    bool _301 = !_235;
    float _303 = _179;
    float _319;
    if (!_301)
    {
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_95);
        float _325 = 1.0 / _323;
        float _327 = _129 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = _329 + _331;
    bool _335 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_329);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _347;
    float _351 = -_345;
    float _353 = _351 + 1.0;
    bool _355 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _357 = isnan(_329);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _373 = 1.0 / _349;
    float _375 = _365 * _353;
    float _377 = -_365;
    float _379 = _377 + 1.0;
    float _381 = _333 * _373;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = fma(_369, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _389 = fma(_385, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = _387 * _375;
    float _393 = _389 * _375;
    float _395 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].x, _391);
    float _397 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].y, _393);
    float _399 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[144].x, _395);
    float _401 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[144].y, _397);
    bool _403 = !_371;
    float _419;
    if (!_403)
    {
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_95);
        float _425 = 1.0 / _423;
        float _427 = _129 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_62.x;
    float _433 = in.m_62.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = _429 + _435;
    bool _439 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _441 = isnan(_429);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _457 = 1.0 / _453;
    float _459 = _401 * _433;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _467 = _429 + _465;
    float _469 = _399 * _431;
    float _471 = _437 * _457;
    bool _473 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _475 = isnan(_429);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = 1.0 / _463;
    bool _487 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _489 = isnan(_429);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _499;
    float _503 = -_483;
    float _505 = _503 + 1.0;
    float _507 = -_497;
    float _509 = _507 + 1.0;
    float _511 = fma(_501, _471, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _513 = _497 * _505;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _519;
    float _523 = _449 * _509;
    float _525 = -_449;
    float _527 = _525 + 1.0;
    float _529 = fma(_517, _471, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _531 = fma(_521, _471, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _533 = _511 * _523;
    float _535 = _467 * _485;
    float _537 = _529 * _523;
    float _539 = _531 * _523;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _553 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].x, _537);
    float _555 = fma(_543, _535, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _557 = fma(_547, _535, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _559 = fma(_551, _535, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _561 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].y, _533);
    float _563 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].z, _539);
    float _565 = fma(_555, _513, _553);
    float _567 = fma(_557, _513, _561);
    float _569 = fma(_559, _513, _563);
    float _571 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[109].x, _565);
    float _573 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[109].y, _567);
    float _575 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[109].z, _569);
    bool _577 = !_455;
    float _593;
    if (!_577)
    {
        float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _581 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _585 = _583 * _579;
        float _587 = floor(_585);
        float _589 = -_587;
        float _591 = _585 + _589;
        _593 = _591;
        _595 = true;
    }
    else
    {
        float _597 = float(_95);
        float _599 = 1.0 / _597;
        float _601 = _129 * _599;
        _593 = _601;
    }
    _595 = false;
    float _603 = _593;
    bool _605 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _607 = isnan(_603);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _621 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_603);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _639 = _603 + _637;
    float _641 = -_615;
    float _643 = _641 + 1.0;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _647 = 1.0 / _619;
    float _649 = _631 * _643;
    float _651 = -_631;
    float _653 = _651 + 1.0;
    float _655 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = _635 * _647;
    float _659 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _661 = fma(_657, _639, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _663 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _665 = _661 * _649;
    float _667 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[115].x, _665);
    float _669 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[116].x, _667);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _671;
    out.m_64.y = _673;
    out.m_64.z = _675;
    out.m_64.w = _677;
    bool _679 = !_645;
    float _701;
    float _703;
    float _705;
    if (!_679)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _683 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _685 = float(_95);
        float _687 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _689 = 1.0 / _685;
        float _691 = _687 * _681;
        float _693 = floor(_691);
        float _695 = _129 * _689;
        float _697 = -_693;
        float _699 = _691 + _697;
        _701 = _695;
        _703 = _685;
        _705 = _699;
        _707 = true;
    }
    else
    {
        float _709 = float(_95);
        float _711 = 1.0 / _709;
        float _713 = _129 * _711;
        _701 = _713;
        _703 = _709;
        _705 = _713;
    }
    _707 = false;
    float _715 = _701;
    float _717 = _703;
    float _719 = _705;
    float _721 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _723 = int(_721);
    float _725 = in.m_49.y;
    float _727 = in.m_49.w;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _731 = _729 != 0;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _735 = int(_733);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = float(_723);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _749 = 1.0 / _743;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _755 = float(uint(_735));
    float _757 = _725 * 2.0;
    bool _759 = !_731;
    float _761 = _759 ? _725 : _151;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _767 = 1.0 / _755;
    int _769 = ~_735;
    int _771 = _769 + 1;
    int _773 = ~_735;
    int _775 = _773 + 1;
    bool _777 = _735 == 0;
    float _779 = _749 * _129;
    float _781 = float(_735);
    float _783 = 1.0 / _741;
    bool _785 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _787 = isnan(_715);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    int _797 = as_type<int>(_767) + (-2);
    float _799 = trunc(_779);
    int _801 = int(_799);
    bool _803 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _805 = isnan(_715);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = 1.0 / _747;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _819 = float(uint(_801));
    float _821 = floor(_757);
    float _823 = float(_801);
    float _825 = as_type<float>(_797) * _819;
    bool _827 = _823 >= _781;
    bool _829 = isnan(_823);
    bool _831 = _827 || _829;
    bool _833 = isnan(_781);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = 1.0 / _753;
    float _841 = trunc(_825);
    float _843 = precise::max(_841, 0.0);
    uint _846 = uint(_843);
    float _848 = trunc(_837);
    int _850 = int(_848);
    int _852 = _771 * int(_846);
    int _854 = _852 + _801;
    float _856 = 1.0 / _765;
    float _858 = float(uint(_854));
    float _860 = as_type<float>(_797) * _858;
    float _862 = trunc(_860);
    float _864 = precise::max(_862, 0.0);
    uint _866 = uint(_864);
    bool _868 = !_731;
    float _870 = _868 ? 1.2345600128173828125 : 1.0;
    float _872 = _870 * _761;
    float _874 = floor(_872);
    int _876 = int(_846) + int(_866);
    int _878 = _775 * _876;
    int _880 = _878 + _801;
    float _882 = -_874;
    float _884 = _872 + _882;
    bool _886 = uint(_880) >= uint(_735);
    float _888 = _884 * _781;
    float _890 = 1.0 / _717;
    float _892 = _781 * _129;
    bool _894 = !_886;
    int _896 = _894 ? 0 : (-1);
    int _898 = ~_850;
    int _900 = _898 + 1;
    int _902 = _900 + 1;
    int _904 = ~_876;
    int _906 = _904 + _896;
    int _908 = _906 + 1;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _924 = _922 != 0;
    float _926 = trunc(_888);
    int _928 = int(_926);
    int _930 = _735 + (-1);
    int _932 = _735 * _908;
    int _934 = _932 + _801;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _938 = _936 != 0;
    bool _940 = !_777;
    int _942 = _940 ? _934 : (-1);
    float _944 = _892 * _890;
    bool _946 = !_916;
    int _948 = _946 ? 0 : 1;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _954 = !_938;
    int _956 = _954 ? 0 : 1;
    int _958 = _942 * _902;
    int _960 = abs(_948);
    float _962 = trunc(_944);
    int _964 = int(_962);
    bool _966 = !_920;
    int _968 = _966 ? 0 : 1;
    int _970 = _850 * _930;
    int _972 = _970 + _958;
    bool _974 = !_912;
    int _976 = _974 ? 0 : 1;
    int _978 = abs(_968);
    int _980 = _972 * _960;
    int _982 = abs(_976);
    float _984 = 1.0 / _952;
    bool _986 = !_924;
    int _988 = _986 ? 0 : 1;
    int _990 = abs(_956);
    int _992 = abs(_988);
    int _994 = _928 * _990;
    int _996 = _994 + _801;
    int _998 = _964 * _982;
    int _1000 = _998 + _980;
    int _1002 = ~_735;
    int _1004 = _1002 + 1;
    int _1006 = _996 * _978;
    int _1008 = _1006 + _1000;
    float _1010 = float(uint(_996));
    int _1012 = ~_735;
    int _1014 = _1012 + 1;
    int _1016 = _928 * _992;
    int _1018 = _1016 + _1008;
    int _1020 = ~_735;
    int _1022 = _1020 + 1;
    float _1024 = as_type<float>(_797) * _1010;
    float _1026 = float(uint(_1018));
    float _1028 = trunc(_1024);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = as_type<float>(_797) * _1026;
    float _1036 = trunc(_1034);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    int _1042 = _1004 * int(_1032);
    int _1044 = _1042 + _996;
    float _1046 = float(uint(_1044));
    int _1048 = _1022 * int(_1040);
    int _1050 = _1048 + _1018;
    float _1052 = float(uint(_1050));
    float _1054 = as_type<float>(_797) * _1052;
    float _1056 = trunc(_1054);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    int _1062 = int(_1040) + int(_1060);
    int _1064 = _1014 * _1062;
    int _1066 = _1064 + _1018;
    float _1068 = as_type<float>(_797) * _1046;
    bool _1070 = uint(_1066) >= uint(_735);
    float _1072 = trunc(_1068);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    bool _1078 = !_1070;
    int _1080 = _1078 ? 0 : (-1);
    int _1082 = ~_1062;
    int _1084 = _1082 + _1080;
    int _1086 = _1084 + 1;
    int _1088 = ~_735;
    int _1090 = _1088 + 1;
    int _1092 = _735 * _1086;
    int _1094 = _1092 + _1018;
    bool _1096 = !_777;
    int _1098 = _1096 ? _1094 : (-1);
    int _1100 = int(_1032) + int(_1076);
    int _1102 = _1098 & 3;
    bool _1104 = _1102 != 0;
    int _1106 = _1098 & 3;
    bool _1108 = _1106 != 0;
    int _1110 = _1090 * _1100;
    int _1112 = _1110 + _996;
    bool _1114 = uint(_1102) > 1u;
    int _1116 = _1108 ? 0 : 1;
    bool _1118 = uint(_1112) >= uint(_735);
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1122 = _1120 != 0;
    bool _1124 = !_1118;
    int _1126 = _1124 ? 0 : (-1);
    int _1128 = ~_1116;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    bool _1134 = !_1122;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _1132;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_1114)
    {
        int _1142 = ~_1116;
        int _1144 = _1142 + 1;
        _1138 = _1144;
    }
    int _1146 = _1138;
    int _1148 = ~_1100;
    int _1150 = _1148 + _1126;
    int _1152 = _1150 + 1;
    bool _1154 = uint(_1102) >= 2u;
    bool _1156 = _1102 != 3;
    int _1158 = _735 * _1152;
    int _1160 = _1158 + _996;
    int _1162 = _1154 ? 0 : 1;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1174 = _1172 != 0;
    float _1176 = _151 * 2.0;
    bool _1178 = _1102 != 3;
    float _1180 = in.m_42.x;
    float _1182 = in.m_42.y;
    float _1184 = in.m_42.z;
    int _1186 = ~_1162;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    bool _1192 = !_1104;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = floor(_1176);
    int _1198 = _1190;
    if (_1156)
    {
        int _1200 = ~_1162;
        int _1202 = _1200 + 1;
        _1198 = _1202;
    }
    int _1204 = _1198;
    float _1206 = in.m_49.z;
    bool _1208 = _151 > 0.5;
    bool _1210 = _735 == 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1214 = _1212 != 0;
    float _1216 = -_295;
    int _1218 = _1208 ? as_type<int>(_1216) : as_type<int>(_295);
    bool _1220 = _725 > 0.5;
    bool _1222 = !_1210;
    int _1224 = _1222 ? _1160 : (-1);
    bool _1226 = !_1214;
    float _1228 = _1226 ? _295 : as_type<float>(_1218);
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1232 = _1230 != 0;
    float _1234 = _173 * _1182;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1238 = _1236 != 0;
    float _1240 = _167 * _1182;
    float _1242 = -_207;
    int _1244 = _1220 ? as_type<int>(_1242) : as_type<int>(_207);
    float _1246 = fma(_171, _1180, _1234);
    bool _1248 = !_1178;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = _181 * _1182;
    int _1254 = _1098 >> 31;
    float _1256 = fma(_165, _1180, _1240);
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1260 = _1258 != 0;
    float _1262 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1266 = _1264 != 0;
    float _1268 = fma(_179, _1180, _1252);
    bool _1270 = !_1238;
    float _1272 = _1270 ? _207 : as_type<float>(_1244);
    float _1274 = _725 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1276 = -_737;
    float _1278 = fma(_1262, 2.0, _1276);
    int _1280 = _1254 & 3;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1284 = _1098 + _1280;
    float _1286 = fma(_175, _1184, _1246);
    float _1288 = _1262;
    if (!_1232)
    {
        _1288 = _725;
    }
    float _1290 = _1288;
    float _1292 = fma(_1274, -2.0, _1282);
    float _1294 = _1290;
    if (!_1232)
    {
        _303 = _1206;
    }
    float _1296 = _303;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1302 = _1296;
    if (!_1232)
    {
        _1140 = _1206;
    }
    float _1304 = _1140;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1310 = _1304;
    if (_1232)
    {
        _1294 = _151;
    }
    float _1312 = _1294;
    if (_1232)
    {
        _1302 = _725;
    }
    float _1314 = _1302;
    float _1316 = _1308 * _984;
    if (_1232)
    {
        _1310 = _725;
    }
    float _1318 = _1310;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1320;
    bool _1324 = _1196 >= 0.0;
    bool _1326 = isnan(_1196);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    float _1334 = 1.0 / _1300;
    int _1336 = _1284 >> 2;
    int _1338 = _1332 ? 0 : 1;
    int _1340 = _1336 << 4;
    int _1342 = _1340 + 512;
    bool _1344 = _1196 > 0.0;
    float _1346 = fma(_169, _1184, _1256);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1350 = _1348 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1352 = fma(_183, _1184, _1268);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1354;
    uint _1358 = uint(int(uint(_1342) >> uint(2)));
    uint _1360 = uint(int(uint(int(_1358)) >> uint(2)));
    int _1362 = int(_1358) & 3;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[int(_1360)][_1362];
    int _1366 = int(_1358) + 1;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    int _1370 = _1366 & 3;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[int(_1368)][_1370];
    bool _1374 = _727 > 0.5;
    float _1376 = _1322 * _1334;
    float _1378 = _1356 * _783;
    float _1380 = 1.0 / _1350;
    int _1382 = _1342 + 8;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    uint _1386 = uint(int(uint(int(_1384)) >> uint(2)));
    int _1388 = int(_1384) & 3;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[int(_1386)][_1388];
    int _1392 = int(_1384) + 1;
    uint _1394 = uint(int(uint(_1392) >> uint(2)));
    int _1396 = _1392 & 3;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[int(_1394)][_1396];
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1410 = _1408 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1414 = _1412 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1416 = _1406 * _839;
    float _1418 = 1.0 / _1402;
    float _1420 = _1410 * _815;
    int _1422 = ~_1338;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1428;
    int _1432 = _1426;
    if (!_1344)
    {
        int _1434 = ~_1338;
        int _1436 = _1434 + 1;
        _1432 = _1436;
    }
    int _1438 = _1432;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    bool _1444 = _821 >= 0.0;
    bool _1446 = isnan(_821);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.0);
    bool _1452 = _1448 || _1450;
    float _1454 = _1430 * _856;
    float _1456 = 1.0 / _1414;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _1462 = _1452 ? 0 : 1;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1464;
    bool _1468 = _821 > 0.0;
    float _1470 = _1460 * _1380;
    int _1472 = abs(_1146);
    float _1474 = _725 + _1206;
    float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1478 = _1442 * _1418;
    float _1480 = _1206 * 2.0;
    int _1482 = abs(_1194);
    float _1484 = _1474 + (-1.0);
    int _1486 = ~_1472;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    int _1492 = ~_1482;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    float _1498 = floor(_1480);
    int _1500 = ~_1462;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    float _1506 = _1466 * _1456;
    int _1508 = _1504;
    if (!_1468)
    {
        int _1510 = ~_1462;
        int _1512 = _1510 + 1;
        _1508 = _1512;
    }
    int _1514 = _1508;
    float _1516 = _151 + _725;
    int _1518 = abs(_1204);
    float _1520 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1522 = int(_1520);
    int _1524 = _1490 * as_type<int>(_1372);
    float _1526 = _1516 + (-1.0);
    int _1528 = _1496 * as_type<int>(_1364);
    int _1530 = _1528 + _1524;
    float _1532 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1534 = -_129;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1278);
    float _1538 = _1228 + 0.5;
    bool _1540 = _1498 >= 0.0;
    bool _1542 = isnan(_1498);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan(0.0);
    bool _1548 = _1544 || _1546;
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1552 = ~_1518;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1532, _1538, _1536);
    int _1560 = abs(_1250);
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1564 = _719 + _1562;
    int _1566 = _1548 ? 0 : 1;
    int _1568 = _1556 * as_type<int>(_1390);
    int _1570 = _1568 + _1530;
    float _1572 = fma(_1378, _1564, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1574 = float(uint(_1522));
    float _1576 = in.m_56.w;
    bool _1578 = _1498 > 0.0;
    float _1580 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1582 = ~_1560;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    float _1588 = in.m_58.w;
    int _1590 = abs(_1136);
    float _1592 = 1.0 / _1574;
    int _1594 = abs(_1522);
    int _1596 = _1586 * as_type<int>(_1398);
    int _1598 = _1596 + _1570;
    int _1600 = ~_1590;
    int _1602 = _1600 + 1;
    int _1604 = _1602 + 1;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1608 = _715 + _1606;
    float _1610 = float(uint(_1594));
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1614 = _719 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1618 = _715 + _1616;
    int _1620 = _1598 * _1604;
    float _1622 = fma(_1416, _1608, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1624 = 1.0 / _1610;
    float _1626 = fma(_1316, _1614, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1628 = _1224 * _1590;
    int _1630 = _1628 + _1620;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1634 = _715 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1638 = _715 + _1636;
    float _1640 = fma(_1478, _1618, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _1642 = as_type<int>(_1592) + (-2);
    float _1644 = fma(_1454, _1634, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1646 = float(uint(_1630));
    float _1648 = in.m_60.w;
    int _1650 = abs(_1630);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1654 = _715 + _1652;
    float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1658 = as_type<float>(_1642) * _1646;
    float _1660 = float(uint(_1650));
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1664 = _715 + _1662;
    int _1666 = as_type<int>(_1624) + (-2);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1670 = _715 + _1668;
    float _1672 = fma(_1420, _1638, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1674 = fma(_1376, _1654, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1676 = trunc(_1658);
    float _1678 = precise::max(_1676, 0.0);
    uint _1680 = uint(_1678);
    float _1682 = as_type<float>(_1666) * _1660;
    float _1684 = fma(_1470, _1664, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1688 = fma(_1506, _1670, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1690 = ~_1522;
    int _1692 = _1690 + 1;
    float _1694 = _1286 + _1588;
    int _1696 = ~_1594;
    int _1698 = _1696 + 1;
    float _1700 = trunc(_1682);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    float _1706 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1686);
    float _1708 = _1346 + _1576;
    float _1710 = _1352 + _1648;
    float _1712 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1292);
    float _1714 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1716 = _1692 * int(_1680);
    int _1718 = _1716 + _1630;
    float _1720 = _1272 + (-0.5);
    bool _1722 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1724 = isnan(_715);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1706);
    bool _1736 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1738 = isnan(_719);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = -_1714;
    float _1750 = -_1712;
    float _1752 = fma(_1748, _1720, _1750);
    float _1754 = float(uint(_1718));
    float _1756 = -_1732;
    float _1758 = _1756 + 1.0;
    int _1760 = _1698 * int(_1704);
    int _1762 = _1760 + _1650;
    bool _1764 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1766 = isnan(_715);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1772 = _1768 || _1770;
    float _1774 = float(_1772);
    float _1776 = -_1734;
    float _1778 = _1776 + 1.0;
    bool _1780 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1782 = isnan(_715);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = as_type<float>(_1642) * _1754;
    float _1794 = float(uint(_1762));
    float _1796 = _1774 * _1758;
    float _1798 = -_1774;
    float _1800 = _1798 + 1.0;
    bool _1802 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1804 = isnan(_715);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = as_type<float>(_1666) * _1794;
    float _1816 = -_1790;
    float _1818 = _1816 + 1.0;
    bool _1820 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1822 = isnan(_719);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1828 = _1824 || _1826;
    float _1830 = float(_1828);
    float _1832 = _1790 * _1800;
    bool _1834 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1836 = isnan(_719);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = _1812 * _1818;
    bool _1848 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1850 = isnan(_715);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1856 = _1852 || _1854;
    float _1858 = float(_1856);
    float _1860 = -_1812;
    float _1862 = _1860 + 1.0;
    bool _1864 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1866 = isnan(_715);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = -_1844;
    float _1878 = _1876 + 1.0;
    float _1880 = trunc(_1814);
    float _1882 = precise::max(_1880, 0.0);
    uint _1884 = uint(_1882);
    float _1886 = _1858 * _1862;
    float _1888 = -_1858;
    float _1890 = _1888 + 1.0;
    float _1892 = -_1830;
    float _1894 = _1892 + 1.0;
    float _1896 = _1830 * _1878;
    float _1898 = -_1874;
    float _1900 = _1898 + 1.0;
    float _1902 = _1874 * _1890;
    float _1904 = _1746 * _1894;
    float _1906 = _813 * _1900;
    float _1908 = -_813;
    float _1910 = _1908 + 1.0;
    float _1912 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1914 = _1572 * _1904;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1918 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[83].z, _817);
    float _1920 = _795 * _1910;
    float _1922 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1924 = log2(_1922);
    float _1926 = -_795;
    float _1928 = _1926 + 1.0;
    float _1930 = -_1746;
    float _1932 = _1930 + 1.0;
    float _1934 = _1622 * _1920;
    float _1936 = -_1916;
    float _1938 = fma(_1912, 2.0, _1936);
    float _1940 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1914);
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1934);
    float _1944 = trunc(_1792);
    float _1946 = precise::max(_1944, 0.0);
    uint _1948 = uint(_1946);
    float _1950 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1952 = fma(_1626, _1896, _1940);
    float _1954 = fma(_1672, _1906, _1942);
    int _1956 = int(_1704) + int(_1884);
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1960 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1918);
    float _1962 = _1924 * _129;
    float _1964 = fma(_1950, -2.0, _1958);
    int _1966 = ~_1566;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    float _1972 = -_129;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1938);
    int _1976 = _1970;
    if (!_1578)
    {
        int _1978 = ~_1566;
        int _1980 = _1978 + 1;
        _1976 = _1980;
    }
    int _1982 = _1976;
    float _1984 = exp2(_1962);
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1988 = int(_1680) + int(_1948);
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1992 = 1.0 + _1990;
    bool _1994 = !_1170;
    int _1996 = _1994 ? 0 : 1;
    float _1998 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1986);
    bool _2000 = !_1166;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2006 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2008 = isnan(1.0);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2014 = _2010 || _2012;
    float _2016 = 1.0 / _1992;
    int _2018 = ~_1522;
    int _2020 = _2018 + 1;
    float _2022 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2004);
    int _2024 = abs(_1996);
    float _2026 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1964);
    bool _2028 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2030 = isnan(0.0);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2036 = _2032 || _2034;
    float _2038 = -_1984;
    float _2040 = _2038 + 1.0;
    float _2042 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1998);
    int _2044 = ~_1594;
    int _2046 = _2044 + 1;
    float _2048 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2022);
    float _2050 = _2036 ? _2040 : 0.0;
    int _2052 = _2020 * _1988;
    int _2054 = _2052 + _1630;
    float _2056 = float(_1438);
    int _2058 = _2046 * _1956;
    int _2060 = _2058 + _1650;
    int _2062 = abs(_2002);
    if (_2014)
    {
        float _2064 = _2050 * _2016;
        _131 = _2064;
    }
    float _2066 = _131;
    float _2068 = fma(_1644, _1902, _1954);
    bool _2070 = uint(_2054) >= uint(_1522);
    float _2072 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1952);
    float _2074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2076 = !_2070;
    int _2078 = _2076 ? 0 : (-1);
    float _2080 = fma(_1640, _1886, _2068);
    bool _2082 = uint(_2060) >= uint(_1594);
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _1708 + _2084;
    float _2088 = float(_2062);
    float _2090 = fma(_1674, _1846, _2080);
    float _2092 = float(_1982);
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2096 = in.m_66.x;
    float _2098 = in.m_66.y;
    float _2100 = in.m_66.z;
    int _2102 = ~_1988;
    int _2104 = _2102 + _2078;
    int _2106 = _2104 + 1;
    float _2108 = -_1960;
    float _2110 = _2108 + 1.0;
    float _2112 = float(_2024);
    float _2114 = _2088 * _2092;
    int _2116 = _1630 ^ _1522;
    int _2118 = _1522 * _2106;
    int _2120 = _2118 + _1630;
    bool _2122 = _1522 == 0;
    float _2124 = _2112 * _2056;
    bool _2126 = !_2082;
    int _2128 = _2126 ? 0 : (-1);
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2132 = _1694 + _2130;
    uint _2134 = uint(int(uint(_2116) >> uint(31)));
    float _2136 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2138 = !_2122;
    int _2140 = _2138 ? _2120 : (-1);
    float _2142 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2144 = ~_2128;
    int _2146 = _1956 + _2144;
    int _2148 = _2146 + 1;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2152 = _1710 + _2150;
    bool _2154 = _1206 > 0.5;
    float _2156 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2142);
    int _2158 = ~int(_2134);
    int _2160 = _2158 + 1;
    float _2162 = _2124 * (-2.0);
    bool _2164 = _1522 == 0;
    float _2166 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2168 = -_295;
    int _2170 = _2154 ? as_type<int>(_2168) : as_type<int>(_295);
    float _2172 = fma(_1580, _2162, _1580);
    int _2174 = _2148 ^ _2160;
    float _2176 = fma(_1684, _1832, _2090);
    float _2178 = float(_2140);
    float _2180 = fma(_2162, _2098, _2098);
    bool _2182 = !_1260;
    float _2184 = _2182 ? _295 : as_type<float>(_2170);
    float _2186 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2156);
    int _2188 = ~_2160;
    int _2190 = _2188 + _2174;
    int _2192 = _2190 + 1;
    float _2194 = fma(_2136, _2178, _1974);
    float _2196 = -_207;
    int _2198 = _1374 ? as_type<int>(_2196) : as_type<int>(_207);
    float _2200 = _2184 + 0.5;
    bool _2202 = !_2164;
    int _2204 = _2202 ? _2192 : (-1);
    float _2206 = -_2048;
    float _2208 = _2206 + 1.0;
    bool _2210 = !_1266;
    float _2212 = _2210 ? _207 : as_type<float>(_2198);
    float _2214 = fma(_2136, _2200, _2194);
    float _2216 = _2132 * _2132;
    float _2218 = float(_2204);
    float _2220 = -_2208;
    float _2222 = fma(_1228, _2220, _1558);
    bool _2224 = _2186 >= 0.0;
    float _2226 = fma(_2086, _2086, _2216);
    float _2228 = fma(_1688, _1796, _2176);
    float _2230 = -_2026;
    float _2232 = fma(_2166, _2218, _2230);
    float _2234 = _2212 + (-0.5);
    float _2236 = fma(_2152, _2152, _2226);
    float _2238 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2228);
    float _2240 = -_2166;
    float _2242 = fma(_2240, _2234, _2232);
    float _2244 = -_2042;
    float _2246 = _2244 + 1.0;
    float _2248 = rsqrt(_2236);
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_2224)
    {
        _2254 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2256 = _2254;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2260 = fma(_1272, _2246, _1752);
    float _2262 = _2250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2264 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2266 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2072 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2270 = as_type<int>(_2256);
    if (_2224)
    {
        float _2272 = _2256 * 5.0;
        _2270 = as_type<int>(_2272);
    }
    int _2274 = _2270;
    float _2276 = -_2110;
    float _2278 = fma(_2184, _2276, _2214);
    float _2280 = fma(_2212, _1778, _2242);
    float _2282 = _2114 * (-2.0);
    out.m_68.x = _2262;
    out.m_68.y = _2264;
    out.m_68.z = _2266;
    out.m_68.w = _2268;
    bool _2284 = !_1174;
    int _2286 = _2284 ? 0 : 1;
    float _2288 = _2132 * _2248;
    float _2290 = fma(_1550, _2282, _1550);
    if (_2224)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6487 = as_type<float>(_2274);
        out.gl_Position.z = _6487;
    }
    float _2292 = _2086 * _2248;
    out.m_70.x = _2238;
    out.m_72.x = _2222;
    out.m_72.y = _2260;
    out.m_72.z = _2278;
    out.m_72.w = _2280;
    if (_2224)
    {
        out.m_45.x = 0.0;
    }
    if (_2224)
    {
        return out;
    }
    float _2294 = -_2288;
    float _2296 = fma(_2294, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1694);
    float _2298 = -_2292;
    float _2300 = fma(_2298, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1708);
    float _2302 = _725 + (-0.5);
    float _2304 = fma(_2282, _2096, _2096);
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2308 = _2296 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2312 = _2300 + _2310;
    float _2314 = fma(_2302, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2180);
    float _2316 = _151 + (-0.5);
    float _2318 = _2308 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2320 = -_2288;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2132);
    float _2324 = fma(_2172, _2066, _2314);
    float _2326 = fma(_2316, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2304);
    float _2328 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2318);
    float _2330 = _2152 * _2248;
    int _2332 = abs(_2286);
    float _2334 = _2324 * 0.15915493667125701904296875;
    float _2336 = float(_1514);
    float _2338 = -_2330;
    float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1710);
    float _2342 = float(_2332);
    float _2344 = -_2292;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2086);
    float _2348 = _2322 * _2322;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2352 = _2340 + _2350;
    float _2354 = _151 + _1206;
    float _2356 = _2342 * _2336;
    float _2358 = fma(_2346, _2346, _2348);
    float _2360 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2328);
    float _2362 = _2354 + (-1.0);
    float _2364 = _1206 + (-0.5);
    float _2366 = -_2330;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2152);
    bool _2370 = _2360 >= 0.0;
    float _2372 = _2356 * (-2.0);
    float _2374 = fma(_2362, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2376 = fma(_2368, _2368, _2358);
    float _2378 = fma(_2290, _2066, _2326);
    float _2380 = fma(_2372, _2100, _2100);
    float _2382 = fma(_2374, _2372, _2374);
    float _2384 = _2334 * 6.283185482025146484375;
    float _2386 = sin(_2384);
    float _2388 = _2378 * 0.15915493667125701904296875;
    float _2390 = fma(_2364, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2380);
    float _2392 = _299 * _459;
    float _2394 = fma(_2382, _2066, _2390);
    float _2396 = _2380;
    float _2398 = _2340;
    if (_2370)
    {
        _2396 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2400 = _2396;
    float _2402 = sqrt(_2376);
    float _2404 = _2394 * 0.15915493667125701904296875;
    int _2406 = as_type<int>(_2400);
    if (_2370)
    {
        out.m_45.x = 0.0;
    }
    if (_2370)
    {
        float _2408 = _2400 * 5.0;
        _2406 = as_type<int>(_2408);
    }
    int _2410 = _2406;
    float _2412 = _2334 * 6.283185482025146484375;
    float _2414 = cos(_2412);
    if (_2370)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6715 = as_type<float>(_2410);
        out.gl_Position.z = _6715;
    }
    float _2416 = _2388 * 6.283185482025146484375;
    float _2418 = sin(_2416);
    float _2420 = _2248 * _2402;
    float _2422 = _2388 * 6.283185482025146484375;
    float _2424 = cos(_2422);
    float _2426 = _2404 * 6.283185482025146484375;
    float _2428 = sin(_2426);
    if (_2370)
    {
        return out;
    }
    float _2430 = _2404 * 6.283185482025146484375;
    float _2432 = cos(_2430);
    float _2434 = _2392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2436 = _299 * _469;
    float _2438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2440 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _295);
    float _2442 = _2420 * _2434;
    float _2444 = _2436 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2446 = _2424 * _2414;
    float _2448 = _2424 * _2386;
    float _2450 = _2438 * _2442;
    float _2452 = _2420 * _2444;
    float _2454 = _2418 * _2386;
    float _2456 = _2440 * _2452;
    float _2458 = fma(_2428, _2446, _2454);
    float _2460 = _2432 * _2450;
    float _2462 = -_2450;
    float _2464 = _2428 * _2462;
    float _2466 = fma(_2428, _2454, _2446);
    float _2468 = _2424 * _2460;
    float _2470 = _2386 * _2432;
    float _2472 = _2414 * _2432;
    float _2474 = _2418 * _2414;
    float _2476 = fma(_2458, _2456, _2468);
    float _2478 = _2420 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2480 = _2478 * 0.5;
    float _2482 = fma(_2472, _2456, _2464);
    float _2484 = -_2474;
    float _2486 = fma(_2428, _2448, _2484);
    float _2488 = -_2448;
    float _2490 = fma(_2428, _2474, _2488);
    float _2492 = _2418 * _2460;
    float _2494 = fma(_2470, _2480, _2482);
    float _2496 = fma(_2486, _2480, _2476);
    float _2498 = fma(_2490, _2456, _2492);
    float _2500 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2502 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2504 = fma(_2466, _2480, _2498);
    float _2506 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2508 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2500);
    float _2510 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2502);
    float _2512 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2506);
    float _2514 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2508);
    float _2516 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2510);
    float _2518 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2512);
    float _2520 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2522 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2524 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2526 = _1710 + _2520;
    float _2528 = _1708 + _2522;
    float _2530 = _1694 + _2524;
    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2534 = _2526 + _2532;
    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2538 = _2528 + _2536;
    float _2540 = _2534 * _2534;
    float _2542 = fma(_2538, _2538, _2540);
    float _2544 = sqrt(_2542);
    bool _2546 = _2544 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2548 = _2540;
    float _2550 = _2522;
    float _2552 = _2528;
    float _2554 = _2530;
    if (!_2546)
    {
        _2548 = _2526;
    }
    float _2556 = _2548;
    float _2558 = _2556;
    if (!_2546)
    {
        _2550 = _2530;
    }
    float _2560 = _2550;
    bool _2562 = !_2546;
    float _2564 = _2560;
    if (!_2562)
    {
        float _2566 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2570 = _2544 + _2568;
        float _2572 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2574 = rsqrt(_2542);
        float _2576 = _2570 * _2566;
        float _2578 = _2576 * 0.15915493667125701904296875;
        float _2580 = _2578 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        float _2584 = _2578 * 6.283185482025146484375;
        float _2586 = sin(_2584);
        float _2588 = _2582 + (-1.0);
        float _2590 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2592 = fma(_2586, _2572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2594 = fma(_2530, _2582, _2590);
        float _2596 = _2574 * _2592;
        float _2598 = fma(_2538, _2596, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2600 = fma(_2534, _2596, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2564 = _2594;
        _2552 = _2598;
        _2558 = _2600;
    }
    float _2602 = _2564;
    float _2604 = _2552;
    float _2606 = _2558;
    float _2608 = -_1694;
    float _2610 = _2608 + _2602;
    float _2612 = -_1708;
    float _2614 = _2612 + _2604;
    float _2616 = -_1710;
    float _2618 = _2616 + _2606;
    float _2620 = _2610 * _2610;
    float _2622 = fma(_2614, _2614, _2620);
    float _2624 = fma(_2618, _2618, _2622);
    float _2626 = sqrt(_2624);
    bool _2628 = _2626 > 0.0;
    bool _2630 = !_2628;
    float _2632 = _2602;
    float _2634 = _2604;
    float _2636 = _2606;
    float _2638 = _2610;
    if (!_2630)
    {
        float _2640 = _255 * _255;
        float _2642 = fma(_285, _285, _2640);
        float _2644 = fma(_291, _291, _2642);
        float _2646 = rsqrt(_2624);
        float _2648 = sqrt(_2644);
        float _2650 = _2614 * _2646;
        float _2652 = _2610 * _2646;
        float _2654 = _2618 * _2646;
        bool _2656 = _2648 > 0.0;
        bool _2658 = !_2656;
        _2554 = _2648;
        if (!_2658)
        {
            float _2660 = rsqrt(_2644);
            float _2662 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2664 = _255 * _2660;
            float _2666 = _285 * _2660;
            float _2668 = _291 * _2660;
            float _2670 = _2652 * _2664;
            float _2672 = fma(_2650, _2666, _2670);
            float _2674 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2676 = fma(_2654, _2668, _2672);
            float _2678 = _2676 * _2674;
            float _2680 = fma(_285, _2678, _2604);
            float _2682 = fma(_255, _2678, _2602);
            float _2684 = fma(_291, _2678, _2606);
            _2632 = _2682;
            _2634 = _2680;
            _2636 = _2684;
            _2554 = _2662;
            _2638 = _2672;
        }
    }
    float _2686 = _2632;
    float _2688 = _2634;
    float _2690 = _2636;
    float _2692 = _2554;
    float _2694 = _2638;
    float _2696 = -_2288;
    float _2698 = fma(_2696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2686);
    float _2700 = -_2292;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2688);
    float _2704 = -_2330;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2690);
    float _2708 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2710 = _2698 + _2708;
    float _2712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2714 = _2702 + _2712;
    float _2716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2718 = _2706 + _2716;
    float _2720 = _2710 * _2710;
    float _2722 = fma(_2714, _2714, _2720);
    float _2724 = fma(_2718, _2718, _2722);
    float _2726 = rsqrt(_2724);
    float _2728 = sqrt(_2724);
    float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2732 = _2714 * _2730;
    float _2734 = _2718 * _2730;
    float _2736 = _2732 * _2732;
    float _2738 = _2734 * _2734;
    float _2740 = _2736 + _2738;
    float _2742 = sqrt(_2740);
    bool _2744 = _2742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2748 = _2742 + _2746;
    float _2750 = _2718;
    float _2752 = _2722;
    float _2754 = _2748;
    float _2756 = _2692;
    float _2758 = _2730;
    float _2760 = _2732;
    if (_2744)
    {
        float _2762 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2750 = _2762;
    }
    float _2764 = _2750;
    if (_2744)
    {
        float _2766 = rsqrt(_2740);
        _2752 = _2766;
    }
    float _2768 = _2752;
    float _2770 = _2768;
    if (_2744)
    {
        float _2772 = _2748 * _2764;
        _2754 = _2772;
    }
    float _2774 = _2754;
    if (_2744)
    {
        float _2776 = _2774 * 0.15915493667125701904296875;
        _2756 = _2776;
    }
    float _2778 = _2756;
    float _2780 = _2726;
    float _2782 = _2778;
    if (_2744)
    {
        float _2784 = _2778 * 6.283185482025146484375;
        float _2786 = sin(_2784);
        _2780 = _2786;
    }
    float _2788 = _2780;
    float _2790 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2792 = precise::max(0.0, _2790);
    float _2794 = _2694;
    float _2796 = _2792;
    float _2798 = _2790;
    if (_2744)
    {
        float _2800 = _2778 * 6.283185482025146484375;
        float _2802 = cos(_2800);
        _2794 = _2802;
    }
    float _2804 = _2794;
    float _2806 = -_2730;
    float _2808 = -_2792;
    float _2810 = fma(_2710, _2806, _2808);
    if (!_2744)
    {
        _2796 = _2734;
    }
    float _2812 = _2796;
    float _2814 = _2812;
    if (_2744)
    {
        float _2816 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2798 = _2816;
    }
    float _2818 = _2798;
    float _2820 = _2788;
    float _2822 = _2818;
    if (_2744)
    {
        float _2824 = fma(_2788, _2818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2820 = _2824;
    }
    float _2826 = _2820;
    float _2828 = _2826;
    if (_2744)
    {
        float _2830 = _2804 + (-1.0);
        _2822 = _2830;
    }
    float _2832 = _2822;
    float _2834 = _2832;
    if (_2744)
    {
        float _2836 = _2768 * _2826;
        _2758 = _2836;
    }
    float _2838 = _2758;
    if (!_2744)
    {
        _2770 = _2810;
    }
    float _2840 = _2770;
    float _2842 = _2840;
    if (_2744)
    {
        float _2844 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2844;
    }
    float _2846 = _2782;
    if (_2744)
    {
        float _2848 = _2732 * _2838;
        _2760 = _2848;
    }
    float _2850 = _2760;
    if (!_2744)
    {
        _2828 = _2736;
    }
    float _2852 = _2828;
    float _2854 = _2852;
    if (_2744)
    {
        float _2856 = _2734 * _2838;
        _2814 = _2856;
    }
    float _2858 = _2814;
    if (_2744)
    {
        float _2860 = fma(_2810, _2804, _2846);
        _2842 = _2860;
    }
    float _2862 = _2842;
    if (_2744)
    {
        float _2864 = _2850 * _2850;
        _2854 = _2864;
    }
    float _2866 = _2854;
    if (!_2744)
    {
        _2834 = _2738;
    }
    float _2868 = _2834;
    float _2870 = _2868;
    if (_2744)
    {
        float _2872 = _2858 * _2858;
        _2870 = _2872;
    }
    float _2874 = _2870;
    float _2876 = fma(_2862, _2862, _2866);
    float _2878 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2880 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2882 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2884 = _2876 + _2874;
    float _2886 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2878);
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2890 = fma(_2728, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2888);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2896 = rsqrt(_2884);
    float _2898 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2886);
    float _2900 = -_2892;
    float _2902 = _2900 + 1.0;
    float _2904 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2894);
    float _2906 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2880);
    float _2908 = _2898 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2910 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2912 = abs(_2902);
    float _2914 = log2(_2912);
    float _2916 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2904);
    float _2918 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2906);
    float _2920 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2922 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2910);
    float _2924 = _2916 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2926 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2928 = -_2920;
    float _2930 = fma(_2928, _2882, 1.0);
    float _2932 = _2896 * _2850;
    float _2934 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2936 = _2896 * _2862;
    float _2938 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2922);
    float _2940 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2942 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2934);
    float _2944 = _2896 * _2858;
    float _2946 = _2938 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2948 = -_2940;
    float _2950 = fma(_2936, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2948);
    float _2952 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2954 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2942);
    float _2956 = log2(_2930);
    float _2958 = -_2944;
    float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2950);
    float _2962 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2964 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2954);
    float _2966 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2968 = fma(_2960, -0.5, 0.5);
    float _2970 = fma(_2960, 0.5, 0.5);
    float _2972 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2962);
    float _2974 = exp2(_2952);
    float _2976 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2966);
    float _2978 = fma(_2970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2980 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2972);
    float _2982 = _2936 + 1.0;
    float _2984 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2976);
    float _2986 = fma(_2970, _2978, -0.212114393711090087890625);
    float _2988 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2980);
    float _2990 = 1.0 / _2964;
    float _2992 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2984);
    float _2994 = fma(_2970, _2986, 1.570728778839111328125);
    float _2996 = sqrt(_2968);
    float _2998 = -_2936;
    float _3000 = fma(_2974, _2982, _2998);
    float _3002 = _2956 * 0.693147182464599609375;
    float _3004 = fma(_3000, 0.5, 0.5);
    float _3006 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3008 = _2988 * _2990;
    float _3010 = _2992 * _2990;
    float _3012 = fma(_3008, 0.5, 0.5);
    float _3014 = fma(_3010, -0.5, 0.5);
    float _3016 = _2996 * 0.636619746685028076171875;
    float3 _7692 = float3(_3012, _3014, _3006);
    float _3018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7692, float3(0.0), isnan(_7692)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7692, float3(0.0), isnan(_7692)), level(0.0)).x;
    float3 _7703 = float3(_3012, _3014, _3006);
    float4 _3021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7703, float3(0.0), isnan(_7703)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7703, float3(0.0), isnan(_7703)), level(0.0)).xyzw;
    float _3023 = _3021.x;
    float _3025 = _3021.y;
    float _3027 = _3021.z;
    float _3029 = _3021.w;
    float _3031 = -_2994;
    float _3033 = fma(_3016, _3031, 1.0);
    float2 _7725 = float2(_3033, _3004);
    float3 _3037 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7725, float2(0.0), isnan(_7725)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7725, float2(0.0), isnan(_7725)), level(0.0)).xyz;
    float _3039 = _3037.x;
    float _3041 = _3037.y;
    float _3043 = _3037.z;
    float _3045 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3047 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3049 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3051 = isnan(0.5);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3057 = _3053 || _3055;
    float _3059 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3061 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3045);
    float _3063 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3047);
    float _3065 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3067 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3061);
    float _3069 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3063);
    float _3071 = exp2(_3059);
    float _3073 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3065);
    float _3075 = _3067 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3077 = _3069 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3079 = _3012;
    float _3081 = _3067;
    float _3083 = _3065;
    if (!_3057)
    {
        _2398 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3085 = _2398;
    float _3087 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3073);
    float _3089 = _3077 + _3075;
    float _3091 = 1.0 / _3075;
    float _3093 = _3085;
    if (!_3057)
    {
        _3079 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3095 = _3079;
    float _3097 = _3089 * _3091;
    float _3099 = _3097 * 0.5;
    float _3101 = _3091;
    float _3103 = _3099;
    if (_3057)
    {
        _3101 = 1.0;
    }
    float _3105 = _3101;
    float _3107 = _3105;
    if (!_3057)
    {
        float _3109 = -_3085;
        float _3111 = fma(_3099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3109);
        _3103 = _3111;
    }
    float _3113 = _3103;
    if (!_3057)
    {
        float _3115 = -_3095;
        float _3117 = _3115 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3093 = _3117;
    }
    float _3119 = _3093;
    if (!_3057)
    {
        float _3121 = 1.0 / _3119;
        _3081 = _3121;
    }
    float _3123 = _3081;
    float _3125 = _3113;
    if (!_3057)
    {
        float _3127 = 1.0 / _3113;
        _3125 = _3127;
    }
    float _3129 = _3125;
    if (!_3057)
    {
        float _3131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3133 = -_3095;
        float _3135 = fma(_3129, _3131, _3133);
        _3083 = _3135;
    }
    float _3137 = _3083;
    if (!_3057)
    {
        float _3139 = _3137 * _3123;
        float _3141 = precise::clamp(_3139, 0.0, 1.0);
        _3107 = _3141;
    }
    float _3143 = _3107;
    float _3145 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3087);
    float _3147 = -_3071;
    float _3149 = _3147 + 1.0;
    float _3151 = _3143 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3153 = _3145 + _2964;
    float _3155 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3157 = _3143 > 0.0;
    bool _3159 = isnan(_3143);
    bool _3161 = _3157 || _3159;
    bool _3163 = isnan(0.0);
    bool _3165 = _3161 || _3163;
    out.gl_Position.x = _2988;
    out.gl_Position.y = _2992;
    out.gl_Position.z = _3145;
    out.gl_Position.w = _2964;
    float _3167 = _3153 * 0.5;
    float _3169 = _3151 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_74.z = _3167;
    out.m_74.w = _2964;
    out.m_45.x = _3169;
    float _3171 = _3155 * _3018;
    float _3173 = -_3155;
    float _3175 = _3173 + 1.0;
    float _3177 = _3029 * _3171;
    float _3179 = _3043 * _3171;
    float _3181 = fma(_3039, _3177, _3023);
    float _3183 = fma(_3041, _3177, _3025);
    float _3185 = _3029 * _3175;
    float _3187 = fma(_3029, _3179, _3027);
    out.m_76.x = _3181;
    out.m_76.y = _3183;
    out.m_76.z = _3187;
    out.m_76.w = _3185;
    if (_3165)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3189 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3189;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _707 = false;
    bool _595 = false;
    bool _421 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3246 = as_type<float>(_111);
        out.gl_Position.z = _3246;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3316 = as_type<float>(_149);
        out.gl_Position.z = _3316;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_49.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = in.m_54.x;
    float _161 = in.m_54.y;
    float _163 = in.m_54.z;
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    float _177 = _155 * _153;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    int _187 = as_type<int>(_157) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_157) & 2;
    bool _193 = _191 != 0;
    float _195 = _185 * 6.283185482025146484375;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = floor(_185);
    float _203 = _195 * 0.15915493667125701904296875;
    bool _205 = !_193;
    float _207 = _205 ? (-0.5) : 0.5;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _215 = _213 != 0;
    float _217 = _161 * _167;
    bool _219 = !_199;
    int _221 = _219 ? 0 : 1;
    float _223 = _203 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = _161 * _173;
    bool _229 = !_211;
    int _231 = _229 ? 0 : 1;
    float _233 = fma(_159, _165, _217);
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _237 = _161 * _181;
    int _239 = abs(_231);
    float _241 = fma(_159, _171, _227);
    int _243 = abs(_221);
    float _245 = fma(_159, _179, _237);
    float _247 = -_201;
    float _249 = _185 + _247;
    bool _251 = !_215;
    int _253 = _251 ? 0 : 1;
    float _255 = fma(_163, _175, _241);
    float _257 = float(_239);
    float _259 = -_249;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _263 = abs(_253);
    float _265 = fma(_225, 0.5, 0.5);
    bool _267 = _249 < 0.5;
    float _269 = float(_267);
    float _271 = abs(_261);
    float _273 = _257 * _271;
    float _275 = float(_243);
    float _277 = -_265;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _281 = -_269;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = fma(_163, _169, _233);
    float _287 = fma(_275, _279, _273);
    float _289 = float(_263);
    float _291 = fma(_163, _183, _245);
    bool _293 = !_189;
    float _295 = _293 ? (-0.5) : 0.5;
    float _297 = abs(_283);
    float _299 = fma(_289, _297, _287);
    bool _301 = !_235;
    float _303 = _179;
    float _319;
    if (!_301)
    {
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_95);
        float _325 = 1.0 / _323;
        float _327 = _129 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = _329 + _331;
    bool _335 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_329);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _347;
    float _351 = -_345;
    float _353 = _351 + 1.0;
    bool _355 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _357 = isnan(_329);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _373 = 1.0 / _349;
    float _375 = _365 * _353;
    float _377 = -_365;
    float _379 = _377 + 1.0;
    float _381 = _333 * _373;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = fma(_369, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _389 = fma(_385, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = _387 * _375;
    float _393 = _389 * _375;
    float _395 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].x, _391);
    float _397 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].y, _393);
    float _399 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[144].x, _395);
    float _401 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[144].y, _397);
    bool _403 = !_371;
    float _419;
    if (!_403)
    {
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _407 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_95);
        float _425 = 1.0 / _423;
        float _427 = _129 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_62.x;
    float _433 = in.m_62.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = _429 + _435;
    bool _439 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _441 = isnan(_429);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _457 = 1.0 / _453;
    float _459 = _401 * _433;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _467 = _429 + _465;
    float _469 = _399 * _431;
    float _471 = _437 * _457;
    bool _473 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _475 = isnan(_429);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = 1.0 / _463;
    bool _487 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _489 = isnan(_429);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _499;
    float _503 = -_483;
    float _505 = _503 + 1.0;
    float _507 = -_497;
    float _509 = _507 + 1.0;
    float _511 = fma(_501, _471, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _513 = _497 * _505;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _519;
    float _523 = _449 * _509;
    float _525 = -_449;
    float _527 = _525 + 1.0;
    float _529 = fma(_517, _471, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _531 = fma(_521, _471, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _533 = _511 * _523;
    float _535 = _467 * _485;
    float _537 = _529 * _523;
    float _539 = _531 * _523;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _553 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].x, _537);
    float _555 = fma(_543, _535, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _557 = fma(_547, _535, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _559 = fma(_551, _535, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _561 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].y, _533);
    float _563 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[107].z, _539);
    float _565 = fma(_555, _513, _553);
    float _567 = fma(_557, _513, _561);
    float _569 = fma(_559, _513, _563);
    float _571 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[109].x, _565);
    float _573 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[109].y, _567);
    float _575 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[109].z, _569);
    bool _577 = !_455;
    float _593;
    if (!_577)
    {
        float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _581 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _585 = _583 * _579;
        float _587 = floor(_585);
        float _589 = -_587;
        float _591 = _585 + _589;
        _593 = _591;
        _595 = true;
    }
    else
    {
        float _597 = float(_95);
        float _599 = 1.0 / _597;
        float _601 = _129 * _599;
        _593 = _601;
    }
    _595 = false;
    float _603 = _593;
    bool _605 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _607 = isnan(_603);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _621 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_603);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _639 = _603 + _637;
    float _641 = -_615;
    float _643 = _641 + 1.0;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _647 = 1.0 / _619;
    float _649 = _631 * _643;
    float _651 = -_631;
    float _653 = _651 + 1.0;
    float _655 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _657 = _635 * _647;
    float _659 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _661 = fma(_657, _639, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _663 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _665 = _661 * _649;
    float _667 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[115].x, _665);
    float _669 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[116].x, _667);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _671;
    out.m_64.y = _673;
    out.m_64.z = _675;
    out.m_64.w = _677;
    bool _679 = !_645;
    float _701;
    float _703;
    float _705;
    if (!_679)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _683 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _685 = float(_95);
        float _687 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _689 = 1.0 / _685;
        float _691 = _687 * _681;
        float _693 = floor(_691);
        float _695 = _129 * _689;
        float _697 = -_693;
        float _699 = _691 + _697;
        _701 = _695;
        _703 = _685;
        _705 = _699;
        _707 = true;
    }
    else
    {
        float _709 = float(_95);
        float _711 = 1.0 / _709;
        float _713 = _129 * _711;
        _701 = _713;
        _703 = _709;
        _705 = _713;
    }
    _707 = false;
    float _715 = _701;
    float _717 = _703;
    float _719 = _705;
    float _721 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _723 = int(_721);
    float _725 = in.m_49.y;
    float _727 = in.m_49.w;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _731 = _729 != 0;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _735 = int(_733);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = float(_723);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _749 = 1.0 / _743;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _755 = float(uint(_735));
    float _757 = _725 * 2.0;
    bool _759 = !_731;
    float _761 = _759 ? _725 : _151;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _767 = 1.0 / _755;
    int _769 = ~_735;
    int _771 = _769 + 1;
    int _773 = ~_735;
    int _775 = _773 + 1;
    bool _777 = _735 == 0;
    float _779 = _749 * _129;
    float _781 = float(_735);
    float _783 = 1.0 / _741;
    bool _785 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _787 = isnan(_715);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    int _797 = as_type<int>(_767) + (-2);
    float _799 = trunc(_779);
    int _801 = int(_799);
    bool _803 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _805 = isnan(_715);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = 1.0 / _747;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _819 = float(uint(_801));
    float _821 = floor(_757);
    float _823 = float(_801);
    float _825 = as_type<float>(_797) * _819;
    bool _827 = _823 >= _781;
    bool _829 = isnan(_823);
    bool _831 = _827 || _829;
    bool _833 = isnan(_781);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = 1.0 / _753;
    float _841 = trunc(_825);
    float _843 = precise::max(_841, 0.0);
    uint _846 = uint(_843);
    float _848 = trunc(_837);
    int _850 = int(_848);
    int _852 = _771 * int(_846);
    int _854 = _852 + _801;
    float _856 = 1.0 / _765;
    float _858 = float(uint(_854));
    float _860 = as_type<float>(_797) * _858;
    float _862 = trunc(_860);
    float _864 = precise::max(_862, 0.0);
    uint _866 = uint(_864);
    bool _868 = !_731;
    float _870 = _868 ? 1.2345600128173828125 : 1.0;
    float _872 = _870 * _761;
    float _874 = floor(_872);
    int _876 = int(_846) + int(_866);
    int _878 = _775 * _876;
    int _880 = _878 + _801;
    float _882 = -_874;
    float _884 = _872 + _882;
    bool _886 = uint(_880) >= uint(_735);
    float _888 = _884 * _781;
    float _890 = 1.0 / _717;
    float _892 = _781 * _129;
    bool _894 = !_886;
    int _896 = _894 ? 0 : (-1);
    int _898 = ~_850;
    int _900 = _898 + 1;
    int _902 = _900 + 1;
    int _904 = ~_876;
    int _906 = _904 + _896;
    int _908 = _906 + 1;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _924 = _922 != 0;
    float _926 = trunc(_888);
    int _928 = int(_926);
    int _930 = _735 + (-1);
    int _932 = _735 * _908;
    int _934 = _932 + _801;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _938 = _936 != 0;
    bool _940 = !_777;
    int _942 = _940 ? _934 : (-1);
    float _944 = _892 * _890;
    bool _946 = !_916;
    int _948 = _946 ? 0 : 1;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _954 = !_938;
    int _956 = _954 ? 0 : 1;
    int _958 = _942 * _902;
    int _960 = abs(_948);
    float _962 = trunc(_944);
    int _964 = int(_962);
    bool _966 = !_920;
    int _968 = _966 ? 0 : 1;
    int _970 = _850 * _930;
    int _972 = _970 + _958;
    bool _974 = !_912;
    int _976 = _974 ? 0 : 1;
    int _978 = abs(_968);
    int _980 = _972 * _960;
    int _982 = abs(_976);
    float _984 = 1.0 / _952;
    bool _986 = !_924;
    int _988 = _986 ? 0 : 1;
    int _990 = abs(_956);
    int _992 = abs(_988);
    int _994 = _928 * _990;
    int _996 = _994 + _801;
    int _998 = _964 * _982;
    int _1000 = _998 + _980;
    int _1002 = ~_735;
    int _1004 = _1002 + 1;
    int _1006 = _996 * _978;
    int _1008 = _1006 + _1000;
    float _1010 = float(uint(_996));
    int _1012 = ~_735;
    int _1014 = _1012 + 1;
    int _1016 = _928 * _992;
    int _1018 = _1016 + _1008;
    int _1020 = ~_735;
    int _1022 = _1020 + 1;
    float _1024 = as_type<float>(_797) * _1010;
    float _1026 = float(uint(_1018));
    float _1028 = trunc(_1024);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = as_type<float>(_797) * _1026;
    float _1036 = trunc(_1034);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    int _1042 = _1004 * int(_1032);
    int _1044 = _1042 + _996;
    float _1046 = float(uint(_1044));
    int _1048 = _1022 * int(_1040);
    int _1050 = _1048 + _1018;
    float _1052 = float(uint(_1050));
    float _1054 = as_type<float>(_797) * _1052;
    float _1056 = trunc(_1054);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    int _1062 = int(_1040) + int(_1060);
    int _1064 = _1014 * _1062;
    int _1066 = _1064 + _1018;
    float _1068 = as_type<float>(_797) * _1046;
    bool _1070 = uint(_1066) >= uint(_735);
    float _1072 = trunc(_1068);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    bool _1078 = !_1070;
    int _1080 = _1078 ? 0 : (-1);
    int _1082 = ~_1062;
    int _1084 = _1082 + _1080;
    int _1086 = _1084 + 1;
    int _1088 = ~_735;
    int _1090 = _1088 + 1;
    int _1092 = _735 * _1086;
    int _1094 = _1092 + _1018;
    bool _1096 = !_777;
    int _1098 = _1096 ? _1094 : (-1);
    int _1100 = int(_1032) + int(_1076);
    int _1102 = _1098 & 3;
    bool _1104 = _1102 != 0;
    int _1106 = _1098 & 3;
    bool _1108 = _1106 != 0;
    int _1110 = _1090 * _1100;
    int _1112 = _1110 + _996;
    bool _1114 = uint(_1102) > 1u;
    int _1116 = _1108 ? 0 : 1;
    bool _1118 = uint(_1112) >= uint(_735);
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1122 = _1120 != 0;
    bool _1124 = !_1118;
    int _1126 = _1124 ? 0 : (-1);
    int _1128 = ~_1116;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    bool _1134 = !_1122;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _1132;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_1114)
    {
        int _1142 = ~_1116;
        int _1144 = _1142 + 1;
        _1138 = _1144;
    }
    int _1146 = _1138;
    int _1148 = ~_1100;
    int _1150 = _1148 + _1126;
    int _1152 = _1150 + 1;
    bool _1154 = uint(_1102) >= 2u;
    bool _1156 = _1102 != 3;
    int _1158 = _735 * _1152;
    int _1160 = _1158 + _996;
    int _1162 = _1154 ? 0 : 1;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1174 = _1172 != 0;
    float _1176 = _151 * 2.0;
    bool _1178 = _1102 != 3;
    float _1180 = in.m_42.x;
    float _1182 = in.m_42.y;
    float _1184 = in.m_42.z;
    int _1186 = ~_1162;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    bool _1192 = !_1104;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = floor(_1176);
    int _1198 = _1190;
    if (_1156)
    {
        int _1200 = ~_1162;
        int _1202 = _1200 + 1;
        _1198 = _1202;
    }
    int _1204 = _1198;
    float _1206 = in.m_49.z;
    bool _1208 = _151 > 0.5;
    bool _1210 = _735 == 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1214 = _1212 != 0;
    float _1216 = -_295;
    int _1218 = _1208 ? as_type<int>(_1216) : as_type<int>(_295);
    bool _1220 = _725 > 0.5;
    bool _1222 = !_1210;
    int _1224 = _1222 ? _1160 : (-1);
    bool _1226 = !_1214;
    float _1228 = _1226 ? _295 : as_type<float>(_1218);
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1232 = _1230 != 0;
    float _1234 = _173 * _1182;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1238 = _1236 != 0;
    float _1240 = _167 * _1182;
    float _1242 = -_207;
    int _1244 = _1220 ? as_type<int>(_1242) : as_type<int>(_207);
    float _1246 = fma(_171, _1180, _1234);
    bool _1248 = !_1178;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = _181 * _1182;
    int _1254 = _1098 >> 31;
    float _1256 = fma(_165, _1180, _1240);
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1260 = _1258 != 0;
    float _1262 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1266 = _1264 != 0;
    float _1268 = fma(_179, _1180, _1252);
    bool _1270 = !_1238;
    float _1272 = _1270 ? _207 : as_type<float>(_1244);
    float _1274 = _725 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1276 = -_737;
    float _1278 = fma(_1262, 2.0, _1276);
    int _1280 = _1254 & 3;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1284 = _1098 + _1280;
    float _1286 = fma(_175, _1184, _1246);
    float _1288 = _1262;
    if (!_1232)
    {
        _1288 = _725;
    }
    float _1290 = _1288;
    float _1292 = fma(_1274, -2.0, _1282);
    float _1294 = _1290;
    if (!_1232)
    {
        _303 = _1206;
    }
    float _1296 = _303;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1302 = _1296;
    if (!_1232)
    {
        _1140 = _1206;
    }
    float _1304 = _1140;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1310 = _1304;
    if (_1232)
    {
        _1294 = _151;
    }
    float _1312 = _1294;
    if (_1232)
    {
        _1302 = _725;
    }
    float _1314 = _1302;
    float _1316 = _1308 * _984;
    if (_1232)
    {
        _1310 = _725;
    }
    float _1318 = _1310;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1320;
    bool _1324 = _1196 >= 0.0;
    bool _1326 = isnan(_1196);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    float _1334 = 1.0 / _1300;
    int _1336 = _1284 >> 2;
    int _1338 = _1332 ? 0 : 1;
    int _1340 = _1336 << 4;
    int _1342 = _1340 + 512;
    bool _1344 = _1196 > 0.0;
    float _1346 = fma(_169, _1184, _1256);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1350 = _1348 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1352 = fma(_183, _1184, _1268);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1354;
    uint _1358 = uint(int(uint(_1342) >> uint(2)));
    uint _1360 = uint(int(uint(int(_1358)) >> uint(2)));
    int _1362 = int(_1358) & 3;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[int(_1360)][_1362];
    int _1366 = int(_1358) + 1;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    int _1370 = _1366 & 3;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[int(_1368)][_1370];
    bool _1374 = _727 > 0.5;
    float _1376 = _1322 * _1334;
    float _1378 = _1356 * _783;
    float _1380 = 1.0 / _1350;
    int _1382 = _1342 + 8;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    uint _1386 = uint(int(uint(int(_1384)) >> uint(2)));
    int _1388 = int(_1384) & 3;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[int(_1386)][_1388];
    int _1392 = int(_1384) + 1;
    uint _1394 = uint(int(uint(_1392) >> uint(2)));
    int _1396 = _1392 & 3;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[int(_1394)][_1396];
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1410 = _1408 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1414 = _1412 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1416 = _1406 * _839;
    float _1418 = 1.0 / _1402;
    float _1420 = _1410 * _815;
    int _1422 = ~_1338;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1428;
    int _1432 = _1426;
    if (!_1344)
    {
        int _1434 = ~_1338;
        int _1436 = _1434 + 1;
        _1432 = _1436;
    }
    int _1438 = _1432;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    bool _1444 = _821 >= 0.0;
    bool _1446 = isnan(_821);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.0);
    bool _1452 = _1448 || _1450;
    float _1454 = _1430 * _856;
    float _1456 = 1.0 / _1414;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _1462 = _1452 ? 0 : 1;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1464;
    bool _1468 = _821 > 0.0;
    float _1470 = _1460 * _1380;
    int _1472 = abs(_1146);
    float _1474 = _725 + _1206;
    float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1478 = _1442 * _1418;
    float _1480 = _1206 * 2.0;
    int _1482 = abs(_1194);
    float _1484 = _1474 + (-1.0);
    int _1486 = ~_1472;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    int _1492 = ~_1482;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    float _1498 = floor(_1480);
    int _1500 = ~_1462;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    float _1506 = _1466 * _1456;
    int _1508 = _1504;
    if (!_1468)
    {
        int _1510 = ~_1462;
        int _1512 = _1510 + 1;
        _1508 = _1512;
    }
    int _1514 = _1508;
    float _1516 = _151 + _725;
    int _1518 = abs(_1204);
    float _1520 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1522 = int(_1520);
    int _1524 = _1490 * as_type<int>(_1372);
    float _1526 = _1516 + (-1.0);
    int _1528 = _1496 * as_type<int>(_1364);
    int _1530 = _1528 + _1524;
    float _1532 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1534 = -_129;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1278);
    float _1538 = _1228 + 0.5;
    bool _1540 = _1498 >= 0.0;
    bool _1542 = isnan(_1498);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan(0.0);
    bool _1548 = _1544 || _1546;
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1552 = ~_1518;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1532, _1538, _1536);
    int _1560 = abs(_1250);
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1564 = _719 + _1562;
    int _1566 = _1548 ? 0 : 1;
    int _1568 = _1556 * as_type<int>(_1390);
    int _1570 = _1568 + _1530;
    float _1572 = fma(_1378, _1564, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1574 = float(uint(_1522));
    float _1576 = in.m_56.w;
    bool _1578 = _1498 > 0.0;
    float _1580 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1582 = ~_1560;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    float _1588 = in.m_58.w;
    int _1590 = abs(_1136);
    float _1592 = 1.0 / _1574;
    int _1594 = abs(_1522);
    int _1596 = _1586 * as_type<int>(_1398);
    int _1598 = _1596 + _1570;
    int _1600 = ~_1590;
    int _1602 = _1600 + 1;
    int _1604 = _1602 + 1;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1608 = _715 + _1606;
    float _1610 = float(uint(_1594));
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1614 = _719 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1618 = _715 + _1616;
    int _1620 = _1598 * _1604;
    float _1622 = fma(_1416, _1608, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1624 = 1.0 / _1610;
    float _1626 = fma(_1316, _1614, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1628 = _1224 * _1590;
    int _1630 = _1628 + _1620;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1634 = _715 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1638 = _715 + _1636;
    float _1640 = fma(_1478, _1618, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _1642 = as_type<int>(_1592) + (-2);
    float _1644 = fma(_1454, _1634, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1646 = float(uint(_1630));
    float _1648 = in.m_60.w;
    int _1650 = abs(_1630);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1654 = _715 + _1652;
    float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1658 = as_type<float>(_1642) * _1646;
    float _1660 = float(uint(_1650));
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1664 = _715 + _1662;
    int _1666 = as_type<int>(_1624) + (-2);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1670 = _715 + _1668;
    float _1672 = fma(_1420, _1638, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1674 = fma(_1376, _1654, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1676 = trunc(_1658);
    float _1678 = precise::max(_1676, 0.0);
    uint _1680 = uint(_1678);
    float _1682 = as_type<float>(_1666) * _1660;
    float _1684 = fma(_1470, _1664, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1688 = fma(_1506, _1670, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1690 = ~_1522;
    int _1692 = _1690 + 1;
    float _1694 = _1286 + _1588;
    int _1696 = ~_1594;
    int _1698 = _1696 + 1;
    float _1700 = trunc(_1682);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    float _1706 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1686);
    float _1708 = _1346 + _1576;
    float _1710 = _1352 + _1648;
    float _1712 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1292);
    float _1714 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1716 = _1692 * int(_1680);
    int _1718 = _1716 + _1630;
    float _1720 = _1272 + (-0.5);
    bool _1722 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1724 = isnan(_715);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1706);
    bool _1736 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1738 = isnan(_719);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = -_1714;
    float _1750 = -_1712;
    float _1752 = fma(_1748, _1720, _1750);
    float _1754 = float(uint(_1718));
    float _1756 = -_1732;
    float _1758 = _1756 + 1.0;
    int _1760 = _1698 * int(_1704);
    int _1762 = _1760 + _1650;
    bool _1764 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1766 = isnan(_715);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1772 = _1768 || _1770;
    float _1774 = float(_1772);
    float _1776 = -_1734;
    float _1778 = _1776 + 1.0;
    bool _1780 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1782 = isnan(_715);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = as_type<float>(_1642) * _1754;
    float _1794 = float(uint(_1762));
    float _1796 = _1774 * _1758;
    float _1798 = -_1774;
    float _1800 = _1798 + 1.0;
    bool _1802 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1804 = isnan(_715);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = as_type<float>(_1666) * _1794;
    float _1816 = -_1790;
    float _1818 = _1816 + 1.0;
    bool _1820 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1822 = isnan(_719);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1828 = _1824 || _1826;
    float _1830 = float(_1828);
    float _1832 = _1790 * _1800;
    bool _1834 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1836 = isnan(_719);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = _1812 * _1818;
    bool _1848 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1850 = isnan(_715);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1856 = _1852 || _1854;
    float _1858 = float(_1856);
    float _1860 = -_1812;
    float _1862 = _1860 + 1.0;
    bool _1864 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1866 = isnan(_715);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = -_1844;
    float _1878 = _1876 + 1.0;
    float _1880 = trunc(_1814);
    float _1882 = precise::max(_1880, 0.0);
    uint _1884 = uint(_1882);
    float _1886 = _1858 * _1862;
    float _1888 = -_1858;
    float _1890 = _1888 + 1.0;
    float _1892 = -_1830;
    float _1894 = _1892 + 1.0;
    float _1896 = _1830 * _1878;
    float _1898 = -_1874;
    float _1900 = _1898 + 1.0;
    float _1902 = _1874 * _1890;
    float _1904 = _1746 * _1894;
    float _1906 = _813 * _1900;
    float _1908 = -_813;
    float _1910 = _1908 + 1.0;
    float _1912 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1914 = _1572 * _1904;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1918 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[83].z, _817);
    float _1920 = _795 * _1910;
    float _1922 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1924 = log2(_1922);
    float _1926 = -_795;
    float _1928 = _1926 + 1.0;
    float _1930 = -_1746;
    float _1932 = _1930 + 1.0;
    float _1934 = _1622 * _1920;
    float _1936 = -_1916;
    float _1938 = fma(_1912, 2.0, _1936);
    float _1940 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1914);
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1934);
    float _1944 = trunc(_1792);
    float _1946 = precise::max(_1944, 0.0);
    uint _1948 = uint(_1946);
    float _1950 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1952 = fma(_1626, _1896, _1940);
    float _1954 = fma(_1672, _1906, _1942);
    int _1956 = int(_1704) + int(_1884);
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1960 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1918);
    float _1962 = _1924 * _129;
    float _1964 = fma(_1950, -2.0, _1958);
    int _1966 = ~_1566;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    float _1972 = -_129;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1938);
    int _1976 = _1970;
    if (!_1578)
    {
        int _1978 = ~_1566;
        int _1980 = _1978 + 1;
        _1976 = _1980;
    }
    int _1982 = _1976;
    float _1984 = exp2(_1962);
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1988 = int(_1680) + int(_1948);
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1992 = 1.0 + _1990;
    bool _1994 = !_1170;
    int _1996 = _1994 ? 0 : 1;
    float _1998 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1986);
    bool _2000 = !_1166;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2006 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2008 = isnan(1.0);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2014 = _2010 || _2012;
    float _2016 = 1.0 / _1992;
    int _2018 = ~_1522;
    int _2020 = _2018 + 1;
    float _2022 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2004);
    int _2024 = abs(_1996);
    float _2026 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1964);
    bool _2028 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2030 = isnan(0.0);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2036 = _2032 || _2034;
    float _2038 = -_1984;
    float _2040 = _2038 + 1.0;
    float _2042 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1998);
    int _2044 = ~_1594;
    int _2046 = _2044 + 1;
    float _2048 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2022);
    float _2050 = _2036 ? _2040 : 0.0;
    int _2052 = _2020 * _1988;
    int _2054 = _2052 + _1630;
    float _2056 = float(_1438);
    int _2058 = _2046 * _1956;
    int _2060 = _2058 + _1650;
    int _2062 = abs(_2002);
    if (_2014)
    {
        float _2064 = _2050 * _2016;
        _131 = _2064;
    }
    float _2066 = _131;
    float _2068 = fma(_1644, _1902, _1954);
    bool _2070 = uint(_2054) >= uint(_1522);
    float _2072 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1952);
    float _2074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2076 = !_2070;
    int _2078 = _2076 ? 0 : (-1);
    float _2080 = fma(_1640, _1886, _2068);
    bool _2082 = uint(_2060) >= uint(_1594);
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _1708 + _2084;
    float _2088 = float(_2062);
    float _2090 = fma(_1674, _1846, _2080);
    float _2092 = float(_1982);
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2096 = in.m_66.x;
    float _2098 = in.m_66.y;
    float _2100 = in.m_66.z;
    int _2102 = ~_1988;
    int _2104 = _2102 + _2078;
    int _2106 = _2104 + 1;
    float _2108 = -_1960;
    float _2110 = _2108 + 1.0;
    float _2112 = float(_2024);
    float _2114 = _2088 * _2092;
    int _2116 = _1630 ^ _1522;
    int _2118 = _1522 * _2106;
    int _2120 = _2118 + _1630;
    bool _2122 = _1522 == 0;
    float _2124 = _2112 * _2056;
    bool _2126 = !_2082;
    int _2128 = _2126 ? 0 : (-1);
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2132 = _1694 + _2130;
    uint _2134 = uint(int(uint(_2116) >> uint(31)));
    float _2136 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2138 = !_2122;
    int _2140 = _2138 ? _2120 : (-1);
    float _2142 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2144 = ~_2128;
    int _2146 = _1956 + _2144;
    int _2148 = _2146 + 1;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2152 = _1710 + _2150;
    bool _2154 = _1206 > 0.5;
    float _2156 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2142);
    int _2158 = ~int(_2134);
    int _2160 = _2158 + 1;
    float _2162 = _2124 * (-2.0);
    bool _2164 = _1522 == 0;
    float _2166 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2168 = -_295;
    int _2170 = _2154 ? as_type<int>(_2168) : as_type<int>(_295);
    float _2172 = fma(_1580, _2162, _1580);
    int _2174 = _2148 ^ _2160;
    float _2176 = fma(_1684, _1832, _2090);
    float _2178 = float(_2140);
    float _2180 = fma(_2162, _2098, _2098);
    bool _2182 = !_1260;
    float _2184 = _2182 ? _295 : as_type<float>(_2170);
    float _2186 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2156);
    int _2188 = ~_2160;
    int _2190 = _2188 + _2174;
    int _2192 = _2190 + 1;
    float _2194 = fma(_2136, _2178, _1974);
    float _2196 = -_207;
    int _2198 = _1374 ? as_type<int>(_2196) : as_type<int>(_207);
    float _2200 = _2184 + 0.5;
    bool _2202 = !_2164;
    int _2204 = _2202 ? _2192 : (-1);
    float _2206 = -_2048;
    float _2208 = _2206 + 1.0;
    bool _2210 = !_1266;
    float _2212 = _2210 ? _207 : as_type<float>(_2198);
    float _2214 = fma(_2136, _2200, _2194);
    float _2216 = _2132 * _2132;
    float _2218 = float(_2204);
    float _2220 = -_2208;
    float _2222 = fma(_1228, _2220, _1558);
    bool _2224 = _2186 >= 0.0;
    float _2226 = fma(_2086, _2086, _2216);
    float _2228 = fma(_1688, _1796, _2176);
    float _2230 = -_2026;
    float _2232 = fma(_2166, _2218, _2230);
    float _2234 = _2212 + (-0.5);
    float _2236 = fma(_2152, _2152, _2226);
    float _2238 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2228);
    float _2240 = -_2166;
    float _2242 = fma(_2240, _2234, _2232);
    float _2244 = -_2042;
    float _2246 = _2244 + 1.0;
    float _2248 = rsqrt(_2236);
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_2224)
    {
        _2254 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2256 = _2254;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2260 = fma(_1272, _2246, _1752);
    float _2262 = _2250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2264 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2266 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2072 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2270 = as_type<int>(_2256);
    if (_2224)
    {
        float _2272 = _2256 * 5.0;
        _2270 = as_type<int>(_2272);
    }
    int _2274 = _2270;
    float _2276 = -_2110;
    float _2278 = fma(_2184, _2276, _2214);
    float _2280 = fma(_2212, _1778, _2242);
    float _2282 = _2114 * (-2.0);
    out.m_68.x = _2262;
    out.m_68.y = _2264;
    out.m_68.z = _2266;
    out.m_68.w = _2268;
    bool _2284 = !_1174;
    int _2286 = _2284 ? 0 : 1;
    float _2288 = _2132 * _2248;
    float _2290 = fma(_1550, _2282, _1550);
    if (_2224)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6487 = as_type<float>(_2274);
        out.gl_Position.z = _6487;
    }
    float _2292 = _2086 * _2248;
    out.m_70.x = _2238;
    out.m_72.x = _2222;
    out.m_72.y = _2260;
    out.m_72.z = _2278;
    out.m_72.w = _2280;
    if (_2224)
    {
        out.m_45.x = 0.0;
    }
    if (_2224)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2294 = -_2288;
    float _2296 = fma(_2294, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1694);
    float _2298 = -_2292;
    float _2300 = fma(_2298, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1708);
    float _2302 = _725 + (-0.5);
    float _2304 = fma(_2282, _2096, _2096);
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2308 = _2296 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2312 = _2300 + _2310;
    float _2314 = fma(_2302, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2180);
    float _2316 = _151 + (-0.5);
    float _2318 = _2308 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2320 = -_2288;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2132);
    float _2324 = fma(_2172, _2066, _2314);
    float _2326 = fma(_2316, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2304);
    float _2328 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2318);
    float _2330 = _2152 * _2248;
    int _2332 = abs(_2286);
    float _2334 = _2324 * 0.15915493667125701904296875;
    float _2336 = float(_1514);
    float _2338 = -_2330;
    float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1710);
    float _2342 = float(_2332);
    float _2344 = -_2292;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2086);
    float _2348 = _2322 * _2322;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2352 = _2340 + _2350;
    float _2354 = _151 + _1206;
    float _2356 = _2342 * _2336;
    float _2358 = fma(_2346, _2346, _2348);
    float _2360 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2328);
    float _2362 = _2354 + (-1.0);
    float _2364 = _1206 + (-0.5);
    float _2366 = -_2330;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2152);
    bool _2370 = _2360 >= 0.0;
    float _2372 = _2356 * (-2.0);
    float _2374 = fma(_2362, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2376 = fma(_2368, _2368, _2358);
    float _2378 = fma(_2290, _2066, _2326);
    float _2380 = fma(_2372, _2100, _2100);
    float _2382 = fma(_2374, _2372, _2374);
    float _2384 = _2334 * 6.283185482025146484375;
    float _2386 = sin(_2384);
    float _2388 = _2378 * 0.15915493667125701904296875;
    float _2390 = fma(_2364, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2380);
    float _2392 = _299 * _459;
    float _2394 = fma(_2382, _2066, _2390);
    float _2396 = _2380;
    float _2398 = _2340;
    if (_2370)
    {
        _2396 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2400 = _2396;
    float _2402 = sqrt(_2376);
    float _2404 = _2394 * 0.15915493667125701904296875;
    int _2406 = as_type<int>(_2400);
    if (_2370)
    {
        out.m_45.x = 0.0;
    }
    if (_2370)
    {
        float _2408 = _2400 * 5.0;
        _2406 = as_type<int>(_2408);
    }
    int _2410 = _2406;
    float _2412 = _2334 * 6.283185482025146484375;
    float _2414 = cos(_2412);
    if (_2370)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6715 = as_type<float>(_2410);
        out.gl_Position.z = _6715;
    }
    float _2416 = _2388 * 6.283185482025146484375;
    float _2418 = sin(_2416);
    float _2420 = _2248 * _2402;
    float _2422 = _2388 * 6.283185482025146484375;
    float _2424 = cos(_2422);
    float _2426 = _2404 * 6.283185482025146484375;
    float _2428 = sin(_2426);
    if (_2370)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2430 = _2404 * 6.283185482025146484375;
    float _2432 = cos(_2430);
    float _2434 = _2392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2436 = _299 * _469;
    float _2438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2440 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _295);
    float _2442 = _2420 * _2434;
    float _2444 = _2436 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2446 = _2424 * _2414;
    float _2448 = _2424 * _2386;
    float _2450 = _2438 * _2442;
    float _2452 = _2420 * _2444;
    float _2454 = _2418 * _2386;
    float _2456 = _2440 * _2452;
    float _2458 = fma(_2428, _2446, _2454);
    float _2460 = _2432 * _2450;
    float _2462 = -_2450;
    float _2464 = _2428 * _2462;
    float _2466 = fma(_2428, _2454, _2446);
    float _2468 = _2424 * _2460;
    float _2470 = _2386 * _2432;
    float _2472 = _2414 * _2432;
    float _2474 = _2418 * _2414;
    float _2476 = fma(_2458, _2456, _2468);
    float _2478 = _2420 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2480 = _2478 * 0.5;
    float _2482 = fma(_2472, _2456, _2464);
    float _2484 = -_2474;
    float _2486 = fma(_2428, _2448, _2484);
    float _2488 = -_2448;
    float _2490 = fma(_2428, _2474, _2488);
    float _2492 = _2418 * _2460;
    float _2494 = fma(_2470, _2480, _2482);
    float _2496 = fma(_2486, _2480, _2476);
    float _2498 = fma(_2490, _2456, _2492);
    float _2500 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2502 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2504 = fma(_2466, _2480, _2498);
    float _2506 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2508 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2500);
    float _2510 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2502);
    float _2512 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2506);
    float _2514 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2508);
    float _2516 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2510);
    float _2518 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2512);
    float _2520 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2522 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2524 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2526 = _1710 + _2520;
    float _2528 = _1708 + _2522;
    float _2530 = _1694 + _2524;
    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2534 = _2526 + _2532;
    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2538 = _2528 + _2536;
    float _2540 = _2534 * _2534;
    float _2542 = fma(_2538, _2538, _2540);
    float _2544 = sqrt(_2542);
    bool _2546 = _2544 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2548 = _2540;
    float _2550 = _2522;
    float _2552 = _2528;
    float _2554 = _2530;
    if (!_2546)
    {
        _2548 = _2526;
    }
    float _2556 = _2548;
    float _2558 = _2556;
    if (!_2546)
    {
        _2550 = _2530;
    }
    float _2560 = _2550;
    bool _2562 = !_2546;
    float _2564 = _2560;
    if (!_2562)
    {
        float _2566 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2570 = _2544 + _2568;
        float _2572 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2574 = rsqrt(_2542);
        float _2576 = _2570 * _2566;
        float _2578 = _2576 * 0.15915493667125701904296875;
        float _2580 = _2578 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        float _2584 = _2578 * 6.283185482025146484375;
        float _2586 = sin(_2584);
        float _2588 = _2582 + (-1.0);
        float _2590 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2592 = fma(_2586, _2572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2594 = fma(_2530, _2582, _2590);
        float _2596 = _2574 * _2592;
        float _2598 = fma(_2538, _2596, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2600 = fma(_2534, _2596, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2564 = _2594;
        _2552 = _2598;
        _2558 = _2600;
    }
    float _2602 = _2564;
    float _2604 = _2552;
    float _2606 = _2558;
    float _2608 = -_1694;
    float _2610 = _2608 + _2602;
    float _2612 = -_1708;
    float _2614 = _2612 + _2604;
    float _2616 = -_1710;
    float _2618 = _2616 + _2606;
    float _2620 = _2610 * _2610;
    float _2622 = fma(_2614, _2614, _2620);
    float _2624 = fma(_2618, _2618, _2622);
    float _2626 = sqrt(_2624);
    bool _2628 = _2626 > 0.0;
    bool _2630 = !_2628;
    float _2632 = _2602;
    float _2634 = _2604;
    float _2636 = _2606;
    float _2638 = _2610;
    if (!_2630)
    {
        float _2640 = _255 * _255;
        float _2642 = fma(_285, _285, _2640);
        float _2644 = fma(_291, _291, _2642);
        float _2646 = rsqrt(_2624);
        float _2648 = sqrt(_2644);
        float _2650 = _2614 * _2646;
        float _2652 = _2610 * _2646;
        float _2654 = _2618 * _2646;
        bool _2656 = _2648 > 0.0;
        bool _2658 = !_2656;
        _2554 = _2648;
        if (!_2658)
        {
            float _2660 = rsqrt(_2644);
            float _2662 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2664 = _255 * _2660;
            float _2666 = _285 * _2660;
            float _2668 = _291 * _2660;
            float _2670 = _2652 * _2664;
            float _2672 = fma(_2650, _2666, _2670);
            float _2674 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2676 = fma(_2654, _2668, _2672);
            float _2678 = _2676 * _2674;
            float _2680 = fma(_285, _2678, _2604);
            float _2682 = fma(_255, _2678, _2602);
            float _2684 = fma(_291, _2678, _2606);
            _2632 = _2682;
            _2634 = _2680;
            _2636 = _2684;
            _2554 = _2662;
            _2638 = _2672;
        }
    }
    float _2686 = _2632;
    float _2688 = _2634;
    float _2690 = _2636;
    float _2692 = _2554;
    float _2694 = _2638;
    float _2696 = -_2288;
    float _2698 = fma(_2696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2686);
    float _2700 = -_2292;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2688);
    float _2704 = -_2330;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2690);
    float _2708 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2710 = _2698 + _2708;
    float _2712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2714 = _2702 + _2712;
    float _2716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2718 = _2706 + _2716;
    float _2720 = _2710 * _2710;
    float _2722 = fma(_2714, _2714, _2720);
    float _2724 = fma(_2718, _2718, _2722);
    float _2726 = rsqrt(_2724);
    float _2728 = sqrt(_2724);
    float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2732 = _2714 * _2730;
    float _2734 = _2718 * _2730;
    float _2736 = _2732 * _2732;
    float _2738 = _2734 * _2734;
    float _2740 = _2736 + _2738;
    float _2742 = sqrt(_2740);
    bool _2744 = _2742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2748 = _2742 + _2746;
    float _2750 = _2718;
    float _2752 = _2722;
    float _2754 = _2748;
    float _2756 = _2692;
    float _2758 = _2730;
    float _2760 = _2732;
    if (_2744)
    {
        float _2762 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2750 = _2762;
    }
    float _2764 = _2750;
    if (_2744)
    {
        float _2766 = rsqrt(_2740);
        _2752 = _2766;
    }
    float _2768 = _2752;
    float _2770 = _2768;
    if (_2744)
    {
        float _2772 = _2748 * _2764;
        _2754 = _2772;
    }
    float _2774 = _2754;
    if (_2744)
    {
        float _2776 = _2774 * 0.15915493667125701904296875;
        _2756 = _2776;
    }
    float _2778 = _2756;
    float _2780 = _2726;
    float _2782 = _2778;
    if (_2744)
    {
        float _2784 = _2778 * 6.283185482025146484375;
        float _2786 = sin(_2784);
        _2780 = _2786;
    }
    float _2788 = _2780;
    float _2790 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2792 = precise::max(0.0, _2790);
    float _2794 = _2694;
    float _2796 = _2792;
    float _2798 = _2790;
    if (_2744)
    {
        float _2800 = _2778 * 6.283185482025146484375;
        float _2802 = cos(_2800);
        _2794 = _2802;
    }
    float _2804 = _2794;
    float _2806 = -_2730;
    float _2808 = -_2792;
    float _2810 = fma(_2710, _2806, _2808);
    if (!_2744)
    {
        _2796 = _2734;
    }
    float _2812 = _2796;
    float _2814 = _2812;
    if (_2744)
    {
        float _2816 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2798 = _2816;
    }
    float _2818 = _2798;
    float _2820 = _2788;
    float _2822 = _2818;
    if (_2744)
    {
        float _2824 = fma(_2788, _2818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2820 = _2824;
    }
    float _2826 = _2820;
    float _2828 = _2826;
    if (_2744)
    {
        float _2830 = _2804 + (-1.0);
        _2822 = _2830;
    }
    float _2832 = _2822;
    float _2834 = _2832;
    if (_2744)
    {
        float _2836 = _2768 * _2826;
        _2758 = _2836;
    }
    float _2838 = _2758;
    if (!_2744)
    {
        _2770 = _2810;
    }
    float _2840 = _2770;
    float _2842 = _2840;
    if (_2744)
    {
        float _2844 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2844;
    }
    float _2846 = _2782;
    if (_2744)
    {
        float _2848 = _2732 * _2838;
        _2760 = _2848;
    }
    float _2850 = _2760;
    if (!_2744)
    {
        _2828 = _2736;
    }
    float _2852 = _2828;
    float _2854 = _2852;
    if (_2744)
    {
        float _2856 = _2734 * _2838;
        _2814 = _2856;
    }
    float _2858 = _2814;
    if (_2744)
    {
        float _2860 = fma(_2810, _2804, _2846);
        _2842 = _2860;
    }
    float _2862 = _2842;
    if (_2744)
    {
        float _2864 = _2850 * _2850;
        _2854 = _2864;
    }
    float _2866 = _2854;
    if (!_2744)
    {
        _2834 = _2738;
    }
    float _2868 = _2834;
    float _2870 = _2868;
    if (_2744)
    {
        float _2872 = _2858 * _2858;
        _2870 = _2872;
    }
    float _2874 = _2870;
    float _2876 = fma(_2862, _2862, _2866);
    float _2878 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2880 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2882 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2884 = _2876 + _2874;
    float _2886 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2878);
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2890 = fma(_2728, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2888);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2896 = rsqrt(_2884);
    float _2898 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2886);
    float _2900 = -_2892;
    float _2902 = _2900 + 1.0;
    float _2904 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2894);
    float _2906 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2880);
    float _2908 = _2898 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2910 = _2698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2912 = abs(_2902);
    float _2914 = log2(_2912);
    float _2916 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2904);
    float _2918 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2906);
    float _2920 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2922 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2910);
    float _2924 = _2916 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2926 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2928 = -_2920;
    float _2930 = fma(_2928, _2882, 1.0);
    float _2932 = _2896 * _2850;
    float _2934 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2936 = _2896 * _2862;
    float _2938 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2922);
    float _2940 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2942 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2934);
    float _2944 = _2896 * _2858;
    float _2946 = _2938 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2948 = -_2940;
    float _2950 = fma(_2936, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2948);
    float _2952 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2954 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2942);
    float _2956 = log2(_2930);
    float _2958 = -_2944;
    float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2950);
    float _2962 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2964 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2954);
    float _2966 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2968 = fma(_2960, -0.5, 0.5);
    float _2970 = fma(_2960, 0.5, 0.5);
    float _2972 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2962);
    float _2974 = exp2(_2952);
    float _2976 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2966);
    float _2978 = fma(_2970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2980 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2972);
    float _2982 = _2936 + 1.0;
    float _2984 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2976);
    float _2986 = fma(_2970, _2978, -0.212114393711090087890625);
    float _2988 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2980);
    float _2990 = 1.0 / _2964;
    float _2992 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2984);
    float _2994 = fma(_2970, _2986, 1.570728778839111328125);
    float _2996 = sqrt(_2968);
    float _2998 = -_2936;
    float _3000 = fma(_2974, _2982, _2998);
    float _3002 = _2956 * 0.693147182464599609375;
    float _3004 = fma(_3000, 0.5, 0.5);
    float _3006 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3008 = _2988 * _2990;
    float _3010 = _2992 * _2990;
    float _3012 = fma(_3008, 0.5, 0.5);
    float _3014 = fma(_3010, -0.5, 0.5);
    float _3016 = _2996 * 0.636619746685028076171875;
    float3 _7692 = float3(_3012, _3014, _3006);
    float _3018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7692, float3(0.0), isnan(_7692)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7692, float3(0.0), isnan(_7692)), level(0.0)).x;
    float3 _7703 = float3(_3012, _3014, _3006);
    float4 _3021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7703, float3(0.0), isnan(_7703)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7703, float3(0.0), isnan(_7703)), level(0.0)).xyzw;
    float _3023 = _3021.x;
    float _3025 = _3021.y;
    float _3027 = _3021.z;
    float _3029 = _3021.w;
    float _3031 = -_2994;
    float _3033 = fma(_3016, _3031, 1.0);
    float2 _7725 = float2(_3033, _3004);
    float3 _3037 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7725, float2(0.0), isnan(_7725)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7725, float2(0.0), isnan(_7725)), level(0.0)).xyz;
    float _3039 = _3037.x;
    float _3041 = _3037.y;
    float _3043 = _3037.z;
    float _3045 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3047 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3049 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3051 = isnan(0.5);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3057 = _3053 || _3055;
    float _3059 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3061 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3045);
    float _3063 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3047);
    float _3065 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3067 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3061);
    float _3069 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3063);
    float _3071 = exp2(_3059);
    float _3073 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3065);
    float _3075 = _3067 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3077 = _3069 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3079 = _3012;
    float _3081 = _3067;
    float _3083 = _3065;
    if (!_3057)
    {
        _2398 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3085 = _2398;
    float _3087 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3073);
    float _3089 = _3077 + _3075;
    float _3091 = 1.0 / _3075;
    float _3093 = _3085;
    if (!_3057)
    {
        _3079 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3095 = _3079;
    float _3097 = _3089 * _3091;
    float _3099 = _3097 * 0.5;
    float _3101 = _3091;
    float _3103 = _3099;
    if (_3057)
    {
        _3101 = 1.0;
    }
    float _3105 = _3101;
    float _3107 = _3105;
    if (!_3057)
    {
        float _3109 = -_3085;
        float _3111 = fma(_3099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3109);
        _3103 = _3111;
    }
    float _3113 = _3103;
    if (!_3057)
    {
        float _3115 = -_3095;
        float _3117 = _3115 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3093 = _3117;
    }
    float _3119 = _3093;
    if (!_3057)
    {
        float _3121 = 1.0 / _3119;
        _3081 = _3121;
    }
    float _3123 = _3081;
    float _3125 = _3113;
    if (!_3057)
    {
        float _3127 = 1.0 / _3113;
        _3125 = _3127;
    }
    float _3129 = _3125;
    if (!_3057)
    {
        float _3131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3133 = -_3095;
        float _3135 = fma(_3129, _3131, _3133);
        _3083 = _3135;
    }
    float _3137 = _3083;
    if (!_3057)
    {
        float _3139 = _3137 * _3123;
        float _3141 = precise::clamp(_3139, 0.0, 1.0);
        _3107 = _3141;
    }
    float _3143 = _3107;
    float _3145 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3087);
    float _3147 = -_3071;
    float _3149 = _3147 + 1.0;
    float _3151 = _3143 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3153 = _3145 + _2964;
    float _3155 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3157 = _3143 > 0.0;
    bool _3159 = isnan(_3143);
    bool _3161 = _3157 || _3159;
    bool _3163 = isnan(0.0);
    bool _3165 = _3161 || _3163;
    out.gl_Position.x = _2988;
    out.gl_Position.y = _2992;
    out.gl_Position.z = _3145;
    out.gl_Position.w = _2964;
    float _3167 = _3153 * 0.5;
    float _3169 = _3151 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_74.z = _3167;
    out.m_74.w = _2964;
    out.m_45.x = _3169;
    float _3171 = _3155 * _3018;
    float _3173 = -_3155;
    float _3175 = _3173 + 1.0;
    float _3177 = _3029 * _3171;
    float _3179 = _3043 * _3171;
    float _3181 = fma(_3039, _3177, _3023);
    float _3183 = fma(_3041, _3177, _3025);
    float _3185 = _3029 * _3175;
    float _3187 = fma(_3029, _3179, _3027);
    out.m_76.x = _3181;
    out.m_76.y = _3183;
    out.m_76.z = _3187;
    out.m_76.w = _3185;
    if (_3165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3189 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3189;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

