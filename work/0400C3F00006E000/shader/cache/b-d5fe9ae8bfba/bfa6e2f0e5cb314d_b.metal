#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    device _23* cp_s1 [[id(2)]];
    texture2d<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _46 = as_type<float>(gl_WorkGroupID.x);
    float _48 = float(as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[40].x));
    float _50 = as_type<float>(gl_LocalInvocationID.x);
    float _52 = 1.0 / _48;
    int _55 = as_type<int>(_46) * 32;
    int _57 = _55 + as_type<int>(_50);
    int _59 = as_type<int>(_52) + (-2);
    float _61 = float(uint(_57));
    float _63 = as_type<float>(_59) * _61;
    float _65 = trunc(_63);
    float _67 = precise::max(_65, 0.0);
    uint _70 = uint(_67);
    int _72 = -int(_70);
    int _74 = _72 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _76 = _74 + _57;
    float _78 = float(uint(_76));
    float _80 = as_type<float>(_59) * _78;
    float _82 = trunc(_80);
    float _84 = precise::max(_82, 0.0);
    uint _86 = uint(_84);
    int _88 = int(_70) + int(_86);
    int _90 = -_88;
    int _92 = _90 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _94 = _92 + _57;
    bool _98 = uint(_94) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    bool _100 = !_98;
    int _102 = _100 ? 0 : (-1);
    bool _104 = 0 == as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _106 = -_102;
    int _108 = _88 + _106;
    bool _110 = !_104;
    int _112 = _110 ? _108 : (-1);
    bool _114 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].y);
    int _116 = -_112;
    int _118 = _116 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _120 = _118 + _57;
    float _122 = float(uint(_112));
    float _124 = float(uint(_120));
    float _126 = fma(_122, (*spvDescriptorSet0.cp_c3)._m0[40].w, (*spvDescriptorSet0.cp_c3)._m0[38].w);
    float _128 = fma(_124, (*spvDescriptorSet0.cp_c3)._m0[40].z, (*spvDescriptorSet0.cp_c3)._m0[38].z);
    bool _130 = !_114;
    float _132 = _126;
    float _134 = 0.0;
    int _136 = 0;
    float _138 = 0.0;
    if (!_130)
    {
        int _140 = 0;
        int _142 = 0;
        int _144 = 0;
        int _146 = 0;
        int _148 = 0;
        int _150 = 0;
        int _152 = 0;
        int _154 = 0;
        int _156 = 0;
        int _158 = 0;
        int _160 = 0;
        int _162 = 0;
        int _164 = 0;
        int _166 = 0;
        int _168 = 0;
        int _170 = 0;
        bool _172;
        bool _302;
        do
        {
            int _174 = _140;
            int _176 = _142;
            int _178 = _144;
            int _180 = _146;
            int _182 = _148;
            float _184 = _132;
            int _186 = _150;
            int _188 = _152;
            int _190 = _154;
            int _192 = _156;
            int _194 = _158;
            int _196 = _160;
            int _198 = _162;
            int _200 = _164;
            int _202 = _166;
            int _204 = _168;
            float _206 = _134;
            int _208 = _170;
            bool _210 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
            int _212 = _174 + 1;
            bool _214 = _212 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].y);
            bool _216 = !_210;
            _140 = _212;
            float _218 = _206;
            int _220 = _176;
            int _222 = _178;
            int _224 = _182;
            int _226 = _186;
            int _228 = _188;
            int _230 = _190;
            int _232 = _192;
            int _234 = _194;
            int _236 = _196;
            int _238 = _198;
            int _240 = _200;
            int _242 = _202;
            int _244 = _204;
            float _246 = _206;
            int _248 = _208;
            int _250 = _176;
            int _252 = _178;
            int _254 = _180;
            int _256 = _182;
            int _258 = _186;
            int _260 = _188;
            int _262 = _190;
            int _264 = _192;
            int _266 = _194;
            int _268 = _196;
            int _270 = _198;
            int _272 = _200;
            int _274 = _202;
            int _276 = _204;
            float _278 = _206;
            int _280 = _208;
            _136 = _214 ? (-1) : 0;
            if (!_216)
            {
                int _282 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
                int _284 = _282 + 1;
                bool _286 = _284 > 3;
                bool _288 = !_286;
                float _290 = _128;
                int _292 = 0;
                int _294 = 0;
                float _296 = _128;
                int _298 = -1;
                if (!_288)
                {
                    int _300 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x) + (-3);
                    _298 = 0;
                    do
                    {
                        float _304 = _290;
                        int _306 = _292;
                        float _308 = _218;
                        float _310 = _304 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float2 _965 = float2(_304, _184);
                        float4 _313 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_965, float2(0.0), isnan(_965)), int2(0), component::x).xyzw;
                        float _315 = _313.x;
                        float _317 = _313.y;
                        float _319 = _313.z;
                        float _321 = _313.w;
                        float _323 = _310 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float2 _987 = float2(_310, _184);
                        float4 _325 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_987, float2(0.0), isnan(_987)), int2(0), component::x).xyzw;
                        float _327 = _325.x;
                        float _329 = _325.y;
                        float _331 = _325.z;
                        float _333 = _325.w;
                        float _335 = _323 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float2 _1007 = float2(_323, _184);
                        float4 _337 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1007, float2(0.0), isnan(_1007)), int2(0), component::x).xyzw;
                        float _339 = _337.x;
                        float _341 = _337.y;
                        float _343 = _337.z;
                        float _345 = _337.w;
                        float2 _1023 = float2(_335, _184);
                        float4 _347 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1023, float2(0.0), isnan(_1023)), int2(0), component::x).xyzw;
                        float _349 = _347.x;
                        float _351 = _347.y;
                        float _353 = _347.z;
                        float _355 = _347.w;
                        int _357 = _306 + 4;
                        bool _359 = _357 >= _300;
                        float _361 = _335 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                        float _363 = precise::max(_317, _315);
                        float _365 = precise::max(_321, _319);
                        float _367 = precise::max(_329, _327);
                        float _369 = precise::max(_363, _365);
                        float _371 = precise::max(_333, _331);
                        float _373 = precise::max(_369, _308);
                        float _375 = precise::max(_367, _371);
                        float _377 = precise::max(_341, _339);
                        float _379 = precise::max(_345, _343);
                        float _381 = precise::max(_373, _375);
                        float _383 = precise::max(_377, _379);
                        float _385 = precise::max(_351, _349);
                        float _387 = precise::max(_355, _353);
                        float _389 = precise::max(_381, _383);
                        float _391 = precise::max(_385, _387);
                        float _393 = precise::max(_389, _391);
                        _302 = !_359;
                        _290 = _361;
                        _292 = _357;
                        _218 = _393;
                        _220 = as_type<int>(_389);
                        _222 = as_type<int>(_317);
                        _224 = as_type<int>(_365);
                        _226 = as_type<int>(_367);
                        _228 = as_type<int>(_329);
                        _230 = as_type<int>(_375);
                        _232 = as_type<int>(_377);
                        _234 = as_type<int>(_341);
                        _236 = as_type<int>(_383);
                        _238 = as_type<int>(_385);
                        _240 = as_type<int>(_351);
                        _242 = as_type<int>(_353);
                        _244 = as_type<int>(_391);
                        _246 = _393;
                        _294 = _357;
                        _296 = _361;
                        _248 = as_type<int>(_343);
                    } while (_302);
                }
                int _395 = _220;
                int _397 = _222;
                int _399 = _224;
                int _401 = _226;
                int _403 = _228;
                int _405 = _230;
                int _407 = _232;
                int _409 = _234;
                int _411 = _236;
                int _413 = _238;
                int _415 = _240;
                int _417 = _242;
                int _419 = _244;
                float _421 = _246;
                int _423 = _294;
                float _425 = _296;
                int _427 = _248;
                int _429 = _298;
                int _431 = ~_423;
                int _433 = _431 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
                int _435 = _433 + 1;
                bool _437 = _435 > 1;
                bool _439 = !_437;
                int _441 = _395;
                int _443 = _397;
                int _445 = _435;
                int _447 = _399;
                int _449 = _401;
                int _451 = _403;
                int _453 = _411;
                float _455 = _421;
                int _457 = _427;
                int _459 = _423;
                int _461 = _429;
                float _463 = _425;
                _262 = _405;
                _264 = _407;
                _266 = _409;
                _270 = _413;
                _272 = _415;
                _274 = _417;
                _276 = _419;
                if (!_439)
                {
                    float _465 = _425 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                    float2 _1194 = float2(_425, _184);
                    float4 _467 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1194, float2(0.0), isnan(_1194)), int2(0), component::x).xyzw;
                    float _469 = _467.x;
                    float _471 = _467.y;
                    float _473 = _467.z;
                    float _475 = _467.w;
                    float2 _1210 = float2(_465, _184);
                    float4 _477 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1210, float2(0.0), isnan(_1210)), int2(0), component::x).xyzw;
                    float _479 = _477.x;
                    float _481 = _477.y;
                    float _483 = _477.z;
                    float _485 = _477.w;
                    int _487 = _423 + 2;
                    float _489 = _465 + (*spvDescriptorSet0.cp_c3)._m0[41].z;
                    float _491 = precise::max(_471, _469);
                    float _493 = precise::max(_475, _473);
                    float _495 = precise::max(_481, _479);
                    float _497 = precise::max(_491, _493);
                    float _499 = precise::max(_485, _483);
                    float _501 = precise::max(_421, _497);
                    float _503 = precise::max(_495, _499);
                    float _505 = precise::max(_501, _503);
                    _441 = as_type<int>(_497);
                    _443 = as_type<int>(_471);
                    _445 = as_type<int>(_473);
                    _447 = as_type<int>(_493);
                    _449 = as_type<int>(_483);
                    _451 = as_type<int>(_499);
                    _453 = as_type<int>(_481);
                    _455 = _505;
                    _457 = as_type<int>(_503);
                    _459 = _487;
                    _461 = 0;
                    _463 = _489;
                }
                int _507 = _441;
                int _509 = _443;
                int _511 = _445;
                int _513 = _447;
                int _515 = _449;
                int _517 = _451;
                int _519 = _453;
                float _521 = _455;
                int _523 = _457;
                int _525 = _459;
                int _527 = _461;
                float _529 = _463;
                bool _531 = _525 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[41].x);
                int _533 = (_531 ? (-1) : 0) | _527;
                int _535 = ~_533;
                _250 = _507;
                _252 = _509;
                _254 = _511;
                _256 = _513;
                _258 = _515;
                _260 = _517;
                _268 = _519;
                _278 = _521;
                _280 = _523;
                if (!(_535 != 0))
                {
                    float2 _1312 = float2(_529, _184);
                    float4 _537 = spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1312, float2(0.0), isnan(_1312)), int2(0), component::x).xyzw;
                    float _539 = _537.x;
                    float _541 = _537.y;
                    float _543 = _537.z;
                    float _545 = _537.w;
                    float _547 = precise::max(_539, _541);
                    float _549 = precise::max(_543, _545);
                    float _551 = precise::max(_547, _549);
                    float _553 = precise::max(_521, _551);
                    _250 = as_type<int>(_543);
                    _252 = as_type<int>(_549);
                    _254 = as_type<int>(_551);
                    _256 = as_type<int>(_541);
                    _278 = _553;
                }
            }
            int _555 = _250;
            int _557 = _252;
            int _559 = _254;
            int _561 = _256;
            int _563 = _258;
            int _565 = _260;
            int _567 = _262;
            int _569 = _264;
            int _571 = _266;
            int _573 = _268;
            int _575 = _270;
            int _577 = _272;
            int _579 = _274;
            int _581 = _276;
            float _583 = _278;
            int _585 = _280;
            float _587 = _184 + (*spvDescriptorSet0.cp_c3)._m0[41].w;
            _172 = !_214;
            _142 = _555;
            _144 = _557;
            _146 = _559;
            _148 = _561;
            _132 = _587;
            _150 = _563;
            _152 = _565;
            _154 = _567;
            _156 = _569;
            _158 = _571;
            _160 = _573;
            _162 = _575;
            _164 = _577;
            _166 = _579;
            _168 = _581;
            _134 = _583;
            _170 = _585;
            _138 = _583;
        } while (_172);
    }
    int _589 = _136;
    float _591 = _138;
    int _593 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x) + 1;
    int _595 = _112 * _593;
    int _597 = _595 + _120;
    int _599 = _597 * 4;
    int _601 = _597 + _593;
    int _603 = _599 + 19456;
    int _605 = _601 * 4;
    int _607 = _599 + 19460;
    uint _609 = uint(int(uint(_603) >> uint(2)));
    float _611 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_609)]);
    int _613 = _605 + 19456;
    uint _615 = uint(int(uint(_607) >> uint(2)));
    float _617 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_615)]);
    int _619 = _605 + 19460;
    uint _621 = uint(int(uint(_613) >> uint(2)));
    float _623 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_621)]);
    uint _625 = uint(int(uint(_619) >> uint(2)));
    float _627 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_625)]);
    int _629 = _57 << 3;
    int _631 = _629 + 448;
    bool _633 = _611 >= 0.0;
    bool _635 = isnan(_611);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    bool _643 = _617 < 0.0;
    bool _645 = !_641;
    bool _647 = _643 && _645;
    bool _649 = _623 < 0.0;
    bool _651 = _649 && _647;
    bool _653 = _627 < 0.0;
    bool _655 = _653 && _651;
    int _657 = _589;
    int _659 = as_type<int>(_591);
    if (_655)
    {
        bool _661 = _611 != (-1.0);
        bool _663 = isnan(_611);
        bool _665 = _661 || _663;
        bool _667 = isnan(-1.0);
        bool _669 = _665 || _667;
        _657 = _669 ? (-1) : 0;
    }
    int _671 = _657;
    int _673 = _671;
    if (_655)
    {
        bool _675 = _617 == (-1.0);
        int _677 = ~_671;
        int _679 = (_675 ? (-1) : 0) | _677;
        _673 = _679;
    }
    int _681 = _673;
    int _683 = _681;
    if (_655)
    {
        bool _685 = _623 == (-1.0);
        int _687 = (_685 ? (-1) : 0) | _681;
        _683 = _687;
    }
    int _689 = _683;
    bool _691 = _689 != 0;
    if (_655)
    {
        bool _693 = _627 == (-1.0);
        int _695 = (_693 ? (-1) : 0) | _689;
        _691 = _695 != 0;
    }
    bool _697 = _691;
    if (_655)
    {
        float _699 = -_591;
        int _701 = _697 ? as_type<int>(_699) : as_type<int>(_591);
        _659 = _701;
    }
    int _703 = _659;
    uint _705 = uint(int(uint(_631) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_705)] = 0u;
    int _707 = _631 + 4;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_709)] = uint(_703);
}

