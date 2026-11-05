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
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _973 = false;
    bool _367 = false;
    bool _477 = false;
    bool _130 = false;
    float _46 = gl_FragCoord.y;
    float _48 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _50 = _46 / _48;
    float _52 = gl_FragCoord.x;
    float _54 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _56 = _52 / _54;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[4].x * 0.5;
    float _60 = (*spvDescriptorSet0.fp_c4)._m0[2].z + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _62 = _50 + (-0.5);
    bool _66 = _62 >= _58;
    bool _68 = isnan(_62);
    bool _70 = _66 || _68;
    bool _72 = isnan(_58);
    bool _74 = _70 || _72;
    float _124;
    float _126;
    float _128;
    if (!_74)
    {
        float _76 = 1.0 / _60;
        float _78 = _60 * _60;
        float _80 = -_62;
        float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[4].w, 1.0);
        float _84 = _82 * (*spvDescriptorSet0.fp_c4)._m0[2].w;
        float _86 = (*spvDescriptorSet0.fp_c4)._m0[2].w * 0.999000012874603271484375;
        float _88 = precise::max(_84, (*spvDescriptorSet0.fp_c4)._m0[2].z);
        float _90 = _76 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _92 = precise::min(_88, _86);
        float _94 = -_78;
        float _96 = fma((*spvDescriptorSet0.fp_c3)._m0[8].x, (*spvDescriptorSet0.fp_c3)._m0[8].x, _94);
        float _98 = -_90;
        float _100 = fma(_98, _90, 1.0);
        float _102 = precise::clamp(_100, 0.0, 1.0);
        float _104 = _60 * _92;
        float _106 = _104 * 2.0;
        float _108 = -_92;
        float _110 = fma(_108, _92, _96);
        float _112 = sqrt(_102);
        float _114 = 1.0 / _106;
        float _116 = -_112;
        float _118 = _116 + (-0.001000000047497451305389404296875);
        float _120 = _110 * _114;
        float _122 = precise::min(_120, _118);
        _124 = _122;
        _126 = _112;
        _128 = _78;
        _130 = true;
    }
    else
    {
        float _132 = 1.0 / _60;
        float _134 = -_58;
        float _136 = _62 + _134;
        float _138 = _60 * _60;
        float _140 = _136 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _142 = (*spvDescriptorSet0.fp_c4)._m0[2].y * 0.999000012874603271484375;
        float _144 = _140 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _146 = precise::max(_144, (*spvDescriptorSet0.fp_c4)._m0[2].x);
        float _148 = _132 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _150 = _132 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _152 = precise::min(_146, _142);
        float _154 = -_138;
        float _156 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _154);
        float _158 = -_148;
        float _160 = fma(_158, _148, 1.0);
        float _162 = precise::clamp(_160, 0.0, 1.0);
        float _164 = -_150;
        float _166 = fma(_164, _150, 1.0);
        float _168 = precise::clamp(_166, 0.0, 1.0);
        float _170 = _60 * _152;
        float _172 = _170 * 2.0;
        float _174 = -_152;
        float _176 = fma(_174, _152, _156);
        float _178 = sqrt(_162);
        float _180 = 1.0 / _172;
        float _182 = sqrt(_168);
        float _184 = -_178;
        float _186 = _184 + (-0.001000000047497451305389404296875);
        float _188 = _176 * _180;
        float _190 = precise::max(_188, _186);
        _124 = _190;
        _126 = _182;
        _128 = _138;
    }
    _130 = false;
    float _192 = _124;
    float _194 = _126;
    float _196 = _128;
    float _198 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _200 = _56 + (-0.5);
    float _202 = precise::max(_192, -1.0);
    float _204 = precise::min(_202, 1.0);
    float _206 = _200 * _198;
    float _208 = floor(_206);
    float _210 = -_208;
    float _212 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[5].x, _200);
    float _214 = _200 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _216 = -_204;
    float _218 = fma(_216, _204, 1.0);
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = _212 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _224 = sqrt(_220);
    float _226 = fma(_222, 2.2000000476837158203125, -0.81400001049041748046875);
    float _228 = _226 * 0.15915493667125701904296875;
    float _230 = floor(_214);
    float _232 = _228 * 6.283185482025146484375;
    float _234 = cos(_232);
    bool _236 = _224 != 0.0;
    bool _238 = isnan(_224);
    bool _240 = _236 || _238;
    bool _242 = isnan(0.0);
    bool _244 = _240 || _242;
    float _246 = _228 * 6.283185482025146484375;
    float _248 = sin(_246);
    float _250 = _230 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _252 = 1.0 / _234;
    float _254 = fma(_250, 2.0, -1.0);
    float _256 = rsqrt(_220);
    float _258 = _248 * _252;
    float _260 = _258 * 0.18692903220653533935546875;
    float _262 = precise::max(_260, -1.0);
    float _264 = precise::min(_262, 1.0);
    float _266 = -_264;
    float _268 = fma(_266, _264, 1.0);
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _204 * _264;
    float _274 = sqrt(_270);
    float _276 = -_224;
    float _278 = fma(_276, _274, _272);
    float _280 = fma(_224, _274, _272);
    float _282 = precise::max(_254, _278);
    float _284 = precise::min(_280, _282);
    float _286 = -_272;
    float _288 = _286 + _284;
    float _290 = _288 * _256;
    float _292 = _244 ? _290 : 0.0;
    float _294 = -_292;
    float _296 = fma(_294, _292, 1.0);
    float _298 = -_264;
    float _300 = fma(_298, _264, _296);
    float _302 = precise::max(0.0, _300);
    float _304 = sqrt(_302);
    int _307 = 0;
    float _309 = 0.0;
    float _311 = 0.0;
    float _313 = 0.0;
    float _357;
    float _359;
    float _361;
    float _363;
    float _365;
    float _471;
    float _473;
    float _475;
    bool _675;
    float _967;
    float _969;
    float _971;
    do
    {
        int _315 = _307;
        float _317 = _309;
        float _319 = _311;
        float _321 = _313;
        float _323 = float(_315);
        int _325 = _315 + 1;
        float _327 = fma(_323, 0.19634954631328582763671875, 0.098174773156642913818359375);
        bool _329 = _325 >= 16;
        float _331 = _327 * 0.15915493667125701904296875;
        float _333 = _331 * 6.283185482025146484375;
        float _335 = cos(_333);
        float _337 = -_194;
        bool _339 = _335 >= _337;
        bool _341 = isnan(_335);
        bool _343 = _339 || _341;
        bool _345 = isnan(_337);
        bool _347 = _343 || _345;
        bool _349 = !_347;
        _307 = _325;
        float _351 = _317;
        float _353 = _319;
        float _355 = _321;
        if (!_349)
        {
            _357 = 0.0;
            _359 = 0.0;
            _361 = 0.0;
            _363 = 0.0;
            _365 = 0.0;
            _367 = true;
        }
        else
        {
            float _369 = fma(_335, _335, -1.0);
            float _371 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _373 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _375 = fma(_196, _369, _373);
            float _377 = sqrt(_375);
            float _379 = -_60;
            float _381 = -_377;
            float _383 = fma(_379, _335, _381);
            float _385 = -_371;
            float _387 = _377 * _385;
            float _389 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _391 = _389 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _393 = fma(_383, _383, _373);
            float _395 = _383 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _397 = _395 * 2.0;
            bool _399 = _387 >= 0.0;
            float _401 = fma(_387, (*spvDescriptorSet0.fp_c3)._m0[8].x, _383);
            float _403 = fma(_387, _397, _393);
            float _405 = rsqrt(_403);
            float _407 = sqrt(_403);
            float _409 = _401 * _405;
            bool _411 = !_399;
            _365 = _383;
            if (!_411)
            {
                float _413 = 1.0 / _391;
                float _415 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _417 = _407 + _415;
                float _419 = fma(_387, 350.80767822265625, 53.62115478515625);
                float _421 = fma(_409, 350.80767822265625, 53.62115478515625);
                float _423 = log2(_419);
                float _425 = _417 * _413;
                float _427 = log2(_421);
                float _429 = sqrt(_425);
                float _431 = _423 * 0.1155245304107666015625;
                float _433 = _427 * 0.1155245304107666015625;
                float2 _1492 = float2(_433, _429);
                float3 _437 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1492, float2(0.0), isnan(_1492))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1492, float2(0.0), isnan(_1492))).xyz;
                float _439 = _437.x;
                float _441 = _437.y;
                float _443 = _437.z;
                float2 _1507 = float2(_431, 0.0);
                float3 _445 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1507, float2(0.0), isnan(_1507))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1507, float2(0.0), isnan(_1507))).xyz;
                float _447 = _445.x;
                float _449 = _445.y;
                float _451 = _445.z;
                float _453 = precise::max(_441, 9.9999999747524270787835121154785e-07);
                float _455 = precise::max(_439, 9.9999999747524270787835121154785e-07);
                float _457 = precise::max(_443, 9.9999999747524270787835121154785e-07);
                float _459 = 1.0 / _455;
                float _461 = 1.0 / _453;
                float _463 = 1.0 / _457;
                float _465 = _447 * _459;
                float _467 = _449 * _461;
                float _469 = _451 * _463;
                _471 = _465;
                _473 = _467;
                _475 = _469;
                _477 = true;
            }
            else
            {
                float _479 = 1.0 / _391;
                float _481 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
                float _483 = _407 + _481;
                float _485 = fma(_387, -350.80767822265625, 53.62115478515625);
                float _487 = fma(_409, -350.80767822265625, 53.62115478515625);
                float _489 = log2(_485);
                float _491 = _483 * _479;
                float _493 = log2(_487);
                float _495 = _489 * 0.1155245304107666015625;
                float _497 = sqrt(_491);
                float2 _1570 = float2(_495, 0.0);
                float3 _499 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1570, float2(0.0), isnan(_1570))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1570, float2(0.0), isnan(_1570))).xyz;
                float _501 = _499.x;
                float _503 = _499.y;
                float _505 = _499.z;
                float _507 = _493 * 0.1155245304107666015625;
                float2 _1586 = float2(_507, _497);
                float3 _509 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1586, float2(0.0), isnan(_1586))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1586, float2(0.0), isnan(_1586))).xyz;
                float _511 = _509.x;
                float _513 = _509.y;
                float _515 = _509.z;
                float _517 = precise::max(_505, 9.9999999747524270787835121154785e-07);
                float _519 = precise::max(_501, 9.9999999747524270787835121154785e-07);
                float _521 = precise::max(_503, 9.9999999747524270787835121154785e-07);
                float _523 = 1.0 / _519;
                float _525 = 1.0 / _521;
                float _527 = 1.0 / _517;
                float _529 = _511 * _523;
                float _531 = _513 * _525;
                float _533 = _515 * _527;
                _471 = _529;
                _473 = _531;
                _475 = _533;
            }
            _477 = false;
            float _535 = _471;
            float _537 = _473;
            float _539 = _475;
            float _541 = precise::min(_535, 1.0);
            float _543 = precise::min(_537, 1.0);
            float _545 = precise::min(_539, 1.0);
            _357 = 0.031830988824367523193359375;
            _359 = _541;
            _361 = _543;
            _363 = _545;
        }
        _367 = false;
        float _547 = _357;
        float _549 = _359;
        float _551 = _361;
        float _553 = _363;
        float _555 = _365;
        float _557 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _559 = _547 * _549;
        float _561 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _563 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _561;
        float _565 = _547 * _551;
        float _567 = (*spvDescriptorSet0.fp_c4)._m0[2].z * (-1.44269502162933349609375);
        float _569 = _547 * _553;
        float _571 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
        float _573 = fma(_335, _555, _60);
        float _575 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _577 = -_575;
        float _579 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _577);
        float _581 = 1.0 / _563;
        float _583 = _557 * _555;
        float _585 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
        float _587 = 1.0 + _585;
        float _589 = -(*spvDescriptorSet0.fp_c4)._m0[1].x;
        float _591 = fma(_589, (*spvDescriptorSet0.fp_c4)._m0[1].x, 1.0);
        float _593 = _573 * _557;
        float _595 = fma((*spvDescriptorSet0.fp_c4)._m0[1].x, (*spvDescriptorSet0.fp_c4)._m0[1].x, 2.0);
        float _597 = fma((*spvDescriptorSet0.fp_c4)._m0[1].x, (*spvDescriptorSet0.fp_c4)._m0[1].x, 1.0);
        float _599 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _601 = 1.0 + _599;
        float _603 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].z;
        float _605 = _571 * _567;
        float _607 = _204 * _335;
        float _609 = (*spvDescriptorSet0.fp_c4)._m0[1].x * 2.0;
        float _611 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _613 = _591 * 0.119366206228733062744140625;
        float _615 = _331 * 6.283185482025146484375;
        float _617 = sin(_615);
        float _619 = _581 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
        float _621 = _619 * _587;
        float _623 = _603 * _567;
        float _625 = exp2(_605);
        float _627 = _60 * _335;
        float _629 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _621);
        float _631 = _617 * 0.038553141057491302490234375;
        float _633 = exp2(_623);
        float _635 = _304 * _617;
        float _637 = _292 * _617;
        float _639 = _617 * _583;
        float _641 = _224 * _617;
        float _643 = -_196;
        float _645 = fma(_627, _627, _643);
        float _647 = _304 * _639;
        float _649 = sqrt(_579);
        float _651 = _575 + _645;
        float _653 = -_575;
        bool _655 = _645 > _653;
        float _657 = _292 * _639;
        float _659 = _625 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
        float _661 = _625 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
        bool _663 = _627 < 0.0;
        bool _665 = _663 && _655;
        float _667 = _625 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _669 = _633 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
        float _671 = _633;
        int _673 = 0;
        do
        {
            float _677 = _671;
            int _679 = _673;
            float _681 = _351;
            float _683 = _353;
            float _685 = _355;
            float _687 = precise::max(_264, -0.19750000536441802978515625);
            float _689 = -_575;
            float _691 = _196 + _689;
            float _693 = _687 * 5.34962368011474609375;
            float _695 = abs(_693);
            bool _697 = _695 > 1.0;
            float _699 = abs(_693);
            bool _701 = _699 > as_type<float>(0x7f800000u /* inf */);
            bool _703 = isnan(_699);
            bool _705 = _701 || _703;
            bool _707 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _709 = _705 || _707;
            float _711 = _677;
            if (!_697)
            {
                float _713 = abs(_693);
                float _715 = (-0.0) + _713;
                _711 = _715;
            }
            float _717 = _711;
            float _719 = _717;
            if (_697)
            {
                float _721 = abs(_693);
                float _723 = 1.0 / _721;
                _719 = _723;
            }
            float _725 = _719;
            float _727 = _725 * _725;
            float _729 = _727 + 11.33538818359375;
            float _731 = fma(_727, -0.82336294651031494140625, -5.674867153167724609375);
            float _733 = fma(_727, _729, 28.84246826171875);
            float _735 = fma(_727, _731, -6.565555095672607421875);
            float _737 = sqrt(_691);
            float _739 = fma(_727, _733, 19.6966705322265625);
            float _741 = _727 * _735;
            float _743 = _735;
            float _745 = _727;
            if (_665)
            {
                _743 = 0.0;
            }
            float _747 = _743;
            float _749 = _747;
            if (!_665)
            {
                _749 = _579;
            }
            float _751 = _749;
            float _753 = _741 * _725;
            float _755 = _751;
            float _757 = _753;
            if (_665)
            {
                _745 = 0.0;
            }
            float _759 = _745;
            float _761 = 1.0 / _739;
            float _763 = _759;
            if (!_665)
            {
                _763 = _649;
            }
            float _765 = _763;
            float _767 = _651 + _751;
            if (_665)
            {
                _755 = 1.0;
            }
            float _769 = _755;
            float _771 = _769;
            if (!_665)
            {
                _771 = -1.0;
            }
            float _773 = _771;
            float _775 = _737 + _765;
            float _777 = sqrt(_767);
            float _779 = float(_679);
            float _781 = fma(_779, 0.19634954631328582763671875, 0.098174773156642913818359375);
            float _783 = 1.0 / _775;
            float _785 = fma(_753, _761, _725);
            float _787 = _781 * 0.15915493667125701904296875;
            int _789 = as_type<int>(_785);
            if (_697)
            {
                float _791 = -_785;
                float _793 = _791 + 1.57079637050628662109375;
                _789 = as_type<int>(_793);
            }
            int _795 = _789;
            float _797 = fma(_627, _773, _777);
            float _799 = as_type<float>(_795);
            if (_665)
            {
                float _801 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _803 = fma(_801, 0.5, 0.5);
                _757 = _803;
            }
            float _805 = _757;
            float _807 = _787 * 6.283185482025146484375;
            float _809 = sin(_807);
            float _811 = _805;
            if (!_665)
            {
                float _813 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
                _811 = _813;
            }
            float _815 = _811;
            float _817 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _819 = _817 + 0.5;
            float _821 = _797 * _783;
            float _823 = _787 * 6.283185482025146484375;
            float _825 = cos(_823);
            float _827 = fma(_821, _819, _815);
            float _829 = _809 * _635;
            float _831 = _809 * _647;
            float _833 = fma(_825, _637, _829);
            float _835 = fma(_264, _335, _833);
            int _837 = as_type<int>(_693) & int(0x80000000);
            float _839 = fma(_835, 0.5, 0.5);
            if (!_709)
            {
                int _841 = _837 | _795;
                _799 = as_type<float>(_841);
            }
            float _843 = _799;
            float _845 = _839 * _611;
            float _847 = floor(_845);
            float _849 = fma(0.454545438289642333984375, _843, 0.37000000476837158203125);
            float _851 = _849 * _601;
            float _853 = fma(_825, _657, _831);
            float _855 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[5].y, _851);
            float _857 = fma(_264, _593, _853);
            float _859 = fma(_857, 0.833333313465118408203125, 0.16666667163372039794921875);
            float _861 = _855 + _847;
            float _863 = -_847;
            float _865 = _845 + _863;
            float _867 = _861 + 1.0;
            float _869 = _861 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _871 = _867 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float3 _2107 = float3(_869, _827, _629);
            float3 _873 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2107, float3(0.0), isnan(_2107))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2107, float3(0.0), isnan(_2107))).xyz;
            float _875 = _873.x;
            float _877 = _873.y;
            float _879 = _873.z;
            float3 _2124 = float3(_871, _827, _629);
            float3 _881 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2124, float3(0.0), isnan(_2124))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2124, float3(0.0), isnan(_2124))).xyz;
            float _883 = _881.x;
            float _885 = _881.y;
            float _887 = _881.z;
            float2 _2137 = float2(_859, 0.0);
            float3 _889 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2137, float2(0.0), isnan(_2137))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2137, float2(0.0), isnan(_2137))).xyz;
            float _891 = _889.x;
            float _893 = _889.y;
            float _895 = _889.z;
            float _897 = fma(_825, _641, _607);
            int _899 = _679 + 1;
            bool _901 = _899 >= 32;
            float _903 = -_875;
            float _905 = _903 + _883;
            float _907 = -_879;
            float _909 = _907 + _887;
            float _911 = fma(_865, _905, _875);
            float _913 = -_877;
            float _915 = _913 + _885;
            float _917 = fma(_865, _909, _879);
            float _919 = fma(_865, _915, _877);
            float _921 = -_609;
            float _923 = fma(_897, _921, _597);
            float _925 = _897 * _897;
            float _927 = abs(_923);
            float _929 = log2(_927);
            float _931 = fma(_925, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
            float _933 = _925 + 1.0;
            float _935 = _933 * _613;
            float _937 = _929 * 1.5;
            float _939 = exp2(_937);
            float _941 = _595 * _939;
            float _943 = 1.0 / _941;
            float _945 = fma(_891, _559, _911);
            float _947 = fma(_893, _565, _919);
            float _949 = fma(_895, _569, _917);
            float _951 = _935 * _943;
            float _953 = _951 * _669;
            float _955 = fma(_931, _659, _953);
            float _957 = fma(_931, _661, _953);
            float _959 = fma(_931, _667, _953);
            float _961 = _945 * _955;
            float _963 = _947 * _957;
            float _965 = _949 * _959;
            _967 = fma(_631, _961, _681);
            _969 = fma(_631, _963, _683);
            _971 = fma(_631, _965, _685);
            _675 = !_901;
            _309 = _967;
            _311 = _969;
            _313 = _971;
            _671 = _957;
            _673 = _899;
            _351 = _967;
            _353 = _969;
            _355 = _971;
        } while (_675);
        if (_329)
        {
            _973 = true;
            if (_973)
            {
                break;
            }
        }
    } while (true);
    _973 = false;
    out.m_39.x = _967;
    out.m_39.y = _969;
    out.m_39.z = _971;
    out.m_39.w = 0.0;
    return out;
}

