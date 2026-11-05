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
        float _1694 = as_type<float>(_104);
        out.gl_Position.z = _1694;
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
        float _1762 = as_type<float>(_142);
        out.gl_Position.z = _1762;
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
    float _689 = _609;
    if (!_679)
    {
        _681 = _653;
    }
    float _691 = _681;
    float _693 = _691;
    if (!_679)
    {
        _683 = _677;
    }
    float _695 = _683;
    bool _697 = !_679;
    float _699 = _695;
    if (!_697)
    {
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _705 = _671 + _703;
        float _707 = rsqrt(_667);
        float _709 = _705 * _701;
        float _711 = _677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _713 = _709 * 0.15915493667125701904296875;
        float _715 = _713 * 6.283185482025146484375;
        float _717 = cos(_715);
        float _719 = _713 * 6.283185482025146484375;
        float _721 = sin(_719);
        float _723 = _717 + (-1.0);
        float _725 = _723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _727 = fma(_721, _711, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _729 = fma(_677, _717, _725);
        float _731 = _707 * _727;
        float _733 = fma(_663, _731, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _735 = fma(_659, _731, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _685 = _733;
        _699 = _729;
        _693 = _735;
        _687 = _713;
    }
    float _737 = _685;
    float _739 = _699;
    float _741 = _693;
    float _743 = _687;
    float _745 = -_569;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    float _749 = -_567;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _753 = -_571;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _741);
    float _757 = -_567;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _539);
    float _761 = -_571;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _549);
    float _765 = _751;
    float _767 = _747;
    float _769 = _755;
    float _771 = _743;
    if (!_531)
    {
        float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _775 = _759 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _779 = _637 + _777;
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _783 = -_539;
        float _785 = _783 + _739;
        float _787 = _775 * _775;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _791 = _763 + _789;
        float _793 = -_549;
        float _795 = _793 + _741;
        float _797 = -_543;
        float _799 = _797 + _737;
        float _801 = fma(_779, _779, _787);
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _805 = fma(_791, _791, _801);
        float _807 = sqrt(_805);
        float _809 = 1.0 / _609;
        bool _811 = _807 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _813 = isnan(_807);
        bool _815 = _811 || _813;
        bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _819 = _815 || _817;
        float _821 = precise::min(_807, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _823 = _821 * _781;
        float _825 = _803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _827 = _795 * _809;
        float _829 = _785 * _809;
        float _831 = _799 * _809;
        float _833 = _825 * _823;
        float _835 = _743;
        float _837 = _825;
        if (_819)
        {
            float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _835 = _839;
        }
        float _841 = _835;
        if (_819)
        {
            float _843 = precise::max(_807, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _689 = _843;
        }
        float _845 = _689;
        float _847 = fma(_827, _833, _763);
        float _849 = fma(_831, _833, _637);
        float _851 = fma(_829, _833, _759);
        float _853 = _845;
        float _855 = _849;
        float _857 = _851;
        _771 = _841;
        if (_819)
        {
            float _859 = _845 * _841;
            _853 = _859;
        }
        float _861 = _853;
        float _863 = _861;
        if (_819)
        {
            float _865 = _825 * _861;
            _863 = _865;
        }
        float _867 = _863;
        if (!_819)
        {
            _837 = _847;
        }
        float _869 = _837;
        _769 = _869;
        if (_819)
        {
            float _871 = fma(_831, _867, _637);
            _855 = _871;
        }
        float _873 = _855;
        _767 = _873;
        if (_819)
        {
            float _875 = fma(_829, _867, _759);
            _857 = _875;
        }
        float _877 = _857;
        _765 = _877;
        if (_819)
        {
            float _879 = fma(_827, _867, _763);
            _769 = _879;
        }
    }
    float _881 = _765;
    float _883 = _767;
    float _885 = _769;
    float _887 = _771;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _891 = _881 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _895 = _883 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _899 = _885 + _897;
    float _901 = _891 * _891;
    float _903 = fma(_895, _895, _901);
    float _905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _907 = fma(_899, _899, _903);
    float _909 = rsqrt(_907);
    float _911 = _909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _913 = _895 * _911;
    float _915 = _899 * _911;
    float _917 = _913 * _913;
    float _919 = _915 * _915;
    float _921 = _917 + _919;
    float _923 = sqrt(_921);
    bool _925 = _923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _929 = _923 + _927;
    float _931 = _903;
    float _933 = _921;
    float _935 = _929;
    float _937 = _887;
    float _939 = _911;
    if (_925)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _931 = _941;
    }
    float _943 = _931;
    if (_925)
    {
        float _945 = rsqrt(_921);
        _933 = _945;
    }
    float _947 = _933;
    if (_925)
    {
        float _949 = _929 * _943;
        _935 = _949;
    }
    float _951 = _935;
    if (_925)
    {
        float _953 = _951 * 0.15915493667125701904296875;
        _937 = _953;
    }
    float _955 = _937;
    float _957 = _899;
    float _959 = _955;
    if (_925)
    {
        float _961 = _955 * 6.283185482025146484375;
        float _963 = sin(_961);
        _957 = _963;
    }
    float _965 = _957;
    float _967 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _969 = precise::max(0.0, _967);
    float _971 = _909;
    float _973 = _969;
    float _975 = _967;
    if (_925)
    {
        float _977 = _955 * 6.283185482025146484375;
        float _979 = cos(_977);
        _971 = _979;
    }
    float _981 = _971;
    float _983 = -_911;
    float _985 = -_969;
    float _987 = fma(_891, _983, _985);
    float _989 = _987;
    if (_925)
    {
        float _991 = _987 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _991;
    }
    float _993 = _973;
    float _995 = _993;
    float _997 = _965;
    if (_925)
    {
        float _999 = fma(_965, _993, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _995 = _999;
    }
    float _1001 = _995;
    float _1003 = _1001;
    if (!_925)
    {
        _997 = _913;
    }
    float _1005 = _997;
    float _1007 = _1005;
    float _1009 = _981;
    if (_925)
    {
        float _1011 = _981 + (-1.0);
        _975 = _1011;
    }
    float _1013 = _975;
    float _1015 = _1013;
    if (_925)
    {
        float _1017 = _947 * _1001;
        _939 = _1017;
    }
    float _1019 = _939;
    if (!_925)
    {
        _1003 = _917;
    }
    float _1021 = _1003;
    float _1023 = sqrt(_907);
    float _1025 = _1021;
    if (_925)
    {
        float _1027 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _959 = _1027;
    }
    float _1029 = _959;
    if (_925)
    {
        float _1031 = _913 * _1019;
        _1007 = _1031;
    }
    float _1033 = _1007;
    if (!_925)
    {
        _1015 = _915;
    }
    float _1035 = _1015;
    float _1037 = _1035;
    if (_925)
    {
        float _1039 = _915 * _1019;
        _1037 = _1039;
    }
    float _1041 = _1037;
    if (_925)
    {
        float _1043 = fma(_987, _981, _1029);
        _989 = _1043;
    }
    float _1045 = _989;
    if (_925)
    {
        float _1047 = _1033 * _1033;
        _1025 = _1047;
    }
    float _1049 = _1025;
    if (!_925)
    {
        _1009 = _919;
    }
    float _1051 = _1009;
    float _1053 = _1051;
    if (_925)
    {
        float _1055 = _1041 * _1041;
        _1053 = _1055;
    }
    float _1057 = _1053;
    float _1059 = fma(_1045, _1045, _1049);
    float _1061 = _1059 + _1057;
    float _1063 = _881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1067 = fma(_1023, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1065);
    float _1069 = precise::clamp(_1067, 0.0, 1.0);
    float _1071 = _881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1073 = rsqrt(_1061);
    float _1075 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1063);
    float _1077 = -_1069;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1071);
    float _1083 = _881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1085 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1075);
    float _1087 = _881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1089 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1091 = abs(_1079);
    float _1093 = log2(_1091);
    float _1095 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1097 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1087);
    float _1099 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1083);
    float _1101 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1105 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1097);
    float _1107 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1109 = _1073 * _1033;
    float _1111 = -_1103;
    float _1113 = fma(_1111, _905, 1.0);
    float _1115 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1117 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1119 = _1073 * _1045;
    float _1121 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1123 = _1073 * _1041;
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1117);
    float _1127 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1129 = -_1121;
    float _1131 = fma(_1119, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1129);
    float _1133 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1135 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1125);
    float _1137 = exp2(_1127);
    float _1139 = -_1123;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1131);
    float _1143 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1135);
    float _1147 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1149 = fma(_1141, -0.5, 0.5);
    float _1151 = fma(_1141, 0.5, 0.5);
    float _1153 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1143);
    float _1155 = log2(_1113);
    float _1157 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1147);
    float _1159 = _1119 + 1.0;
    float _1161 = fma(_1151, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1163 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1153);
    float _1165 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1157);
    float _1167 = fma(_1151, _1161, -0.212114393711090087890625);
    float _1169 = 1.0 / _1145;
    float _1171 = -_1119;
    float _1173 = fma(_1137, _1159, _1171);
    float _1175 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1163);
    float _1177 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1165);
    float _1179 = fma(_1151, _1167, 1.570728778839111328125);
    float _1181 = fma(_1173, 0.5, 0.5);
    float _1183 = sqrt(_1149);
    float _1185 = _1155 * 0.693147182464599609375;
    float _1187 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1189 = _1175 * _1169;
    float _1191 = _1177 * _1169;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = fma(_1191, -0.5, 0.5);
    float _1197 = _1183 * 0.636619746685028076171875;
    float _1199 = -_1179;
    float _1201 = fma(_1197, _1199, 1.0);
    float3 _3482 = float3(_1193, _1195, _1187);
    float _1203 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3482, float3(0.0), isnan(_3482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3482, float3(0.0), isnan(_3482)), level(0.0)).x;
    float3 _3493 = float3(_1193, _1195, _1187);
    float4 _1206 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3493, float3(0.0), isnan(_3493)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3493, float3(0.0), isnan(_3493)), level(0.0)).xyzw;
    float _1208 = _1206.x;
    float _1210 = _1206.y;
    float _1212 = _1206.z;
    float _1214 = _1206.w;
    float2 _3510 = float2(_1201, _1181);
    float3 _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3510, float2(0.0), isnan(_3510)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3510, float2(0.0), isnan(_3510)), level(0.0)).xyz;
    float _1220 = _1218.x;
    float _1222 = _1218.y;
    float _1224 = _1218.z;
    float _1226 = in.m_57.y;
    float _1228 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1230 = in.m_49.y;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1234 = _1232 != 0;
    float _1236 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1240 = _1238 != 0;
    float _1242 = in.m_57.x;
    bool _1244 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1246 = isnan(0.5);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1252 = _1248 || _1250;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1258 = -_1254;
    float _1260 = fma(_1228, 2.0, _1258);
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1268 = _144 > 0.5;
    bool _1270 = _1268 && _1240;
    float _1272 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1262);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1280 = 1.0 / _1266;
    float _1282 = -_1226;
    float _1284 = _1282 + 1.0;
    out.m_59.y = _881;
    bool _1286 = _1230 > 0.5;
    float _1288 = 1.0 / _1276;
    float _1290 = _1226;
    if (_1234)
    {
        float _1292 = _1286 ? _1284 : _1226;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1302 = fma(_1296, -2.0, _1278);
    float _1304 = _759 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1308 = _759 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1310;
    float _1314 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1304);
    float _1316 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1306);
    float _1318 = 1.0 / _1300;
    float _1320 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1302);
    float _1322 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1314);
    float _1324 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1308);
    float _1326 = _1312 * _1280;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1332 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1334 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1324);
    float _1336 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1338 = _1330 * _1288;
    float _1340 = 1.0 / _1332;
    float _1342 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1344 = -_122;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1260);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1350 = _511 + _1348;
    float _1352 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1272);
    float _1354 = _1342 + _1332;
    bool _1356 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1358 = isnan(_511);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1316);
    bool _1370 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1372 = isnan(_511);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = fma(_1326, _1350, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1384 = fma(_1336, _1294, -0.5);
    float _1386 = -_1366;
    float _1388 = _1386 + 1.0;
    bool _1390 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1392 = isnan(_511);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = -_1380;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1406;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1412 = _1332;
    float _1414 = _1316;
    if (!_1252)
    {
        _1410 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1416 = _1410;
    float _1418 = _1354 * _1340;
    float _1420 = _1418 * 0.5;
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1424 = _1380 * _1388;
    bool _1426 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1428 = isnan(_511);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1434 = _1430 || _1432;
    float _1436 = float(_1434);
    float _1438 = _1400 * _1404;
    float _1440 = -_1400;
    float _1442 = _1440 + 1.0;
    float _1444 = _1416;
    float _1446 = _1420;
    if (!_1252)
    {
        float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1450 = fma(_1420, _1416, _1448);
        _1444 = _1450;
    }
    float _1452 = _1444;
    if (_1240)
    {
        _1446 = _1242;
    }
    float _1454 = _1446;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1458 = _511 + _1456;
    float _1460 = _1454;
    float _1462 = _1458;
    if (!_1252)
    {
        _1412 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1464 = _1412;
    float _1466 = _1436 * _1442;
    float _1468 = -_1436;
    float _1470 = _1468 + 1.0;
    if (_1270)
    {
        float _1472 = -_1454;
        float _1474 = _1472 + 1.0;
        _1460 = _1474;
    }
    float _1476 = _1460;
    float _1478 = _1408 * _1318;
    float _1480 = _1382 * _1466;
    if (!_1252)
    {
        float _1482 = -_1464;
        float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1414 = _1484;
    }
    float _1486 = _1414;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1490 = _511 + _1488;
    float _1492 = _1452;
    if (!_1252)
    {
        float _1494 = 1.0 / _1452;
        _1492 = _1494;
    }
    float _1496 = _1492;
    float _1498 = fma(_1338, _1458, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (!_1240)
    {
        _1462 = _1242;
    }
    float _1500 = _1462;
    float _1502 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1480);
    float _1504 = _1500;
    if (_1240)
    {
        _1504 = _1476;
    }
    float _1506 = _1504;
    float _1508 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1510 = fma(_1478, _1490, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1512 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1514 = _1486;
    float _1516 = _1510;
    if (!_1252)
    {
        float _1518 = 1.0 / _1486;
        _1514 = _1518;
    }
    float _1520 = _1514;
    float _1522 = fma(_1498, _1438, _1502);
    float _1524 = fma(_1508, _1506, -0.5);
    float _1526 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1512);
    float _1528 = in.m_61.w;
    float _1530 = fma(_1510, _1424, _1522);
    float _1532 = fma(_1352, _1524, _1346);
    float _1534 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1536 = exp2(_1236);
    float _1538 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1530);
    if (!_1252)
    {
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1542 = -_1464;
        float _1544 = fma(_1496, _1540, _1542);
        _1516 = _1544;
    }
    float _1546 = _1516;
    float _1548 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1534);
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1552 = _1532 + 0.5;
    float _1554 = _1546;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_1252)
    {
        float _1558 = _1546 * _1520;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1554 = _1560;
    }
    float _1562 = _1554;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1252)
    {
        _1556 = 1.0;
    }
    float _1568 = _1556;
    float _1570 = _1568;
    if (!_1252)
    {
        float _1572 = -_1562;
        float _1574 = _1572 + 1.0;
        _1570 = _1574;
    }
    float _1576 = _1570;
    float _1578 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = -_1536;
    float _1582 = _1580 + 1.0;
    float _1584 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1586 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1588 = _1538 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1590 = _1582 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1592 = -_1320;
    float _1594 = fma(_1368, _1384, _1592);
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1598 = _1548 + _1596;
    bool _1600 = _1576 > 0.0;
    bool _1602 = isnan(_1576);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan(0.0);
    bool _1608 = _1604 || _1606;
    out.m_63.x = _1578;
    out.m_63.y = _1584;
    out.m_63.z = _1586;
    out.m_63.w = _1588;
    float _1610 = _1594 + 0.5;
    float _1612 = _1145 + _1598;
    float _1614 = _1576 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1175;
    out.gl_Position.y = _1177;
    out.gl_Position.z = _1598;
    out.gl_Position.w = _1145;
    float _1616 = _1612 * 0.5;
    float _1618 = _1614 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.w = _1528;
    out.m_67.x = _1552;
    out.m_67.y = _1610;
    out.m_69.z = _1616;
    out.m_69.w = _1145;
    out.m_45.x = _1618;
    float _1620 = _1590 * _1203;
    float _1622 = -_1590;
    float _1624 = _1622 + 1.0;
    float _1626 = _1214 * _1620;
    float _1628 = _1224 * _1620;
    float _1630 = _1214 * _1624;
    float _1632 = fma(_1220, _1626, _1208);
    float _1634 = fma(_1222, _1626, _1210);
    float _1636 = fma(_1214, _1628, _1212);
    out.m_71.x = _1632;
    out.m_71.y = _1634;
    out.m_71.z = _1636;
    out.m_71.w = _1630;
    if (_1608)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1638 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1638;
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
        float _1694 = as_type<float>(_104);
        out.gl_Position.z = _1694;
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
        float _1762 = as_type<float>(_142);
        out.gl_Position.z = _1762;
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
    float _689 = _609;
    if (!_679)
    {
        _681 = _653;
    }
    float _691 = _681;
    float _693 = _691;
    if (!_679)
    {
        _683 = _677;
    }
    float _695 = _683;
    bool _697 = !_679;
    float _699 = _695;
    if (!_697)
    {
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _705 = _671 + _703;
        float _707 = rsqrt(_667);
        float _709 = _705 * _701;
        float _711 = _677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _713 = _709 * 0.15915493667125701904296875;
        float _715 = _713 * 6.283185482025146484375;
        float _717 = cos(_715);
        float _719 = _713 * 6.283185482025146484375;
        float _721 = sin(_719);
        float _723 = _717 + (-1.0);
        float _725 = _723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _727 = fma(_721, _711, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _729 = fma(_677, _717, _725);
        float _731 = _707 * _727;
        float _733 = fma(_663, _731, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _735 = fma(_659, _731, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _685 = _733;
        _699 = _729;
        _693 = _735;
        _687 = _713;
    }
    float _737 = _685;
    float _739 = _699;
    float _741 = _693;
    float _743 = _687;
    float _745 = -_569;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    float _749 = -_567;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _753 = -_571;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _741);
    float _757 = -_567;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _539);
    float _761 = -_571;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _549);
    float _765 = _751;
    float _767 = _747;
    float _769 = _755;
    float _771 = _743;
    if (!_531)
    {
        float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _775 = _759 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _779 = _637 + _777;
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _783 = -_539;
        float _785 = _783 + _739;
        float _787 = _775 * _775;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _791 = _763 + _789;
        float _793 = -_549;
        float _795 = _793 + _741;
        float _797 = -_543;
        float _799 = _797 + _737;
        float _801 = fma(_779, _779, _787);
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _805 = fma(_791, _791, _801);
        float _807 = sqrt(_805);
        float _809 = 1.0 / _609;
        bool _811 = _807 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _813 = isnan(_807);
        bool _815 = _811 || _813;
        bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _819 = _815 || _817;
        float _821 = precise::min(_807, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _823 = _821 * _781;
        float _825 = _803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _827 = _795 * _809;
        float _829 = _785 * _809;
        float _831 = _799 * _809;
        float _833 = _825 * _823;
        float _835 = _743;
        float _837 = _825;
        if (_819)
        {
            float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _835 = _839;
        }
        float _841 = _835;
        if (_819)
        {
            float _843 = precise::max(_807, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _689 = _843;
        }
        float _845 = _689;
        float _847 = fma(_827, _833, _763);
        float _849 = fma(_831, _833, _637);
        float _851 = fma(_829, _833, _759);
        float _853 = _845;
        float _855 = _849;
        float _857 = _851;
        _771 = _841;
        if (_819)
        {
            float _859 = _845 * _841;
            _853 = _859;
        }
        float _861 = _853;
        float _863 = _861;
        if (_819)
        {
            float _865 = _825 * _861;
            _863 = _865;
        }
        float _867 = _863;
        if (!_819)
        {
            _837 = _847;
        }
        float _869 = _837;
        _769 = _869;
        if (_819)
        {
            float _871 = fma(_831, _867, _637);
            _855 = _871;
        }
        float _873 = _855;
        _767 = _873;
        if (_819)
        {
            float _875 = fma(_829, _867, _759);
            _857 = _875;
        }
        float _877 = _857;
        _765 = _877;
        if (_819)
        {
            float _879 = fma(_827, _867, _763);
            _769 = _879;
        }
    }
    float _881 = _765;
    float _883 = _767;
    float _885 = _769;
    float _887 = _771;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _891 = _881 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _895 = _883 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _899 = _885 + _897;
    float _901 = _891 * _891;
    float _903 = fma(_895, _895, _901);
    float _905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _907 = fma(_899, _899, _903);
    float _909 = rsqrt(_907);
    float _911 = _909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _913 = _895 * _911;
    float _915 = _899 * _911;
    float _917 = _913 * _913;
    float _919 = _915 * _915;
    float _921 = _917 + _919;
    float _923 = sqrt(_921);
    bool _925 = _923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _929 = _923 + _927;
    float _931 = _903;
    float _933 = _921;
    float _935 = _929;
    float _937 = _887;
    float _939 = _911;
    if (_925)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _931 = _941;
    }
    float _943 = _931;
    if (_925)
    {
        float _945 = rsqrt(_921);
        _933 = _945;
    }
    float _947 = _933;
    if (_925)
    {
        float _949 = _929 * _943;
        _935 = _949;
    }
    float _951 = _935;
    if (_925)
    {
        float _953 = _951 * 0.15915493667125701904296875;
        _937 = _953;
    }
    float _955 = _937;
    float _957 = _899;
    float _959 = _955;
    if (_925)
    {
        float _961 = _955 * 6.283185482025146484375;
        float _963 = sin(_961);
        _957 = _963;
    }
    float _965 = _957;
    float _967 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _969 = precise::max(0.0, _967);
    float _971 = _909;
    float _973 = _969;
    float _975 = _967;
    if (_925)
    {
        float _977 = _955 * 6.283185482025146484375;
        float _979 = cos(_977);
        _971 = _979;
    }
    float _981 = _971;
    float _983 = -_911;
    float _985 = -_969;
    float _987 = fma(_891, _983, _985);
    float _989 = _987;
    if (_925)
    {
        float _991 = _987 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _991;
    }
    float _993 = _973;
    float _995 = _993;
    float _997 = _965;
    if (_925)
    {
        float _999 = fma(_965, _993, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _995 = _999;
    }
    float _1001 = _995;
    float _1003 = _1001;
    if (!_925)
    {
        _997 = _913;
    }
    float _1005 = _997;
    float _1007 = _1005;
    float _1009 = _981;
    if (_925)
    {
        float _1011 = _981 + (-1.0);
        _975 = _1011;
    }
    float _1013 = _975;
    float _1015 = _1013;
    if (_925)
    {
        float _1017 = _947 * _1001;
        _939 = _1017;
    }
    float _1019 = _939;
    if (!_925)
    {
        _1003 = _917;
    }
    float _1021 = _1003;
    float _1023 = sqrt(_907);
    float _1025 = _1021;
    if (_925)
    {
        float _1027 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _959 = _1027;
    }
    float _1029 = _959;
    if (_925)
    {
        float _1031 = _913 * _1019;
        _1007 = _1031;
    }
    float _1033 = _1007;
    if (!_925)
    {
        _1015 = _915;
    }
    float _1035 = _1015;
    float _1037 = _1035;
    if (_925)
    {
        float _1039 = _915 * _1019;
        _1037 = _1039;
    }
    float _1041 = _1037;
    if (_925)
    {
        float _1043 = fma(_987, _981, _1029);
        _989 = _1043;
    }
    float _1045 = _989;
    if (_925)
    {
        float _1047 = _1033 * _1033;
        _1025 = _1047;
    }
    float _1049 = _1025;
    if (!_925)
    {
        _1009 = _919;
    }
    float _1051 = _1009;
    float _1053 = _1051;
    if (_925)
    {
        float _1055 = _1041 * _1041;
        _1053 = _1055;
    }
    float _1057 = _1053;
    float _1059 = fma(_1045, _1045, _1049);
    float _1061 = _1059 + _1057;
    float _1063 = _881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1067 = fma(_1023, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1065);
    float _1069 = precise::clamp(_1067, 0.0, 1.0);
    float _1071 = _881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1073 = rsqrt(_1061);
    float _1075 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1063);
    float _1077 = -_1069;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1071);
    float _1083 = _881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1085 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1075);
    float _1087 = _881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1089 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1091 = abs(_1079);
    float _1093 = log2(_1091);
    float _1095 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1097 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1087);
    float _1099 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1083);
    float _1101 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1105 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1097);
    float _1107 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1109 = _1073 * _1033;
    float _1111 = -_1103;
    float _1113 = fma(_1111, _905, 1.0);
    float _1115 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1117 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1119 = _1073 * _1045;
    float _1121 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1123 = _1073 * _1041;
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1117);
    float _1127 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1129 = -_1121;
    float _1131 = fma(_1119, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1129);
    float _1133 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1135 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1125);
    float _1137 = exp2(_1127);
    float _1139 = -_1123;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1131);
    float _1143 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1135);
    float _1147 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1149 = fma(_1141, -0.5, 0.5);
    float _1151 = fma(_1141, 0.5, 0.5);
    float _1153 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1143);
    float _1155 = log2(_1113);
    float _1157 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1147);
    float _1159 = _1119 + 1.0;
    float _1161 = fma(_1151, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1163 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1153);
    float _1165 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1157);
    float _1167 = fma(_1151, _1161, -0.212114393711090087890625);
    float _1169 = 1.0 / _1145;
    float _1171 = -_1119;
    float _1173 = fma(_1137, _1159, _1171);
    float _1175 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1163);
    float _1177 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1165);
    float _1179 = fma(_1151, _1167, 1.570728778839111328125);
    float _1181 = fma(_1173, 0.5, 0.5);
    float _1183 = sqrt(_1149);
    float _1185 = _1155 * 0.693147182464599609375;
    float _1187 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1189 = _1175 * _1169;
    float _1191 = _1177 * _1169;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = fma(_1191, -0.5, 0.5);
    float _1197 = _1183 * 0.636619746685028076171875;
    float _1199 = -_1179;
    float _1201 = fma(_1197, _1199, 1.0);
    float3 _3482 = float3(_1193, _1195, _1187);
    float _1203 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3482, float3(0.0), isnan(_3482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3482, float3(0.0), isnan(_3482)), level(0.0)).x;
    float3 _3493 = float3(_1193, _1195, _1187);
    float4 _1206 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3493, float3(0.0), isnan(_3493)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3493, float3(0.0), isnan(_3493)), level(0.0)).xyzw;
    float _1208 = _1206.x;
    float _1210 = _1206.y;
    float _1212 = _1206.z;
    float _1214 = _1206.w;
    float2 _3510 = float2(_1201, _1181);
    float3 _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3510, float2(0.0), isnan(_3510)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3510, float2(0.0), isnan(_3510)), level(0.0)).xyz;
    float _1220 = _1218.x;
    float _1222 = _1218.y;
    float _1224 = _1218.z;
    float _1226 = in.m_57.y;
    float _1228 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1230 = in.m_49.y;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1234 = _1232 != 0;
    float _1236 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1240 = _1238 != 0;
    float _1242 = in.m_57.x;
    bool _1244 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1246 = isnan(0.5);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1252 = _1248 || _1250;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1258 = -_1254;
    float _1260 = fma(_1228, 2.0, _1258);
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1268 = _144 > 0.5;
    bool _1270 = _1268 && _1240;
    float _1272 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1262);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1280 = 1.0 / _1266;
    float _1282 = -_1226;
    float _1284 = _1282 + 1.0;
    out.m_59.y = _881;
    bool _1286 = _1230 > 0.5;
    float _1288 = 1.0 / _1276;
    float _1290 = _1226;
    if (_1234)
    {
        float _1292 = _1286 ? _1284 : _1226;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1302 = fma(_1296, -2.0, _1278);
    float _1304 = _759 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1308 = _759 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1310;
    float _1314 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1304);
    float _1316 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1306);
    float _1318 = 1.0 / _1300;
    float _1320 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1302);
    float _1322 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1314);
    float _1324 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1308);
    float _1326 = _1312 * _1280;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1332 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1334 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1324);
    float _1336 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1338 = _1330 * _1288;
    float _1340 = 1.0 / _1332;
    float _1342 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1344 = -_122;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1260);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1350 = _511 + _1348;
    float _1352 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1272);
    float _1354 = _1342 + _1332;
    bool _1356 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1358 = isnan(_511);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1316);
    bool _1370 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1372 = isnan(_511);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = fma(_1326, _1350, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1384 = fma(_1336, _1294, -0.5);
    float _1386 = -_1366;
    float _1388 = _1386 + 1.0;
    bool _1390 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1392 = isnan(_511);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = -_1380;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1406;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1412 = _1332;
    float _1414 = _1316;
    if (!_1252)
    {
        _1410 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1416 = _1410;
    float _1418 = _1354 * _1340;
    float _1420 = _1418 * 0.5;
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1424 = _1380 * _1388;
    bool _1426 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1428 = isnan(_511);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1434 = _1430 || _1432;
    float _1436 = float(_1434);
    float _1438 = _1400 * _1404;
    float _1440 = -_1400;
    float _1442 = _1440 + 1.0;
    float _1444 = _1416;
    float _1446 = _1420;
    if (!_1252)
    {
        float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1450 = fma(_1420, _1416, _1448);
        _1444 = _1450;
    }
    float _1452 = _1444;
    if (_1240)
    {
        _1446 = _1242;
    }
    float _1454 = _1446;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1458 = _511 + _1456;
    float _1460 = _1454;
    float _1462 = _1458;
    if (!_1252)
    {
        _1412 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1464 = _1412;
    float _1466 = _1436 * _1442;
    float _1468 = -_1436;
    float _1470 = _1468 + 1.0;
    if (_1270)
    {
        float _1472 = -_1454;
        float _1474 = _1472 + 1.0;
        _1460 = _1474;
    }
    float _1476 = _1460;
    float _1478 = _1408 * _1318;
    float _1480 = _1382 * _1466;
    if (!_1252)
    {
        float _1482 = -_1464;
        float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1414 = _1484;
    }
    float _1486 = _1414;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1490 = _511 + _1488;
    float _1492 = _1452;
    if (!_1252)
    {
        float _1494 = 1.0 / _1452;
        _1492 = _1494;
    }
    float _1496 = _1492;
    float _1498 = fma(_1338, _1458, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (!_1240)
    {
        _1462 = _1242;
    }
    float _1500 = _1462;
    float _1502 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1480);
    float _1504 = _1500;
    if (_1240)
    {
        _1504 = _1476;
    }
    float _1506 = _1504;
    float _1508 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1510 = fma(_1478, _1490, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1512 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1514 = _1486;
    float _1516 = _1510;
    if (!_1252)
    {
        float _1518 = 1.0 / _1486;
        _1514 = _1518;
    }
    float _1520 = _1514;
    float _1522 = fma(_1498, _1438, _1502);
    float _1524 = fma(_1508, _1506, -0.5);
    float _1526 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1512);
    float _1528 = in.m_61.w;
    float _1530 = fma(_1510, _1424, _1522);
    float _1532 = fma(_1352, _1524, _1346);
    float _1534 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1536 = exp2(_1236);
    float _1538 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1530);
    if (!_1252)
    {
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1542 = -_1464;
        float _1544 = fma(_1496, _1540, _1542);
        _1516 = _1544;
    }
    float _1546 = _1516;
    float _1548 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1534);
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1552 = _1532 + 0.5;
    float _1554 = _1546;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_1252)
    {
        float _1558 = _1546 * _1520;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1554 = _1560;
    }
    float _1562 = _1554;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1252)
    {
        _1556 = 1.0;
    }
    float _1568 = _1556;
    float _1570 = _1568;
    if (!_1252)
    {
        float _1572 = -_1562;
        float _1574 = _1572 + 1.0;
        _1570 = _1574;
    }
    float _1576 = _1570;
    float _1578 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = -_1536;
    float _1582 = _1580 + 1.0;
    float _1584 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1586 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1588 = _1538 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1590 = _1582 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1592 = -_1320;
    float _1594 = fma(_1368, _1384, _1592);
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1598 = _1548 + _1596;
    bool _1600 = _1576 > 0.0;
    bool _1602 = isnan(_1576);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan(0.0);
    bool _1608 = _1604 || _1606;
    out.m_63.x = _1578;
    out.m_63.y = _1584;
    out.m_63.z = _1586;
    out.m_63.w = _1588;
    float _1610 = _1594 + 0.5;
    float _1612 = _1145 + _1598;
    float _1614 = _1576 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1175;
    out.gl_Position.y = _1177;
    out.gl_Position.z = _1598;
    out.gl_Position.w = _1145;
    float _1616 = _1612 * 0.5;
    float _1618 = _1614 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.w = _1528;
    out.m_67.x = _1552;
    out.m_67.y = _1610;
    out.m_69.z = _1616;
    out.m_69.w = _1145;
    out.m_45.x = _1618;
    float _1620 = _1590 * _1203;
    float _1622 = -_1590;
    float _1624 = _1622 + 1.0;
    float _1626 = _1214 * _1620;
    float _1628 = _1224 * _1620;
    float _1630 = _1214 * _1624;
    float _1632 = fma(_1220, _1626, _1208);
    float _1634 = fma(_1222, _1626, _1210);
    float _1636 = fma(_1214, _1628, _1212);
    out.m_71.x = _1632;
    out.m_71.y = _1634;
    out.m_71.z = _1636;
    out.m_71.w = _1630;
    if (_1608)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1638 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1638;
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
        float _1694 = as_type<float>(_104);
        out.gl_Position.z = _1694;
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
        float _1762 = as_type<float>(_142);
        out.gl_Position.z = _1762;
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
    float _689 = _609;
    if (!_679)
    {
        _681 = _653;
    }
    float _691 = _681;
    float _693 = _691;
    if (!_679)
    {
        _683 = _677;
    }
    float _695 = _683;
    bool _697 = !_679;
    float _699 = _695;
    if (!_697)
    {
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _705 = _671 + _703;
        float _707 = rsqrt(_667);
        float _709 = _705 * _701;
        float _711 = _677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _713 = _709 * 0.15915493667125701904296875;
        float _715 = _713 * 6.283185482025146484375;
        float _717 = cos(_715);
        float _719 = _713 * 6.283185482025146484375;
        float _721 = sin(_719);
        float _723 = _717 + (-1.0);
        float _725 = _723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _727 = fma(_721, _711, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _729 = fma(_677, _717, _725);
        float _731 = _707 * _727;
        float _733 = fma(_663, _731, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _735 = fma(_659, _731, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _685 = _733;
        _699 = _729;
        _693 = _735;
        _687 = _713;
    }
    float _737 = _685;
    float _739 = _699;
    float _741 = _693;
    float _743 = _687;
    float _745 = -_569;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    float _749 = -_567;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _753 = -_571;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _741);
    float _757 = -_567;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _539);
    float _761 = -_571;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _549);
    float _765 = _751;
    float _767 = _747;
    float _769 = _755;
    float _771 = _743;
    if (!_531)
    {
        float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _775 = _759 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _779 = _637 + _777;
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _783 = -_539;
        float _785 = _783 + _739;
        float _787 = _775 * _775;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _791 = _763 + _789;
        float _793 = -_549;
        float _795 = _793 + _741;
        float _797 = -_543;
        float _799 = _797 + _737;
        float _801 = fma(_779, _779, _787);
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _805 = fma(_791, _791, _801);
        float _807 = sqrt(_805);
        float _809 = 1.0 / _609;
        bool _811 = _807 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _813 = isnan(_807);
        bool _815 = _811 || _813;
        bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _819 = _815 || _817;
        float _821 = precise::min(_807, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _823 = _821 * _781;
        float _825 = _803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _827 = _795 * _809;
        float _829 = _785 * _809;
        float _831 = _799 * _809;
        float _833 = _825 * _823;
        float _835 = _743;
        float _837 = _825;
        if (_819)
        {
            float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _835 = _839;
        }
        float _841 = _835;
        if (_819)
        {
            float _843 = precise::max(_807, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _689 = _843;
        }
        float _845 = _689;
        float _847 = fma(_827, _833, _763);
        float _849 = fma(_831, _833, _637);
        float _851 = fma(_829, _833, _759);
        float _853 = _845;
        float _855 = _849;
        float _857 = _851;
        _771 = _841;
        if (_819)
        {
            float _859 = _845 * _841;
            _853 = _859;
        }
        float _861 = _853;
        float _863 = _861;
        if (_819)
        {
            float _865 = _825 * _861;
            _863 = _865;
        }
        float _867 = _863;
        if (!_819)
        {
            _837 = _847;
        }
        float _869 = _837;
        _769 = _869;
        if (_819)
        {
            float _871 = fma(_831, _867, _637);
            _855 = _871;
        }
        float _873 = _855;
        _767 = _873;
        if (_819)
        {
            float _875 = fma(_829, _867, _759);
            _857 = _875;
        }
        float _877 = _857;
        _765 = _877;
        if (_819)
        {
            float _879 = fma(_827, _867, _763);
            _769 = _879;
        }
    }
    float _881 = _765;
    float _883 = _767;
    float _885 = _769;
    float _887 = _771;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _891 = _881 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _895 = _883 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _899 = _885 + _897;
    float _901 = _891 * _891;
    float _903 = fma(_895, _895, _901);
    float _905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _907 = fma(_899, _899, _903);
    float _909 = rsqrt(_907);
    float _911 = _909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _913 = _895 * _911;
    float _915 = _899 * _911;
    float _917 = _913 * _913;
    float _919 = _915 * _915;
    float _921 = _917 + _919;
    float _923 = sqrt(_921);
    bool _925 = _923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _929 = _923 + _927;
    float _931 = _903;
    float _933 = _921;
    float _935 = _929;
    float _937 = _887;
    float _939 = _911;
    if (_925)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _931 = _941;
    }
    float _943 = _931;
    if (_925)
    {
        float _945 = rsqrt(_921);
        _933 = _945;
    }
    float _947 = _933;
    if (_925)
    {
        float _949 = _929 * _943;
        _935 = _949;
    }
    float _951 = _935;
    if (_925)
    {
        float _953 = _951 * 0.15915493667125701904296875;
        _937 = _953;
    }
    float _955 = _937;
    float _957 = _899;
    float _959 = _955;
    if (_925)
    {
        float _961 = _955 * 6.283185482025146484375;
        float _963 = sin(_961);
        _957 = _963;
    }
    float _965 = _957;
    float _967 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _969 = precise::max(0.0, _967);
    float _971 = _909;
    float _973 = _969;
    float _975 = _967;
    if (_925)
    {
        float _977 = _955 * 6.283185482025146484375;
        float _979 = cos(_977);
        _971 = _979;
    }
    float _981 = _971;
    float _983 = -_911;
    float _985 = -_969;
    float _987 = fma(_891, _983, _985);
    float _989 = _987;
    if (_925)
    {
        float _991 = _987 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _991;
    }
    float _993 = _973;
    float _995 = _993;
    float _997 = _965;
    if (_925)
    {
        float _999 = fma(_965, _993, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _995 = _999;
    }
    float _1001 = _995;
    float _1003 = _1001;
    if (!_925)
    {
        _997 = _913;
    }
    float _1005 = _997;
    float _1007 = _1005;
    float _1009 = _981;
    if (_925)
    {
        float _1011 = _981 + (-1.0);
        _975 = _1011;
    }
    float _1013 = _975;
    float _1015 = _1013;
    if (_925)
    {
        float _1017 = _947 * _1001;
        _939 = _1017;
    }
    float _1019 = _939;
    if (!_925)
    {
        _1003 = _917;
    }
    float _1021 = _1003;
    float _1023 = sqrt(_907);
    float _1025 = _1021;
    if (_925)
    {
        float _1027 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _959 = _1027;
    }
    float _1029 = _959;
    if (_925)
    {
        float _1031 = _913 * _1019;
        _1007 = _1031;
    }
    float _1033 = _1007;
    if (!_925)
    {
        _1015 = _915;
    }
    float _1035 = _1015;
    float _1037 = _1035;
    if (_925)
    {
        float _1039 = _915 * _1019;
        _1037 = _1039;
    }
    float _1041 = _1037;
    if (_925)
    {
        float _1043 = fma(_987, _981, _1029);
        _989 = _1043;
    }
    float _1045 = _989;
    if (_925)
    {
        float _1047 = _1033 * _1033;
        _1025 = _1047;
    }
    float _1049 = _1025;
    if (!_925)
    {
        _1009 = _919;
    }
    float _1051 = _1009;
    float _1053 = _1051;
    if (_925)
    {
        float _1055 = _1041 * _1041;
        _1053 = _1055;
    }
    float _1057 = _1053;
    float _1059 = fma(_1045, _1045, _1049);
    float _1061 = _1059 + _1057;
    float _1063 = _881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1067 = fma(_1023, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1065);
    float _1069 = precise::clamp(_1067, 0.0, 1.0);
    float _1071 = _881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1073 = rsqrt(_1061);
    float _1075 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1063);
    float _1077 = -_1069;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1071);
    float _1083 = _881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1085 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1075);
    float _1087 = _881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1089 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1091 = abs(_1079);
    float _1093 = log2(_1091);
    float _1095 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1097 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1087);
    float _1099 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1083);
    float _1101 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1105 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1097);
    float _1107 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1109 = _1073 * _1033;
    float _1111 = -_1103;
    float _1113 = fma(_1111, _905, 1.0);
    float _1115 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1117 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1119 = _1073 * _1045;
    float _1121 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1123 = _1073 * _1041;
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1117);
    float _1127 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1129 = -_1121;
    float _1131 = fma(_1119, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1129);
    float _1133 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1135 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1125);
    float _1137 = exp2(_1127);
    float _1139 = -_1123;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1131);
    float _1143 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1145 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1135);
    float _1147 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1149 = fma(_1141, -0.5, 0.5);
    float _1151 = fma(_1141, 0.5, 0.5);
    float _1153 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1143);
    float _1155 = log2(_1113);
    float _1157 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1147);
    float _1159 = _1119 + 1.0;
    float _1161 = fma(_1151, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1163 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1153);
    float _1165 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1157);
    float _1167 = fma(_1151, _1161, -0.212114393711090087890625);
    float _1169 = 1.0 / _1145;
    float _1171 = -_1119;
    float _1173 = fma(_1137, _1159, _1171);
    float _1175 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1163);
    float _1177 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1165);
    float _1179 = fma(_1151, _1167, 1.570728778839111328125);
    float _1181 = fma(_1173, 0.5, 0.5);
    float _1183 = sqrt(_1149);
    float _1185 = _1155 * 0.693147182464599609375;
    float _1187 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1189 = _1175 * _1169;
    float _1191 = _1177 * _1169;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = fma(_1191, -0.5, 0.5);
    float _1197 = _1183 * 0.636619746685028076171875;
    float _1199 = -_1179;
    float _1201 = fma(_1197, _1199, 1.0);
    float3 _3482 = float3(_1193, _1195, _1187);
    float _1203 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3482, float3(0.0), isnan(_3482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3482, float3(0.0), isnan(_3482)), level(0.0)).x;
    float3 _3493 = float3(_1193, _1195, _1187);
    float4 _1206 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3493, float3(0.0), isnan(_3493)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3493, float3(0.0), isnan(_3493)), level(0.0)).xyzw;
    float _1208 = _1206.x;
    float _1210 = _1206.y;
    float _1212 = _1206.z;
    float _1214 = _1206.w;
    float2 _3510 = float2(_1201, _1181);
    float3 _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3510, float2(0.0), isnan(_3510)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3510, float2(0.0), isnan(_3510)), level(0.0)).xyz;
    float _1220 = _1218.x;
    float _1222 = _1218.y;
    float _1224 = _1218.z;
    float _1226 = in.m_57.y;
    float _1228 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1230 = in.m_49.y;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1234 = _1232 != 0;
    float _1236 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1240 = _1238 != 0;
    float _1242 = in.m_57.x;
    bool _1244 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1246 = isnan(0.5);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1252 = _1248 || _1250;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1258 = -_1254;
    float _1260 = fma(_1228, 2.0, _1258);
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1268 = _144 > 0.5;
    bool _1270 = _1268 && _1240;
    float _1272 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1262);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1280 = 1.0 / _1266;
    float _1282 = -_1226;
    float _1284 = _1282 + 1.0;
    out.m_59.y = _881;
    bool _1286 = _1230 > 0.5;
    float _1288 = 1.0 / _1276;
    float _1290 = _1226;
    if (_1234)
    {
        float _1292 = _1286 ? _1284 : _1226;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1302 = fma(_1296, -2.0, _1278);
    float _1304 = _759 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1308 = _759 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1310;
    float _1314 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1304);
    float _1316 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1306);
    float _1318 = 1.0 / _1300;
    float _1320 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1302);
    float _1322 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1314);
    float _1324 = fma(_637, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1308);
    float _1326 = _1312 * _1280;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1332 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1334 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1324);
    float _1336 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1338 = _1330 * _1288;
    float _1340 = 1.0 / _1332;
    float _1342 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1344 = -_122;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1260);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1350 = _511 + _1348;
    float _1352 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1272);
    float _1354 = _1342 + _1332;
    bool _1356 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1358 = isnan(_511);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1316);
    bool _1370 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1372 = isnan(_511);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = fma(_1326, _1350, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1384 = fma(_1336, _1294, -0.5);
    float _1386 = -_1366;
    float _1388 = _1386 + 1.0;
    bool _1390 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1392 = isnan(_511);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = -_1380;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1406;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1412 = _1332;
    float _1414 = _1316;
    if (!_1252)
    {
        _1410 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1416 = _1410;
    float _1418 = _1354 * _1340;
    float _1420 = _1418 * 0.5;
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1424 = _1380 * _1388;
    bool _1426 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1428 = isnan(_511);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1434 = _1430 || _1432;
    float _1436 = float(_1434);
    float _1438 = _1400 * _1404;
    float _1440 = -_1400;
    float _1442 = _1440 + 1.0;
    float _1444 = _1416;
    float _1446 = _1420;
    if (!_1252)
    {
        float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1450 = fma(_1420, _1416, _1448);
        _1444 = _1450;
    }
    float _1452 = _1444;
    if (_1240)
    {
        _1446 = _1242;
    }
    float _1454 = _1446;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1458 = _511 + _1456;
    float _1460 = _1454;
    float _1462 = _1458;
    if (!_1252)
    {
        _1412 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1464 = _1412;
    float _1466 = _1436 * _1442;
    float _1468 = -_1436;
    float _1470 = _1468 + 1.0;
    if (_1270)
    {
        float _1472 = -_1454;
        float _1474 = _1472 + 1.0;
        _1460 = _1474;
    }
    float _1476 = _1460;
    float _1478 = _1408 * _1318;
    float _1480 = _1382 * _1466;
    if (!_1252)
    {
        float _1482 = -_1464;
        float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1414 = _1484;
    }
    float _1486 = _1414;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1490 = _511 + _1488;
    float _1492 = _1452;
    if (!_1252)
    {
        float _1494 = 1.0 / _1452;
        _1492 = _1494;
    }
    float _1496 = _1492;
    float _1498 = fma(_1338, _1458, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (!_1240)
    {
        _1462 = _1242;
    }
    float _1500 = _1462;
    float _1502 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1480);
    float _1504 = _1500;
    if (_1240)
    {
        _1504 = _1476;
    }
    float _1506 = _1504;
    float _1508 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1510 = fma(_1478, _1490, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1512 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1514 = _1486;
    float _1516 = _1510;
    if (!_1252)
    {
        float _1518 = 1.0 / _1486;
        _1514 = _1518;
    }
    float _1520 = _1514;
    float _1522 = fma(_1498, _1438, _1502);
    float _1524 = fma(_1508, _1506, -0.5);
    float _1526 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1512);
    float _1528 = in.m_61.w;
    float _1530 = fma(_1510, _1424, _1522);
    float _1532 = fma(_1352, _1524, _1346);
    float _1534 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1526);
    float _1536 = exp2(_1236);
    float _1538 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1530);
    if (!_1252)
    {
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1542 = -_1464;
        float _1544 = fma(_1496, _1540, _1542);
        _1516 = _1544;
    }
    float _1546 = _1516;
    float _1548 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1534);
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1552 = _1532 + 0.5;
    float _1554 = _1546;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_1252)
    {
        float _1558 = _1546 * _1520;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1554 = _1560;
    }
    float _1562 = _1554;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1252)
    {
        _1556 = 1.0;
    }
    float _1568 = _1556;
    float _1570 = _1568;
    if (!_1252)
    {
        float _1572 = -_1562;
        float _1574 = _1572 + 1.0;
        _1570 = _1574;
    }
    float _1576 = _1570;
    float _1578 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = -_1536;
    float _1582 = _1580 + 1.0;
    float _1584 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1586 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1588 = _1538 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1590 = _1582 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1592 = -_1320;
    float _1594 = fma(_1368, _1384, _1592);
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1598 = _1548 + _1596;
    bool _1600 = _1576 > 0.0;
    bool _1602 = isnan(_1576);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan(0.0);
    bool _1608 = _1604 || _1606;
    out.m_63.x = _1578;
    out.m_63.y = _1584;
    out.m_63.z = _1586;
    out.m_63.w = _1588;
    float _1610 = _1594 + 0.5;
    float _1612 = _1145 + _1598;
    float _1614 = _1576 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1175;
    out.gl_Position.y = _1177;
    out.gl_Position.z = _1598;
    out.gl_Position.w = _1145;
    float _1616 = _1612 * 0.5;
    float _1618 = _1614 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.w = _1528;
    out.m_67.x = _1552;
    out.m_67.y = _1610;
    out.m_69.z = _1616;
    out.m_69.w = _1145;
    out.m_45.x = _1618;
    float _1620 = _1590 * _1203;
    float _1622 = -_1590;
    float _1624 = _1622 + 1.0;
    float _1626 = _1214 * _1620;
    float _1628 = _1224 * _1620;
    float _1630 = _1214 * _1624;
    float _1632 = fma(_1220, _1626, _1208);
    float _1634 = fma(_1222, _1626, _1210);
    float _1636 = fma(_1214, _1628, _1212);
    out.m_71.x = _1632;
    out.m_71.y = _1634;
    out.m_71.z = _1636;
    out.m_71.w = _1630;
    if (_1608)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1638 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1638;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

