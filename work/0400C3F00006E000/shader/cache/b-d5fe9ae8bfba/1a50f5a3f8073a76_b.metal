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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture3d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1201 = false;
    bool _401 = false;
    bool _511 = false;
    bool _132 = false;
    float _48 = gl_FragCoord.y;
    float _50 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _52 = _48 / _50;
    float _54 = gl_FragCoord.x;
    float _56 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _58 = _54 / _56;
    float _60 = (*spvDescriptorSet0.fp_c3)._m0[4].x * 0.5;
    float _62 = (*spvDescriptorSet0.fp_c4)._m0[2].z + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _64 = _52 + (-0.5);
    bool _68 = _64 >= _60;
    bool _70 = isnan(_64);
    bool _72 = _68 || _70;
    bool _74 = isnan(_60);
    bool _76 = _72 || _74;
    float _126;
    float _128;
    float _130;
    if (!_76)
    {
        float _78 = 1.0 / _62;
        float _80 = -_64;
        float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[4].w, 1.0);
        float _84 = _82 * (*spvDescriptorSet0.fp_c4)._m0[2].w;
        float _86 = (*spvDescriptorSet0.fp_c4)._m0[2].w * 0.999000012874603271484375;
        float _88 = precise::max(_84, (*spvDescriptorSet0.fp_c4)._m0[2].z);
        float _90 = _78 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _92 = -_90;
        float _94 = fma(_92, _90, 1.0);
        float _96 = precise::clamp(_94, 0.0, 1.0);
        float _98 = precise::min(_88, _86);
        float _100 = _62 * _62;
        float _102 = sqrt(_96);
        float _104 = _62 * _98;
        float _106 = _104 * 2.0;
        float _108 = -_100;
        float _110 = fma((*spvDescriptorSet0.fp_c3)._m0[8].x, (*spvDescriptorSet0.fp_c3)._m0[8].x, _108);
        float _112 = -_98;
        float _114 = fma(_112, _98, _110);
        float _116 = 1.0 / _106;
        float _118 = -_102;
        float _120 = _118 + (-0.001000000047497451305389404296875);
        float _122 = _114 * _116;
        float _124 = precise::min(_122, _120);
        _126 = _124;
        _128 = _102;
        _130 = _100;
        _132 = true;
    }
    else
    {
        float _134 = -_60;
        float _136 = _64 + _134;
        float _138 = 1.0 / _62;
        float _140 = _136 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _142 = (*spvDescriptorSet0.fp_c4)._m0[2].y * 0.999000012874603271484375;
        float _144 = _140 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _146 = precise::max(_144, (*spvDescriptorSet0.fp_c4)._m0[2].x);
        float _148 = precise::min(_146, _142);
        float _150 = _138 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _152 = _62 * _62;
        float _154 = -_150;
        float _156 = fma(_154, _150, 1.0);
        float _158 = precise::clamp(_156, 0.0, 1.0);
        float _160 = _62 * _148;
        float _162 = _160 * 2.0;
        float _164 = _138 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _166 = -_152;
        float _168 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _166);
        float _170 = sqrt(_158);
        float _172 = -_164;
        float _174 = fma(_172, _164, 1.0);
        float _176 = precise::clamp(_174, 0.0, 1.0);
        float _178 = -_148;
        float _180 = fma(_178, _148, _168);
        float _182 = 1.0 / _162;
        float _184 = sqrt(_176);
        float _186 = -_170;
        float _188 = _186 + (-0.001000000047497451305389404296875);
        float _190 = _180 * _182;
        float _192 = precise::max(_190, _188);
        _126 = _192;
        _128 = _184;
        _130 = _152;
    }
    _132 = false;
    float _194 = _126;
    float _196 = _128;
    float _198 = _130;
    float _200 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _202 = _58 + (-0.5);
    float _204 = precise::max(_194, -1.0);
    float _206 = _202 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _208 = precise::min(_204, 1.0);
    float _210 = floor(_206);
    float _212 = -_208;
    float _214 = fma(_212, _208, 1.0);
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _202 * _200;
    float _220 = floor(_218);
    float _222 = -_220;
    float _224 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[5].x, _202);
    float _226 = sqrt(_216);
    float _228 = _224 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _230 = fma(_228, 2.2000000476837158203125, -0.81400001049041748046875);
    float _232 = _230 * 0.15915493667125701904296875;
    float _234 = _232 * 6.283185482025146484375;
    float _236 = cos(_234);
    bool _238 = _226 != 0.0;
    bool _240 = isnan(_226);
    bool _242 = _238 || _240;
    bool _244 = isnan(0.0);
    bool _246 = _242 || _244;
    float _248 = _232 * 6.283185482025146484375;
    float _250 = sin(_248);
    float _252 = 1.0 / _236;
    float _254 = _250 * _252;
    float _256 = _254 * 0.18692903220653533935546875;
    float _258 = precise::max(_256, -1.0);
    float _260 = _210 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _262 = rsqrt(_216);
    float _264 = precise::min(_258, 1.0);
    float _266 = fma(_260, 2.0, -1.0);
    float _268 = -_264;
    float _270 = fma(_268, _264, 1.0);
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _208 * _264;
    float _276 = sqrt(_272);
    float _278 = -_226;
    float _280 = fma(_278, _276, _274);
    float _282 = fma(_226, _276, _274);
    float _284 = precise::max(_266, _280);
    float _286 = precise::min(_282, _284);
    float _288 = -_274;
    float _290 = _288 + _286;
    float _292 = _290 * _262;
    float _294 = _246 ? _292 : 0.0;
    float _296 = -_294;
    float _298 = fma(_296, _294, 1.0);
    float _300 = -_264;
    float _302 = fma(_300, _264, _298);
    float _304 = precise::max(0.0, _302);
    float _306 = sqrt(_304);
    int _309 = 0;
    float _311 = 0.0;
    float _313 = 0.0;
    float _315 = 0.0;
    float _317 = 0.0;
    float _319 = 0.0;
    float _321 = 0.0;
    float _323 = 0.0;
    float _325 = 0.0;
    float _391;
    float _393;
    float _395;
    float _397;
    float _399;
    float _505;
    float _507;
    float _509;
    bool _703;
    float _1195;
    float _1197;
    float _1199;
    do
    {
        int _327 = _309;
        float _329 = _311;
        float _331 = _313;
        float _333 = _315;
        float _335 = _317;
        float _337 = _319;
        float _339 = _321;
        float _341 = _323;
        float _343 = _325;
        float _345 = float(_327);
        int _347 = _327 + 1;
        float _349 = fma(_345, 0.19634954631328582763671875, 0.098174773156642913818359375);
        float _351 = (*spvDescriptorSet0.fp_c4)._m0[2].z + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        bool _353 = _347 >= 16;
        float _355 = _349 * 0.15915493667125701904296875;
        float _357 = _355 * 6.283185482025146484375;
        float _359 = cos(_357);
        float _361 = -_196;
        bool _363 = _359 >= _361;
        bool _365 = isnan(_359);
        bool _367 = _363 || _365;
        bool _369 = isnan(_361);
        bool _371 = _367 || _369;
        bool _373 = !_371;
        _309 = _347;
        float _375 = _329;
        float _377 = _331;
        float _379 = _333;
        float _381 = _335;
        float _383 = _337;
        float _385 = _339;
        float _387 = _341;
        float _389 = _343;
        if (!_373)
        {
            _391 = 0.0;
            _393 = 0.0;
            _395 = 0.0;
            _397 = 0.0;
            _399 = 0.0;
            _401 = true;
        }
        else
        {
            float _403 = fma(_359, _359, -1.0);
            float _405 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _407 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _409 = fma(_198, _403, _407);
            float _411 = sqrt(_409);
            float _413 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _415 = _413 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _417 = -_351;
            float _419 = -_411;
            float _421 = fma(_417, _359, _419);
            float _423 = -_405;
            float _425 = _411 * _423;
            float _427 = fma(_421, _421, _407);
            float _429 = _421 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _431 = _429 * 2.0;
            bool _433 = _425 >= 0.0;
            float _435 = fma(_425, _431, _427);
            float _437 = fma(_425, (*spvDescriptorSet0.fp_c3)._m0[8].x, _421);
            float _439 = rsqrt(_435);
            float _441 = sqrt(_435);
            float _443 = _437 * _439;
            bool _445 = !_433;
            if (!_445)
            {
                float _447 = 1.0 / _415;
                float _449 = fma(_425, 350.80767822265625, 53.62115478515625);
                float _451 = fma(_443, 350.80767822265625, 53.62115478515625);
                float _453 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _455 = _441 + _453;
                float _457 = log2(_449);
                float _459 = _455 * _447;
                float _461 = log2(_451);
                float _463 = sqrt(_459);
                float _465 = _457 * 0.1155245304107666015625;
                float _467 = _461 * 0.1155245304107666015625;
                float2 _1734 = float2(_467, _463);
                float3 _471 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1734, float2(0.0), isnan(_1734))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1734, float2(0.0), isnan(_1734))).xyz;
                float _473 = _471.x;
                float _475 = _471.y;
                float _477 = _471.z;
                float2 _1749 = float2(_465, 0.0);
                float3 _479 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1749, float2(0.0), isnan(_1749))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1749, float2(0.0), isnan(_1749))).xyz;
                float _481 = _479.x;
                float _483 = _479.y;
                float _485 = _479.z;
                float _487 = precise::max(_477, 9.9999999747524270787835121154785e-07);
                float _489 = precise::max(_473, 9.9999999747524270787835121154785e-07);
                float _491 = precise::max(_475, 9.9999999747524270787835121154785e-07);
                float _493 = 1.0 / _489;
                float _495 = 1.0 / _491;
                float _497 = 1.0 / _487;
                float _499 = _481 * _493;
                float _501 = _483 * _495;
                float _503 = _485 * _497;
                _505 = _499;
                _507 = _501;
                _509 = _503;
                _511 = true;
            }
            else
            {
                float _513 = 1.0 / _415;
                float _515 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _517 = _441 + _515;
                float _519 = fma(_425, -350.80767822265625, 53.62115478515625);
                float _521 = fma(_443, -350.80767822265625, 53.62115478515625);
                float _523 = log2(_519);
                float _525 = _517 * _513;
                float _527 = log2(_521);
                float _529 = _523 * 0.1155245304107666015625;
                float _531 = sqrt(_525);
                float2 _1812 = float2(_529, 0.0);
                float3 _533 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1812, float2(0.0), isnan(_1812))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1812, float2(0.0), isnan(_1812))).xyz;
                float _535 = _533.x;
                float _537 = _533.y;
                float _539 = _533.z;
                float _541 = _527 * 0.1155245304107666015625;
                float2 _1828 = float2(_541, _531);
                float3 _543 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1828, float2(0.0), isnan(_1828))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1828, float2(0.0), isnan(_1828))).xyz;
                float _545 = _543.x;
                float _547 = _543.y;
                float _549 = _543.z;
                float _551 = precise::max(_535, 9.9999999747524270787835121154785e-07);
                float _553 = precise::max(_537, 9.9999999747524270787835121154785e-07);
                float _555 = precise::max(_539, 9.9999999747524270787835121154785e-07);
                float _557 = 1.0 / _551;
                float _559 = 1.0 / _553;
                float _561 = 1.0 / _555;
                float _563 = _545 * _557;
                float _565 = _547 * _559;
                float _567 = _549 * _561;
                _505 = _563;
                _507 = _565;
                _509 = _567;
            }
            _511 = false;
            float _569 = _505;
            float _571 = _507;
            float _573 = _509;
            float _575 = precise::min(_569, 1.0);
            float _577 = precise::min(_571, 1.0);
            float _579 = precise::min(_573, 1.0);
            _391 = _577;
            _393 = _421;
            _395 = 0.031830988824367523193359375;
            _397 = _575;
            _399 = _579;
        }
        _401 = false;
        float _581 = _391;
        float _583 = _393;
        float _585 = _395;
        float _587 = _397;
        float _589 = _399;
        float _591 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _593 = fma(_359, _583, _351);
        float _595 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _597 = _595 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _599 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
        float _601 = _599 + 1.0;
        float _603 = 1.0 / _597;
        float _605 = (*spvDescriptorSet0.fp_c4)._m0[2].z * (-1.44269502162933349609375);
        float _607 = -(*spvDescriptorSet0.fp_c4)._m0[1].x;
        float _609 = fma(_607, (*spvDescriptorSet0.fp_c4)._m0[1].x, 1.0);
        float _611 = fma((*spvDescriptorSet0.fp_c4)._m0[1].x, (*spvDescriptorSet0.fp_c4)._m0[1].x, 2.0);
        float _613 = fma((*spvDescriptorSet0.fp_c4)._m0[1].x, (*spvDescriptorSet0.fp_c4)._m0[1].x, 1.0);
        float _615 = (*spvDescriptorSet0.fp_c4)._m0[1].x * 2.0;
        float _617 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
        float _619 = _591 * _583;
        float _621 = _593 * _591;
        float _623 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _625 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].z;
        float _627 = _603 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
        float _629 = _627 * _601;
        float _631 = _355 * 6.283185482025146484375;
        float _633 = sin(_631);
        float _635 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _629);
        float _637 = _351 * _359;
        float _639 = _617 * _605;
        float _641 = _208 * _359;
        float _643 = -_198;
        float _645 = fma(_637, _637, _643);
        float _647 = _625 * _605;
        float _649 = exp2(_639);
        float _651 = -_623;
        bool _653 = _645 > _651;
        float _655 = _623 + _645;
        float _657 = -_623;
        float _659 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _657);
        float _661 = -_623;
        float _663 = _198 + _661;
        float _665 = _633 * _619;
        float _667 = _633 * 0.038553141057491302490234375;
        float _669 = exp2(_647);
        float _671 = _306 * _633;
        float _673 = _294 * _633;
        float _675 = _226 * _633;
        bool _677 = _637 < 0.0;
        bool _679 = _677 && _653;
        float _681 = _306 * _665;
        float _683 = _294 * _665;
        float _685 = sqrt(_663);
        float _687 = _649 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        float _689 = _649 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
        float _691 = _649 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _693 = sqrt(_659);
        float _695 = _669 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
        int _697 = 0;
        float _699 = _665;
        float _701 = _615;
        do
        {
            int _705 = _697;
            float _707 = _375;
            float _709 = _377;
            float _711 = _379;
            float _713 = _699;
            float _715 = _381;
            float _717 = _383;
            float _719 = _701;
            float _721 = _385;
            float _723 = _387;
            float _725 = _389;
            float _727 = precise::max(_264, -0.19750000536441802978515625);
            float _729 = _707;
            float _731 = _711;
            float _733 = _709;
            float _735 = _717;
            float _737 = _713;
            float _739 = _715;
            if (_679)
            {
                _729 = 0.0;
                _731 = 0.0;
            }
            float _741 = _729;
            float _743 = _731;
            float _745 = float(_705);
            float _747 = _727 * 5.34962368011474609375;
            float _749 = _741;
            float _751 = _743;
            if (!_679)
            {
                _749 = _659;
            }
            float _753 = _749;
            if (_679)
            {
                _733 = 0.0;
            }
            float _755 = _733;
            float _757 = fma(_745, 0.19634954631328582763671875, 0.098174773156642913818359375);
            float _759 = abs(_747);
            bool _761 = _759 > 1.0;
            float _763 = _655 + _753;
            float _765 = _755;
            if (!_679)
            {
                _765 = _659;
            }
            float _767 = _765;
            float _769 = _757 * 0.15915493667125701904296875;
            if (!_679)
            {
                _751 = _693;
            }
            float _771 = _751;
            if (_679)
            {
                _735 = 1.0;
            }
            float _773 = _735;
            float _775 = _769 * 6.283185482025146484375;
            float _777 = cos(_775);
            float _779 = _655 + _767;
            float _781 = _685 + _771;
            float _783 = _773;
            if (!_679)
            {
                _783 = -1.0;
            }
            float _785 = _783;
            float _787 = abs(_747);
            bool _789 = _787 > as_type<float>(0x7f800000u /* inf */);
            bool _791 = isnan(_787);
            bool _793 = _789 || _791;
            bool _795 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _797 = _793 || _795;
            if (!_761)
            {
                float _799 = abs(_747);
                float _801 = (-0.0) + _799;
                _737 = _801;
            }
            float _803 = _737;
            float _805 = _769 * 6.283185482025146484375;
            float _807 = sin(_805);
            float _809 = _803;
            float _811 = _807;
            if (!_761)
            {
                _739 = _803;
            }
            float _813 = _739;
            float _815 = sqrt(_763);
            float _817 = _813;
            if (_761)
            {
                float _819 = abs(_747);
                float _821 = 1.0 / _819;
                _817 = _821;
            }
            float _823 = _817;
            float _825 = sqrt(_779);
            float _827 = fma(_637, _785, _815);
            float _829 = _823 * _823;
            if (_761)
            {
                _809 = _823;
            }
            float _831 = _809;
            float _833 = 1.0 / _781;
            float _835 = _829 + 11.33538818359375;
            float _837 = _831 * _831;
            float _839 = fma(_829, _835, 28.84246826171875);
            float _841 = _837 + 11.33538818359375;
            float _843 = fma(_829, _839, 19.6966705322265625);
            float _845 = _839;
            float _847 = _841;
            if (_679)
            {
                _845 = 1.0;
            }
            float _849 = _845;
            float _851 = fma(_837, _841, 28.84246826171875);
            float _853 = _849;
            if (_679)
            {
                _847 = 0.0;
            }
            float _855 = _847;
            float _857 = fma(_829, -0.82336294651031494140625, -5.674867153167724609375);
            float _859 = _855;
            if (!_679)
            {
                _853 = -1.0;
            }
            float _861 = _853;
            float _863 = 1.0 / _843;
            float _865 = fma(_837, _851, 19.6966705322265625);
            if (!_679)
            {
                _859 = _693;
            }
            float _867 = _859;
            float _869 = fma(_837, -0.82336294651031494140625, -5.674867153167724609375);
            float _871 = fma(_829, _857, -6.565555095672607421875);
            float _873 = fma(_637, _861, _825);
            float _875 = _827 * _833;
            float _877 = _685 + _867;
            float _879 = 1.0 / _865;
            float _881 = fma(_837, _869, -6.565555095672607421875);
            float _883 = _829 * _871;
            float _885 = _807 * _671;
            float _887 = _837 * _881;
            float _889 = _883 * _823;
            float _891 = fma(_777, _673, _885);
            float _893 = 1.0 / _877;
            float _895 = _887 * _831;
            float _897 = fma(_889, _863, _823);
            float _899 = fma(_264, _359, _891);
            float _901 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
            int _903 = as_type<int>(_747) & int(0x80000000);
            int _905 = as_type<int>(_897);
            float _907 = as_type<float>(_903);
            if (_761)
            {
                float _909 = -_897;
                float _911 = _909 + 1.57079637050628662109375;
                _905 = as_type<int>(_911);
            }
            int _913 = _905;
            float _915 = fma(_895, _879, _831);
            float _917 = fma(_899, 0.5, 0.5);
            float _919 = _807 * _681;
            int _921 = as_type<int>(_915);
            float _923 = as_type<float>(_913);
            if (_761)
            {
                float _925 = -_915;
                float _927 = _925 + 1.57079637050628662109375;
                _921 = as_type<int>(_927);
            }
            int _929 = _921;
            float _931 = _917 * _901;
            float _933 = as_type<float>(_929);
            if (_679)
            {
                float _935 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _937 = fma(0.5, _935, 0.5);
                _811 = _937;
            }
            float _939 = _811;
            float _941 = _873 * _893;
            float _943 = _939;
            if (!_797)
            {
                int _945 = _903 | _929;
                _933 = as_type<float>(_945);
            }
            float _947 = _933;
            float _949 = floor(_931);
            if (!_679)
            {
                float _951 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5);
                _943 = _951;
            }
            float _953 = _943;
            if (!_797)
            {
                int _955 = _903 | _913;
                _923 = as_type<float>(_955);
            }
            float _957 = _923;
            if (_679)
            {
                float _959 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _961 = fma(_959, 0.5, 0.5);
                _907 = _961;
            }
            float _963 = _907;
            float _965 = _963;
            if (!_679)
            {
                float _967 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
                _965 = _967;
            }
            float _969 = _965;
            float _971 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _973 = _971 + 1.0;
            float _975 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _977 = fma(0.454545438289642333984375, _947, 0.37000000476837158203125);
            float _979 = fma(0.454545438289642333984375, _957, 0.37000000476837158203125);
            float _981 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _983 = _981 + 0.5;
            float _985 = fma(_777, _683, _919);
            float _987 = fma(_973, _977, _975);
            float _989 = fma(_979, _973, _975);
            float _991 = fma(_875, _983, _969);
            float _993 = fma(_983, _941, _953);
            float _995 = _949 + _987;
            float _997 = _989 + _949;
            float _999 = fma(_264, _621, _985);
            float _1001 = _995 + 1.0;
            float _1003 = _995 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _1005 = fma(_999, 0.833333313465118408203125, 0.16666667163372039794921875);
            float _1007 = _1001 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _1009 = _997 + 1.0;
            float _1011 = _997 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float3 _2495 = float3(_1003, _993, _635);
            float3 _1013 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2495, float3(0.0), isnan(_2495))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2495, float3(0.0), isnan(_2495))).xyz;
            float _1015 = _1013.x;
            float _1017 = _1013.y;
            float _1019 = _1013.z;
            float _1021 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float3 _2516 = float3(_1007, _993, _635);
            float3 _1023 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2516, float3(0.0), isnan(_2516))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2516, float3(0.0), isnan(_2516))).xyz;
            float _1025 = _1023.x;
            float _1027 = _1023.y;
            float _1029 = _1023.z;
            float3 _2531 = float3(_1011, _991, _635);
            float3 _1031 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2531, float3(0.0), isnan(_2531))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2531, float3(0.0), isnan(_2531))).xyz;
            float _1033 = _1031.x;
            float _1035 = _1031.y;
            float _1037 = _1031.z;
            float3 _2546 = float3(_1021, _991, _635);
            float3 _1039 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2546, float3(0.0), isnan(_2546))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2546, float3(0.0), isnan(_2546))).xyz;
            float _1041 = _1039.x;
            float _1043 = _1039.y;
            float _1045 = _1039.z;
            float2 _2559 = float2(_1005, 0.0);
            float3 _1047 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2559, float2(0.0), isnan(_2559))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2559, float2(0.0), isnan(_2559))).xyz;
            float _1049 = _1047.x;
            float _1051 = _1047.y;
            float _1053 = _1047.z;
            float _1055 = fma(_777, _675, _641);
            float _1057 = -_719;
            float _1059 = fma(_899, _1057, _613);
            float _1061 = -_949;
            float _1063 = _931 + _1061;
            int _1065 = _705 + 1;
            float _1067 = -_719;
            float _1069 = fma(_1055, _1067, _613);
            float _1071 = abs(_1059);
            float _1073 = log2(_1071);
            float _1075 = _1055 * _1055;
            bool _1077 = _1065 >= 32;
            float _1079 = abs(_1069);
            float _1081 = log2(_1079);
            float _1083 = _1075 + 1.0;
            float _1085 = fma(_1075, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
            float _1087 = _1073 * 1.5;
            float _1089 = exp2(_1087);
            float _1091 = _1081 * 1.5;
            float _1093 = _609 * 0.119366206228733062744140625;
            float _1095 = _1083 * _1093;
            float _1097 = exp2(_1091);
            float _1099 = _611 * _1089;
            float _1101 = 1.0 / _1099;
            float _1103 = _611 * _1097;
            float _1105 = 1.0 / _1103;
            float _1107 = _1095 * _1105;
            float _1109 = _899 * _899;
            float _1111 = _1107 * _695;
            float _1113 = _1109 + 1.0;
            float _1115 = fma(_1109, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
            float _1117 = fma(_1085, _689, _1111);
            float _1119 = _1113 * _1093;
            float _1121 = (*spvDescriptorSet0.fp_c4)._m0[1].x * 2.0;
            float _1123 = _1119 * _1101;
            float _1125 = fma(_1085, _687, _1111);
            float _1127 = fma(_1085, _691, _1111);
            float _1129 = -_1015;
            float _1131 = _1129 + _1025;
            float _1133 = -_1019;
            float _1135 = _1133 + _1029;
            float _1137 = fma(_1063, _1131, _1015);
            float _1139 = -_1017;
            float _1141 = _1139 + _1027;
            float _1143 = -_1033;
            float _1145 = _1143 + _1041;
            float _1147 = -_1035;
            float _1149 = _1147 + _1043;
            float _1151 = fma(_1063, _1135, _1019);
            float _1153 = fma(_1063, _1141, _1017);
            float _1155 = -_1037;
            float _1157 = _1155 + _1045;
            float _1159 = fma(_1063, _1145, _1033);
            float _1161 = fma(_1063, _1149, _1035);
            float _1163 = _1123 * _1137;
            float _1165 = _1123 * _1153;
            float _1167 = _1123 * _1151;
            float _1169 = fma(_1063, _1157, _1037);
            float _1171 = fma(_1115, _1159, _1163);
            float _1173 = fma(_1115, _1161, _1165);
            float _1175 = _1049 * _585;
            float _1177 = fma(_1115, _1169, _1167);
            float _1179 = _1051 * _585;
            float _1181 = _1053 * _585;
            float _1183 = fma(_1175, _587, _1171);
            float _1185 = fma(_1179, _581, _1173);
            float _1187 = fma(_1181, _589, _1177);
            float _1189 = _1183 * _1125;
            float _1191 = _1185 * _1117;
            float _1193 = _1187 * _1127;
            _1195 = fma(_667, _1189, _721);
            _1197 = fma(_667, _1191, _723);
            _1199 = fma(_667, _1193, _725);
            _703 = !_1077;
            _311 = _1035;
            _313 = _1043;
            _315 = _1181;
            _317 = _1171;
            _319 = _1157;
            _321 = _1195;
            _323 = _1197;
            _325 = _1199;
            _697 = _1065;
            _375 = _1035;
            _377 = _1043;
            _379 = _1181;
            _699 = _1185;
            _381 = _1171;
            _383 = _1157;
            _701 = _1121;
            _385 = _1195;
            _387 = _1197;
            _389 = _1199;
        } while (_703);
        if (_353)
        {
            _1201 = true;
            if (_1201)
            {
                break;
            }
        }
    } while (true);
    _1201 = false;
    out.m_41.x = _1195;
    out.m_41.y = _1197;
    out.m_41.z = _1199;
    out.m_41.w = 0.0;
    return out;
}

