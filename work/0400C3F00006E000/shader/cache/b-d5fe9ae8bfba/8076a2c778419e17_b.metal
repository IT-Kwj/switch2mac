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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _21* cp_s0 [[id(0)]];
    device _21* cp_s1 [[id(1)]];
    device _21* cp_s2 [[id(2)]];
    device _21* cp_s3 [[id(3)]];
    device _21* cp_s4 [[id(4)]];
    device _21* cp_s5 [[id(5)]];
    device _21* cp_s6 [[id(6)]];
    device _21* cp_s7 [[id(7)]];
    device _21* cp_s8 [[id(8)]];
    device _21* cp_s9 [[id(9)]];
    device _21* cp_s10 [[id(10)]];
    device _21* cp_s11 [[id(11)]];
    device _21* cp_s12 [[id(12)]];
    texture3d<float> cp_t_tcb_12 [[id(13)]];
    sampler cp_t_tcb_12Smplr [[id(14)]];
    texture2d<float> cp_t_tcb_2C [[id(15)]];
    sampler cp_t_tcb_2CSmplr [[id(16)]];
    texture2d<float> cp_t_tcb_2A [[id(17)]];
    sampler cp_t_tcb_2ASmplr [[id(18)]];
    sampler cp_t_tcb_12Smplr_w [[id(19)]];
    sampler cp_t_tcb_2CSmplr_w [[id(20)]];
    sampler cp_t_tcb_2ASmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2753 = false;
    bool _1619 = false;
    bool _1189 = false;
    bool _697 = false;
    float _73 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _75 = as_type<float>(gl_LocalInvocationID.x);
    float _77 = as_type<float>(gl_WorkGroupID.x);
    int _80 = as_type<int>(_77) << 5;
    int _82 = _80 + as_type<int>(_75);
    float _84 = trunc(_73);
    int _86 = int(_84);
    bool _90 = _82 >= _86;
    int _92 = 0;
    float _94 = as_type<float>(_86);
    if (_90)
    {
        _92 = 0;
    }
    int _96 = _92;
    int _98 = _96;
    int _100 = _96;
    float _102 = 0.0;
    if (!_90)
    {
        int _104 = _82 << 4;
        int _106 = _104 + 12;
        uint _109 = uint(int(uint(_106) >> uint(2)));
        float _111 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_109)]);
        float _113 = trunc(_111);
        int _115 = int(_113);
        bool _117 = _115 >= 1;
        int _119 = _117 ? (-1) : 0;
        _94 = as_type<float>(_106);
        _102 = as_type<float>(_115);
        if (!_117)
        {
            _98 = 0;
        }
        int _121 = _98;
        bool _123 = !_117;
        _100 = _121;
        if (!_123)
        {
            float _125 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _127 = uint(int(uint(_106) >> uint(2)));
            float _129 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_127)]);
            float _131 = float(_115);
            float _133 = -_129;
            float _135 = _125 + _133;
            bool _137 = _135 > _131;
            int _139 = as_type<int>(_125);
            _94 = _129;
            _102 = _131;
            if (!_137)
            {
                bool _141 = _125 >= _129;
                bool _143 = isnan(_125);
                bool _145 = _141 || _143;
                bool _147 = isnan(_129);
                bool _149 = _145 || _147;
                _119 = _149 ? (-1) : 0;
            }
            int _151 = _119;
            if (_137)
            {
                _139 = 0;
            }
            int _153 = _139;
            _100 = _153;
            if (!_137)
            {
                int _155 = ~_151;
                int _157 = (_155 != 0) ? 0 : 1;
                _100 = _157;
            }
        }
    }
    int _159 = _100;
    float _161 = _94;
    float _163 = _102;
    int _165 = _159 & 1;
    bool _167 = _165 != 0;
    if (!_167)
    {
        return;
    }
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _177 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _185 = as_type<int>(_171) & 512;
    bool _187 = _185 != 0;
    float _189 = 0.0;
    float _191 = 0.0;
    float _193 = 0.0;
    float _195 = _171;
    if (_187)
    {
        float _197 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _199 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _201 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _189 = _197;
        _191 = _199;
        _193 = _201;
    }
    float _203 = _189;
    float _205 = _191;
    float _207 = _193;
    float _209 = 0.0;
    float _211 = 0.0;
    float _213 = 0.0;
    if (_187)
    {
        float _215 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _217 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _219 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _209 = _215;
        _211 = _217;
        _213 = _219;
    }
    float _221 = _209;
    float _223 = _211;
    float _225 = _213;
    float _227 = as_type<float>(_159);
    float _229 = _161;
    float _231 = _163;
    if (_187)
    {
        float _233 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _235 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _237 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _227 = _233;
        _229 = _235;
        _231 = _237;
    }
    float _239 = _227;
    float _241 = _229;
    float _243 = _231;
    int _245 = _82 << 4;
    int _247 = _245 + 12;
    uint _249 = uint(int(uint(_245) >> uint(2)));
    float _251 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_249)]);
    int _253 = _245 + 4;
    uint _255 = uint(int(uint(_253) >> uint(2)));
    float _257 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_255)]);
    int _259 = _245 + 8;
    uint _261 = uint(int(uint(_259) >> uint(2)));
    float _263 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_261)]);
    uint _265 = uint(int(uint(_245) >> uint(2)));
    float _267 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_265)]);
    int _269 = _245 + 4;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    float _273 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_271)]);
    int _275 = _245 + 8;
    uint _277 = uint(int(uint(_275) >> uint(2)));
    float _279 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_277)]);
    uint _281 = uint(int(uint(_245) >> uint(2)));
    float _283 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_281)]);
    int _285 = _245 + 4;
    uint _287 = uint(int(uint(_285) >> uint(2)));
    float _289 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_287)]);
    int _291 = _245 + 8;
    uint _293 = uint(int(uint(_291) >> uint(2)));
    float _295 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_293)]);
    uint _297 = uint(int(uint(_245) >> uint(2)));
    float _299 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_297)]);
    uint _301 = uint(int(uint(_247) >> uint(2)));
    float _303 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_301)]);
    uint _305 = uint(int(uint(_247) >> uint(2)));
    float _307 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_305)]);
    float _309 = _221;
    float _311 = _223;
    float _313 = _203;
    float _315 = _225;
    float _317 = _205;
    float _319 = _239;
    float _321 = _207;
    float _323 = _241;
    float _325 = _243;
    float _327 = 0.0;
    float _329 = _179;
    float _331 = _183;
    int _333 = as_type<int>(_267);
    int _335 = as_type<int>(_273);
    int _337 = as_type<int>(_279);
    int _339 = as_type<int>(_267);
    int _341 = as_type<int>(_273);
    int _343 = as_type<int>(_279);
    int _345 = as_type<int>(_267);
    int _347 = as_type<int>(_273);
    int _349 = as_type<int>(_279);
    if (!_187)
    {
        int _351 = _245 + 4;
        uint _353 = uint(int(uint(_245) >> uint(2)));
        float _355 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_353)]);
        int _357 = _245 + 8;
        uint _359 = uint(int(uint(_245) >> uint(2)));
        float _361 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_359)]);
        uint _363 = uint(int(uint(_351) >> uint(2)));
        float _365 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_363)]);
        uint _367 = uint(int(uint(_351) >> uint(2)));
        float _369 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_367)]);
        uint _371 = uint(int(uint(_357) >> uint(2)));
        float _373 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_371)]);
        uint _375 = uint(int(uint(_245) >> uint(2)));
        float _377 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_375)]);
        uint _379 = uint(int(uint(_357) >> uint(2)));
        float _381 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_379)]);
        uint _383 = uint(int(uint(_351) >> uint(2)));
        float _385 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_383)]);
        uint _387 = uint(int(uint(_357) >> uint(2)));
        float _389 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_387)]);
        float _391 = _355 * _355;
        float _393 = fma(_361, _361, _391);
        float _395 = _365 * _365;
        float _397 = fma(_369, _369, _395);
        float _399 = _373 * _373;
        float _401 = fma(_377, _377, _393);
        float _403 = fma(_381, _381, _399);
        float _405 = sqrt(_401);
        float _407 = fma(_385, _385, _397);
        float _409 = fma(_389, _389, _403);
        float _411 = sqrt(_407);
        float _413 = sqrt(_409);
        bool _415 = _405 > 0.0;
        bool _417 = _411 > 0.0;
        bool _419 = _413 > 0.0;
        float _421 = _411;
        float _423 = _413;
        float _425 = _403;
        float _427 = _355;
        float _429 = _405;
        float _431 = _361;
        float _433 = _397;
        float _435 = _365;
        float _437 = _385;
        float _439 = _377;
        _329 = _407;
        if (_415)
        {
            float _441 = rsqrt(_401);
            _421 = _441;
        }
        float _443 = _421;
        float _445 = 0.0;
        if (_417)
        {
            float _447 = rsqrt(_407);
            _445 = _447;
        }
        float _449 = _445;
        float _451 = 0.0;
        if (_419)
        {
            float _453 = rsqrt(_409);
            _451 = _453;
        }
        float _455 = _451;
        if (!_415)
        {
            _423 = 0.0;
        }
        float _457 = _423;
        float _459 = _457;
        if (_415)
        {
            float _461 = _355 * _443;
            _459 = _461;
        }
        float _463 = _459;
        _309 = _463;
        if (!_415)
        {
            _425 = 0.0;
        }
        float _465 = _425;
        float _467 = _465;
        if (_415)
        {
            float _469 = _361 * _443;
            _467 = _469;
        }
        float _471 = _467;
        _313 = _471;
        if (!_415)
        {
            _427 = 0.0;
        }
        float _473 = _427;
        float _475 = _473;
        if (_415)
        {
            float _477 = _377 * _443;
            _475 = _477;
        }
        float _479 = _475;
        _319 = _479;
        if (!_417)
        {
            _429 = 0.0;
        }
        float _481 = _429;
        float _483 = _481;
        _327 = _449;
        if (_417)
        {
            float _485 = _365 * _449;
            _483 = _485;
        }
        float _487 = _483;
        _311 = _487;
        if (!_417)
        {
            _431 = 0.0;
        }
        float _489 = _431;
        float _491 = _489;
        if (_417)
        {
            float _493 = _385 * _449;
            _491 = _493;
        }
        float _495 = _491;
        _323 = _495;
        if (!_417)
        {
            _433 = 0.0;
        }
        float _497 = _433;
        float _499 = _497;
        if (_417)
        {
            float _501 = _369 * _449;
            _499 = _501;
        }
        float _503 = _499;
        _317 = _503;
        if (!_419)
        {
            _435 = 0.0;
        }
        float _505 = _435;
        float _507 = _505;
        if (!_419)
        {
            _437 = 0.0;
        }
        float _509 = _437;
        float _511 = _509;
        if (_419)
        {
            float _513 = _373 * _455;
            _507 = _513;
        }
        float _515 = _507;
        _315 = _515;
        if (!_419)
        {
            _439 = 0.0;
        }
        float _517 = _439;
        _325 = _517;
        if (_419)
        {
            float _519 = _381 * _455;
            _511 = _519;
        }
        float _521 = _511;
        _321 = _521;
        if (_419)
        {
            float _523 = _389 * _455;
            _325 = _523;
        }
    }
    float _525 = _309;
    float _527 = _311;
    float _529 = _313;
    float _531 = _315;
    float _533 = _317;
    float _535 = _319;
    float _537 = _321;
    float _539 = _323;
    float _541 = _325;
    float _543 = _327;
    float _545 = _329;
    float _547 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _549 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[65]);
    float _551 = abs(_183);
    float _553 = log2(_551);
    float _555 = _175 * _181;
    float _557 = _173 * _181;
    float _559 = _303 * _169;
    float _561 = _555 * _525;
    float _563 = _555 * _527;
    float _565 = _177 * _181;
    float _567 = _169 * _553;
    float _569 = exp2(_567);
    float _571 = fma(_557, _529, _561);
    float _573 = _555 * _531;
    float _575 = fma(_557, _533, _563);
    float _577 = fma(_565, _535, _571);
    float _579 = fma(_557, _537, _573);
    float _581 = fma(_565, _539, _575);
    float _583 = _169 * _577;
    float _585 = fma(_565, _541, _579);
    float _587 = _169 * _581;
    float _589 = _169 * _585;
    float _591 = fma(_283, _569, _583);
    float _593 = fma(_295, _559, _263);
    float _595 = fma(_289, _569, _587);
    float _597 = fma(_295, _569, _589);
    bool _599 = _549 > 0.0;
    float _601 = fma(_283, _559, _251);
    float _603 = fma(_289, _559, _257);
    float _605 = -_307;
    float _607 = _547 + _605;
    float _609 = _559;
    float _611 = _543;
    float _613 = _545;
    bool _615 = _599;
    float _617 = _591;
    if (!_599)
    {
        _609 = _601;
    }
    float _619 = _609;
    float _621 = _619;
    float _623 = _619;
    if (!_599)
    {
        _611 = _603;
    }
    float _625 = _611;
    float _627 = _625;
    float _629 = _625;
    if (!_599)
    {
        _613 = _593;
    }
    float _631 = _613;
    bool _633 = !_599;
    float _635 = _631;
    float _637 = _631;
    float _639 = 0.0;
    float _641 = 0.0;
    float _643 = 0.0;
    float _645 = 0.0;
    if (!_633)
    {
        bool _647 = !_187;
        if (!_647)
        {
            float _649 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _651 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _653 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _655 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _657 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _659 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _661 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _663 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _665 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _667 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _669 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _671 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _673 = _603 * _651;
            float _675 = _603 * _659;
            float _677 = fma(_601, _649, _673);
            float _679 = _603 * _667;
            float _681 = fma(_601, _657, _675);
            float _683 = fma(_593, _653, _677);
            float _685 = fma(_601, _665, _679);
            float _687 = fma(_593, _661, _681);
            float _689 = _655 + _683;
            float _691 = fma(_593, _669, _685);
            float _693 = _663 + _687;
            float _695 = _671 + _691;
            _623 = _689;
            _637 = _695;
            _629 = _693;
            _639 = _649;
            _641 = _651;
            _643 = _653;
            _645 = _655;
            _697 = true;
        }
        else
        {
            int _699 = as_type<int>(_171) & 1024;
            bool _701 = _699 != 0;
            bool _703 = !_701;
            if (!_703)
            {
                float _705 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _707 = uint(int(uint(_245) >> uint(2)));
                float _709 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_707)]);
                int _711 = _245 + 4;
                uint _713 = uint(int(uint(_711) >> uint(2)));
                float _715 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_713)]);
                int _717 = _245 + 8;
                uint _719 = uint(int(uint(_717) >> uint(2)));
                float _721 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_719)]);
                int _723 = _245 + 12;
                uint _725 = uint(int(uint(_723) >> uint(2)));
                float _727 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_725)]);
                uint _729 = uint(int(uint(_245) >> uint(2)));
                float _731 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_729)]);
                int _733 = _245 + 4;
                uint _735 = uint(int(uint(_733) >> uint(2)));
                float _737 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_735)]);
                int _739 = _245 + 8;
                uint _741 = uint(int(uint(_739) >> uint(2)));
                float _743 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_741)]);
                uint _745 = uint(int(uint(_245) >> uint(2)));
                float _747 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_745)]);
                int _749 = _245 + 4;
                uint _751 = uint(int(uint(_749) >> uint(2)));
                float _753 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_751)]);
                int _755 = _245 + 8;
                uint _757 = uint(int(uint(_755) >> uint(2)));
                float _759 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_757)]);
                float _761 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _763 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _765 = _603 * _715;
                float _767 = _603 * _737;
                float _769 = _603 * _753;
                float _771 = fma(_601, _709, _765);
                float _773 = fma(_601, _731, _767);
                float _775 = fma(_601, _747, _769);
                float _777 = fma(_593, _721, _771);
                float _779 = fma(_593, _743, _773);
                float _781 = fma(_593, _759, _775);
                float _783 = _705 + _777;
                float _785 = _761 + _779;
                float _787 = _763 + _781;
                _623 = _783;
                _637 = _787;
                _629 = _785;
                _639 = _709;
                _641 = _715;
                _643 = _721;
                _645 = _727;
                _697 = true;
            }
            else
            {
                int _789 = as_type<int>(_171) & 2048;
                bool _791 = _789 != 0;
                if (!_791)
                {
                    _621 = _601;
                }
                float _793 = _621;
                _623 = _793;
                if (!_791)
                {
                    _627 = _603;
                }
                float _795 = _627;
                _629 = _795;
                if (!_791)
                {
                    _635 = _593;
                }
                float _797 = _635;
                bool _799 = !_791;
                _637 = _797;
                _639 = 0.0;
                _641 = 0.0;
                _643 = 0.0;
                _645 = 0.0;
                if (!_799)
                {
                    uint _801 = uint(int(uint(_245) >> uint(2)));
                    float _803 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_801)]);
                    int _805 = _245 + 4;
                    uint _807 = uint(int(uint(_805) >> uint(2)));
                    float _809 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_807)]);
                    int _811 = _245 + 8;
                    uint _813 = uint(int(uint(_811) >> uint(2)));
                    float _815 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_813)]);
                    int _817 = _245 + 12;
                    uint _819 = uint(int(uint(_817) >> uint(2)));
                    float _821 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_819)]);
                    uint _823 = uint(int(uint(_245) >> uint(2)));
                    float _825 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_823)]);
                    int _827 = _245 + 4;
                    uint _829 = uint(int(uint(_827) >> uint(2)));
                    float _831 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_829)]);
                    int _833 = _245 + 8;
                    uint _835 = uint(int(uint(_833) >> uint(2)));
                    float _837 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_835)]);
                    int _839 = _245 + 12;
                    uint _841 = uint(int(uint(_839) >> uint(2)));
                    float _843 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_841)]);
                    uint _845 = uint(int(uint(_245) >> uint(2)));
                    float _847 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_845)]);
                    int _849 = _245 + 4;
                    uint _851 = uint(int(uint(_849) >> uint(2)));
                    float _853 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_851)]);
                    int _855 = _245 + 8;
                    uint _857 = uint(int(uint(_855) >> uint(2)));
                    float _859 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_857)]);
                    int _861 = _245 + 12;
                    uint _863 = uint(int(uint(_861) >> uint(2)));
                    float _865 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_863)]);
                    float _867 = _603 * _809;
                    float _869 = _603 * _831;
                    float _871 = _603 * _853;
                    float _873 = fma(_601, _803, _867);
                    float _875 = fma(_601, _825, _869);
                    float _877 = fma(_601, _847, _871);
                    float _879 = fma(_593, _815, _873);
                    float _881 = fma(_593, _837, _875);
                    float _883 = fma(_593, _859, _877);
                    float _885 = _879 + _821;
                    float _887 = _881 + _843;
                    float _889 = _883 + _865;
                    _623 = _885;
                    _637 = _889;
                    _629 = _887;
                    _639 = _803;
                    _641 = _809;
                    _643 = _815;
                    _645 = _821;
                }
            }
        }
    }
    _697 = false;
    float _891 = _623;
    float _893 = _637;
    float _895 = _629;
    float _897 = _639;
    float _899 = _641;
    float _901 = _643;
    float _903 = _645;
    float _905 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[64]);
    float _907 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _909 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[62]);
    float _911 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _913 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[59]);
    float _915 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[63]);
    bool _917 = _905 != 0.0;
    bool _919 = isnan(_905);
    bool _921 = _917 || _919;
    bool _923 = isnan(0.0);
    bool _925 = _921 || _923;
    float _927 = _547 * _907;
    float _929 = _547 * _909;
    float _931 = _547 * _911;
    float _933 = fma(_913, _891, _927);
    float _935 = fma(_913, _893, _929);
    float _937 = fma(_913, _895, _931);
    float _939 = _915;
    float _941 = _895;
    float _943 = _897;
    float _945 = _899;
    float _947 = _901;
    float _949 = _903;
    if (_925)
    {
        float _951 = _299 * _915;
        _939 = _951;
    }
    float _953 = _939;
    float _955 = _937 + _953;
    float _957 = -_953;
    bool _959 = _933 >= _957;
    bool _961 = isnan(_933);
    bool _963 = _959 || _961;
    bool _965 = isnan(_957);
    bool _967 = _963 || _965;
    float _969 = _933 + _953;
    float _971 = -_953;
    bool _973 = _935 >= _971;
    bool _975 = isnan(_935);
    bool _977 = _973 || _975;
    bool _979 = isnan(_971);
    bool _981 = _977 || _979;
    float _983 = _935 + _953;
    float _985 = -_953;
    bool _987 = _937 >= _985;
    bool _989 = isnan(_937);
    bool _991 = _987 || _989;
    bool _993 = isnan(_985);
    bool _995 = _991 || _993;
    bool _997 = !_967;
    float _999 = -_969;
    float _1001 = _997 ? _999 : _969;
    bool _1003 = !_981;
    float _1005 = -_983;
    float _1007 = _1003 ? _1005 : _983;
    bool _1009 = !_995;
    float _1011 = -_955;
    float _1013 = _1009 ? _1011 : _955;
    float _1015 = _1001 * 0.03125;
    float _1017 = _1007 * 0.03125;
    float _1019 = _1013 * 0.03125;
    float3 _4398 = float3(_1015, _1019, _1017);
    float3 _1023 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_4398, float3(0.0), isnan(_4398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_4398, float3(0.0), isnan(_4398)), level(0.0)).xyz;
    float _1025 = _1023.x;
    float _1027 = _1023.y;
    float _1029 = _1023.z;
    float _1031 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[57]);
    float _1033 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[56]);
    float _1035 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[58]);
    float _1037 = _1027 + (-0.5);
    float _1039 = _1025 + (-0.5);
    float _1041 = _1029 + (-0.5);
    float _1043 = _1037 * _1031;
    float _1045 = _1039 * _1033;
    float _1047 = _1041 * _1035;
    float _1049 = _1045;
    float _1051 = _1047;
    float _1053 = _1035;
    if (!_599)
    {
        _331 = _1043;
    }
    float _1055 = _331;
    bool _1057 = !_599;
    float _1059 = _1055;
    float _1061 = _1055;
    float _1063 = 0.0;
    float _1065 = 0.0;
    if (!_1057)
    {
        bool _1067 = !_187;
        if (!_1067)
        {
            float _1069 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1071 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1073 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1075 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1077 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1079 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1081 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1083 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1085 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1087 = _1073 * _1075;
            float _1089 = _1073 * _1077;
            float _1091 = _1071 * _1075;
            float _1093 = -_1087;
            float _1095 = fma(_1069, _1079, _1093);
            float _1097 = -_1089;
            float _1099 = fma(_1071, _1079, _1097);
            float _1101 = -_1091;
            float _1103 = fma(_1069, _1077, _1101);
            float _1105 = _1083 * _1069;
            float _1107 = _1083 * _1095;
            float _1109 = _1085 * _1071;
            float _1111 = _1081 * _1077;
            float _1113 = -_1105;
            float _1115 = fma(_1081, _1071, _1113);
            float _1117 = -_1107;
            float _1119 = fma(_1081, _1099, _1117);
            float _1121 = _1083 * _1079;
            float _1123 = _1085 * _1075;
            float _1125 = _1081 * _1073;
            float _1127 = fma(_1085, _1103, _1119);
            float _1129 = -_1121;
            float _1131 = fma(_1085, _1077, _1129);
            float _1133 = -_1123;
            float _1135 = fma(_1081, _1079, _1133);
            float _1137 = -_1111;
            float _1139 = fma(_1083, _1075, _1137);
            float _1141 = 1.0 / _1127;
            float _1143 = -_1125;
            float _1145 = fma(_1085, _1069, _1143);
            float _1147 = -_1069;
            float _1149 = fma(_1147, _1079, _1087);
            float _1151 = -_1109;
            float _1153 = fma(_1083, _1073, _1151);
            float _1155 = _1131 * _1141;
            float _1157 = _1135 * _1141;
            float _1159 = _1139 * _1141;
            float _1161 = _1149 * _1141;
            float _1163 = _1043 * _1155;
            float _1165 = _1043 * _1157;
            float _1167 = _1045 * _1141;
            float _1169 = _1043 * _1159;
            float _1171 = _1153 * _1141;
            float _1173 = _1145 * _1141;
            float _1175 = fma(_1099, _1167, _1163);
            float _1177 = fma(_1045, _1161, _1165);
            float _1179 = _1115 * _1141;
            float _1181 = fma(_1103, _1167, _1169);
            float _1183 = fma(_1047, _1171, _1175);
            float _1185 = fma(_1047, _1173, _1177);
            float _1187 = fma(_1047, _1179, _1181);
            _1049 = _1183;
            _1061 = _1185;
            _1051 = _1187;
            _1053 = _1171;
            _941 = _1181;
            _943 = _1165;
            _945 = _1083;
            _947 = _1085;
            _949 = _1115;
            _1063 = _1157;
            _1065 = _1145;
            _1189 = true;
        }
        else
        {
            int _1191 = as_type<int>(_171) & 1024;
            bool _1193 = _1191 != 0;
            if (_1193)
            {
                _615 = true;
            }
            bool _1195 = _615;
            bool _1197 = _1195;
            if (!_1193)
            {
                int _1199 = as_type<int>(_171) & 2048;
                bool _1201 = _1199 != 0;
                _1197 = _1201;
            }
            bool _1203 = _1197;
            if (!_1203)
            {
                _1059 = _1043;
            }
            float _1205 = _1059;
            bool _1207 = !_1203;
            _1061 = _1205;
            _1063 = 0.0;
            _1065 = 0.0;
            if (!_1207)
            {
                uint _1209 = uint(int(uint(_245) >> uint(2)));
                float _1211 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1209)]);
                int _1213 = _245 + 4;
                uint _1215 = uint(int(uint(_1213) >> uint(2)));
                float _1217 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1215)]);
                int _1219 = _245 + 8;
                uint _1221 = uint(int(uint(_1219) >> uint(2)));
                float _1223 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1221)]);
                uint _1225 = uint(int(uint(_245) >> uint(2)));
                float _1227 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1225)]);
                int _1229 = _245 + 4;
                uint _1231 = uint(int(uint(_1229) >> uint(2)));
                float _1233 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1231)]);
                int _1235 = _245 + 8;
                uint _1237 = uint(int(uint(_1235) >> uint(2)));
                float _1239 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1237)]);
                uint _1241 = uint(int(uint(_245) >> uint(2)));
                float _1243 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1241)]);
                int _1245 = _245 + 4;
                uint _1247 = uint(int(uint(_1245) >> uint(2)));
                float _1249 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1247)]);
                int _1251 = _245 + 8;
                uint _1253 = uint(int(uint(_1251) >> uint(2)));
                float _1255 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1253)]);
                float _1257 = _1223 * _1227;
                float _1259 = _1223 * _1233;
                float _1261 = _1217 * _1227;
                float _1263 = -_1257;
                float _1265 = fma(_1211, _1239, _1263);
                float _1267 = -_1259;
                float _1269 = fma(_1217, _1239, _1267);
                float _1271 = -_1261;
                float _1273 = fma(_1211, _1233, _1271);
                float _1275 = _1249 * _1211;
                float _1277 = _1249 * _1265;
                float _1279 = _1255 * _1217;
                float _1281 = _1243 * _1233;
                float _1283 = -_1275;
                float _1285 = fma(_1243, _1217, _1283);
                float _1287 = -_1277;
                float _1289 = fma(_1243, _1269, _1287);
                float _1291 = _1249 * _1239;
                float _1293 = _1255 * _1227;
                float _1295 = _1243 * _1223;
                float _1297 = fma(_1255, _1273, _1289);
                float _1299 = -_1291;
                float _1301 = fma(_1255, _1233, _1299);
                float _1303 = -_1293;
                float _1305 = fma(_1243, _1239, _1303);
                float _1307 = -_1281;
                float _1309 = fma(_1249, _1227, _1307);
                float _1311 = 1.0 / _1297;
                float _1313 = -_1295;
                float _1315 = fma(_1255, _1211, _1313);
                float _1317 = -_1211;
                float _1319 = fma(_1317, _1239, _1257);
                float _1321 = -_1279;
                float _1323 = fma(_1249, _1223, _1321);
                float _1325 = _1301 * _1311;
                float _1327 = _1305 * _1311;
                float _1329 = _1309 * _1311;
                float _1331 = _1319 * _1311;
                float _1333 = _1043 * _1325;
                float _1335 = _1043 * _1327;
                float _1337 = _1045 * _1311;
                float _1339 = _1043 * _1329;
                float _1341 = _1323 * _1311;
                float _1343 = _1315 * _1311;
                float _1345 = fma(_1269, _1337, _1333);
                float _1347 = fma(_1045, _1331, _1335);
                float _1349 = _1285 * _1311;
                float _1351 = fma(_1273, _1337, _1339);
                float _1353 = fma(_1047, _1341, _1345);
                float _1355 = fma(_1047, _1343, _1347);
                float _1357 = fma(_1047, _1349, _1351);
                _1049 = _1353;
                _1061 = _1355;
                _1051 = _1357;
                _1053 = _1341;
                _941 = _1351;
                _943 = _1335;
                _945 = _1249;
                _947 = _1255;
                _949 = _1285;
                _1063 = _1327;
                _1065 = _1315;
            }
        }
    }
    _1189 = false;
    float _1359 = _1049;
    float _1361 = _1061;
    float _1363 = _1051;
    float _1365 = _1053;
    float _1367 = _941;
    float _1369 = _943;
    float _1371 = _945;
    float _1373 = _947;
    float _1375 = _949;
    float _1377 = _1063;
    float _1379 = _1065;
    float _1381 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _1383 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _1385 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _1387 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _1389 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _1391 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _1393 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    float _1395 = fma(_169, _1359, _591);
    uint _1397 = uint(int(uint(_247) >> uint(2)));
    float _1399 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1397)]);
    float _1401 = fma(_169, _1361, _595);
    float _1403 = fma(_169, _1363, _597);
    bool _1405 = _1381 > 0.0;
    bool _1407 = _1383 > 0.0;
    float _1409 = _1385 * _1383;
    float _1411 = _169 * _1387;
    float _1413 = _1365;
    float _1415 = _1385;
    float _1417 = _1367;
    bool _1419 = _1407;
    float _1421 = _1369;
    float _1423 = _1371;
    float _1425 = _1373;
    float _1427 = _1375;
    float _1429 = _1361;
    float _1431 = _1411;
    float _1433 = _1389;
    float _1435 = _1393;
    float _1437 = _1409;
    float _1439 = _1377;
    float _1441 = _1379;
    float _1443 = _1401;
    if (_1405)
    {
        float _1445 = 1.0 / _1381;
        _1413 = _1445;
    }
    float _1447 = _1413;
    float _1449 = _169 * _1391;
    float _1451 = _1449;
    if (_1407)
    {
        float _1453 = -_1409;
        float _1455 = fma(_299, _1453, _1385);
        _1415 = _1455;
    }
    float _1457 = _1415;
    float _1459 = _169 * _1389;
    float _1461 = _1447;
    float _1463 = _1457;
    float _1465 = _1459;
    if (_1405)
    {
        float _1467 = _607 * _1447;
        _1417 = _1467;
    }
    float _1469 = _1417;
    if (_1405)
    {
        float _1471 = precise::min(_1469, 1.0);
        _1461 = _1471;
    }
    float _1473 = _1461;
    if (_1405)
    {
        float _1475 = _1473 * _1457;
        _1463 = _1475;
    }
    float _1477 = _1463;
    float _1479 = _1411 * _1477;
    float _1481 = _1459 * _1477;
    float _1483 = _1449 * _1477;
    bool _1485 = !_187;
    float _1487 = _1477;
    float _1489 = _1479;
    float _1491 = _1483;
    int _1493 = as_type<int>(_1399);
    float _1617;
    if (!_1485)
    {
        float _1495 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1497 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1499 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1501 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1503 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1505 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1507 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1509 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1511 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1513 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _1515 = _1499 * _1501;
        float _1517 = _1499 * _1503;
        float _1519 = _1497 * _1501;
        float _1521 = -_1515;
        float _1523 = fma(_1495, _1505, _1521);
        float _1525 = -_1517;
        float _1527 = fma(_1497, _1505, _1525);
        float _1529 = _1511 * _1497;
        float _1531 = _1511 * _1501;
        float _1533 = _1509 * _1523;
        float _1535 = -_1519;
        float _1537 = fma(_1495, _1503, _1535);
        float _1539 = _1509 * _1495;
        float _1541 = _1507 * _1503;
        float _1543 = -_1533;
        float _1545 = fma(_1507, _1527, _1543);
        float _1547 = -_1531;
        float _1549 = fma(_1507, _1505, _1547);
        float _1551 = -_1539;
        float _1553 = fma(_1507, _1497, _1551);
        float _1555 = _1509 * _1505;
        float _1557 = fma(_1511, _1537, _1545);
        float _1559 = -_1529;
        float _1561 = fma(_1509, _1499, _1559);
        float _1563 = _1507 * _1499;
        float _1565 = -_1555;
        float _1567 = fma(_1511, _1503, _1565);
        float _1569 = 1.0 / _1557;
        float _1571 = -_1541;
        float _1573 = fma(_1509, _1501, _1571);
        float _1575 = -_1563;
        float _1577 = fma(_1511, _1495, _1575);
        float _1579 = -_1495;
        float _1581 = fma(_1579, _1505, _1515);
        float _1583 = _1567 * _1569;
        float _1585 = _1549 * _1569;
        float _1587 = _1573 * _1569;
        float _1589 = _1581 * _1569;
        float _1591 = _1583 * _1481;
        float _1593 = _1585 * _1481;
        float _1595 = _1479 * _1569;
        float _1597 = _1587 * _1481;
        float _1599 = _1561 * _1569;
        float _1601 = _1577 * _1569;
        float _1603 = fma(_1527, _1595, _1591);
        float _1605 = fma(_1589, _1479, _1593);
        float _1607 = _1553 * _1569;
        float _1609 = fma(_1537, _1595, _1597);
        float _1611 = fma(_1599, _1483, _1603);
        float _1613 = fma(_1601, _1483, _1605);
        float _1615 = fma(_1607, _1483, _1609);
        _1421 = _1587;
        _1423 = _1573;
        _1425 = _1511;
        _1427 = _1513;
        _1465 = _1609;
        _1429 = _1503;
        _617 = _1505;
        _195 = _1599;
        _1431 = _1603;
        _1433 = _1597;
        _1451 = _1605;
        _1435 = _1589;
        _1617 = _1613;
        _1489 = _1611;
        _1491 = _1615;
        _1437 = _1527;
        _1439 = _1601;
        _1441 = _1607;
        _1619 = true;
    }
    else
    {
        int _1621 = as_type<int>(_171) & 1024;
        bool _1623 = _1621 != 0;
        if (_1623)
        {
            _1419 = true;
        }
        bool _1625 = _1419;
        bool _1627 = _1625;
        if (!_1623)
        {
            int _1629 = as_type<int>(_171) & 2048;
            bool _1631 = _1629 != 0;
            _1627 = _1631;
        }
        bool _1633 = _1627;
        if (!_1633)
        {
            _1487 = _1481;
        }
        float _1635 = _1487;
        bool _1637 = !_1633;
        _1617 = _1635;
        if (!_1637)
        {
            uint _1639 = uint(int(uint(_245) >> uint(2)));
            float _1641 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1639)]);
            int _1643 = _245 + 4;
            uint _1645 = uint(int(uint(_1643) >> uint(2)));
            float _1647 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1645)]);
            int _1649 = _245 + 8;
            uint _1651 = uint(int(uint(_1649) >> uint(2)));
            float _1653 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1651)]);
            uint _1655 = uint(int(uint(_245) >> uint(2)));
            float _1657 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1655)]);
            int _1659 = _245 + 4;
            uint _1661 = uint(int(uint(_1659) >> uint(2)));
            float _1663 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1661)]);
            int _1665 = _245 + 8;
            uint _1667 = uint(int(uint(_1665) >> uint(2)));
            float _1669 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1667)]);
            uint _1671 = uint(int(uint(_245) >> uint(2)));
            float _1673 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1671)]);
            int _1675 = _245 + 4;
            uint _1677 = uint(int(uint(_1675) >> uint(2)));
            float _1679 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1677)]);
            int _1681 = _245 + 8;
            uint _1683 = uint(int(uint(_1681) >> uint(2)));
            float _1685 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1683)]);
            int _1687 = _245 + 12;
            uint _1689 = uint(int(uint(_1687) >> uint(2)));
            float _1691 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1689)]);
            float _1693 = _1653 * _1657;
            float _1695 = _1653 * _1663;
            float _1697 = _1647 * _1657;
            float _1699 = -_1693;
            float _1701 = fma(_1641, _1669, _1699);
            float _1703 = -_1695;
            float _1705 = fma(_1647, _1669, _1703);
            float _1707 = _1685 * _1647;
            float _1709 = _1685 * _1657;
            float _1711 = _1679 * _1701;
            float _1713 = -_1697;
            float _1715 = fma(_1641, _1663, _1713);
            float _1717 = _1679 * _1641;
            float _1719 = _1673 * _1663;
            float _1721 = -_1711;
            float _1723 = fma(_1673, _1705, _1721);
            float _1725 = -_1709;
            float _1727 = fma(_1673, _1669, _1725);
            float _1729 = -_1717;
            float _1731 = fma(_1673, _1647, _1729);
            float _1733 = _1679 * _1669;
            float _1735 = fma(_1685, _1715, _1723);
            float _1737 = -_1707;
            float _1739 = fma(_1679, _1653, _1737);
            float _1741 = _1673 * _1653;
            float _1743 = -_1733;
            float _1745 = fma(_1685, _1663, _1743);
            float _1747 = 1.0 / _1735;
            float _1749 = -_1719;
            float _1751 = fma(_1679, _1657, _1749);
            float _1753 = -_1741;
            float _1755 = fma(_1685, _1641, _1753);
            float _1757 = -_1641;
            float _1759 = fma(_1757, _1669, _1693);
            float _1761 = _1745 * _1747;
            float _1763 = _1727 * _1747;
            float _1765 = _1751 * _1747;
            float _1767 = _1759 * _1747;
            float _1769 = _1761 * _1481;
            float _1771 = _1763 * _1481;
            float _1773 = _1479 * _1747;
            float _1775 = _1765 * _1481;
            float _1777 = _1739 * _1747;
            float _1779 = _1755 * _1747;
            float _1781 = fma(_1705, _1773, _1769);
            float _1783 = fma(_1767, _1479, _1771);
            float _1785 = _1731 * _1747;
            float _1787 = fma(_1715, _1773, _1775);
            float _1789 = fma(_1777, _1483, _1781);
            float _1791 = fma(_1779, _1483, _1783);
            float _1793 = fma(_1785, _1483, _1787);
            _1421 = _1765;
            _1423 = _1751;
            _1425 = _1685;
            _1427 = _1691;
            _1465 = _1787;
            _1429 = _1663;
            _617 = _1669;
            _195 = _1777;
            _1431 = _1781;
            _1433 = _1775;
            _1451 = _1783;
            _1435 = _1767;
            _1617 = _1791;
            _1489 = _1789;
            _1491 = _1793;
            _1437 = _1705;
            _1439 = _1779;
            _1441 = _1785;
        }
    }
    _1619 = false;
    float _1795 = _1421;
    float _1797 = _1423;
    float _1799 = _1425;
    float _1801 = _1427;
    float _1803 = _1465;
    float _1805 = _1429;
    float _1807 = _617;
    float _1809 = _195;
    float _1811 = _1431;
    float _1813 = _1433;
    float _1815 = _1451;
    float _1817 = _1435;
    float _1819 = _1617;
    float _1821 = _1489;
    float _1823 = _1491;
    float _1825 = _1437;
    float _1827 = _1439;
    float _1829 = _1441;
    uint _1831 = uint(int(uint(_247) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1831)] = as_type<uint>(_1399);
    float _1833 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1835 = as_type<int>(_1833) & 512;
    bool _1837 = _1835 != 0;
    int _1839 = as_type<int>(_1833) & 1024;
    bool _1841 = _1839 != 0;
    float _1843 = _1795;
    float _1845 = _1797;
    float _1847 = _1799;
    float _1849 = _1801;
    float _1851 = _1819;
    float _1853 = _1821;
    float _1855 = _1823;
    float _1857 = _1825;
    float _1859 = _1833;
    float _1861 = _1827;
    float _1863 = _1829;
    if (_1837)
    {
        float _1865 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1867 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1869 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1871 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1843 = _1865;
        _1845 = _1867;
        _1847 = _1869;
        _1849 = _1871;
    }
    float _1873 = _1843;
    float _1875 = _1845;
    float _1877 = _1847;
    float _1879 = _1849;
    float _1881 = _1803;
    float _1883 = _1805;
    float _1885 = _1807;
    float _1887 = _1809;
    if (_1837)
    {
        float _1889 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1891 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1893 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1895 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1881 = _1889;
        _1883 = _1891;
        _1885 = _1893;
        _1887 = _1895;
    }
    float _1897 = _1881;
    float _1899 = _1883;
    float _1901 = _1885;
    float _1903 = _1887;
    float _1905 = _1811;
    float _1907 = _1813;
    float _1909 = _1815;
    float _1911 = _1817;
    if (_1837)
    {
        float _1913 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1915 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1917 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1919 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1905 = _1913;
        _1907 = _1915;
        _1909 = _1917;
        _1911 = _1919;
    }
    float _1921 = _1905;
    float _1923 = _1907;
    float _1925 = _1909;
    float _1927 = _1911;
    float _1929 = _603 + _1819;
    float _1931 = _601 + _1821;
    float _1933 = _593 + _1823;
    float _1935 = _1929;
    if (!_1837)
    {
        _1851 = 0.0;
    }
    float _1937 = _1851;
    float _1939 = _1937;
    if (!_1837)
    {
        _1853 = 0.0;
    }
    float _1941 = _1853;
    float _1943 = _1941;
    if (!_1837)
    {
        _1855 = 0.0;
    }
    float _1945 = _1855;
    int _1947 = as_type<int>(_1833) & 2048;
    bool _1949 = _1947 != 0;
    float _1951 = _1875;
    float _1953 = _1877;
    float _1955 = _1945;
    float _1957 = _1873;
    if (_1837)
    {
        float _1959 = _1929 * _1875;
        _1951 = _1959;
    }
    float _1961 = _1951;
    float _1963 = _1899;
    float _1965 = _1961;
    float _1967 = _1897;
    float _1969 = _1921;
    float _1971 = _1903;
    float _1973 = _1927;
    int _1975 = as_type<int>(_1925);
    if (_1837)
    {
        float _1977 = _1929 * _1899;
        _1963 = _1977;
    }
    float _1979 = _1963;
    if (_1837)
    {
        float _1981 = fma(_1931, _1873, _1961);
        _1965 = _1981;
    }
    float _1983 = _1965;
    float _1985 = _1983;
    if (_1837)
    {
        float _1987 = _1929 * _1923;
        _1857 = _1987;
    }
    float _1989 = _1857;
    if (_1837)
    {
        float _1991 = fma(_1931, _1897, _1979);
        _1967 = _1991;
    }
    float _1993 = _1967;
    float _1995 = _1993;
    if (_1837)
    {
        float _1997 = fma(_1933, _1877, _1983);
        _1953 = _1997;
    }
    float _1999 = _1953;
    if (_1837)
    {
        float _2001 = fma(_1931, _1921, _1989);
        _1969 = _2001;
    }
    float _2003 = _1969;
    float _2005 = _2003;
    if (_1837)
    {
        float _2007 = fma(_1933, _1901, _1993);
        _1995 = _2007;
    }
    float _2009 = _1995;
    float _2011 = _2009;
    if (_1837)
    {
        float _2013 = _1879 + _1999;
        _1939 = _2013;
    }
    float _2015 = _1939;
    float _2017 = _2015;
    if (_1837)
    {
        float _2019 = fma(_1933, _1925, _2003);
        _2005 = _2019;
    }
    float _2021 = _2005;
    if (_1837)
    {
        float _2023 = _1903 + _2009;
        _1943 = _2023;
    }
    float _2025 = _1943;
    float _2027 = _2025;
    if (!_1841)
    {
        _1971 = _2015;
    }
    float _2029 = _1971;
    float _2031 = _2029;
    if (_1837)
    {
        float _2033 = _1927 + _2021;
        _1955 = _2033;
    }
    float _2035 = _1955;
    float _2037 = _2035;
    if (!_1841)
    {
        _1973 = _2025;
    }
    float _2039 = _1973;
    bool _2041 = !_1841;
    float _2043 = _2039;
    if (!_2041)
    {
        float _2045 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2047 = uint(int(uint(_245) >> uint(2)));
        float _2049 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2047)]);
        int _2051 = _245 + 4;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        float _2055 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2053)]);
        int _2057 = _245 + 8;
        uint _2059 = uint(int(uint(_2057) >> uint(2)));
        float _2061 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2059)]);
        uint _2063 = uint(int(uint(_245) >> uint(2)));
        float _2065 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2063)]);
        int _2067 = _245 + 4;
        uint _2069 = uint(int(uint(_2067) >> uint(2)));
        float _2071 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2069)]);
        int _2073 = _245 + 8;
        uint _2075 = uint(int(uint(_2073) >> uint(2)));
        float _2077 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2075)]);
        uint _2079 = uint(int(uint(_245) >> uint(2)));
        float _2081 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2079)]);
        int _2083 = _245 + 4;
        uint _2085 = uint(int(uint(_2083) >> uint(2)));
        float _2087 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2085)]);
        int _2089 = _245 + 8;
        uint _2091 = uint(int(uint(_2089) >> uint(2)));
        float _2093 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2091)]);
        float _2095 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2097 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2099 = _1929 * _2055;
        float _2101 = _1929 * _2071;
        float _2103 = _1929 * _2087;
        float _2105 = fma(_1931, _2049, _2099);
        float _2107 = fma(_1931, _2065, _2101);
        float _2109 = fma(_1931, _2081, _2103);
        float _2111 = fma(_1933, _2061, _2105);
        float _2113 = fma(_1933, _2077, _2107);
        float _2115 = fma(_1933, _2093, _2109);
        float _2117 = _2045 + _2111;
        float _2119 = _2095 + _2113;
        float _2121 = _2097 + _2115;
        _2011 = _2111;
        _2031 = _2119;
        _1957 = _2065;
        _1985 = _2107;
        _1975 = as_type<int>(_2115);
        _2043 = _2121;
        _2037 = _2117;
        _2027 = _2095;
        _2017 = _2097;
    }
    float _2123 = _2011;
    float _2125 = _2031;
    float _2127 = _1957;
    float _2129 = _1985;
    int _2131 = _1975;
    float _2133 = _2043;
    float _2135 = _2037;
    float _2137 = _2027;
    float _2139 = _2017;
    bool _2141 = !_1949;
    float _2143 = _2135;
    float _2145 = _2133;
    float _2147 = _2123;
    int _2149 = _2131;
    float _2151 = _2129;
    float _2153 = _2125;
    float _2155 = _2127;
    if (!_2141)
    {
        uint _2157 = uint(int(uint(_245) >> uint(2)));
        float _2159 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2157)]);
        int _2161 = _245 + 4;
        uint _2163 = uint(int(uint(_2161) >> uint(2)));
        float _2165 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2163)]);
        int _2167 = _245 + 8;
        uint _2169 = uint(int(uint(_2167) >> uint(2)));
        float _2171 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2169)]);
        int _2173 = _245 + 12;
        uint _2175 = uint(int(uint(_2173) >> uint(2)));
        float _2177 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2175)]);
        uint _2179 = uint(int(uint(_245) >> uint(2)));
        float _2181 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2179)]);
        int _2183 = _245 + 4;
        uint _2185 = uint(int(uint(_2183) >> uint(2)));
        float _2187 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2185)]);
        int _2189 = _245 + 8;
        uint _2191 = uint(int(uint(_2189) >> uint(2)));
        float _2193 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2191)]);
        int _2195 = _245 + 12;
        uint _2197 = uint(int(uint(_2195) >> uint(2)));
        float _2199 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2197)]);
        uint _2201 = uint(int(uint(_245) >> uint(2)));
        float _2203 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2201)]);
        int _2205 = _245 + 4;
        uint _2207 = uint(int(uint(_2205) >> uint(2)));
        float _2209 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2207)]);
        int _2211 = _245 + 8;
        uint _2213 = uint(int(uint(_2211) >> uint(2)));
        float _2215 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2213)]);
        int _2217 = _245 + 12;
        uint _2219 = uint(int(uint(_2217) >> uint(2)));
        float _2221 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2219)]);
        float _2223 = _1929 * _2165;
        float _2225 = _1929 * _2187;
        float _2227 = fma(_1931, _2159, _2223);
        float _2229 = _1929 * _2209;
        float _2231 = fma(_1931, _2181, _2225);
        float _2233 = fma(_1931, _2203, _2229);
        float _2235 = fma(_1933, _2171, _2227);
        float _2237 = fma(_1933, _2193, _2231);
        float _2239 = fma(_1933, _2215, _2233);
        float _2241 = _2235 + _2177;
        float _2243 = _2237 + _2199;
        float _2245 = _2239 + _2221;
        _2143 = _2241;
        _2145 = _2245;
        _2147 = _2235;
        _2149 = as_type<int>(_2239);
        _2151 = _2231;
        _2153 = _2243;
        _2155 = _2181;
    }
    float _2247 = _2143;
    float _2249 = _2145;
    float _2251 = _2147;
    int _2253 = _2149;
    float _2255 = _2151;
    float _2257 = _2153;
    float _2259 = _2155;
    float _2261 = fma(_2247, 6.2500002968590706586837768554688e-05, 0.5);
    float _2263 = fma(_2249, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _6265 = float2(_2261, _2263);
    float _2265 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6265, float2(0.0), isnan(_6265)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6265, float2(0.0), isnan(_6265)), level(0.0)).x;
    bool _2267 = _607 > 0.001000000047497451305389404296875;
    bool _2269 = isnan(_607);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(0.001000000047497451305389404296875);
    bool _2275 = _2271 || _2273;
    float _2277 = _2137;
    float _2279 = _2251;
    int _2281 = _2253;
    float _2283 = _2259;
    float _2285 = _2255;
    if (!_2275)
    {
        float _2287 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _2277 = _2287;
    }
    float _2289 = _2277;
    bool _2291 = _2265 != 0.0;
    bool _2293 = isnan(_2265);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan(0.0);
    bool _2299 = _2295 || _2297;
    bool _2301 = _2299;
    if (!_2299)
    {
        _2279 = 4.0;
    }
    float _2303 = _2279;
    float _2305 = _2265;
    if (!_2299)
    {
        float2 _6324 = float2(_2261, _2263);
        float _2307 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6324, float2(0.0), isnan(_6324)), level(_2303)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6324, float2(0.0), isnan(_6324)), level(_2303)).x;
        _2305 = _2307;
    }
    float _2309 = _2305;
    float _2311 = _2139;
    if (!_2275)
    {
        float2 _6340 = float2(_2261, _2263);
        float _2313 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6340, float2(0.0), isnan(_6340)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6340, float2(0.0), isnan(_6340)), level(0.0)).x;
        _2311 = _2313;
    }
    float _2315 = _2311;
    float _2317 = fma(_2247, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _2319 = fma(_2247, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float2 _6357 = float2(_2317, _2263);
    float _2321 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6357, float2(0.0), isnan(_6357)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6357, float2(0.0), isnan(_6357)), level(0.0)).x;
    float2 _6365 = float2(_2319, _2263);
    float _2323 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6365, float2(0.0), isnan(_6365)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6365, float2(0.0), isnan(_6365)), level(0.0)).x;
    float2 _6373 = float2(_2261, _2263);
    float2 _2327 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6373, float2(0.0), isnan(_6373)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6373, float2(0.0), isnan(_6373)), level(0.0)).xy;
    float _2329 = _2327.x;
    float _2331 = _2327.y;
    int _2333 = _245 + 4;
    float _2335 = _2317;
    if (!_2275)
    {
        float _2337 = fma(_2309, 2000.0, _2289);
        _2281 = as_type<int>(_2337);
    }
    int _2339 = _2281;
    if (!_2275)
    {
        uint _2341 = uint(int(uint(_2333) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_2341)] = uint(_2339);
    }
    float _2343 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
    uint _2345 = uint(int(uint(_2333) >> uint(2)));
    float _2347 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2345)]);
    if (!_2275)
    {
        float _2349 = _2315 * 2000.0;
        _2283 = _2349;
    }
    float _2351 = _2283;
    float _2353 = fma(_2309, 2000.0, _2343);
    float _2355 = _1929 + _2347;
    bool _2357 = _2355 >= _2353;
    bool _2359 = isnan(_2355);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan(_2353);
    bool _2365 = _2361 || _2363;
    float _2367 = _2353;
    if (!_2365)
    {
        float _2369 = -_2347;
        float _2371 = _2353 + _2369;
        _2367 = _2371;
    }
    float _2373 = _2367;
    int _2375 = as_type<int>(_2373);
    if (!_2365)
    {
        float _2377 = fma(_2373, 0.00999999977648258209228515625, _2347);
        _2375 = as_type<int>(_2377);
    }
    int _2379 = _2375;
    if (!_2365)
    {
        uint _2381 = uint(int(uint(_2333) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_2381)] = uint(_2379);
    }
    if (!_2275)
    {
        float _2383 = fma(_2249, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _6491 = float2(_2317, _2383);
        float _2385 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6491, float2(0.0), isnan(_6491)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6491, float2(0.0), isnan(_6491)), level(0.0)).x;
        float2 _6499 = float2(_2319, _2383);
        float _2387 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6499, float2(0.0), isnan(_6499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6499, float2(0.0), isnan(_6499)), level(0.0)).x;
        float _2389 = fma(_2249, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        bool _2391 = _2321 != 0.0;
        bool _2393 = isnan(_2321);
        bool _2395 = _2391 || _2393;
        bool _2397 = isnan(0.0);
        bool _2399 = _2395 || _2397;
        float2 _6520 = float2(_2261, _2383);
        float _2401 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6520, float2(0.0), isnan(_6520)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6520, float2(0.0), isnan(_6520)), level(0.0)).x;
        bool _2403 = _2323 != 0.0;
        bool _2405 = isnan(_2323);
        bool _2407 = _2403 || _2405;
        bool _2409 = isnan(0.0);
        bool _2411 = _2407 || _2409;
        float2 _6539 = float2(_2317, _2389);
        float _2413 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6539, float2(0.0), isnan(_6539)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6539, float2(0.0), isnan(_6539)), level(0.0)).x;
        float2 _6547 = float2(_2319, _2389);
        float _2415 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6547, float2(0.0), isnan(_6547)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6547, float2(0.0), isnan(_6547)), level(0.0)).x;
        float2 _6555 = float2(_2261, _2389);
        float _2417 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6555, float2(0.0), isnan(_6555)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6555, float2(0.0), isnan(_6555)), level(0.0)).x;
        if (!_2399)
        {
            _1859 = 4.0;
        }
        float _2419 = _1859;
        float _2421 = _2419;
        if (!_2411)
        {
            _1861 = 4.0;
        }
        float _2423 = _1861;
        float _2425 = _2321;
        float _2427 = _2423;
        if (!_2399)
        {
            float2 _6579 = float2(_2317, _2263);
            float _2429 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6579, float2(0.0), isnan(_6579)), level(_2419)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6579, float2(0.0), isnan(_6579)), level(_2419)).x;
            _2425 = _2429;
        }
        float _2431 = _2425;
        float _2433 = _2323;
        if (!_2411)
        {
            float2 _6595 = float2(_2319, _2263);
            float _2435 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6595, float2(0.0), isnan(_6595)), level(_2423)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6595, float2(0.0), isnan(_6595)), level(_2423)).x;
            _2433 = _2435;
        }
        float _2437 = _2433;
        bool _2439 = _2329 != 0.0;
        bool _2441 = isnan(_2329);
        bool _2443 = _2439 || _2441;
        bool _2445 = isnan(0.0);
        bool _2447 = _2443 || _2445;
        bool _2449 = _2385 != 0.0;
        bool _2451 = isnan(_2385);
        bool _2453 = _2449 || _2451;
        bool _2455 = isnan(0.0);
        bool _2457 = _2453 || _2455;
        bool _2459 = _2387 != 0.0;
        bool _2461 = isnan(_2387);
        bool _2463 = _2459 || _2461;
        bool _2465 = isnan(0.0);
        bool _2467 = _2463 || _2465;
        if (!_2457)
        {
            _1863 = 4.0;
        }
        float _2469 = _1863;
        float _2471 = _2469;
        if (!_2467)
        {
            _2285 = 4.0;
        }
        float _2473 = _2285;
        float _2475 = _2385;
        float _2477 = _2473;
        if (!_2457)
        {
            float2 _6656 = float2(_2317, _2383);
            float _2479 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6656, float2(0.0), isnan(_6656)), level(_2469)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6656, float2(0.0), isnan(_6656)), level(_2469)).x;
            _2475 = _2479;
        }
        float _2481 = _2475;
        float _2483 = _2387;
        if (!_2467)
        {
            float2 _6672 = float2(_2319, _2383);
            float _2485 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6672, float2(0.0), isnan(_6672)), level(_2473)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6672, float2(0.0), isnan(_6672)), level(_2473)).x;
            _2483 = _2485;
        }
        float _2487 = _2483;
        bool _2489 = _2413 != 0.0;
        bool _2491 = isnan(_2413);
        bool _2493 = _2489 || _2491;
        bool _2495 = isnan(0.0);
        bool _2497 = _2493 || _2495;
        bool _2499 = _2415 != 0.0;
        bool _2501 = isnan(_2415);
        bool _2503 = _2499 || _2501;
        bool _2505 = isnan(0.0);
        bool _2507 = _2503 || _2505;
        bool _2509 = _2401 != 0.0;
        bool _2511 = isnan(_2401);
        bool _2513 = _2509 || _2511;
        bool _2515 = isnan(0.0);
        bool _2517 = _2513 || _2515;
        bool _2519 = _2417 != 0.0;
        bool _2521 = isnan(_2417);
        bool _2523 = _2519 || _2521;
        bool _2525 = isnan(0.0);
        bool _2527 = _2523 || _2525;
        if (!_2497)
        {
            _2477 = 4.0;
        }
        float _2529 = _2477;
        if (!_2507)
        {
            _2335 = 4.0;
        }
        float _2531 = _2335;
        float _2533 = _2413;
        if (!_2497)
        {
            float2 _6742 = float2(_2317, _2389);
            float _2535 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6742, float2(0.0), isnan(_6742)), level(_2529)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6742, float2(0.0), isnan(_6742)), level(_2529)).x;
            _2533 = _2535;
        }
        float _2537 = _2533;
        if (!_2517)
        {
            _2471 = 4.0;
        }
        float _2539 = _2471;
        float _2541 = _2415;
        if (!_2507)
        {
            float2 _6763 = float2(_2319, _2389);
            float _2543 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6763, float2(0.0), isnan(_6763)), level(_2531)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6763, float2(0.0), isnan(_6763)), level(_2531)).x;
            _2541 = _2543;
        }
        float _2545 = _2541;
        if (!_2527)
        {
            _2427 = 4.0;
        }
        float _2547 = _2427;
        float _2549 = _2401;
        if (!_2517)
        {
            float2 _6784 = float2(_2261, _2383);
            float _2551 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6784, float2(0.0), isnan(_6784)), level(_2539)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6784, float2(0.0), isnan(_6784)), level(_2539)).x;
            _2549 = _2551;
        }
        float _2553 = _2549;
        if (!_2447)
        {
            _2421 = 4.0;
        }
        float _2555 = _2421;
        float _2557 = _2417;
        if (!_2527)
        {
            float2 _6805 = float2(_2261, _2389);
            float _2559 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6805, float2(0.0), isnan(_6805)), level(_2547)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6805, float2(0.0), isnan(_6805)), level(_2547)).x;
            _2557 = _2559;
        }
        float _2561 = _2557;
        float _2563 = _2329;
        float _2565 = _2331;
        if (!_2447)
        {
            float2 _6822 = float2(_2261, _2263);
            float2 _2567 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6822, float2(0.0), isnan(_6822)), level(_2555)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6822, float2(0.0), isnan(_6822)), level(_2555)).xy;
            float _2569 = _2567.x;
            float _2571 = _2567.y;
            _2563 = _2569;
            _2565 = _2571;
        }
        float _2573 = _2563;
        float _2575 = _2565;
        float _2577 = -_2431;
        float _2579 = _2309 + _2577;
        float _2581 = -_2437;
        float _2583 = _2309 + _2581;
        float _2585 = abs(_2579);
        float _2587 = abs(_2583);
        float _2589 = precise::max(_2585, _2587);
        float _2591 = -_2481;
        float _2593 = _2309 + _2591;
        float _2595 = -_2487;
        float _2597 = _2309 + _2595;
        float _2599 = -_2537;
        float _2601 = _2309 + _2599;
        float _2603 = -_2545;
        float _2605 = _2309 + _2603;
        float _2607 = abs(_2601);
        float _2609 = abs(_2593);
        float _2611 = precise::max(_2607, _2609);
        float _2613 = -_2553;
        float _2615 = _2309 + _2613;
        float _2617 = abs(_2605);
        float _2619 = abs(_2597);
        float _2621 = precise::max(_2617, _2619);
        float _2623 = -_2561;
        float _2625 = _2309 + _2623;
        float _2627 = precise::max(_2611, _2621);
        float _2629 = abs(_2625);
        float _2631 = abs(_2615);
        float _2633 = precise::max(_2629, _2631);
        bool _2635 = _2627 > 0.00150000001303851604461669921875;
        float _2637 = precise::max(_2589, _2633);
        bool _2639 = _2637 > 0.00150000001303851604461669921875;
        bool _2641 = _2639 || _2635;
        bool _2643 = _2573 < _2575;
        bool _2645 = _2643 || _2641;
        bool _2647 = !_2645;
        int _2649 = _2647 ? as_type<int>(_1399) : 0;
        _1493 = _2649;
        _2301 = _2645;
    }
    int _2651 = _1493;
    bool _2653 = _2301;
    bool _2655 = _2653;
    if (!_2275)
    {
        bool _2657 = _2257 >= _2351;
        bool _2659 = isnan(_2257);
        bool _2661 = _2657 || _2659;
        bool _2663 = isnan(_2351);
        bool _2665 = _2661 || _2663;
        _2655 = _2665;
    }
    bool _2667 = _2655;
    if (!_2365)
    {
        float _2669 = _1929 * 0.9900000095367431640625;
        _1935 = _2669;
    }
    float _2671 = _1935;
    int _2673 = _245 + 8;
    float _2675 = -_251;
    float _2677 = _2675 + _1931;
    int _2679 = _2651;
    if (!_2275)
    {
        int _2681 = _2667 ? _2651 : 0;
        _2679 = _2681;
    }
    int _2683 = _2679;
    if (!_2365)
    {
        _1443 = 0.0;
    }
    float _2685 = _1443;
    float _2687 = -_257;
    float _2689 = _2687 + _2671;
    float _2691 = -_263;
    float _2693 = _2691 + _1933;
    uint _2695 = uint(int(uint(_247) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2695)] = uint(_2683);
    uint _2697 = uint(int(uint(_245) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2697)] = as_type<uint>(_1931);
    uint _2699 = uint(int(uint(_2333) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2699)] = as_type<uint>(_2671);
    uint _2701 = uint(int(uint(_2673) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2701)] = as_type<uint>(_1933);
    uint _2703 = uint(int(uint(_245) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2703)] = as_type<uint>(_1395);
    uint _2705 = uint(int(uint(_2333) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2705)] = as_type<uint>(_2685);
    uint _2707 = uint(int(uint(_2673) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2707)] = as_type<uint>(_1403);
    uint _2709 = uint(int(uint(_245) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2709)] = as_type<uint>(_2677);
    uint _2711 = uint(int(uint(_2333) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2711)] = as_type<uint>(_2689);
    uint _2713 = uint(int(uint(_2673) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2713)] = as_type<uint>(_2693);
    float _2715 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2717 = _2689 * _2689;
    float _2719 = _2685 * _2685;
    float _2721 = fma(_2677, _2677, _2717);
    float _2723 = fma(_1395, _1395, _2719);
    float _2725 = fma(_2693, _2693, _2721);
    float _2727 = fma(_1403, _1403, _2723);
    float _2729 = sqrt(_2727);
    float _2731 = sqrt(_2725);
    bool _2733 = _2731 >= 9.9999999747524270787835121154785e-07;
    bool _2735 = isnan(_2731);
    bool _2737 = _2733 || _2735;
    bool _2739 = isnan(9.9999999747524270787835121154785e-07);
    bool _2741 = _2737 || _2739;
    if (!_2741)
    {
        bool _2743 = _547 != _307;
        bool _2745 = isnan(_547);
        bool _2747 = _2743 || _2745;
        bool _2749 = isnan(_307);
        bool _2751 = _2747 || _2749;
        _2753 = _2751;
        if (!_2753)
        {
            float _2755 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2757 = _2755 > 0.0;
            bool _2759 = !_2757;
            if (!_2759)
            {
                float _2761 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2763 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2765 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2767 = _2763 * _527;
                float _2769 = _2763 * _525;
                float _2771 = _2763 * _531;
                float _2773 = fma(_2761, _533, _2767);
                float _2775 = fma(_2761, _529, _2769);
                float _2777 = fma(_2761, _537, _2771);
                float _2779 = fma(_2765, _539, _2773);
                float _2781 = fma(_2765, _535, _2775);
                float _2783 = fma(_2765, _541, _2777);
                float _2785 = _2779 * _2779;
                float _2787 = fma(_2781, _2781, _2785);
                float _2789 = fma(_2783, _2783, _2787);
                float _2791 = rsqrt(_2789);
                float _2793 = _2791 * 9.9999999747524270787835121154785e-07;
                float _2795 = _2781 * _2793;
                float _2797 = _2779 * _2793;
                float _2799 = _2783 * _2793;
                _345 = as_type<int>(_2795);
                _347 = as_type<int>(_2797);
                _349 = as_type<int>(_2799);
                _2753 = true;
            }
            else
            {
                bool _2801 = _2729 >= 9.9999999747524270787835121154785e-07;
                bool _2803 = isnan(_2729);
                bool _2805 = _2801 || _2803;
                bool _2807 = isnan(9.9999999747524270787835121154785e-07);
                bool _2809 = _2805 || _2807;
                if (!_2809)
                {
                    float _2811 = _2671 * _2671;
                    float _2813 = fma(_1931, _1931, _2811);
                    float _2815 = fma(_1933, _1933, _2813);
                    float _2817 = sqrt(_2815);
                    bool _2819 = _2817 >= 9.9999999747524270787835121154785e-07;
                    bool _2821 = isnan(_2817);
                    bool _2823 = _2819 || _2821;
                    bool _2825 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2827 = _2823 || _2825;
                    float _2829 = _2817;
                    if (_2827)
                    {
                        float _2831 = rsqrt(_2815);
                        _2829 = _2831;
                    }
                    float _2833 = _2829;
                    if (!_2827)
                    {
                        _333 = 0;
                    }
                    int _2835 = _333;
                    int _2837 = _2835;
                    if (!_2827)
                    {
                        _335 = 897988541;
                    }
                    int _2839 = _335;
                    int _2841 = _2839;
                    if (!_2827)
                    {
                        _337 = 0;
                    }
                    int _2843 = _337;
                    float _2845 = _2833;
                    int _2847 = _2843;
                    if (_2827)
                    {
                        float _2849 = _2833 * 9.9999999747524270787835121154785e-07;
                        _2845 = _2849;
                    }
                    float _2851 = _2845;
                    if (_2827)
                    {
                        float _2853 = _1931 * _2851;
                        _2837 = as_type<int>(_2853);
                    }
                    int _2855 = _2837;
                    _345 = _2855;
                    if (_2827)
                    {
                        float _2857 = _2671 * _2851;
                        _2841 = as_type<int>(_2857);
                    }
                    int _2859 = _2841;
                    _347 = _2859;
                    if (_2827)
                    {
                        float _2861 = _1933 * _2851;
                        _2847 = as_type<int>(_2861);
                    }
                    int _2863 = _2847;
                    _349 = _2863;
                    _2753 = true;
                }
                else
                {
                    float _2865 = rsqrt(_2727);
                    float _2867 = _2865 * 9.9999999747524270787835121154785e-07;
                    float _2869 = _1395 * _2867;
                    float _2871 = _2685 * _2867;
                    float _2873 = _1403 * _2867;
                    _345 = as_type<int>(_2869);
                    _347 = as_type<int>(_2871);
                    _349 = as_type<int>(_2873);
                    _2753 = true;
                }
            }
        }
    }
    else
    {
        float _2875 = _2729 * _2715;
        bool _2877 = _2875 >= 0.001000000047497451305389404296875;
        bool _2879 = isnan(_2875);
        bool _2881 = _2877 || _2879;
        bool _2883 = isnan(0.001000000047497451305389404296875);
        bool _2885 = _2881 || _2883;
        bool _2887 = _2875 > 0.0;
        bool _2889 = !_2885;
        bool _2891 = _2887 && _2889;
        bool _2893 = _2731 < 0.001000000047497451305389404296875;
        bool _2895 = _2893 && _2891;
        if (!_2895)
        {
            _339 = as_type<int>(_2677);
        }
        int _2897 = _339;
        int _2899 = _2897;
        if (_2895)
        {
            float _2901 = _1395 * _2715;
            _2899 = as_type<int>(_2901);
        }
        int _2903 = _2899;
        _345 = _2903;
        if (!_2895)
        {
            _341 = as_type<int>(_2689);
        }
        int _2905 = _341;
        int _2907 = _2905;
        if (_2895)
        {
            float _2909 = _2715 * _2685;
            _2907 = as_type<int>(_2909);
        }
        int _2911 = _2907;
        _347 = _2911;
        if (!_2895)
        {
            _343 = as_type<int>(_2693);
        }
        int _2913 = _343;
        _349 = _2913;
        if (_2895)
        {
            float _2915 = _1403 * _2715;
            _349 = as_type<int>(_2915);
        }
    }
    _2753 = false;
    int _2917 = _345;
    int _2919 = _347;
    int _2921 = _349;
    uint _2923 = uint(int(uint(_245) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2923)] = uint(_2917);
    uint _2925 = uint(int(uint(_2333) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2925)] = uint(_2919);
    uint _2927 = uint(int(uint(_2673) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2927)] = uint(_2921);
}

