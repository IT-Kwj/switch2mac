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
    float4 m_53 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_59 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _503 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1636 = as_type<float>(_104);
        out.gl_Position.z = _1636;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_90);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = 0.0;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1704 = as_type<float>(_142);
        out.gl_Position.z = _1704;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.x;
    float _146 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _148 = in.m_51.w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = _146 * _144;
    float _174 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _176 = trunc(_172);
    int _178 = int(_176);
    float _180 = 0.0;
    float _182 = _174;
    if (!_158)
    {
        float _184 = _174 * _174;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_158)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_158;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _174 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _174);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_158;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _174 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _264 = _178 << 4;
    int _266 = _264 + 1712;
    float _268 = fma(_254, _160, _258);
    float _270 = fma(_254, _162, _260);
    float _272 = fma(_254, _164, _262);
    float _274 = fma(_268, _148, _166);
    float _276 = fma(_270, _148, _168);
    float _278 = fma(_272, _148, _170);
    bool _280 = !_256;
    float _296;
    if (!_280)
    {
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _284 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_90);
        float _302 = 1.0 / _300;
        float _304 = _122 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    int _308 = _266 + 8;
    uint _311 = uint(int(uint(_308) >> uint(2)));
    uint _313 = uint(int(uint(int(_311)) >> uint(2)));
    int _315 = int(_311) & 3;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[int(_313)][_315];
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _321 = _306 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _331 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _333 = isnan(_306);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    uint _343 = uint(int(uint(_266) >> uint(2)));
    uint _345 = uint(int(uint(int(_343)) >> uint(2)));
    int _347 = int(_343) & 3;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[int(_345)][_347];
    int _351 = int(_343) + 1;
    uint _353 = uint(int(uint(_351) >> uint(2)));
    int _355 = _351 & 3;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[int(_353)][_355];
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _363 = 1.0 / _325;
    bool _365 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _367 = isnan(_306);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _377;
    float _381 = -_341;
    float _383 = _381 + 1.0;
    bool _385 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _387 = isnan(_306);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    bool _397 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _399 = _375 * _383;
    float _401 = 1.0 / _329;
    float _403 = 1.0 / _361;
    float _405 = _379 * _363;
    float _407 = -_375;
    float _409 = _407 + 1.0;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _415 = fma(_405, _321, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _417 = _395 * _409;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = _306 + _419;
    float _423 = _413 * _401;
    bool _425 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _427 = isnan(_306);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _437;
    float _441 = _415 * _417;
    float _443 = -_395;
    float _445 = _443 + 1.0;
    float _447 = fma(_423, _421, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _449 = -_435;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _455 = _306 + _453;
    float _457 = _439 * _403;
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[115].x, _441);
    float _461 = _341 * _451;
    float _463 = fma(_457, _455, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _465 = fma(_447, _399, _459);
    float _467 = _317 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _469 = fma(_463, _461, _465);
    float _471 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[118].x, _469);
    float _475 = _349 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _477 = _357 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _479 = _473 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _481 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _481;
    out.m_53.y = _483;
    out.m_53.z = _471;
    out.m_53.w = _479;
    bool _485 = !_397;
    float _501;
    if (!_485)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _489 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_90);
        float _507 = 1.0 / _505;
        float _509 = _122 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _515 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _517 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
    float _519 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
    bool _523 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _525 = isnan(0.5);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _531 = _527 || _529;
    float _533 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _517);
    float _535 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _537 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
    float _539 = _533 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _541 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _543 = _537 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _547 = _539 + _545;
    float _549 = _541 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _553 = _543 + _551;
    float _555 = _547 * _547;
    float _557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _559 = _549 + _557;
    float _561 = fma(_553, _553, _555);
    float _563 = fma(_559, _559, _561);
    float _565 = rsqrt(_563);
    float _567 = _547 * _565;
    float _569 = _553 * _565;
    float _571 = _559 * _565;
    float _573 = -_567;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _577 = -_569;
    float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _553);
    float _581 = -_571;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _559);
    float _585 = _575 * _575;
    float _587 = in.m_51.x;
    float _589 = in.m_51.y;
    float _591 = in.m_51.z;
    float _593 = fma(_579, _579, _585);
    float _595 = in.m_55.x;
    float _597 = in.m_55.y;
    float _599 = in.m_55.z;
    float _601 = fma(_583, _583, _593);
    float _603 = sqrt(_601);
    float _605 = _589 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _607 = _587 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _609 = _565 * _603;
    float _611 = _591 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _613 = _605 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _597);
    float _617 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _619 = _611 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _621 = _609 * _613;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _595);
    float _625 = _609 * _617;
    float _627 = _609 * _619;
    float _629 = _615 * _621;
    float _631 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _599);
    float _633 = _623 * _625;
    float _635 = -_569;
    float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _639 = _629 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _641 = _631 * _627;
    float _643 = _629 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _645 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[10].x, _639);
    float _647 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[8].x, _643);
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c10)._m0[10].z, _645);
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c10)._m0[8].z, _647);
    float _653 = _549 + _649;
    float _655 = _543 + _651;
    float _657 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _659 = _653 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _663 = _655 + _661;
    float _665 = _659 * _659;
    float _667 = fma(_663, _663, _665);
    float _669 = _629 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _671 = sqrt(_667);
    float _673 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[9].x, _669);
    float _675 = fma(_641, (*spvDescriptorSet0.vp_c10)._m0[9].z, _673);
    float _677 = _539 + _675;
    bool _679 = _671 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _681 = _633;
    float _683 = _629;
    float _685 = _655;
    float _687 = _653;
    if (!_679)
    {
        _681 = _653;
    }
    float _689 = _681;
    float _691 = _689;
    if (!_679)
    {
        _683 = _677;
    }
    float _693 = _683;
    bool _695 = !_679;
    float _697 = _693;
    if (!_695)
    {
        float _699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _701 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _703 = _671 + _701;
        float _705 = rsqrt(_667);
        float _707 = _703 * _699;
        float _709 = _677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _711 = _707 * 0.15915493667125701904296875;
        float _713 = _711 * 6.283185482025146484375;
        float _715 = cos(_713);
        float _717 = _711 * 6.283185482025146484375;
        float _719 = sin(_717);
        float _721 = _715 + (-1.0);
        float _723 = _721 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _725 = fma(_719, _709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _727 = fma(_677, _715, _723);
        float _729 = _705 * _725;
        float _731 = fma(_663, _729, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _733 = fma(_659, _729, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _685 = _731;
        _697 = _727;
        _691 = _733;
        _687 = _711;
    }
    float _735 = _685;
    float _737 = _697;
    float _739 = _691;
    float _741 = _687;
    float _743 = -_569;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _747 = -_567;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    float _751 = -_571;
    float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _755 = -_567;
    float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[18].w, _539);
    float _759 = -_571;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _549);
    float _763 = _749;
    float _765 = _745;
    float _767 = _753;
    float _769 = _741;
    if (!_531)
    {
        float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _773 = _757 + _771;
        float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _777 = _637 + _775;
        float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _781 = -_549;
        float _783 = _781 + _739;
        float _785 = _773 * _773;
        float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _789 = _761 + _787;
        float _791 = -_543;
        float _793 = _791 + _735;
        float _795 = fma(_777, _777, _785);
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _799 = fma(_789, _789, _795);
        float _801 = sqrt(_799);
        float _803 = 1.0 / _609;
        float _805 = _797 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _807 = precise::min(_801, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _809 = _807 * _779;
        float _811 = _809 * _803;
        float _813 = -_539;
        float _815 = _813 + _737;
        float _817 = _805 * _811;
        float _819 = _783 * _811;
        float _821 = fma(_815, _817, _757);
        float _823 = fma(_793, _817, _637);
        float _825 = fma(_805, _819, _761);
        _763 = _821;
        _765 = _823;
        _767 = _825;
    }
    float _827 = _763;
    float _829 = _765;
    float _831 = _767;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _835 = _827 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _843 = _831 + _841;
    float _845 = _835 * _835;
    float _847 = fma(_839, _839, _845);
    float _849 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _851 = fma(_843, _843, _847);
    float _853 = rsqrt(_851);
    float _855 = _853 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _857 = _839 * _855;
    float _859 = _843 * _855;
    float _861 = _857 * _857;
    float _863 = _859 * _859;
    float _865 = _861 + _863;
    float _867 = sqrt(_865);
    bool _869 = _867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _873 = _867 + _871;
    float _875 = _847;
    float _877 = _865;
    float _879 = _873;
    float _881 = _855;
    if (_869)
    {
        float _883 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _875 = _883;
    }
    float _885 = _875;
    if (_869)
    {
        float _887 = rsqrt(_865);
        _877 = _887;
    }
    float _889 = _877;
    if (_869)
    {
        float _891 = _873 * _885;
        _879 = _891;
    }
    float _893 = _879;
    if (_869)
    {
        float _895 = _893 * 0.15915493667125701904296875;
        _769 = _895;
    }
    float _897 = _769;
    float _899 = _843;
    float _901 = _897;
    if (_869)
    {
        float _903 = _897 * 6.283185482025146484375;
        float _905 = sin(_903);
        _899 = _905;
    }
    float _907 = _899;
    float _909 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _911 = precise::max(0.0, _909);
    float _913 = _853;
    float _915 = _911;
    float _917 = _909;
    if (_869)
    {
        float _919 = _897 * 6.283185482025146484375;
        float _921 = cos(_919);
        _913 = _921;
    }
    float _923 = _913;
    float _925 = -_855;
    float _927 = -_911;
    float _929 = fma(_835, _925, _927);
    float _931 = _929;
    if (_869)
    {
        float _933 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _933;
    }
    float _935 = _915;
    float _937 = _935;
    float _939 = _907;
    if (_869)
    {
        float _941 = fma(_907, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _937 = _941;
    }
    float _943 = _937;
    float _945 = _943;
    if (!_869)
    {
        _939 = _857;
    }
    float _947 = _939;
    float _949 = _947;
    float _951 = _923;
    if (_869)
    {
        float _953 = _923 + (-1.0);
        _917 = _953;
    }
    float _955 = _917;
    float _957 = _955;
    if (_869)
    {
        float _959 = _889 * _943;
        _881 = _959;
    }
    float _961 = _881;
    if (!_869)
    {
        _945 = _861;
    }
    float _963 = _945;
    float _965 = sqrt(_851);
    float _967 = _963;
    if (_869)
    {
        float _969 = _955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _901 = _969;
    }
    float _971 = _901;
    if (_869)
    {
        float _973 = _857 * _961;
        _949 = _973;
    }
    float _975 = _949;
    if (!_869)
    {
        _957 = _859;
    }
    float _977 = _957;
    float _979 = _977;
    if (_869)
    {
        float _981 = _859 * _961;
        _979 = _981;
    }
    float _983 = _979;
    if (_869)
    {
        float _985 = fma(_929, _923, _971);
        _931 = _985;
    }
    float _987 = _931;
    if (_869)
    {
        float _989 = _975 * _975;
        _967 = _989;
    }
    float _991 = _967;
    if (!_869)
    {
        _951 = _863;
    }
    float _993 = _951;
    float _995 = _993;
    if (_869)
    {
        float _997 = _983 * _983;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = fma(_987, _987, _991);
    float _1003 = _1001 + _999;
    float _1005 = _827 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1009 = fma(_965, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1007);
    float _1011 = precise::clamp(_1009, 0.0, 1.0);
    float _1013 = _827 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1015 = rsqrt(_1003);
    float _1017 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1005);
    float _1019 = -_1011;
    float _1021 = _1019 + 1.0;
    float _1023 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1013);
    float _1025 = _827 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1027 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1017);
    float _1029 = _827 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1023);
    float _1033 = abs(_1021);
    float _1035 = log2(_1033);
    float _1037 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1039 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1041 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1025);
    float _1043 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1047 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1039);
    float _1049 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1041);
    float _1051 = _1015 * _975;
    float _1053 = -_1045;
    float _1055 = fma(_1053, _849, 1.0);
    float _1057 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1059 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1061 = _1015 * _987;
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1065 = _1015 * _983;
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1059);
    float _1069 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1071 = -_1063;
    float _1073 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1071);
    float _1075 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1077 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1067);
    float _1079 = exp2(_1069);
    float _1081 = -_1065;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1073);
    float _1085 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1087 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1077);
    float _1089 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1091 = fma(_1083, -0.5, 0.5);
    float _1093 = fma(_1083, 0.5, 0.5);
    float _1095 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1085);
    float _1097 = log2(_1055);
    float _1099 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1089);
    float _1101 = _1061 + 1.0;
    float _1103 = fma(_1093, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1105 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1095);
    float _1107 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1099);
    float _1109 = fma(_1093, _1103, -0.212114393711090087890625);
    float _1111 = 1.0 / _1087;
    float _1113 = -_1061;
    float _1115 = fma(_1079, _1101, _1113);
    float _1117 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1105);
    float _1119 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1107);
    float _1121 = fma(_1093, _1109, 1.570728778839111328125);
    float _1123 = fma(_1115, 0.5, 0.5);
    float _1125 = sqrt(_1091);
    float _1127 = _1097 * 0.693147182464599609375;
    float _1129 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1131 = _1117 * _1111;
    float _1133 = _1119 * _1111;
    float _1135 = fma(_1131, 0.5, 0.5);
    float _1137 = fma(_1133, -0.5, 0.5);
    float _1139 = _1125 * 0.636619746685028076171875;
    float _1141 = -_1121;
    float _1143 = fma(_1139, _1141, 1.0);
    float3 _3331 = float3(_1135, _1137, _1129);
    float _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3331, float3(0.0), isnan(_3331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3331, float3(0.0), isnan(_3331)), level(0.0)).x;
    float3 _3342 = float3(_1135, _1137, _1129);
    float4 _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3342, float3(0.0), isnan(_3342)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3342, float3(0.0), isnan(_3342)), level(0.0)).xyzw;
    float _1150 = _1148.x;
    float _1152 = _1148.y;
    float _1154 = _1148.z;
    float _1156 = _1148.w;
    float2 _3359 = float2(_1143, _1123);
    float3 _1160 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3359, float2(0.0), isnan(_3359)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3359, float2(0.0), isnan(_3359)), level(0.0)).xyz;
    float _1162 = _1160.x;
    float _1164 = _1160.y;
    float _1166 = _1160.z;
    float _1168 = in.m_57.y;
    float _1170 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1172 = in.m_49.y;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1176 = _1174 != 0;
    float _1178 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1182 = _1180 != 0;
    float _1184 = in.m_57.x;
    bool _1186 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1188 = isnan(0.5);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1194 = _1190 || _1192;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1200 = -_1196;
    float _1202 = fma(_1170, 2.0, _1200);
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1210 = _144 > 0.5;
    bool _1212 = _1210 && _1182;
    float _1214 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1204);
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = 1.0 / _1208;
    float _1224 = -_1168;
    float _1226 = _1224 + 1.0;
    out.m_59.y = _827;
    bool _1228 = _1172 > 0.5;
    float _1230 = 1.0 / _1218;
    float _1232 = _1168;
    if (_1176)
    {
        float _1234 = _1228 ? _1226 : _1168;
        _1232 = _1234;
    }
    float _1236 = _1232;
    float _1238 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1244 = fma(_1238, -2.0, _1220);
    float _1246 = _757 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1250 = _757 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1252;
    float _1256 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1246);
    float _1258 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1248);
    float _1260 = 1.0 / _1242;
    float _1262 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1244);
    float _1264 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1256);
    float _1266 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1250);
    float _1268 = _1254 * _1222;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1274 = _1264 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1276 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1266);
    float _1278 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1280 = _1272 * _1230;
    float _1282 = 1.0 / _1274;
    float _1284 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1286 = -_122;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1202);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1292 = _511 + _1290;
    float _1294 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1214);
    float _1296 = _1284 + _1274;
    bool _1298 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1300 = isnan(_511);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1258);
    bool _1312 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1314 = isnan(_511);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1320 = _1316 || _1318;
    float _1322 = float(_1320);
    float _1324 = fma(_1268, _1292, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1326 = fma(_1278, _1236, -0.5);
    float _1328 = -_1308;
    float _1330 = _1328 + 1.0;
    bool _1332 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1334 = isnan(_511);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1322;
    float _1346 = _1344 + 1.0;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1348;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1354 = _1274;
    float _1356 = _1258;
    if (!_1194)
    {
        _1352 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1358 = _1352;
    float _1360 = _1296 * _1282;
    float _1362 = _1360 * 0.5;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1366 = _1322 * _1330;
    bool _1368 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1370 = isnan(_511);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = _1342 * _1346;
    float _1382 = -_1342;
    float _1384 = _1382 + 1.0;
    float _1386 = _1358;
    float _1388 = _1362;
    if (!_1194)
    {
        float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1392 = fma(_1362, _1358, _1390);
        _1386 = _1392;
    }
    float _1394 = _1386;
    if (_1182)
    {
        _1388 = _1184;
    }
    float _1396 = _1388;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1400 = _511 + _1398;
    float _1402 = _1396;
    float _1404 = _1400;
    if (!_1194)
    {
        _1354 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1406 = _1354;
    float _1408 = _1378 * _1384;
    float _1410 = -_1378;
    float _1412 = _1410 + 1.0;
    if (_1212)
    {
        float _1414 = -_1396;
        float _1416 = _1414 + 1.0;
        _1402 = _1416;
    }
    float _1418 = _1402;
    float _1420 = _1350 * _1260;
    float _1422 = _1324 * _1408;
    if (!_1194)
    {
        float _1424 = -_1406;
        float _1426 = _1424 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1356 = _1426;
    }
    float _1428 = _1356;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1432 = _511 + _1430;
    float _1434 = _1394;
    if (!_1194)
    {
        float _1436 = 1.0 / _1394;
        _1434 = _1436;
    }
    float _1438 = _1434;
    float _1440 = fma(_1280, _1400, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (!_1182)
    {
        _1404 = _1184;
    }
    float _1442 = _1404;
    float _1444 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1422);
    float _1446 = _1442;
    if (_1182)
    {
        _1446 = _1418;
    }
    float _1448 = _1446;
    float _1450 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1452 = fma(_1420, _1432, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1454 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1456 = _1428;
    float _1458 = _1452;
    if (!_1194)
    {
        float _1460 = 1.0 / _1428;
        _1456 = _1460;
    }
    float _1462 = _1456;
    float _1464 = fma(_1440, _1380, _1444);
    float _1466 = fma(_1450, _1448, -0.5);
    float _1468 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1454);
    float _1470 = in.m_61.w;
    float _1472 = fma(_1452, _1366, _1464);
    float _1474 = fma(_1294, _1466, _1288);
    float _1476 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1468);
    float _1478 = exp2(_1178);
    float _1480 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1472);
    if (!_1194)
    {
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1484 = -_1406;
        float _1486 = fma(_1438, _1482, _1484);
        _1458 = _1486;
    }
    float _1488 = _1458;
    float _1490 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1476);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1494 = _1474 + 0.5;
    float _1496 = _1488;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_1194)
    {
        float _1500 = _1488 * _1462;
        float _1502 = precise::clamp(_1500, 0.0, 1.0);
        _1496 = _1502;
    }
    float _1504 = _1496;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1194)
    {
        _1498 = 1.0;
    }
    float _1510 = _1498;
    float _1512 = _1510;
    if (!_1194)
    {
        float _1514 = -_1504;
        float _1516 = _1514 + 1.0;
        _1512 = _1516;
    }
    float _1518 = _1512;
    float _1520 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1522 = -_1478;
    float _1524 = _1522 + 1.0;
    float _1526 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1532 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1534 = -_1262;
    float _1536 = fma(_1310, _1326, _1534);
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1540 = _1490 + _1538;
    bool _1542 = _1518 > 0.0;
    bool _1544 = isnan(_1518);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan(0.0);
    bool _1550 = _1546 || _1548;
    out.m_63.x = _1520;
    out.m_63.y = _1526;
    out.m_63.z = _1528;
    out.m_63.w = _1530;
    float _1552 = _1536 + 0.5;
    float _1554 = _1087 + _1540;
    float _1556 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1117;
    out.gl_Position.y = _1119;
    out.gl_Position.z = _1540;
    out.gl_Position.w = _1087;
    float _1558 = _1554 * 0.5;
    float _1560 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.w = _1470;
    out.m_67.x = _1494;
    out.m_67.y = _1552;
    out.m_69.z = _1558;
    out.m_69.w = _1087;
    out.m_45.x = _1560;
    float _1562 = _1532 * _1145;
    float _1564 = -_1532;
    float _1566 = _1564 + 1.0;
    float _1568 = _1156 * _1562;
    float _1570 = _1166 * _1562;
    float _1572 = _1156 * _1566;
    float _1574 = fma(_1162, _1568, _1150);
    float _1576 = fma(_1164, _1568, _1152);
    float _1578 = fma(_1156, _1570, _1154);
    out.m_71.x = _1574;
    out.m_71.y = _1576;
    out.m_71.z = _1578;
    out.m_71.w = _1572;
    if (_1550)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1580 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1580;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _503 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1636 = as_type<float>(_104);
        out.gl_Position.z = _1636;
    }
    if (!_94)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_90);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = 0.0;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1704 = as_type<float>(_142);
        out.gl_Position.z = _1704;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.x;
    float _146 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _148 = in.m_51.w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = _146 * _144;
    float _174 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _176 = trunc(_172);
    int _178 = int(_176);
    float _180 = 0.0;
    float _182 = _174;
    if (!_158)
    {
        float _184 = _174 * _174;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_158)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_158;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _174 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _174);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_158;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _174 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _264 = _178 << 4;
    int _266 = _264 + 1712;
    float _268 = fma(_254, _160, _258);
    float _270 = fma(_254, _162, _260);
    float _272 = fma(_254, _164, _262);
    float _274 = fma(_268, _148, _166);
    float _276 = fma(_270, _148, _168);
    float _278 = fma(_272, _148, _170);
    bool _280 = !_256;
    float _296;
    if (!_280)
    {
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _284 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_90);
        float _302 = 1.0 / _300;
        float _304 = _122 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    int _308 = _266 + 8;
    uint _311 = uint(int(uint(_308) >> uint(2)));
    uint _313 = uint(int(uint(int(_311)) >> uint(2)));
    int _315 = int(_311) & 3;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[int(_313)][_315];
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _321 = _306 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _331 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _333 = isnan(_306);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    uint _343 = uint(int(uint(_266) >> uint(2)));
    uint _345 = uint(int(uint(int(_343)) >> uint(2)));
    int _347 = int(_343) & 3;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[int(_345)][_347];
    int _351 = int(_343) + 1;
    uint _353 = uint(int(uint(_351) >> uint(2)));
    int _355 = _351 & 3;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[int(_353)][_355];
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _363 = 1.0 / _325;
    bool _365 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _367 = isnan(_306);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _377;
    float _381 = -_341;
    float _383 = _381 + 1.0;
    bool _385 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _387 = isnan(_306);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    bool _397 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _399 = _375 * _383;
    float _401 = 1.0 / _329;
    float _403 = 1.0 / _361;
    float _405 = _379 * _363;
    float _407 = -_375;
    float _409 = _407 + 1.0;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _415 = fma(_405, _321, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _417 = _395 * _409;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = _306 + _419;
    float _423 = _413 * _401;
    bool _425 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _427 = isnan(_306);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _437;
    float _441 = _415 * _417;
    float _443 = -_395;
    float _445 = _443 + 1.0;
    float _447 = fma(_423, _421, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _449 = -_435;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _455 = _306 + _453;
    float _457 = _439 * _403;
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[115].x, _441);
    float _461 = _341 * _451;
    float _463 = fma(_457, _455, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _465 = fma(_447, _399, _459);
    float _467 = _317 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _469 = fma(_463, _461, _465);
    float _471 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[118].x, _469);
    float _475 = _349 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _477 = _357 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _479 = _473 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _481 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _481;
    out.m_53.y = _483;
    out.m_53.z = _471;
    out.m_53.w = _479;
    bool _485 = !_397;
    float _501;
    if (!_485)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _489 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_90);
        float _507 = 1.0 / _505;
        float _509 = _122 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _515 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _517 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
    float _519 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
    bool _523 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _525 = isnan(0.5);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _531 = _527 || _529;
    float _533 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _517);
    float _535 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _537 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
    float _539 = _533 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _541 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _543 = _537 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _547 = _539 + _545;
    float _549 = _541 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _553 = _543 + _551;
    float _555 = _547 * _547;
    float _557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _559 = _549 + _557;
    float _561 = fma(_553, _553, _555);
    float _563 = fma(_559, _559, _561);
    float _565 = rsqrt(_563);
    float _567 = _547 * _565;
    float _569 = _553 * _565;
    float _571 = _559 * _565;
    float _573 = -_567;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _577 = -_569;
    float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _553);
    float _581 = -_571;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _559);
    float _585 = _575 * _575;
    float _587 = in.m_51.x;
    float _589 = in.m_51.y;
    float _591 = in.m_51.z;
    float _593 = fma(_579, _579, _585);
    float _595 = in.m_55.x;
    float _597 = in.m_55.y;
    float _599 = in.m_55.z;
    float _601 = fma(_583, _583, _593);
    float _603 = sqrt(_601);
    float _605 = _589 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _607 = _587 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _609 = _565 * _603;
    float _611 = _591 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _613 = _605 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _597);
    float _617 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _619 = _611 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _621 = _609 * _613;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _595);
    float _625 = _609 * _617;
    float _627 = _609 * _619;
    float _629 = _615 * _621;
    float _631 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _599);
    float _633 = _623 * _625;
    float _635 = -_569;
    float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _639 = _629 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _641 = _631 * _627;
    float _643 = _629 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _645 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[10].x, _639);
    float _647 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[8].x, _643);
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c10)._m0[10].z, _645);
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c10)._m0[8].z, _647);
    float _653 = _549 + _649;
    float _655 = _543 + _651;
    float _657 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _659 = _653 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _663 = _655 + _661;
    float _665 = _659 * _659;
    float _667 = fma(_663, _663, _665);
    float _669 = _629 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _671 = sqrt(_667);
    float _673 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[9].x, _669);
    float _675 = fma(_641, (*spvDescriptorSet0.vp_c10)._m0[9].z, _673);
    float _677 = _539 + _675;
    bool _679 = _671 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _681 = _633;
    float _683 = _629;
    float _685 = _655;
    float _687 = _653;
    if (!_679)
    {
        _681 = _653;
    }
    float _689 = _681;
    float _691 = _689;
    if (!_679)
    {
        _683 = _677;
    }
    float _693 = _683;
    bool _695 = !_679;
    float _697 = _693;
    if (!_695)
    {
        float _699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _701 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _703 = _671 + _701;
        float _705 = rsqrt(_667);
        float _707 = _703 * _699;
        float _709 = _677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _711 = _707 * 0.15915493667125701904296875;
        float _713 = _711 * 6.283185482025146484375;
        float _715 = cos(_713);
        float _717 = _711 * 6.283185482025146484375;
        float _719 = sin(_717);
        float _721 = _715 + (-1.0);
        float _723 = _721 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _725 = fma(_719, _709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _727 = fma(_677, _715, _723);
        float _729 = _705 * _725;
        float _731 = fma(_663, _729, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _733 = fma(_659, _729, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _685 = _731;
        _697 = _727;
        _691 = _733;
        _687 = _711;
    }
    float _735 = _685;
    float _737 = _697;
    float _739 = _691;
    float _741 = _687;
    float _743 = -_569;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _747 = -_567;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    float _751 = -_571;
    float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _755 = -_567;
    float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[18].w, _539);
    float _759 = -_571;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _549);
    float _763 = _749;
    float _765 = _745;
    float _767 = _753;
    float _769 = _741;
    if (!_531)
    {
        float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _773 = _757 + _771;
        float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _777 = _637 + _775;
        float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _781 = -_549;
        float _783 = _781 + _739;
        float _785 = _773 * _773;
        float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _789 = _761 + _787;
        float _791 = -_543;
        float _793 = _791 + _735;
        float _795 = fma(_777, _777, _785);
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _799 = fma(_789, _789, _795);
        float _801 = sqrt(_799);
        float _803 = 1.0 / _609;
        float _805 = _797 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _807 = precise::min(_801, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _809 = _807 * _779;
        float _811 = _809 * _803;
        float _813 = -_539;
        float _815 = _813 + _737;
        float _817 = _805 * _811;
        float _819 = _783 * _811;
        float _821 = fma(_815, _817, _757);
        float _823 = fma(_793, _817, _637);
        float _825 = fma(_805, _819, _761);
        _763 = _821;
        _765 = _823;
        _767 = _825;
    }
    float _827 = _763;
    float _829 = _765;
    float _831 = _767;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _835 = _827 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _843 = _831 + _841;
    float _845 = _835 * _835;
    float _847 = fma(_839, _839, _845);
    float _849 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _851 = fma(_843, _843, _847);
    float _853 = rsqrt(_851);
    float _855 = _853 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _857 = _839 * _855;
    float _859 = _843 * _855;
    float _861 = _857 * _857;
    float _863 = _859 * _859;
    float _865 = _861 + _863;
    float _867 = sqrt(_865);
    bool _869 = _867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _873 = _867 + _871;
    float _875 = _847;
    float _877 = _865;
    float _879 = _873;
    float _881 = _855;
    if (_869)
    {
        float _883 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _875 = _883;
    }
    float _885 = _875;
    if (_869)
    {
        float _887 = rsqrt(_865);
        _877 = _887;
    }
    float _889 = _877;
    if (_869)
    {
        float _891 = _873 * _885;
        _879 = _891;
    }
    float _893 = _879;
    if (_869)
    {
        float _895 = _893 * 0.15915493667125701904296875;
        _769 = _895;
    }
    float _897 = _769;
    float _899 = _843;
    float _901 = _897;
    if (_869)
    {
        float _903 = _897 * 6.283185482025146484375;
        float _905 = sin(_903);
        _899 = _905;
    }
    float _907 = _899;
    float _909 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _911 = precise::max(0.0, _909);
    float _913 = _853;
    float _915 = _911;
    float _917 = _909;
    if (_869)
    {
        float _919 = _897 * 6.283185482025146484375;
        float _921 = cos(_919);
        _913 = _921;
    }
    float _923 = _913;
    float _925 = -_855;
    float _927 = -_911;
    float _929 = fma(_835, _925, _927);
    float _931 = _929;
    if (_869)
    {
        float _933 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _933;
    }
    float _935 = _915;
    float _937 = _935;
    float _939 = _907;
    if (_869)
    {
        float _941 = fma(_907, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _937 = _941;
    }
    float _943 = _937;
    float _945 = _943;
    if (!_869)
    {
        _939 = _857;
    }
    float _947 = _939;
    float _949 = _947;
    float _951 = _923;
    if (_869)
    {
        float _953 = _923 + (-1.0);
        _917 = _953;
    }
    float _955 = _917;
    float _957 = _955;
    if (_869)
    {
        float _959 = _889 * _943;
        _881 = _959;
    }
    float _961 = _881;
    if (!_869)
    {
        _945 = _861;
    }
    float _963 = _945;
    float _965 = sqrt(_851);
    float _967 = _963;
    if (_869)
    {
        float _969 = _955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _901 = _969;
    }
    float _971 = _901;
    if (_869)
    {
        float _973 = _857 * _961;
        _949 = _973;
    }
    float _975 = _949;
    if (!_869)
    {
        _957 = _859;
    }
    float _977 = _957;
    float _979 = _977;
    if (_869)
    {
        float _981 = _859 * _961;
        _979 = _981;
    }
    float _983 = _979;
    if (_869)
    {
        float _985 = fma(_929, _923, _971);
        _931 = _985;
    }
    float _987 = _931;
    if (_869)
    {
        float _989 = _975 * _975;
        _967 = _989;
    }
    float _991 = _967;
    if (!_869)
    {
        _951 = _863;
    }
    float _993 = _951;
    float _995 = _993;
    if (_869)
    {
        float _997 = _983 * _983;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = fma(_987, _987, _991);
    float _1003 = _1001 + _999;
    float _1005 = _827 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1009 = fma(_965, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1007);
    float _1011 = precise::clamp(_1009, 0.0, 1.0);
    float _1013 = _827 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1015 = rsqrt(_1003);
    float _1017 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1005);
    float _1019 = -_1011;
    float _1021 = _1019 + 1.0;
    float _1023 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1013);
    float _1025 = _827 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1027 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1017);
    float _1029 = _827 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1023);
    float _1033 = abs(_1021);
    float _1035 = log2(_1033);
    float _1037 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1039 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1041 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1025);
    float _1043 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1047 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1039);
    float _1049 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1041);
    float _1051 = _1015 * _975;
    float _1053 = -_1045;
    float _1055 = fma(_1053, _849, 1.0);
    float _1057 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1059 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1061 = _1015 * _987;
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1065 = _1015 * _983;
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1059);
    float _1069 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1071 = -_1063;
    float _1073 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1071);
    float _1075 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1077 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1067);
    float _1079 = exp2(_1069);
    float _1081 = -_1065;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1073);
    float _1085 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1087 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1077);
    float _1089 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1091 = fma(_1083, -0.5, 0.5);
    float _1093 = fma(_1083, 0.5, 0.5);
    float _1095 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1085);
    float _1097 = log2(_1055);
    float _1099 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1089);
    float _1101 = _1061 + 1.0;
    float _1103 = fma(_1093, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1105 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1095);
    float _1107 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1099);
    float _1109 = fma(_1093, _1103, -0.212114393711090087890625);
    float _1111 = 1.0 / _1087;
    float _1113 = -_1061;
    float _1115 = fma(_1079, _1101, _1113);
    float _1117 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1105);
    float _1119 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1107);
    float _1121 = fma(_1093, _1109, 1.570728778839111328125);
    float _1123 = fma(_1115, 0.5, 0.5);
    float _1125 = sqrt(_1091);
    float _1127 = _1097 * 0.693147182464599609375;
    float _1129 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1131 = _1117 * _1111;
    float _1133 = _1119 * _1111;
    float _1135 = fma(_1131, 0.5, 0.5);
    float _1137 = fma(_1133, -0.5, 0.5);
    float _1139 = _1125 * 0.636619746685028076171875;
    float _1141 = -_1121;
    float _1143 = fma(_1139, _1141, 1.0);
    float3 _3331 = float3(_1135, _1137, _1129);
    float _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3331, float3(0.0), isnan(_3331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3331, float3(0.0), isnan(_3331)), level(0.0)).x;
    float3 _3342 = float3(_1135, _1137, _1129);
    float4 _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3342, float3(0.0), isnan(_3342)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3342, float3(0.0), isnan(_3342)), level(0.0)).xyzw;
    float _1150 = _1148.x;
    float _1152 = _1148.y;
    float _1154 = _1148.z;
    float _1156 = _1148.w;
    float2 _3359 = float2(_1143, _1123);
    float3 _1160 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3359, float2(0.0), isnan(_3359)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3359, float2(0.0), isnan(_3359)), level(0.0)).xyz;
    float _1162 = _1160.x;
    float _1164 = _1160.y;
    float _1166 = _1160.z;
    float _1168 = in.m_57.y;
    float _1170 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1172 = in.m_49.y;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1176 = _1174 != 0;
    float _1178 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1182 = _1180 != 0;
    float _1184 = in.m_57.x;
    bool _1186 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1188 = isnan(0.5);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1194 = _1190 || _1192;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1200 = -_1196;
    float _1202 = fma(_1170, 2.0, _1200);
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1210 = _144 > 0.5;
    bool _1212 = _1210 && _1182;
    float _1214 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1204);
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = 1.0 / _1208;
    float _1224 = -_1168;
    float _1226 = _1224 + 1.0;
    out.m_59.y = _827;
    bool _1228 = _1172 > 0.5;
    float _1230 = 1.0 / _1218;
    float _1232 = _1168;
    if (_1176)
    {
        float _1234 = _1228 ? _1226 : _1168;
        _1232 = _1234;
    }
    float _1236 = _1232;
    float _1238 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1244 = fma(_1238, -2.0, _1220);
    float _1246 = _757 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1250 = _757 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1252;
    float _1256 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1246);
    float _1258 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1248);
    float _1260 = 1.0 / _1242;
    float _1262 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1244);
    float _1264 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1256);
    float _1266 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1250);
    float _1268 = _1254 * _1222;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1274 = _1264 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1276 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1266);
    float _1278 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1280 = _1272 * _1230;
    float _1282 = 1.0 / _1274;
    float _1284 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1286 = -_122;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1202);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1292 = _511 + _1290;
    float _1294 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1214);
    float _1296 = _1284 + _1274;
    bool _1298 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1300 = isnan(_511);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1258);
    bool _1312 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1314 = isnan(_511);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1320 = _1316 || _1318;
    float _1322 = float(_1320);
    float _1324 = fma(_1268, _1292, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1326 = fma(_1278, _1236, -0.5);
    float _1328 = -_1308;
    float _1330 = _1328 + 1.0;
    bool _1332 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1334 = isnan(_511);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1322;
    float _1346 = _1344 + 1.0;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1348;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1354 = _1274;
    float _1356 = _1258;
    if (!_1194)
    {
        _1352 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1358 = _1352;
    float _1360 = _1296 * _1282;
    float _1362 = _1360 * 0.5;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1366 = _1322 * _1330;
    bool _1368 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1370 = isnan(_511);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = _1342 * _1346;
    float _1382 = -_1342;
    float _1384 = _1382 + 1.0;
    float _1386 = _1358;
    float _1388 = _1362;
    if (!_1194)
    {
        float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1392 = fma(_1362, _1358, _1390);
        _1386 = _1392;
    }
    float _1394 = _1386;
    if (_1182)
    {
        _1388 = _1184;
    }
    float _1396 = _1388;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1400 = _511 + _1398;
    float _1402 = _1396;
    float _1404 = _1400;
    if (!_1194)
    {
        _1354 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1406 = _1354;
    float _1408 = _1378 * _1384;
    float _1410 = -_1378;
    float _1412 = _1410 + 1.0;
    if (_1212)
    {
        float _1414 = -_1396;
        float _1416 = _1414 + 1.0;
        _1402 = _1416;
    }
    float _1418 = _1402;
    float _1420 = _1350 * _1260;
    float _1422 = _1324 * _1408;
    if (!_1194)
    {
        float _1424 = -_1406;
        float _1426 = _1424 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1356 = _1426;
    }
    float _1428 = _1356;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1432 = _511 + _1430;
    float _1434 = _1394;
    if (!_1194)
    {
        float _1436 = 1.0 / _1394;
        _1434 = _1436;
    }
    float _1438 = _1434;
    float _1440 = fma(_1280, _1400, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (!_1182)
    {
        _1404 = _1184;
    }
    float _1442 = _1404;
    float _1444 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1422);
    float _1446 = _1442;
    if (_1182)
    {
        _1446 = _1418;
    }
    float _1448 = _1446;
    float _1450 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1452 = fma(_1420, _1432, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1454 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1456 = _1428;
    float _1458 = _1452;
    if (!_1194)
    {
        float _1460 = 1.0 / _1428;
        _1456 = _1460;
    }
    float _1462 = _1456;
    float _1464 = fma(_1440, _1380, _1444);
    float _1466 = fma(_1450, _1448, -0.5);
    float _1468 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1454);
    float _1470 = in.m_61.w;
    float _1472 = fma(_1452, _1366, _1464);
    float _1474 = fma(_1294, _1466, _1288);
    float _1476 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1468);
    float _1478 = exp2(_1178);
    float _1480 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1472);
    if (!_1194)
    {
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1484 = -_1406;
        float _1486 = fma(_1438, _1482, _1484);
        _1458 = _1486;
    }
    float _1488 = _1458;
    float _1490 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1476);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1494 = _1474 + 0.5;
    float _1496 = _1488;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_1194)
    {
        float _1500 = _1488 * _1462;
        float _1502 = precise::clamp(_1500, 0.0, 1.0);
        _1496 = _1502;
    }
    float _1504 = _1496;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1194)
    {
        _1498 = 1.0;
    }
    float _1510 = _1498;
    float _1512 = _1510;
    if (!_1194)
    {
        float _1514 = -_1504;
        float _1516 = _1514 + 1.0;
        _1512 = _1516;
    }
    float _1518 = _1512;
    float _1520 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1522 = -_1478;
    float _1524 = _1522 + 1.0;
    float _1526 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1532 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1534 = -_1262;
    float _1536 = fma(_1310, _1326, _1534);
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1540 = _1490 + _1538;
    bool _1542 = _1518 > 0.0;
    bool _1544 = isnan(_1518);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan(0.0);
    bool _1550 = _1546 || _1548;
    out.m_63.x = _1520;
    out.m_63.y = _1526;
    out.m_63.z = _1528;
    out.m_63.w = _1530;
    float _1552 = _1536 + 0.5;
    float _1554 = _1087 + _1540;
    float _1556 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1117;
    out.gl_Position.y = _1119;
    out.gl_Position.z = _1540;
    out.gl_Position.w = _1087;
    float _1558 = _1554 * 0.5;
    float _1560 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.w = _1470;
    out.m_67.x = _1494;
    out.m_67.y = _1552;
    out.m_69.z = _1558;
    out.m_69.w = _1087;
    out.m_45.x = _1560;
    float _1562 = _1532 * _1145;
    float _1564 = -_1532;
    float _1566 = _1564 + 1.0;
    float _1568 = _1156 * _1562;
    float _1570 = _1166 * _1562;
    float _1572 = _1156 * _1566;
    float _1574 = fma(_1162, _1568, _1150);
    float _1576 = fma(_1164, _1568, _1152);
    float _1578 = fma(_1156, _1570, _1154);
    out.m_71.x = _1574;
    out.m_71.y = _1576;
    out.m_71.z = _1578;
    out.m_71.w = _1572;
    if (_1550)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1580 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1580;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _503 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1636 = as_type<float>(_104);
        out.gl_Position.z = _1636;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_90);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = 0.0;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1704 = as_type<float>(_142);
        out.gl_Position.z = _1704;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.x;
    float _146 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _148 = in.m_51.w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = _146 * _144;
    float _174 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _176 = trunc(_172);
    int _178 = int(_176);
    float _180 = 0.0;
    float _182 = _174;
    if (!_158)
    {
        float _184 = _174 * _174;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_158)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_158;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _174 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _174);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_158;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _174 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _264 = _178 << 4;
    int _266 = _264 + 1712;
    float _268 = fma(_254, _160, _258);
    float _270 = fma(_254, _162, _260);
    float _272 = fma(_254, _164, _262);
    float _274 = fma(_268, _148, _166);
    float _276 = fma(_270, _148, _168);
    float _278 = fma(_272, _148, _170);
    bool _280 = !_256;
    float _296;
    if (!_280)
    {
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _284 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_90);
        float _302 = 1.0 / _300;
        float _304 = _122 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    int _308 = _266 + 8;
    uint _311 = uint(int(uint(_308) >> uint(2)));
    uint _313 = uint(int(uint(int(_311)) >> uint(2)));
    int _315 = int(_311) & 3;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[int(_313)][_315];
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _321 = _306 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _331 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _333 = isnan(_306);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    uint _343 = uint(int(uint(_266) >> uint(2)));
    uint _345 = uint(int(uint(int(_343)) >> uint(2)));
    int _347 = int(_343) & 3;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[int(_345)][_347];
    int _351 = int(_343) + 1;
    uint _353 = uint(int(uint(_351) >> uint(2)));
    int _355 = _351 & 3;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[int(_353)][_355];
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _363 = 1.0 / _325;
    bool _365 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _367 = isnan(_306);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _377;
    float _381 = -_341;
    float _383 = _381 + 1.0;
    bool _385 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _387 = isnan(_306);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    bool _397 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _399 = _375 * _383;
    float _401 = 1.0 / _329;
    float _403 = 1.0 / _361;
    float _405 = _379 * _363;
    float _407 = -_375;
    float _409 = _407 + 1.0;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _415 = fma(_405, _321, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _417 = _395 * _409;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = _306 + _419;
    float _423 = _413 * _401;
    bool _425 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _427 = isnan(_306);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _437;
    float _441 = _415 * _417;
    float _443 = -_395;
    float _445 = _443 + 1.0;
    float _447 = fma(_423, _421, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _449 = -_435;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _455 = _306 + _453;
    float _457 = _439 * _403;
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[115].x, _441);
    float _461 = _341 * _451;
    float _463 = fma(_457, _455, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _465 = fma(_447, _399, _459);
    float _467 = _317 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _469 = fma(_463, _461, _465);
    float _471 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[118].x, _469);
    float _475 = _349 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _477 = _357 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _479 = _473 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _481 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _481;
    out.m_53.y = _483;
    out.m_53.z = _471;
    out.m_53.w = _479;
    bool _485 = !_397;
    float _501;
    if (!_485)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _489 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_90);
        float _507 = 1.0 / _505;
        float _509 = _122 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _515 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _517 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
    float _519 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
    bool _523 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _525 = isnan(0.5);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _531 = _527 || _529;
    float _533 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _517);
    float _535 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _537 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
    float _539 = _533 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _541 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _543 = _537 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _547 = _539 + _545;
    float _549 = _541 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _553 = _543 + _551;
    float _555 = _547 * _547;
    float _557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _559 = _549 + _557;
    float _561 = fma(_553, _553, _555);
    float _563 = fma(_559, _559, _561);
    float _565 = rsqrt(_563);
    float _567 = _547 * _565;
    float _569 = _553 * _565;
    float _571 = _559 * _565;
    float _573 = -_567;
    float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _577 = -_569;
    float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _553);
    float _581 = -_571;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _559);
    float _585 = _575 * _575;
    float _587 = in.m_51.x;
    float _589 = in.m_51.y;
    float _591 = in.m_51.z;
    float _593 = fma(_579, _579, _585);
    float _595 = in.m_55.x;
    float _597 = in.m_55.y;
    float _599 = in.m_55.z;
    float _601 = fma(_583, _583, _593);
    float _603 = sqrt(_601);
    float _605 = _589 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _607 = _587 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _609 = _565 * _603;
    float _611 = _591 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _613 = _605 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _597);
    float _617 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _619 = _611 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _621 = _609 * _613;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _595);
    float _625 = _609 * _617;
    float _627 = _609 * _619;
    float _629 = _615 * _621;
    float _631 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _599);
    float _633 = _623 * _625;
    float _635 = -_569;
    float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _639 = _629 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _641 = _631 * _627;
    float _643 = _629 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _645 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[10].x, _639);
    float _647 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[8].x, _643);
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c10)._m0[10].z, _645);
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c10)._m0[8].z, _647);
    float _653 = _549 + _649;
    float _655 = _543 + _651;
    float _657 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _659 = _653 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _663 = _655 + _661;
    float _665 = _659 * _659;
    float _667 = fma(_663, _663, _665);
    float _669 = _629 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _671 = sqrt(_667);
    float _673 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[9].x, _669);
    float _675 = fma(_641, (*spvDescriptorSet0.vp_c10)._m0[9].z, _673);
    float _677 = _539 + _675;
    bool _679 = _671 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _681 = _633;
    float _683 = _629;
    float _685 = _655;
    float _687 = _653;
    if (!_679)
    {
        _681 = _653;
    }
    float _689 = _681;
    float _691 = _689;
    if (!_679)
    {
        _683 = _677;
    }
    float _693 = _683;
    bool _695 = !_679;
    float _697 = _693;
    if (!_695)
    {
        float _699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _701 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _703 = _671 + _701;
        float _705 = rsqrt(_667);
        float _707 = _703 * _699;
        float _709 = _677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _711 = _707 * 0.15915493667125701904296875;
        float _713 = _711 * 6.283185482025146484375;
        float _715 = cos(_713);
        float _717 = _711 * 6.283185482025146484375;
        float _719 = sin(_717);
        float _721 = _715 + (-1.0);
        float _723 = _721 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _725 = fma(_719, _709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _727 = fma(_677, _715, _723);
        float _729 = _705 * _725;
        float _731 = fma(_663, _729, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _733 = fma(_659, _729, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _685 = _731;
        _697 = _727;
        _691 = _733;
        _687 = _711;
    }
    float _735 = _685;
    float _737 = _697;
    float _739 = _691;
    float _741 = _687;
    float _743 = -_569;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _747 = -_567;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    float _751 = -_571;
    float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _755 = -_567;
    float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[18].w, _539);
    float _759 = -_571;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _549);
    float _763 = _749;
    float _765 = _745;
    float _767 = _753;
    float _769 = _741;
    if (!_531)
    {
        float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _773 = _757 + _771;
        float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _777 = _637 + _775;
        float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _781 = -_549;
        float _783 = _781 + _739;
        float _785 = _773 * _773;
        float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _789 = _761 + _787;
        float _791 = -_543;
        float _793 = _791 + _735;
        float _795 = fma(_777, _777, _785);
        float _797 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _799 = fma(_789, _789, _795);
        float _801 = sqrt(_799);
        float _803 = 1.0 / _609;
        float _805 = _797 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _807 = precise::min(_801, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _809 = _807 * _779;
        float _811 = _809 * _803;
        float _813 = -_539;
        float _815 = _813 + _737;
        float _817 = _805 * _811;
        float _819 = _783 * _811;
        float _821 = fma(_815, _817, _757);
        float _823 = fma(_793, _817, _637);
        float _825 = fma(_805, _819, _761);
        _763 = _821;
        _765 = _823;
        _767 = _825;
    }
    float _827 = _763;
    float _829 = _765;
    float _831 = _767;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _835 = _827 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _843 = _831 + _841;
    float _845 = _835 * _835;
    float _847 = fma(_839, _839, _845);
    float _849 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _851 = fma(_843, _843, _847);
    float _853 = rsqrt(_851);
    float _855 = _853 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _857 = _839 * _855;
    float _859 = _843 * _855;
    float _861 = _857 * _857;
    float _863 = _859 * _859;
    float _865 = _861 + _863;
    float _867 = sqrt(_865);
    bool _869 = _867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _873 = _867 + _871;
    float _875 = _847;
    float _877 = _865;
    float _879 = _873;
    float _881 = _855;
    if (_869)
    {
        float _883 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _875 = _883;
    }
    float _885 = _875;
    if (_869)
    {
        float _887 = rsqrt(_865);
        _877 = _887;
    }
    float _889 = _877;
    if (_869)
    {
        float _891 = _873 * _885;
        _879 = _891;
    }
    float _893 = _879;
    if (_869)
    {
        float _895 = _893 * 0.15915493667125701904296875;
        _769 = _895;
    }
    float _897 = _769;
    float _899 = _843;
    float _901 = _897;
    if (_869)
    {
        float _903 = _897 * 6.283185482025146484375;
        float _905 = sin(_903);
        _899 = _905;
    }
    float _907 = _899;
    float _909 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _911 = precise::max(0.0, _909);
    float _913 = _853;
    float _915 = _911;
    float _917 = _909;
    if (_869)
    {
        float _919 = _897 * 6.283185482025146484375;
        float _921 = cos(_919);
        _913 = _921;
    }
    float _923 = _913;
    float _925 = -_855;
    float _927 = -_911;
    float _929 = fma(_835, _925, _927);
    float _931 = _929;
    if (_869)
    {
        float _933 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _933;
    }
    float _935 = _915;
    float _937 = _935;
    float _939 = _907;
    if (_869)
    {
        float _941 = fma(_907, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _937 = _941;
    }
    float _943 = _937;
    float _945 = _943;
    if (!_869)
    {
        _939 = _857;
    }
    float _947 = _939;
    float _949 = _947;
    float _951 = _923;
    if (_869)
    {
        float _953 = _923 + (-1.0);
        _917 = _953;
    }
    float _955 = _917;
    float _957 = _955;
    if (_869)
    {
        float _959 = _889 * _943;
        _881 = _959;
    }
    float _961 = _881;
    if (!_869)
    {
        _945 = _861;
    }
    float _963 = _945;
    float _965 = sqrt(_851);
    float _967 = _963;
    if (_869)
    {
        float _969 = _955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _901 = _969;
    }
    float _971 = _901;
    if (_869)
    {
        float _973 = _857 * _961;
        _949 = _973;
    }
    float _975 = _949;
    if (!_869)
    {
        _957 = _859;
    }
    float _977 = _957;
    float _979 = _977;
    if (_869)
    {
        float _981 = _859 * _961;
        _979 = _981;
    }
    float _983 = _979;
    if (_869)
    {
        float _985 = fma(_929, _923, _971);
        _931 = _985;
    }
    float _987 = _931;
    if (_869)
    {
        float _989 = _975 * _975;
        _967 = _989;
    }
    float _991 = _967;
    if (!_869)
    {
        _951 = _863;
    }
    float _993 = _951;
    float _995 = _993;
    if (_869)
    {
        float _997 = _983 * _983;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = fma(_987, _987, _991);
    float _1003 = _1001 + _999;
    float _1005 = _827 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1009 = fma(_965, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1007);
    float _1011 = precise::clamp(_1009, 0.0, 1.0);
    float _1013 = _827 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1015 = rsqrt(_1003);
    float _1017 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1005);
    float _1019 = -_1011;
    float _1021 = _1019 + 1.0;
    float _1023 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1013);
    float _1025 = _827 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1027 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1017);
    float _1029 = _827 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1023);
    float _1033 = abs(_1021);
    float _1035 = log2(_1033);
    float _1037 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1039 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1041 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1025);
    float _1043 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1047 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1039);
    float _1049 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1041);
    float _1051 = _1015 * _975;
    float _1053 = -_1045;
    float _1055 = fma(_1053, _849, 1.0);
    float _1057 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1059 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1061 = _1015 * _987;
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1065 = _1015 * _983;
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1059);
    float _1069 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1071 = -_1063;
    float _1073 = fma(_1061, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1071);
    float _1075 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1077 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1067);
    float _1079 = exp2(_1069);
    float _1081 = -_1065;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1073);
    float _1085 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1087 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1077);
    float _1089 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1091 = fma(_1083, -0.5, 0.5);
    float _1093 = fma(_1083, 0.5, 0.5);
    float _1095 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1085);
    float _1097 = log2(_1055);
    float _1099 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1089);
    float _1101 = _1061 + 1.0;
    float _1103 = fma(_1093, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1105 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1095);
    float _1107 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1099);
    float _1109 = fma(_1093, _1103, -0.212114393711090087890625);
    float _1111 = 1.0 / _1087;
    float _1113 = -_1061;
    float _1115 = fma(_1079, _1101, _1113);
    float _1117 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1105);
    float _1119 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1107);
    float _1121 = fma(_1093, _1109, 1.570728778839111328125);
    float _1123 = fma(_1115, 0.5, 0.5);
    float _1125 = sqrt(_1091);
    float _1127 = _1097 * 0.693147182464599609375;
    float _1129 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1131 = _1117 * _1111;
    float _1133 = _1119 * _1111;
    float _1135 = fma(_1131, 0.5, 0.5);
    float _1137 = fma(_1133, -0.5, 0.5);
    float _1139 = _1125 * 0.636619746685028076171875;
    float _1141 = -_1121;
    float _1143 = fma(_1139, _1141, 1.0);
    float3 _3331 = float3(_1135, _1137, _1129);
    float _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3331, float3(0.0), isnan(_3331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3331, float3(0.0), isnan(_3331)), level(0.0)).x;
    float3 _3342 = float3(_1135, _1137, _1129);
    float4 _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3342, float3(0.0), isnan(_3342)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3342, float3(0.0), isnan(_3342)), level(0.0)).xyzw;
    float _1150 = _1148.x;
    float _1152 = _1148.y;
    float _1154 = _1148.z;
    float _1156 = _1148.w;
    float2 _3359 = float2(_1143, _1123);
    float3 _1160 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3359, float2(0.0), isnan(_3359)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3359, float2(0.0), isnan(_3359)), level(0.0)).xyz;
    float _1162 = _1160.x;
    float _1164 = _1160.y;
    float _1166 = _1160.z;
    float _1168 = in.m_57.y;
    float _1170 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1172 = in.m_49.y;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1176 = _1174 != 0;
    float _1178 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1182 = _1180 != 0;
    float _1184 = in.m_57.x;
    bool _1186 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1188 = isnan(0.5);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1194 = _1190 || _1192;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1200 = -_1196;
    float _1202 = fma(_1170, 2.0, _1200);
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1210 = _144 > 0.5;
    bool _1212 = _1210 && _1182;
    float _1214 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1204);
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = 1.0 / _1208;
    float _1224 = -_1168;
    float _1226 = _1224 + 1.0;
    out.m_59.y = _827;
    bool _1228 = _1172 > 0.5;
    float _1230 = 1.0 / _1218;
    float _1232 = _1168;
    if (_1176)
    {
        float _1234 = _1228 ? _1226 : _1168;
        _1232 = _1234;
    }
    float _1236 = _1232;
    float _1238 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1244 = fma(_1238, -2.0, _1220);
    float _1246 = _757 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1250 = _757 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1252;
    float _1256 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1246);
    float _1258 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1248);
    float _1260 = 1.0 / _1242;
    float _1262 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1244);
    float _1264 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1256);
    float _1266 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1250);
    float _1268 = _1254 * _1222;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1274 = _1264 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1276 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1266);
    float _1278 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1280 = _1272 * _1230;
    float _1282 = 1.0 / _1274;
    float _1284 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1286 = -_122;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1202);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1292 = _511 + _1290;
    float _1294 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1214);
    float _1296 = _1284 + _1274;
    bool _1298 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1300 = isnan(_511);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1258);
    bool _1312 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1314 = isnan(_511);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1320 = _1316 || _1318;
    float _1322 = float(_1320);
    float _1324 = fma(_1268, _1292, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1326 = fma(_1278, _1236, -0.5);
    float _1328 = -_1308;
    float _1330 = _1328 + 1.0;
    bool _1332 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1334 = isnan(_511);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1322;
    float _1346 = _1344 + 1.0;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1348;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1354 = _1274;
    float _1356 = _1258;
    if (!_1194)
    {
        _1352 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1358 = _1352;
    float _1360 = _1296 * _1282;
    float _1362 = _1360 * 0.5;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1366 = _1322 * _1330;
    bool _1368 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1370 = isnan(_511);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = _1342 * _1346;
    float _1382 = -_1342;
    float _1384 = _1382 + 1.0;
    float _1386 = _1358;
    float _1388 = _1362;
    if (!_1194)
    {
        float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1392 = fma(_1362, _1358, _1390);
        _1386 = _1392;
    }
    float _1394 = _1386;
    if (_1182)
    {
        _1388 = _1184;
    }
    float _1396 = _1388;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1400 = _511 + _1398;
    float _1402 = _1396;
    float _1404 = _1400;
    if (!_1194)
    {
        _1354 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1406 = _1354;
    float _1408 = _1378 * _1384;
    float _1410 = -_1378;
    float _1412 = _1410 + 1.0;
    if (_1212)
    {
        float _1414 = -_1396;
        float _1416 = _1414 + 1.0;
        _1402 = _1416;
    }
    float _1418 = _1402;
    float _1420 = _1350 * _1260;
    float _1422 = _1324 * _1408;
    if (!_1194)
    {
        float _1424 = -_1406;
        float _1426 = _1424 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1356 = _1426;
    }
    float _1428 = _1356;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1432 = _511 + _1430;
    float _1434 = _1394;
    if (!_1194)
    {
        float _1436 = 1.0 / _1394;
        _1434 = _1436;
    }
    float _1438 = _1434;
    float _1440 = fma(_1280, _1400, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (!_1182)
    {
        _1404 = _1184;
    }
    float _1442 = _1404;
    float _1444 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1422);
    float _1446 = _1442;
    if (_1182)
    {
        _1446 = _1418;
    }
    float _1448 = _1446;
    float _1450 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1452 = fma(_1420, _1432, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1454 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1456 = _1428;
    float _1458 = _1452;
    if (!_1194)
    {
        float _1460 = 1.0 / _1428;
        _1456 = _1460;
    }
    float _1462 = _1456;
    float _1464 = fma(_1440, _1380, _1444);
    float _1466 = fma(_1450, _1448, -0.5);
    float _1468 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1454);
    float _1470 = in.m_61.w;
    float _1472 = fma(_1452, _1366, _1464);
    float _1474 = fma(_1294, _1466, _1288);
    float _1476 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1468);
    float _1478 = exp2(_1178);
    float _1480 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1472);
    if (!_1194)
    {
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1484 = -_1406;
        float _1486 = fma(_1438, _1482, _1484);
        _1458 = _1486;
    }
    float _1488 = _1458;
    float _1490 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1476);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1494 = _1474 + 0.5;
    float _1496 = _1488;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_1194)
    {
        float _1500 = _1488 * _1462;
        float _1502 = precise::clamp(_1500, 0.0, 1.0);
        _1496 = _1502;
    }
    float _1504 = _1496;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1194)
    {
        _1498 = 1.0;
    }
    float _1510 = _1498;
    float _1512 = _1510;
    if (!_1194)
    {
        float _1514 = -_1504;
        float _1516 = _1514 + 1.0;
        _1512 = _1516;
    }
    float _1518 = _1512;
    float _1520 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1522 = -_1478;
    float _1524 = _1522 + 1.0;
    float _1526 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1532 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1534 = -_1262;
    float _1536 = fma(_1310, _1326, _1534);
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1540 = _1490 + _1538;
    bool _1542 = _1518 > 0.0;
    bool _1544 = isnan(_1518);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan(0.0);
    bool _1550 = _1546 || _1548;
    out.m_63.x = _1520;
    out.m_63.y = _1526;
    out.m_63.z = _1528;
    out.m_63.w = _1530;
    float _1552 = _1536 + 0.5;
    float _1554 = _1087 + _1540;
    float _1556 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1117;
    out.gl_Position.y = _1119;
    out.gl_Position.z = _1540;
    out.gl_Position.w = _1087;
    float _1558 = _1554 * 0.5;
    float _1560 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.w = _1470;
    out.m_67.x = _1494;
    out.m_67.y = _1552;
    out.m_69.z = _1558;
    out.m_69.w = _1087;
    out.m_45.x = _1560;
    float _1562 = _1532 * _1145;
    float _1564 = -_1532;
    float _1566 = _1564 + 1.0;
    float _1568 = _1156 * _1562;
    float _1570 = _1166 * _1562;
    float _1572 = _1156 * _1566;
    float _1574 = fma(_1162, _1568, _1150);
    float _1576 = fma(_1164, _1568, _1152);
    float _1578 = fma(_1156, _1570, _1154);
    out.m_71.x = _1574;
    out.m_71.y = _1576;
    out.m_71.z = _1578;
    out.m_71.w = _1572;
    if (_1550)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1580 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1580;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

