#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_63 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _88(thread const int& _5723, thread const int& _5724, constant _10& support_buffer)
{
    float _5727 = as_type<float>(support_buffer._m4);
    int _5729 = _5724 + as_type<int>(_5727);
    int _5731 = 1 + _5729;
    float _5733 = support_buffer._m5[_5731].x;
    float _5735 = abs(_5733);
    bool _5737 = _5735 == 1.0;
    if (_5737)
    {
        return _5723;
    }
    float _5739 = float(_5723);
    float _5741 = _5739 / _5735;
    int _5743 = int(_5741);
    return _5743;
}

static inline __attribute__((always_inline))
int _89(thread const int& _5773, thread const int& _5774, constant _10& support_buffer)
{
    float _5777 = as_type<float>(support_buffer._m4);
    int _5779 = _5774 + as_type<int>(_5777);
    int _5781 = 1 + _5779;
    float _5783 = support_buffer._m5[_5781].x;
    bool _5785 = _5783 == 1.0;
    if (_5785)
    {
        return _5773;
    }
    float _5787 = float(_5773);
    float _5789 = _5787 * _5783;
    int _5791 = int(_5789);
    return _5791;
}

static inline __attribute__((always_inline))
void _86(thread const int& _5429, thread const int& _5430, thread const int& _5431, thread int& _5432, thread int& _5433, thread int& _5434, thread int& _5435, thread int& _5436, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _5439 = _5430;
    float _5441 = 0.0 + as_type<float>(_5429);
    bool _5443 = _5441 != 0.0;
    bool _5445 = isnan(_5441);
    bool _5447 = _5443 || _5445;
    bool _5449 = isnan(0.0);
    bool _5451 = _5447 || _5449;
    int _5453 = as_type<int>(_5441);
    int _5455 = _5451 ? (-1) : 0;
    if (!_5451)
    {
        float _5457 = as_type<float>(_5429) * 1.0;
        _5439 = as_type<int>(_5457);
    }
    int _5459 = _5439;
    bool _5461 = !_5451;
    int _5463 = _5459;
    int _5465 = _5459;
    if (!_5461)
    {
        bool _5467 = _5441 >= 0.0;
        bool _5469 = isnan(_5441);
        bool _5471 = _5467 || _5469;
        bool _5473 = isnan(0.0);
        bool _5475 = _5471 || _5473;
        _5455 = _5475 ? (-1) : 0;
        if (!_5475)
        {
            _5463 = 2147483647;
        }
        int _5477 = _5463;
        bool _5479 = !_5475;
        int _5481 = _5477;
        _5465 = _5477;
        if (!_5479)
        {
            float _5483 = abs(as_type<float>(_5429));
            float _5485 = 0.0 + _5483;
            bool _5487 = _5485 > as_type<float>(0x7f800000u /* inf */);
            bool _5489 = isnan(_5485);
            bool _5491 = _5487 || _5489;
            bool _5493 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5495 = _5491 || _5493;
            _5453 = as_type<int>(_5485);
            _5455 = _5495 ? (-1) : 0;
            if (_5495)
            {
                float _5497 = as_type<float>(_5429) + 1.0;
                _5481 = as_type<int>(_5497);
            }
            int _5499 = _5481;
            int _5501 = _5499;
            _5465 = _5499;
            if (!_5495)
            {
                bool _5503 = _5485 != as_type<float>(0x7f800000u /* inf */);
                bool _5505 = isnan(_5485);
                bool _5507 = _5503 || _5505;
                bool _5509 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5511 = _5507 || _5509;
                _5455 = _5511 ? (-1) : 0;
                if (!_5511)
                {
                    _5501 = _5429;
                }
                int _5513 = _5501;
                bool _5515 = !_5511;
                _5465 = _5513;
                if (!_5515)
                {
                    float _5517 = as_type<float>(_5429) * 18446744073709551616.0;
                    float _5519 = rsqrt(_5517);
                    float _5521 = _5517 * _5519;
                    float _5523 = _5519 * 0.5;
                    float _5525 = -_5521;
                    float _5527 = 0.0 + _5525;
                    float _5529 = fma(_5523, _5527, 0.5);
                    float _5531 = fma(_5521, _5529, _5521);
                    float _5533 = -_5531;
                    float _5535 = 0.0 + _5533;
                    float _5537 = fma(_5531, _5535, _5517);
                    float _5539 = fma(_5523, _5537, _5531);
                    float _5541 = _5539 * 2.3283064365386962890625e-10;
                    _5465 = as_type<int>(_5541);
                    _5453 = as_type<int>(_5531);
                }
            }
        }
    }
    int _5543 = _5465;
    int _5545 = _5453;
    int _5547 = _5455;
    _5432 = _5431;
    _5433 = 0;
    _5434 = _5543;
    _5435 = _5545;
    _5436 = _5547;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1793 = false;
    bool _767 = false;
    bool _581 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_46.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2271 = as_type<float>(_113);
        out.gl_Position.z = _2271;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = _131;
    if (_127)
    {
        float _135 = float(_97);
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2341 = as_type<float>(_151);
        out.gl_Position.z = _2341;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    int _153 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _155 = _153;
    int _157 = 0;
    int _159 = _88(_155, _157, (*spvDescriptorSet0.support_buffer));
    float _161 = in.m_53.z;
    float _163 = in.m_55.z;
    float _165 = _131 + _161;
    float _167 = _165 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _169 = trunc(_163);
    int _171 = int(_169);
    float _173 = float(_159);
    int _175 = abs(_159);
    bool _177 = _159 == 0;
    float _179 = _167 * _173;
    float _181 = float(uint(_175));
    float _183 = trunc(_179);
    int _185 = int(_183);
    float _187 = 1.0 / _181;
    int _189 = abs(_185);
    uint _192 = uint(int(uint(_185) >> uint(31)));
    float _194 = float(uint(_189));
    int _196 = ~int(_192);
    int _198 = _196 + 1;
    int _200 = as_type<int>(_187) + (-2);
    float _202 = as_type<float>(_200) * _194;
    float _204 = trunc(_202);
    float _206 = precise::max(_204, 0.0);
    uint _208 = uint(_206);
    int _210 = ~int(_208);
    int _212 = _210 + 1;
    int _214 = _212 * _175;
    int _216 = _214 + _189;
    float _218 = float(uint(_216));
    float _220 = as_type<float>(_200) * _218;
    float _222 = trunc(_220);
    float _224 = precise::max(_222, 0.0);
    uint _226 = uint(_224);
    int _228 = int(_208) + int(_226);
    int _230 = ~_228;
    int _232 = _230 + 1;
    int _234 = _232 * _175;
    int _236 = _234 + _189;
    bool _238 = uint(_236) >= uint(_175);
    bool _240 = !_238;
    int _242 = _240 ? 0 : (-1);
    int _244 = ~_228;
    int _246 = _244 + _242;
    int _248 = _246 + 1;
    int _250 = _248 * _175;
    int _252 = _250 + _189;
    int _254 = _252 ^ _198;
    int _256 = ~_198;
    int _258 = _256 + _254;
    int _260 = _258 + 1;
    bool _262 = !_177;
    int _264 = _262 ? _260 : (-1);
    int _266 = _264;
    int _268 = 0;
    int _270 = _89(_266, _268, (*spvDescriptorSet0.support_buffer));
    int _272 = _171;
    int _274 = 0;
    int _276 = _89(_272, _274, (*spvDescriptorSet0.support_buffer));
    float4 _279 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_270, _276)), 0).xyzw;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float _287 = _279.w;
    float _289 = in.m_57.w;
    float _291 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _293 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _297 = _293 || _295;
    bool _299 = isnan(1.0);
    bool _301 = _297 || _299;
    float _303 = in.m_51.x;
    float _305 = in.m_51.y;
    float _307 = in.m_51.z;
    float _309 = in.m_46.x;
    float _311 = in.m_46.y;
    float _313 = in.m_46.z;
    float _315 = 0.0;
    float _317 = _291;
    if (!_301)
    {
        float _319 = _291 * _291;
        float _321 = _319 * 0.5;
        _315 = _321;
    }
    float _323 = _315;
    float _325 = _323;
    if (!_301)
    {
        float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _325 = _327;
    }
    float _329 = _325;
    bool _331 = !_301;
    float _333 = _329;
    if (!_331)
    {
        float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = log2(_335);
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _341 = _339 + 1.0;
        float _343 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = _291 * _337;
        float _347 = 1.0 / _341;
        float _349 = _343 * 0.693147182464599609375;
        float _351 = exp2(_345);
        float _353 = 1.0 / _349;
        float _355 = _351 + (-1.0);
        float _357 = -_355;
        float _359 = fma(_357, _353, _291);
        float _361 = _359 * _347;
        float _363 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _333 = _363;
    }
    float _365 = _333;
    bool _367 = !_301;
    if (!_367)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = 1.0 / _375;
        float _379 = _291 * _371;
        float _381 = exp2(_379);
        float _383 = -_381;
        float _385 = _383 + 1.0;
        float _387 = _385 * _377;
        _317 = _387;
    }
    float _389 = _317;
    float _391 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _393 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _395 = _264 + 1;
    float _397 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _399 = fma(_389, _303, _391);
    float _401 = fma(_389, _305, _393);
    int _403 = abs(_395);
    float _405 = fma(_389, _307, _397);
    float _407 = fma(_399, _289, _309);
    float _409 = fma(_401, _289, _311);
    float _411 = float(uint(_403));
    float _413 = fma(_405, _289, _313);
    uint _415 = as_type<uint>(half2(float2(_287, 0.0)));
    uint _417 = uint(int(uint(_395) >> uint(31)));
    float _419 = as_type<float>(_200) * _411;
    uint _421 = extract_bits(_415, 0u, 8u);
    int _423 = int(_421) & 255;
    uint _425 = extract_bits(_415, 8u, 8u);
    int _427 = int(_425) & 255;
    int _429 = _427 << 8;
    int _431 = _423 | _429;
    int _433 = ~int(_417);
    int _435 = _433 + 1;
    float _437 = trunc(_419);
    float _439 = precise::max(_437, 0.0);
    uint _441 = uint(_439);
    int _443 = ~int(_441);
    int _445 = _443 + 1;
    int _447 = _445 * _175;
    int _449 = _447 + _403;
    float _451 = float(uint(_449));
    float _453 = as_type<float>(_200) * _451;
    float _455 = trunc(_453);
    float _457 = precise::max(_455, 0.0);
    uint _459 = uint(_457);
    int _461 = int(_441) + int(_459);
    int _463 = ~_461;
    int _465 = _463 + 1;
    int _467 = _465 * _175;
    int _469 = _467 + _403;
    bool _471 = uint(_469) >= uint(_175);
    bool _473 = !_471;
    int _475 = _473 ? 0 : (-1);
    bool _477 = _431 >= 32768;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _481 = ~_461;
    int _483 = _481 + _475;
    int _485 = _483 + 1;
    float _487 = _479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _489 = _485 * _175;
    int _491 = _489 + _403;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _495 = _491 ^ _435;
    float _497 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _499 = ~_435;
    int _501 = _499 + _495;
    int _503 = _501 + 1;
    int _505 = _431 + (-1024);
    int _507 = _505;
    float _509 = _409;
    float _511 = _413;
    if (_477)
    {
        int _513 = ~_431;
        int _515 = _513 + 33792;
        int _517 = _515 + 1;
        _507 = _517;
    }
    int _519 = _507;
    bool _521 = !_177;
    int _523 = _521 ? _503 : (-1);
    int _525 = _519 + 30719;
    float _527 = float(_525);
    float _529 = fma(_527, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _533 = abs(_529);
    float _535 = -_533;
    float _537 = _535 + 1.0;
    float _539 = abs(_529);
    float _541 = fma(_539, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _543 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _545 = _529 < 0.0;
    float _547 = float(_545);
    int _549 = as_type<int>(_537) + (-218103808);
    float _551 = abs(_529);
    float _553 = fma(_551, _541, -0.212114393711090087890625);
    bool _555 = uint(_549) >= 1920991232u;
    float _557 = abs(_529);
    float _559 = fma(_557, _553, 1.570728778839111328125);
    bool _561 = !_555;
    float _579;
    if (!_561)
    {
        int _563 = as_type<int>(_537);
        int _565 = as_type<int>(_289);
        int _567 = 2368;
        int _569;
        int _571;
        int _573;
        int _575;
        int _577;
        _86(_563, _565, _567, _569, _571, _573, _575, _577, out.gl_Position, out.gl_PointSize);
        _579 = as_type<float>(_573);
        _581 = true;
    }
    else
    {
        float _583 = rsqrt(_537);
        float _585 = _537 * _583;
        float _587 = _583 * 0.5;
        float _589 = -_585;
        float _591 = 0.0 + _589;
        float _593 = fma(_587, _591, 0.5);
        float _595 = fma(_585, _593, _585);
        float _597 = -_595;
        float _599 = 0.0 + _597;
        float _601 = fma(_595, _599, _537);
        float _603 = fma(_587, _601, _595);
        _579 = _603;
    }
    _581 = false;
    float _605 = _579;
    int _607 = _523;
    int _609 = 0;
    int _611 = _89(_607, _609, (*spvDescriptorSet0.support_buffer));
    int _613 = _171;
    int _615 = 0;
    int _617 = _89(_613, _615, (*spvDescriptorSet0.support_buffer));
    float4 _619 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_611, _617)), 0).xyzw;
    float _621 = _619.x;
    float _623 = _619.y;
    float _625 = _619.z;
    float _627 = _619.w;
    float _629 = _559 * _605;
    float _631 = _547 * 2.0;
    float _633 = _527 * 3.883221149444580078125;
    float _635 = floor(_179);
    float _637 = -_631;
    float _639 = fma(_629, _637, _629);
    float _641 = _633 * 0.15915493667125701904296875;
    float _643 = fma(_547, 3.1415927410125732421875, _639);
    float _645 = _641 * 6.283185482025146484375;
    float _647 = cos(_645);
    float _649 = _643 * 0.15915493667125701904296875;
    float _651 = _649 * 6.283185482025146484375;
    float _653 = sin(_651);
    float _655 = -_635;
    float _657 = _179 + _655;
    float _659 = _641 * 6.283185482025146484375;
    float _661 = sin(_659);
    float _663 = _653 * _647;
    float _665 = _653 * _661;
    uint _667 = as_type<uint>(half2(float2(_627, 0.0)));
    float _669 = -_281;
    float _671 = _669 + _621;
    float _673 = -_283;
    float _675 = _673 + _623;
    uint _677 = extract_bits(_667, 0u, 8u);
    int _679 = int(_677) & 255;
    uint _681 = extract_bits(_667, 8u, 8u);
    int _683 = int(_681) & 255;
    int _685 = _683 << 8;
    int _687 = _679 | _685;
    float _689 = fma(_657, _671, _281);
    float _691 = fma(_657, _675, _283);
    bool _693 = _687 >= 32768;
    int _695 = _687 + (-1024);
    int _697 = _695;
    float _699 = _663;
    if (_693)
    {
        int _701 = ~_687;
        int _703 = _701 + 33792;
        int _705 = _703 + 1;
        _697 = _705;
    }
    int _707 = _697;
    int _709 = _707 + 30719;
    float _711 = float(_709);
    float _713 = fma(_711, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _715 = abs(_713);
    float _717 = -_715;
    float _719 = _717 + 1.0;
    float _721 = abs(_713);
    float _723 = fma(_721, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _725 = _713 < 0.0;
    float _727 = float(_725);
    int _729 = as_type<int>(_719) + (-218103808);
    float _731 = abs(_713);
    float _733 = fma(_731, _723, -0.212114393711090087890625);
    bool _735 = uint(_729) >= 1920991232u;
    float _737 = -_285;
    float _739 = _737 + _625;
    float _741 = abs(_713);
    float _743 = fma(_741, _733, 1.570728778839111328125);
    float _745 = fma(_657, _739, _285);
    bool _747 = !_735;
    float _765;
    if (!_747)
    {
        int _749 = as_type<int>(_719);
        int _751 = as_type<int>(_623);
        int _753 = 3280;
        int _755;
        int _757;
        int _759;
        int _761;
        int _763;
        _86(_749, _751, _753, _755, _757, _759, _761, _763, out.gl_Position, out.gl_PointSize);
        _765 = as_type<float>(_759);
        _767 = true;
    }
    else
    {
        float _769 = rsqrt(_719);
        float _771 = _719 * _769;
        float _773 = _769 * 0.5;
        float _775 = -_771;
        float _777 = 0.0 + _775;
        float _779 = fma(_773, _777, 0.5);
        float _781 = fma(_771, _779, _771);
        float _783 = -_781;
        float _785 = 0.0 + _783;
        float _787 = fma(_781, _785, _719);
        float _789 = fma(_773, _787, _781);
        _765 = _789;
    }
    _767 = false;
    float _791 = _765;
    float _793 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _795 = log2(_793);
    float _797 = in.m_53.x;
    float _799 = in.m_53.y;
    float _801 = in.m_53.z;
    float _803 = _743 * _791;
    float _805 = _711 * 3.883221149444580078125;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _809 = 1.0 + _807;
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _813 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _815 = isnan(1.0);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _821 = _817 || _819;
    float _823 = _795 * _131;
    float _825 = 1.0 / _809;
    bool _827 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _829 = isnan(0.0);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _835 = _831 || _833;
    float _837 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _839 = exp2(_823);
    float _841 = _801 * 2.0;
    float _843 = _799 * 2.0;
    float _845 = floor(_841);
    float _847 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _849 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _851 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _837);
    float _853 = _799 + _801;
    float _855 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _847);
    float _857 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _849);
    float _859 = _797 * 2.0;
    float _861 = floor(_843);
    float _863 = -_839;
    float _865 = _863 + 1.0;
    float _867 = _853 + (-1.0);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _879 = _877 != 0;
    float _881 = _799 + _797;
    float _883 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _855);
    float _885 = _835 ? _865 : 0.0;
    float _887 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _889 = floor(_859);
    bool _891 = !_871;
    int _893 = _891 ? 0 : 1;
    float _895 = _881 + (-1.0);
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _899 = _897 != 0;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _907 = _905 != 0;
    if (_821)
    {
        float _909 = _885 * _825;
        _133 = _909;
    }
    float _911 = _133;
    bool _913 = _845 >= 0.0;
    bool _915 = isnan(_845);
    bool _917 = _913 || _915;
    bool _919 = isnan(0.0);
    bool _921 = _917 || _919;
    bool _923 = !_879;
    int _925 = _923 ? 0 : 1;
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _929 = _845 > 0.0;
    int _931 = _921 ? 0 : 1;
    bool _933 = _861 > 0.0;
    float _935 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _937 = _861 >= 0.0;
    bool _939 = isnan(_861);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.0);
    bool _945 = _941 || _943;
    bool _947 = !_875;
    int _949 = _947 ? 0 : 1;
    bool _951 = _889 >= 0.0;
    bool _953 = isnan(_889);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    float _961 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _851);
    int _963 = ~_931;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _857);
    bool _971 = !_907;
    int _973 = _971 ? 0 : 1;
    float _975 = _911 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _977 = _967;
    if (!_929)
    {
        int _979 = ~_931;
        int _981 = _979 + 1;
        _977 = _981;
    }
    int _983 = _977;
    int _985 = _959 ? 0 : 1;
    float _987 = _975 * _927;
    int _989 = _945 ? 0 : 1;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1001 = _999 != 0;
    float _1003 = _911 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _1005 = _889 > 0.0;
    float _1007 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[203].x, _987);
    int _1009 = ~_985;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    float _1015 = _1003 * _811;
    bool _1017 = !_993;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = floor(_1007);
    float _1023 = float(_983);
    float _1025 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1015);
    int _1027 = abs(_1019);
    int _1029 = ~_989;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    int _1035 = _1033;
    int _1037 = _1013;
    if (!_933)
    {
        int _1039 = ~_989;
        int _1041 = _1039 + 1;
        _1035 = _1041;
    }
    int _1043 = _1035;
    float _1045 = floor(_1025);
    if (!_1005)
    {
        int _1047 = ~_985;
        int _1049 = _1047 + 1;
        _1037 = _1049;
    }
    int _1051 = _1037;
    bool _1053 = !_1001;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = float(_1051);
    float _1059 = _1007 + 0.25;
    int _1061 = abs(_1055);
    bool _1063 = !_997;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = floor(_1059);
    float _1069 = _1025 + 0.25;
    int _1071 = abs(_1065);
    float _1073 = float(_1043);
    float _1075 = floor(_1069);
    float _1077 = float(_1061);
    float _1079 = -_1021;
    float _1081 = _1007 + _1079;
    float _1083 = float(_1071);
    float _1085 = _1007 * 6.283185482025146484375;
    float _1087 = float(_1027);
    bool _1089 = _1081 >= 0.5;
    bool _1091 = isnan(_1081);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(0.5);
    bool _1097 = _1093 || _1095;
    float _1099 = _1083 * _1057;
    float _1101 = _1077 * _1073;
    float _1103 = -_1067;
    float _1105 = _1059 + _1103;
    int _1107 = abs(_949);
    float _1109 = -_1045;
    float _1111 = _1025 + _1109;
    bool _1113 = !_1097;
    float _1115 = _1113 ? 0.5 : (-0.5);
    float _1117 = _1085 * 0.15915493667125701904296875;
    bool _1119 = !_903;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = _1087 * _1023;
    bool _1125 = _1111 >= 0.5;
    bool _1127 = isnan(_1111);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan(0.5);
    bool _1133 = _1129 || _1131;
    float _1135 = _1101 * (-2.0);
    float _1137 = float(_1107);
    float _1139 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1141 = _1139 * 2.0;
    bool _1143 = _1105 > 0.5;
    float _1145 = _1117 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    int _1149 = abs(_1121);
    float _1151 = -_1075;
    float _1153 = _1069 + _1151;
    float _1155 = _1025 * 6.283185482025146484375;
    float _1157 = _1137 * _1141;
    int _1159 = abs(_893);
    float _1161 = _1123 * (-2.0);
    float _1163 = _1155 * 0.15915493667125701904296875;
    float _1165 = in.m_59.x;
    float _1167 = in.m_59.y;
    float _1169 = in.m_59.z;
    bool _1171 = !_1133;
    float _1173 = _1171 ? 0.5 : (-0.5);
    float _1175 = fma(_935, _1161, _935);
    float _1177 = float(_1149);
    float _1179 = _1105;
    float _1181 = _1153;
    if (_1143)
    {
        float _1183 = -_1105;
        float _1185 = _1183 + 1.0;
        _1179 = _1185;
    }
    float _1187 = _1179;
    float _1189 = _1163 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    bool _1193 = _1153 > 0.5;
    float _1195 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1197 = _1195 * 2.0;
    float _1199 = float(_1159);
    float _1201 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1203 = abs(_925);
    float _1205 = _1177 * _1197;
    bool _1207 = !_899;
    int _1209 = _1207 ? 0 : 1;
    float _1211 = fma(_1199, _1201, _1157);
    float _1213 = fma(_1187, 4.0, -1.0);
    int _1215 = abs(_1209);
    float _1217 = _1099 * (-2.0);
    float _1219 = float(_1203);
    if (_1193)
    {
        float _1221 = -_1153;
        float _1223 = _1221 + 1.0;
        _1181 = _1223;
    }
    float _1225 = _1181;
    float _1227 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1229 = float(_1215);
    float _1231 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1233 = abs(_973);
    float _1235 = fma(_1225, 4.0, -1.0);
    float _1237 = fma(_1219, _1227, _1211);
    float _1239 = fma(_887, _1217, _887);
    float _1241 = fma(_1217, _1167, _1167);
    float _1243 = fma(_1229, _1231, _1205);
    float _1245 = _799 + (-0.5);
    float _1247 = float(_1233);
    float _1249 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1251 = fma(_1237, 3.1415927410125732421875, _1165);
    float _1253 = rsqrt(_883);
    float _1255 = _797 + (-0.5);
    float _1257 = _797 + _801;
    float _1259 = fma(_1251, _1161, _1251);
    float _1261 = _801 + (-0.5);
    float _1263 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1259);
    float _1265 = rsqrt(_969);
    float _1267 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1241);
    float _1269 = fma(_1247, _1249, _1243);
    float _1271 = fma(_1175, _911, _1263);
    float _1273 = _1257 + (-1.0);
    float _1275 = fma(_1239, _911, _1267);
    float _1277 = _1271 * 0.15915493667125701904296875;
    float _1279 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1281 = fma(_1269, 3.1415927410125732421875, _1169);
    float _1283 = rsqrt(_961);
    float _1285 = in.m_57.x;
    float _1287 = in.m_57.y;
    float _1289 = in.m_57.z;
    float _1291 = fma(_1279, _1135, _1279);
    float _1293 = fma(_1281, _1135, _1281);
    float _1295 = _1275 * 0.15915493667125701904296875;
    float _1297 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1293);
    float _1299 = sqrt(_961);
    float _1301 = fma(_1291, _911, _1297);
    float _1303 = _1301 * 0.15915493667125701904296875;
    float _1305 = _691 * _1253;
    float _1307 = _1277 * 6.283185482025146484375;
    float _1309 = sin(_1307);
    float _1311 = _689 * _1283;
    float _1313 = _745 * _1265;
    float _1315 = _1299 * _1311;
    float _1317 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1319 = _1277 * 6.283185482025146484375;
    float _1321 = cos(_1319);
    float _1323 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1325 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1329 = _1299 * _1313;
    float _1331 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1333 = _1325 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1335 = _1299 * _1305;
    float _1337 = _1303 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1315);
    float _1343 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1329);
    float _1345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1335);
    bool _1347 = _1335 != 0.0;
    bool _1349 = isnan(_1335);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = _1341 * _1327;
    float _1359 = _1345 * _1333;
    float _1361 = _1303 * 6.283185482025146484375;
    float _1363 = cos(_1361);
    bool _1365 = _1315 == 0.0;
    bool _1367 = !_1355;
    bool _1369 = _1365 && _1367;
    bool _1371 = _1329 == 0.0;
    bool _1373 = _1371 && _1369;
    float _1375 = _1295 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = _1343 * _1331;
    float _1381 = _1321 * _1339;
    float _1383 = _1309 * _1339;
    float _1385 = _1295 * 6.283185482025146484375;
    float _1387 = sin(_1385);
    float _1389 = _1309 * _1363;
    float _1391 = _1321 * _1363;
    float _1393 = _1309 * _1377;
    float _1395 = _1339 * _1377;
    float _1397 = _1363 * _1377;
    float _1399 = _1321 * _1377;
    float _1401 = _1393 * _1359;
    float _1403 = -_1381;
    float _1405 = fma(_1387, _1389, _1403);
    float _1407 = fma(_1387, _1383, _1391);
    float _1409 = fma(_1387, _1391, _1383);
    float _1411 = -_1389;
    float _1413 = fma(_1387, _1381, _1411);
    float _1415 = _1405 * _1359;
    float _1417 = _1407 * _1359;
    float _1419 = -_1387;
    float _1421 = fma(_1419, _1357, _1401);
    float _1423 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1425 = fma(_1397, _1357, _1415);
    float _1427 = fma(_1395, _1357, _1417);
    float _1429 = fma(_1399, _1379, _1421);
    float _1431 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1433 = _1423 * _1423;
    float _1435 = fma(_1413, _1379, _1427);
    float _1437 = fma(_1409, _1379, _1425);
    float _1439 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1441 = fma(_1431, _1431, _1433);
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1447 = fma(_1439, _1439, _1441);
    float _1449 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1443);
    float _1451 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1453 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1445);
    float _1455 = sqrt(_1447);
    float _1457 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1449);
    float _1459 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1451);
    float _1461 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1453);
    float _1463 = _727 * 2.0;
    float _1465 = _1457 * _1457;
    float _1467 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1459);
    float _1469 = rsqrt(_1447);
    float _1471 = fma(_1461, _1461, _1465);
    float _1473 = -_1463;
    float _1475 = fma(_803, _1473, _803);
    float _1477 = fma(_1467, _1467, _1471);
    float _1479 = fma(_727, 3.1415927410125732421875, _1475);
    float _1481 = rsqrt(_1477);
    float _1483 = _1423 * _1469;
    float _1485 = _1431 * _1469;
    float _1487 = _1439 * _1469;
    float _1489 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1491 = _1457 * _1481;
    float _1493 = _1461 * _1481;
    float _1495 = _1467 * _1481;
    float _1497 = _1483 * _1491;
    float _1499 = fma(_1485, _1493, _1497);
    float _1501 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1503 = fma(_1487, _1495, _1499);
    float _1505 = _805 * 0.15915493667125701904296875;
    float _1507 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1489);
    float _1509 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1501);
    float _1511 = _1503 * _1455;
    float _1513 = _1505 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1507);
    float _1519 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1509);
    float _1521 = fma(_1485, _1511, _1461);
    float _1523 = fma(_1487, _1511, _1467);
    float _1525 = _1517 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1527 = _1519 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1529 = fma(_1483, _1511, _1457);
    float _1531 = _1505 * 6.283185482025146484375;
    float _1533 = sin(_1531);
    float _1535 = _1525 + _1521;
    float _1537 = _1527 + _1523;
    float _1539 = _1479 * 0.15915493667125701904296875;
    float _1541 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1545 = _1535 + _1543;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1549 = _1537 + _1547;
    float _1551 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1541);
    float _1553 = _1545 * _1545;
    float _1555 = _1549 * _1549;
    float _1557 = _1539 * 6.283185482025146484375;
    float _1559 = sin(_1557);
    float _1561 = -_529;
    float _1563 = _1561 + _713;
    float _1565 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1551);
    float _1567 = _1553 + _1555;
    float _1569 = fma(_657, _1563, _529);
    float _1571 = _1565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1573 = sqrt(_1567);
    float _1575 = _1569;
    float _1577 = _1563;
    float _1579 = _1529;
    if (!_1373)
    {
        float _1581 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1569);
        _1575 = _1581;
    }
    float _1583 = _1575;
    float _1585 = _1393 * _1583;
    float _1587 = _1405 * _1583;
    float _1589 = -_663;
    float _1591 = fma(_1559, _1515, _1589);
    float _1593 = -_665;
    float _1595 = fma(_1559, _1533, _1593);
    float _1597 = fma(_657, _1591, _663);
    float _1599 = fma(_657, _1595, _665);
    float _1601 = _1407 * _1583;
    float _1603 = _1571 + _1529;
    bool _1605 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1607 = _1597;
    float _1609 = _1599;
    float _1611 = _1583;
    if (!_1373)
    {
        float _1613 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1597);
        _1607 = _1613;
    }
    float _1615 = _1607;
    if (!_1373)
    {
        float _1617 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1599);
        _1609 = _1617;
    }
    float _1619 = _1609;
    if (!_1605)
    {
        _699 = _1555;
    }
    float _1621 = _699;
    float _1623 = _1621;
    if (!_1605)
    {
        _1611 = _1553;
    }
    float _1625 = _1611;
    float _1627 = _1625;
    if (!_1605)
    {
        _509 = _1535;
    }
    float _1629 = _509;
    float _1631 = _1629;
    if (!_1605)
    {
        _1577 = _1537;
    }
    float _1633 = _1577;
    float _1635 = _1633;
    if (!_1605)
    {
        _511 = _1603;
    }
    float _1637 = _511;
    bool _1639 = !_1605;
    float _1641 = _1637;
    if (!_1639)
    {
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1645 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1647 = _1573 + _1645;
        float _1649 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1651 = rsqrt(_1567);
        float _1653 = _1647 * _1643;
        float _1655 = _1653 * 0.15915493667125701904296875;
        float _1657 = _1655 * 6.283185482025146484375;
        float _1659 = sin(_1657);
        float _1661 = _1655 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        float _1665 = fma(_1659, _1649, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1667 = _1651 * _1665;
        float _1669 = _1663 + (-1.0);
        float _1671 = _1545 * _1667;
        float _1673 = _1549 * _1667;
        float _1675 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1677 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1679 = _1671 * _1671;
        float _1681 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1683 = fma(_1603, _1663, _1675);
        float _1685 = _1673 * _1673;
        _1641 = _1683;
        _1627 = _1679;
        _1623 = _1685;
        _1631 = _1677;
        _1635 = _1681;
        _1579 = _1655;
    }
    float _1687 = _1641;
    float _1689 = _1627;
    float _1691 = _1623;
    float _1693 = _1631;
    float _1695 = _1635;
    float _1697 = _1579;
    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1701 = _1687 + _1699;
    float _1703 = fma(_1395, _1615, _1601);
    float _1705 = fma(_1397, _1615, _1587);
    float _1707 = -_1387;
    float _1709 = fma(_1707, _1615, _1585);
    float _1711 = fma(_1701, _1701, _1689);
    float _1713 = fma(_1413, _1619, _1703);
    float _1715 = fma(_1409, _1619, _1705);
    float _1717 = fma(_1399, _1619, _1709);
    float _1719 = _1711 + _1691;
    float _1721 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1723 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1725 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_61.x = _543;
    out.m_61.y = _497;
    out.m_61.z = _487;
    float _1727 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1721);
    float _1729 = sqrt(_1719);
    float _1731 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1723);
    float _1733 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1725);
    float _1735 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1727);
    float _1737 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1731);
    float _1739 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1733);
    out.m_63.x = _1735;
    out.m_63.y = _1737;
    out.m_63.z = _1739;
    bool _1741 = _1729 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1743 = isnan(_1729);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1749 = _1745 || _1747;
    float _1751 = _1717;
    float _1753 = _1687;
    float _1755 = _1735;
    float _1757 = _1697;
    if (!_1749)
    {
        _1751 = 1.0;
    }
    float _1759 = _1751;
    bool _1761 = !_1749;
    float _1763 = _1759;
    if (!_1761)
    {
        bool _1765 = _1729 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1767 = isnan(_1729);
        bool _1769 = _1765 || _1767;
        bool _1771 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1773 = _1769 || _1771;
        if (!_1773)
        {
            float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1777 = _1729 + _1775;
            float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1781 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1779;
            float _1783 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1785 = _1783 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1787 = 1.0 / _1781;
            float _1789 = _1777 * _1787;
            float _1791 = fma(_1789, _1785, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1763 = _1791;
            _1793 = true;
        }
        else
        {
            bool _1795 = _1729 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1797 = isnan(_1729);
            bool _1799 = _1795 || _1797;
            bool _1801 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1803 = _1799 || _1801;
            if (!_1803)
            {
                float _1805 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1807 = _1729 + _1805;
                float _1809 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1811 = _1809 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1813 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1815 = _1813 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1817 = 1.0 / _1811;
                float _1819 = _1807 * _1817;
                float _1821 = fma(_1819, _1815, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1763 = _1821;
                _1793 = true;
            }
            else
            {
                _1763 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1793 = false;
    float _1823 = _1763;
    float _1825 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1827 = _1687 + _1825;
    float _1829 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1831 = _1693 + _1829;
    float _1833 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1835 = _1695 + _1833;
    float _1837 = fma(_1827, _1823, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1839 = fma(_1831, _1823, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1841 = fma(_1835, _1823, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1845 = _1837 + _1843;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1849 = _1839 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1853 = _1841 + _1851;
    float _1855 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1857 = _1845 * _1845;
    float _1859 = fma(_1849, _1849, _1857);
    float _1861 = fma(_1853, _1853, _1859);
    float _1863 = rsqrt(_1861);
    float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1867 = _1849 * _1865;
    float _1869 = _1853 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 * _1869;
    float _1875 = _1871 + _1873;
    float _1877 = sqrt(_1875);
    bool _1879 = _1877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1883 = _1877 + _1881;
    float _1885 = _1853;
    float _1887 = _1883;
    float _1889 = _1867;
    if (_1879)
    {
        float _1891 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1891;
    }
    float _1893 = _1885;
    if (_1879)
    {
        float _1895 = rsqrt(_1875);
        _1753 = _1895;
    }
    float _1897 = _1753;
    float _1899 = _1897;
    if (_1879)
    {
        float _1901 = _1883 * _1893;
        _1887 = _1901;
    }
    float _1903 = _1887;
    float _1905 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1879)
    {
        float _1907 = _1903 * 0.15915493667125701904296875;
        _1755 = _1907;
    }
    float _1909 = _1755;
    float _1911 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1913 = _1863;
    if (_1879)
    {
        float _1915 = _1909 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1923 = precise::max(0.0, _1921);
    float _1925 = _1857;
    float _1927 = _1923;
    float _1929 = _1921;
    if (_1879)
    {
        float _1931 = _1909 * 6.283185482025146484375;
        float _1933 = cos(_1931);
        _1925 = _1933;
    }
    float _1935 = _1925;
    float _1937 = -_1865;
    float _1939 = -_1923;
    float _1941 = fma(_1845, _1937, _1939);
    if (_1879)
    {
        float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1943;
    }
    float _1945 = _1927;
    float _1947 = sqrt(_1861);
    float _1949 = _1945;
    float _1951 = _1919;
    if (_1879)
    {
        float _1953 = fma(_1919, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = _1955;
    if (!_1879)
    {
        _1951 = _1869;
    }
    float _1959 = _1951;
    float _1961 = _1959;
    if (_1879)
    {
        float _1963 = _1935 + (-1.0);
        _1929 = _1963;
    }
    float _1965 = _1929;
    float _1967 = _1965;
    if (_1879)
    {
        float _1969 = _1897 * _1955;
        _1757 = _1969;
    }
    float _1971 = _1757;
    if (!_1879)
    {
        _1899 = _1941;
    }
    float _1973 = _1899;
    float _1975 = _1973;
    if (_1879)
    {
        float _1977 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1967 = _1977;
    }
    float _1979 = _1967;
    float _1981 = _1979;
    if (_1879)
    {
        float _1983 = _1867 * _1971;
        _1889 = _1983;
    }
    float _1985 = _1889;
    if (!_1879)
    {
        _1957 = _1871;
    }
    float _1987 = _1957;
    float _1989 = _1987;
    if (_1879)
    {
        float _1991 = _1869 * _1971;
        _1961 = _1991;
    }
    float _1993 = _1961;
    if (_1879)
    {
        float _1995 = fma(_1941, _1935, _1979);
        _1975 = _1995;
    }
    float _1997 = _1975;
    if (_1879)
    {
        float _1999 = _1985 * _1985;
        _1989 = _1999;
    }
    float _2001 = _1989;
    if (!_1879)
    {
        _1981 = _1873;
    }
    float _2003 = _1981;
    float _2005 = _2003;
    if (_1879)
    {
        float _2007 = _1993 * _1993;
        _2005 = _2007;
    }
    float _2009 = _2005;
    float _2011 = fma(_1997, _1997, _2001);
    float _2013 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2015 = _2011 + _2009;
    float _2017 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2021 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2019);
    float _2023 = precise::clamp(_2021, 0.0, 1.0);
    float _2025 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2013);
    float _2027 = rsqrt(_2015);
    float _2029 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2017);
    float _2031 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2033 = -_2023;
    float _2035 = _2033 + 1.0;
    float _2037 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2025);
    float _2039 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2029);
    float _2041 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2031);
    float _2043 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2045 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2047 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2041);
    float _2049 = abs(_2035);
    float _2051 = log2(_2049);
    float _2053 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2055 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _2027 * _1985;
    float _2059 = _2027 * _1997;
    float _2061 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = -_2053;
    float _2065 = fma(_2063, _1855, 1.0);
    float _2067 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2069 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1911);
    float _2071 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2073 = _2027 * _1993;
    float _2075 = -_2067;
    float _2077 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2075);
    float _2079 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2081 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2071);
    float _2083 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2085 = -_2073;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2077);
    float _2089 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2091 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2081);
    float _2093 = exp2(_2083);
    float _2095 = fma(_2087, -0.5, 0.5);
    float _2097 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2099 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2089);
    float _2101 = fma(_2087, 0.5, 0.5);
    float _2103 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2097);
    float _2105 = _2059 + 1.0;
    float _2107 = log2(_2065);
    float _2109 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2099);
    float _2111 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2103);
    float _2113 = fma(_2101, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2115 = fma(_2101, _2113, -0.212114393711090087890625);
    float _2117 = 1.0 / _2091;
    float _2119 = -_2059;
    float _2121 = fma(_2093, _2105, _2119);
    float _2123 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2109);
    float _2125 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2111);
    float _2127 = fma(_2101, _2115, 1.570728778839111328125);
    float _2129 = fma(_2121, 0.5, 0.5);
    float _2131 = sqrt(_2095);
    float _2133 = _2107 * 0.693147182464599609375;
    float _2135 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2137 = _2123 * _2117;
    float _2139 = _2125 * _2117;
    float _2141 = fma(_2137, 0.5, 0.5);
    float _2143 = fma(_2139, -0.5, 0.5);
    float _2145 = _2131 * 0.636619746685028076171875;
    float3 _5278 = float3(_2141, _2143, _2135);
    float _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5278, float3(0.0), isnan(_5278)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5278, float3(0.0), isnan(_5278)), level(0.0)).x;
    float3 _5289 = float3(_2141, _2143, _2135);
    float4 _2149 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5289, float3(0.0), isnan(_5289)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5289, float3(0.0), isnan(_5289)), level(0.0)).xyzw;
    float _2151 = _2149.x;
    float _2153 = _2149.y;
    float _2155 = _2149.z;
    float _2157 = _2149.w;
    float _2159 = -_2127;
    float _2161 = fma(_2145, _2159, 1.0);
    float2 _5310 = float2(_2161, _2129);
    float3 _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5310, float2(0.0), isnan(_5310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5310, float2(0.0), isnan(_5310)), level(0.0)).xyz;
    float _2167 = _2165.x;
    float _2169 = _2165.y;
    float _2171 = _2165.z;
    float _2173 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2175 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.x = _1525;
    out.m_65.y = _1571;
    out.m_65.z = _1527;
    float _2177 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2175);
    float _2179 = exp2(_2173);
    out.m_67.x = _1839;
    out.m_67.y = _1837;
    out.m_67.z = _1841;
    float _2181 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2177);
    out.m_49.x = 1.0;
    float _2183 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2181);
    float _2185 = _2183 + _2091;
    out.gl_Position.x = _2123;
    out.gl_Position.y = _2125;
    out.gl_Position.z = _2183;
    out.gl_Position.w = _2091;
    float _2187 = _2185 * 0.5;
    float _2189 = -_2179;
    float _2191 = _2189 + 1.0;
    float _2193 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2195 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.z = _2187;
    out.m_69.w = _2091;
    float _2197 = -_2193;
    float _2199 = _2197 + 1.0;
    out.m_71.w = _2195;
    float _2201 = _2193 * _2147;
    float _2203 = _2157 * _2199;
    float _2205 = _2157 * _2201;
    float _2207 = _2171 * _2201;
    float _2209 = fma(_2167, _2205, _2151);
    float _2211 = fma(_2169, _2205, _2153);
    float _2213 = fma(_2157, _2207, _2155);
    out.m_73.x = _2209;
    out.m_73.y = _2211;
    out.m_73.z = _2213;
    out.m_73.w = _2203;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1793 = false;
    bool _767 = false;
    bool _581 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_46.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2271 = as_type<float>(_113);
        out.gl_Position.z = _2271;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = _131;
    if (_127)
    {
        float _135 = float(_97);
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2341 = as_type<float>(_151);
        out.gl_Position.z = _2341;
    }
    if (_143)
    {
        return out;
    }
    int _153 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _155 = _153;
    int _157 = 0;
    int _159 = _88(_155, _157, (*spvDescriptorSet0.support_buffer));
    float _161 = in.m_53.z;
    float _163 = in.m_55.z;
    float _165 = _131 + _161;
    float _167 = _165 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _169 = trunc(_163);
    int _171 = int(_169);
    float _173 = float(_159);
    int _175 = abs(_159);
    bool _177 = _159 == 0;
    float _179 = _167 * _173;
    float _181 = float(uint(_175));
    float _183 = trunc(_179);
    int _185 = int(_183);
    float _187 = 1.0 / _181;
    int _189 = abs(_185);
    uint _192 = uint(int(uint(_185) >> uint(31)));
    float _194 = float(uint(_189));
    int _196 = ~int(_192);
    int _198 = _196 + 1;
    int _200 = as_type<int>(_187) + (-2);
    float _202 = as_type<float>(_200) * _194;
    float _204 = trunc(_202);
    float _206 = precise::max(_204, 0.0);
    uint _208 = uint(_206);
    int _210 = ~int(_208);
    int _212 = _210 + 1;
    int _214 = _212 * _175;
    int _216 = _214 + _189;
    float _218 = float(uint(_216));
    float _220 = as_type<float>(_200) * _218;
    float _222 = trunc(_220);
    float _224 = precise::max(_222, 0.0);
    uint _226 = uint(_224);
    int _228 = int(_208) + int(_226);
    int _230 = ~_228;
    int _232 = _230 + 1;
    int _234 = _232 * _175;
    int _236 = _234 + _189;
    bool _238 = uint(_236) >= uint(_175);
    bool _240 = !_238;
    int _242 = _240 ? 0 : (-1);
    int _244 = ~_228;
    int _246 = _244 + _242;
    int _248 = _246 + 1;
    int _250 = _248 * _175;
    int _252 = _250 + _189;
    int _254 = _252 ^ _198;
    int _256 = ~_198;
    int _258 = _256 + _254;
    int _260 = _258 + 1;
    bool _262 = !_177;
    int _264 = _262 ? _260 : (-1);
    int _266 = _264;
    int _268 = 0;
    int _270 = _89(_266, _268, (*spvDescriptorSet0.support_buffer));
    int _272 = _171;
    int _274 = 0;
    int _276 = _89(_272, _274, (*spvDescriptorSet0.support_buffer));
    float4 _279 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_270, _276)), 0).xyzw;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float _287 = _279.w;
    float _289 = in.m_57.w;
    float _291 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _293 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _297 = _293 || _295;
    bool _299 = isnan(1.0);
    bool _301 = _297 || _299;
    float _303 = in.m_51.x;
    float _305 = in.m_51.y;
    float _307 = in.m_51.z;
    float _309 = in.m_46.x;
    float _311 = in.m_46.y;
    float _313 = in.m_46.z;
    float _315 = 0.0;
    float _317 = _291;
    if (!_301)
    {
        float _319 = _291 * _291;
        float _321 = _319 * 0.5;
        _315 = _321;
    }
    float _323 = _315;
    float _325 = _323;
    if (!_301)
    {
        float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _325 = _327;
    }
    float _329 = _325;
    bool _331 = !_301;
    float _333 = _329;
    if (!_331)
    {
        float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = log2(_335);
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _341 = _339 + 1.0;
        float _343 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = _291 * _337;
        float _347 = 1.0 / _341;
        float _349 = _343 * 0.693147182464599609375;
        float _351 = exp2(_345);
        float _353 = 1.0 / _349;
        float _355 = _351 + (-1.0);
        float _357 = -_355;
        float _359 = fma(_357, _353, _291);
        float _361 = _359 * _347;
        float _363 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _333 = _363;
    }
    float _365 = _333;
    bool _367 = !_301;
    if (!_367)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = 1.0 / _375;
        float _379 = _291 * _371;
        float _381 = exp2(_379);
        float _383 = -_381;
        float _385 = _383 + 1.0;
        float _387 = _385 * _377;
        _317 = _387;
    }
    float _389 = _317;
    float _391 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _393 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _395 = _264 + 1;
    float _397 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _399 = fma(_389, _303, _391);
    float _401 = fma(_389, _305, _393);
    int _403 = abs(_395);
    float _405 = fma(_389, _307, _397);
    float _407 = fma(_399, _289, _309);
    float _409 = fma(_401, _289, _311);
    float _411 = float(uint(_403));
    float _413 = fma(_405, _289, _313);
    uint _415 = as_type<uint>(half2(float2(_287, 0.0)));
    uint _417 = uint(int(uint(_395) >> uint(31)));
    float _419 = as_type<float>(_200) * _411;
    uint _421 = extract_bits(_415, 0u, 8u);
    int _423 = int(_421) & 255;
    uint _425 = extract_bits(_415, 8u, 8u);
    int _427 = int(_425) & 255;
    int _429 = _427 << 8;
    int _431 = _423 | _429;
    int _433 = ~int(_417);
    int _435 = _433 + 1;
    float _437 = trunc(_419);
    float _439 = precise::max(_437, 0.0);
    uint _441 = uint(_439);
    int _443 = ~int(_441);
    int _445 = _443 + 1;
    int _447 = _445 * _175;
    int _449 = _447 + _403;
    float _451 = float(uint(_449));
    float _453 = as_type<float>(_200) * _451;
    float _455 = trunc(_453);
    float _457 = precise::max(_455, 0.0);
    uint _459 = uint(_457);
    int _461 = int(_441) + int(_459);
    int _463 = ~_461;
    int _465 = _463 + 1;
    int _467 = _465 * _175;
    int _469 = _467 + _403;
    bool _471 = uint(_469) >= uint(_175);
    bool _473 = !_471;
    int _475 = _473 ? 0 : (-1);
    bool _477 = _431 >= 32768;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _481 = ~_461;
    int _483 = _481 + _475;
    int _485 = _483 + 1;
    float _487 = _479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _489 = _485 * _175;
    int _491 = _489 + _403;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _495 = _491 ^ _435;
    float _497 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _499 = ~_435;
    int _501 = _499 + _495;
    int _503 = _501 + 1;
    int _505 = _431 + (-1024);
    int _507 = _505;
    float _509 = _409;
    float _511 = _413;
    if (_477)
    {
        int _513 = ~_431;
        int _515 = _513 + 33792;
        int _517 = _515 + 1;
        _507 = _517;
    }
    int _519 = _507;
    bool _521 = !_177;
    int _523 = _521 ? _503 : (-1);
    int _525 = _519 + 30719;
    float _527 = float(_525);
    float _529 = fma(_527, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _533 = abs(_529);
    float _535 = -_533;
    float _537 = _535 + 1.0;
    float _539 = abs(_529);
    float _541 = fma(_539, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _543 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _545 = _529 < 0.0;
    float _547 = float(_545);
    int _549 = as_type<int>(_537) + (-218103808);
    float _551 = abs(_529);
    float _553 = fma(_551, _541, -0.212114393711090087890625);
    bool _555 = uint(_549) >= 1920991232u;
    float _557 = abs(_529);
    float _559 = fma(_557, _553, 1.570728778839111328125);
    bool _561 = !_555;
    float _579;
    if (!_561)
    {
        int _563 = as_type<int>(_537);
        int _565 = as_type<int>(_289);
        int _567 = 2368;
        int _569;
        int _571;
        int _573;
        int _575;
        int _577;
        _86(_563, _565, _567, _569, _571, _573, _575, _577, out.gl_Position, out.gl_PointSize);
        _579 = as_type<float>(_573);
        _581 = true;
    }
    else
    {
        float _583 = rsqrt(_537);
        float _585 = _537 * _583;
        float _587 = _583 * 0.5;
        float _589 = -_585;
        float _591 = 0.0 + _589;
        float _593 = fma(_587, _591, 0.5);
        float _595 = fma(_585, _593, _585);
        float _597 = -_595;
        float _599 = 0.0 + _597;
        float _601 = fma(_595, _599, _537);
        float _603 = fma(_587, _601, _595);
        _579 = _603;
    }
    _581 = false;
    float _605 = _579;
    int _607 = _523;
    int _609 = 0;
    int _611 = _89(_607, _609, (*spvDescriptorSet0.support_buffer));
    int _613 = _171;
    int _615 = 0;
    int _617 = _89(_613, _615, (*spvDescriptorSet0.support_buffer));
    float4 _619 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_611, _617)), 0).xyzw;
    float _621 = _619.x;
    float _623 = _619.y;
    float _625 = _619.z;
    float _627 = _619.w;
    float _629 = _559 * _605;
    float _631 = _547 * 2.0;
    float _633 = _527 * 3.883221149444580078125;
    float _635 = floor(_179);
    float _637 = -_631;
    float _639 = fma(_629, _637, _629);
    float _641 = _633 * 0.15915493667125701904296875;
    float _643 = fma(_547, 3.1415927410125732421875, _639);
    float _645 = _641 * 6.283185482025146484375;
    float _647 = cos(_645);
    float _649 = _643 * 0.15915493667125701904296875;
    float _651 = _649 * 6.283185482025146484375;
    float _653 = sin(_651);
    float _655 = -_635;
    float _657 = _179 + _655;
    float _659 = _641 * 6.283185482025146484375;
    float _661 = sin(_659);
    float _663 = _653 * _647;
    float _665 = _653 * _661;
    uint _667 = as_type<uint>(half2(float2(_627, 0.0)));
    float _669 = -_281;
    float _671 = _669 + _621;
    float _673 = -_283;
    float _675 = _673 + _623;
    uint _677 = extract_bits(_667, 0u, 8u);
    int _679 = int(_677) & 255;
    uint _681 = extract_bits(_667, 8u, 8u);
    int _683 = int(_681) & 255;
    int _685 = _683 << 8;
    int _687 = _679 | _685;
    float _689 = fma(_657, _671, _281);
    float _691 = fma(_657, _675, _283);
    bool _693 = _687 >= 32768;
    int _695 = _687 + (-1024);
    int _697 = _695;
    float _699 = _663;
    if (_693)
    {
        int _701 = ~_687;
        int _703 = _701 + 33792;
        int _705 = _703 + 1;
        _697 = _705;
    }
    int _707 = _697;
    int _709 = _707 + 30719;
    float _711 = float(_709);
    float _713 = fma(_711, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _715 = abs(_713);
    float _717 = -_715;
    float _719 = _717 + 1.0;
    float _721 = abs(_713);
    float _723 = fma(_721, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _725 = _713 < 0.0;
    float _727 = float(_725);
    int _729 = as_type<int>(_719) + (-218103808);
    float _731 = abs(_713);
    float _733 = fma(_731, _723, -0.212114393711090087890625);
    bool _735 = uint(_729) >= 1920991232u;
    float _737 = -_285;
    float _739 = _737 + _625;
    float _741 = abs(_713);
    float _743 = fma(_741, _733, 1.570728778839111328125);
    float _745 = fma(_657, _739, _285);
    bool _747 = !_735;
    float _765;
    if (!_747)
    {
        int _749 = as_type<int>(_719);
        int _751 = as_type<int>(_623);
        int _753 = 3280;
        int _755;
        int _757;
        int _759;
        int _761;
        int _763;
        _86(_749, _751, _753, _755, _757, _759, _761, _763, out.gl_Position, out.gl_PointSize);
        _765 = as_type<float>(_759);
        _767 = true;
    }
    else
    {
        float _769 = rsqrt(_719);
        float _771 = _719 * _769;
        float _773 = _769 * 0.5;
        float _775 = -_771;
        float _777 = 0.0 + _775;
        float _779 = fma(_773, _777, 0.5);
        float _781 = fma(_771, _779, _771);
        float _783 = -_781;
        float _785 = 0.0 + _783;
        float _787 = fma(_781, _785, _719);
        float _789 = fma(_773, _787, _781);
        _765 = _789;
    }
    _767 = false;
    float _791 = _765;
    float _793 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _795 = log2(_793);
    float _797 = in.m_53.x;
    float _799 = in.m_53.y;
    float _801 = in.m_53.z;
    float _803 = _743 * _791;
    float _805 = _711 * 3.883221149444580078125;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _809 = 1.0 + _807;
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _813 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _815 = isnan(1.0);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _821 = _817 || _819;
    float _823 = _795 * _131;
    float _825 = 1.0 / _809;
    bool _827 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _829 = isnan(0.0);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _835 = _831 || _833;
    float _837 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _839 = exp2(_823);
    float _841 = _801 * 2.0;
    float _843 = _799 * 2.0;
    float _845 = floor(_841);
    float _847 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _849 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _851 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _837);
    float _853 = _799 + _801;
    float _855 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _847);
    float _857 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _849);
    float _859 = _797 * 2.0;
    float _861 = floor(_843);
    float _863 = -_839;
    float _865 = _863 + 1.0;
    float _867 = _853 + (-1.0);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _879 = _877 != 0;
    float _881 = _799 + _797;
    float _883 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _855);
    float _885 = _835 ? _865 : 0.0;
    float _887 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _889 = floor(_859);
    bool _891 = !_871;
    int _893 = _891 ? 0 : 1;
    float _895 = _881 + (-1.0);
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _899 = _897 != 0;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _907 = _905 != 0;
    if (_821)
    {
        float _909 = _885 * _825;
        _133 = _909;
    }
    float _911 = _133;
    bool _913 = _845 >= 0.0;
    bool _915 = isnan(_845);
    bool _917 = _913 || _915;
    bool _919 = isnan(0.0);
    bool _921 = _917 || _919;
    bool _923 = !_879;
    int _925 = _923 ? 0 : 1;
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _929 = _845 > 0.0;
    int _931 = _921 ? 0 : 1;
    bool _933 = _861 > 0.0;
    float _935 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _937 = _861 >= 0.0;
    bool _939 = isnan(_861);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.0);
    bool _945 = _941 || _943;
    bool _947 = !_875;
    int _949 = _947 ? 0 : 1;
    bool _951 = _889 >= 0.0;
    bool _953 = isnan(_889);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    float _961 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _851);
    int _963 = ~_931;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _857);
    bool _971 = !_907;
    int _973 = _971 ? 0 : 1;
    float _975 = _911 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _977 = _967;
    if (!_929)
    {
        int _979 = ~_931;
        int _981 = _979 + 1;
        _977 = _981;
    }
    int _983 = _977;
    int _985 = _959 ? 0 : 1;
    float _987 = _975 * _927;
    int _989 = _945 ? 0 : 1;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1001 = _999 != 0;
    float _1003 = _911 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _1005 = _889 > 0.0;
    float _1007 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[203].x, _987);
    int _1009 = ~_985;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    float _1015 = _1003 * _811;
    bool _1017 = !_993;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = floor(_1007);
    float _1023 = float(_983);
    float _1025 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1015);
    int _1027 = abs(_1019);
    int _1029 = ~_989;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    int _1035 = _1033;
    int _1037 = _1013;
    if (!_933)
    {
        int _1039 = ~_989;
        int _1041 = _1039 + 1;
        _1035 = _1041;
    }
    int _1043 = _1035;
    float _1045 = floor(_1025);
    if (!_1005)
    {
        int _1047 = ~_985;
        int _1049 = _1047 + 1;
        _1037 = _1049;
    }
    int _1051 = _1037;
    bool _1053 = !_1001;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = float(_1051);
    float _1059 = _1007 + 0.25;
    int _1061 = abs(_1055);
    bool _1063 = !_997;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = floor(_1059);
    float _1069 = _1025 + 0.25;
    int _1071 = abs(_1065);
    float _1073 = float(_1043);
    float _1075 = floor(_1069);
    float _1077 = float(_1061);
    float _1079 = -_1021;
    float _1081 = _1007 + _1079;
    float _1083 = float(_1071);
    float _1085 = _1007 * 6.283185482025146484375;
    float _1087 = float(_1027);
    bool _1089 = _1081 >= 0.5;
    bool _1091 = isnan(_1081);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(0.5);
    bool _1097 = _1093 || _1095;
    float _1099 = _1083 * _1057;
    float _1101 = _1077 * _1073;
    float _1103 = -_1067;
    float _1105 = _1059 + _1103;
    int _1107 = abs(_949);
    float _1109 = -_1045;
    float _1111 = _1025 + _1109;
    bool _1113 = !_1097;
    float _1115 = _1113 ? 0.5 : (-0.5);
    float _1117 = _1085 * 0.15915493667125701904296875;
    bool _1119 = !_903;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = _1087 * _1023;
    bool _1125 = _1111 >= 0.5;
    bool _1127 = isnan(_1111);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan(0.5);
    bool _1133 = _1129 || _1131;
    float _1135 = _1101 * (-2.0);
    float _1137 = float(_1107);
    float _1139 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1141 = _1139 * 2.0;
    bool _1143 = _1105 > 0.5;
    float _1145 = _1117 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    int _1149 = abs(_1121);
    float _1151 = -_1075;
    float _1153 = _1069 + _1151;
    float _1155 = _1025 * 6.283185482025146484375;
    float _1157 = _1137 * _1141;
    int _1159 = abs(_893);
    float _1161 = _1123 * (-2.0);
    float _1163 = _1155 * 0.15915493667125701904296875;
    float _1165 = in.m_59.x;
    float _1167 = in.m_59.y;
    float _1169 = in.m_59.z;
    bool _1171 = !_1133;
    float _1173 = _1171 ? 0.5 : (-0.5);
    float _1175 = fma(_935, _1161, _935);
    float _1177 = float(_1149);
    float _1179 = _1105;
    float _1181 = _1153;
    if (_1143)
    {
        float _1183 = -_1105;
        float _1185 = _1183 + 1.0;
        _1179 = _1185;
    }
    float _1187 = _1179;
    float _1189 = _1163 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    bool _1193 = _1153 > 0.5;
    float _1195 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1197 = _1195 * 2.0;
    float _1199 = float(_1159);
    float _1201 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1203 = abs(_925);
    float _1205 = _1177 * _1197;
    bool _1207 = !_899;
    int _1209 = _1207 ? 0 : 1;
    float _1211 = fma(_1199, _1201, _1157);
    float _1213 = fma(_1187, 4.0, -1.0);
    int _1215 = abs(_1209);
    float _1217 = _1099 * (-2.0);
    float _1219 = float(_1203);
    if (_1193)
    {
        float _1221 = -_1153;
        float _1223 = _1221 + 1.0;
        _1181 = _1223;
    }
    float _1225 = _1181;
    float _1227 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1229 = float(_1215);
    float _1231 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1233 = abs(_973);
    float _1235 = fma(_1225, 4.0, -1.0);
    float _1237 = fma(_1219, _1227, _1211);
    float _1239 = fma(_887, _1217, _887);
    float _1241 = fma(_1217, _1167, _1167);
    float _1243 = fma(_1229, _1231, _1205);
    float _1245 = _799 + (-0.5);
    float _1247 = float(_1233);
    float _1249 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1251 = fma(_1237, 3.1415927410125732421875, _1165);
    float _1253 = rsqrt(_883);
    float _1255 = _797 + (-0.5);
    float _1257 = _797 + _801;
    float _1259 = fma(_1251, _1161, _1251);
    float _1261 = _801 + (-0.5);
    float _1263 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1259);
    float _1265 = rsqrt(_969);
    float _1267 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1241);
    float _1269 = fma(_1247, _1249, _1243);
    float _1271 = fma(_1175, _911, _1263);
    float _1273 = _1257 + (-1.0);
    float _1275 = fma(_1239, _911, _1267);
    float _1277 = _1271 * 0.15915493667125701904296875;
    float _1279 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1281 = fma(_1269, 3.1415927410125732421875, _1169);
    float _1283 = rsqrt(_961);
    float _1285 = in.m_57.x;
    float _1287 = in.m_57.y;
    float _1289 = in.m_57.z;
    float _1291 = fma(_1279, _1135, _1279);
    float _1293 = fma(_1281, _1135, _1281);
    float _1295 = _1275 * 0.15915493667125701904296875;
    float _1297 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1293);
    float _1299 = sqrt(_961);
    float _1301 = fma(_1291, _911, _1297);
    float _1303 = _1301 * 0.15915493667125701904296875;
    float _1305 = _691 * _1253;
    float _1307 = _1277 * 6.283185482025146484375;
    float _1309 = sin(_1307);
    float _1311 = _689 * _1283;
    float _1313 = _745 * _1265;
    float _1315 = _1299 * _1311;
    float _1317 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1319 = _1277 * 6.283185482025146484375;
    float _1321 = cos(_1319);
    float _1323 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1325 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1329 = _1299 * _1313;
    float _1331 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1333 = _1325 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1335 = _1299 * _1305;
    float _1337 = _1303 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1315);
    float _1343 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1329);
    float _1345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1335);
    bool _1347 = _1335 != 0.0;
    bool _1349 = isnan(_1335);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = _1341 * _1327;
    float _1359 = _1345 * _1333;
    float _1361 = _1303 * 6.283185482025146484375;
    float _1363 = cos(_1361);
    bool _1365 = _1315 == 0.0;
    bool _1367 = !_1355;
    bool _1369 = _1365 && _1367;
    bool _1371 = _1329 == 0.0;
    bool _1373 = _1371 && _1369;
    float _1375 = _1295 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = _1343 * _1331;
    float _1381 = _1321 * _1339;
    float _1383 = _1309 * _1339;
    float _1385 = _1295 * 6.283185482025146484375;
    float _1387 = sin(_1385);
    float _1389 = _1309 * _1363;
    float _1391 = _1321 * _1363;
    float _1393 = _1309 * _1377;
    float _1395 = _1339 * _1377;
    float _1397 = _1363 * _1377;
    float _1399 = _1321 * _1377;
    float _1401 = _1393 * _1359;
    float _1403 = -_1381;
    float _1405 = fma(_1387, _1389, _1403);
    float _1407 = fma(_1387, _1383, _1391);
    float _1409 = fma(_1387, _1391, _1383);
    float _1411 = -_1389;
    float _1413 = fma(_1387, _1381, _1411);
    float _1415 = _1405 * _1359;
    float _1417 = _1407 * _1359;
    float _1419 = -_1387;
    float _1421 = fma(_1419, _1357, _1401);
    float _1423 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1425 = fma(_1397, _1357, _1415);
    float _1427 = fma(_1395, _1357, _1417);
    float _1429 = fma(_1399, _1379, _1421);
    float _1431 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1433 = _1423 * _1423;
    float _1435 = fma(_1413, _1379, _1427);
    float _1437 = fma(_1409, _1379, _1425);
    float _1439 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1441 = fma(_1431, _1431, _1433);
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1447 = fma(_1439, _1439, _1441);
    float _1449 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1443);
    float _1451 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1453 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1445);
    float _1455 = sqrt(_1447);
    float _1457 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1449);
    float _1459 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1451);
    float _1461 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1453);
    float _1463 = _727 * 2.0;
    float _1465 = _1457 * _1457;
    float _1467 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1459);
    float _1469 = rsqrt(_1447);
    float _1471 = fma(_1461, _1461, _1465);
    float _1473 = -_1463;
    float _1475 = fma(_803, _1473, _803);
    float _1477 = fma(_1467, _1467, _1471);
    float _1479 = fma(_727, 3.1415927410125732421875, _1475);
    float _1481 = rsqrt(_1477);
    float _1483 = _1423 * _1469;
    float _1485 = _1431 * _1469;
    float _1487 = _1439 * _1469;
    float _1489 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1491 = _1457 * _1481;
    float _1493 = _1461 * _1481;
    float _1495 = _1467 * _1481;
    float _1497 = _1483 * _1491;
    float _1499 = fma(_1485, _1493, _1497);
    float _1501 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1503 = fma(_1487, _1495, _1499);
    float _1505 = _805 * 0.15915493667125701904296875;
    float _1507 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1489);
    float _1509 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1501);
    float _1511 = _1503 * _1455;
    float _1513 = _1505 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1507);
    float _1519 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1509);
    float _1521 = fma(_1485, _1511, _1461);
    float _1523 = fma(_1487, _1511, _1467);
    float _1525 = _1517 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1527 = _1519 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1529 = fma(_1483, _1511, _1457);
    float _1531 = _1505 * 6.283185482025146484375;
    float _1533 = sin(_1531);
    float _1535 = _1525 + _1521;
    float _1537 = _1527 + _1523;
    float _1539 = _1479 * 0.15915493667125701904296875;
    float _1541 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1545 = _1535 + _1543;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1549 = _1537 + _1547;
    float _1551 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1541);
    float _1553 = _1545 * _1545;
    float _1555 = _1549 * _1549;
    float _1557 = _1539 * 6.283185482025146484375;
    float _1559 = sin(_1557);
    float _1561 = -_529;
    float _1563 = _1561 + _713;
    float _1565 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1551);
    float _1567 = _1553 + _1555;
    float _1569 = fma(_657, _1563, _529);
    float _1571 = _1565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1573 = sqrt(_1567);
    float _1575 = _1569;
    float _1577 = _1563;
    float _1579 = _1529;
    if (!_1373)
    {
        float _1581 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1569);
        _1575 = _1581;
    }
    float _1583 = _1575;
    float _1585 = _1393 * _1583;
    float _1587 = _1405 * _1583;
    float _1589 = -_663;
    float _1591 = fma(_1559, _1515, _1589);
    float _1593 = -_665;
    float _1595 = fma(_1559, _1533, _1593);
    float _1597 = fma(_657, _1591, _663);
    float _1599 = fma(_657, _1595, _665);
    float _1601 = _1407 * _1583;
    float _1603 = _1571 + _1529;
    bool _1605 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1607 = _1597;
    float _1609 = _1599;
    float _1611 = _1583;
    if (!_1373)
    {
        float _1613 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1597);
        _1607 = _1613;
    }
    float _1615 = _1607;
    if (!_1373)
    {
        float _1617 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1599);
        _1609 = _1617;
    }
    float _1619 = _1609;
    if (!_1605)
    {
        _699 = _1555;
    }
    float _1621 = _699;
    float _1623 = _1621;
    if (!_1605)
    {
        _1611 = _1553;
    }
    float _1625 = _1611;
    float _1627 = _1625;
    if (!_1605)
    {
        _509 = _1535;
    }
    float _1629 = _509;
    float _1631 = _1629;
    if (!_1605)
    {
        _1577 = _1537;
    }
    float _1633 = _1577;
    float _1635 = _1633;
    if (!_1605)
    {
        _511 = _1603;
    }
    float _1637 = _511;
    bool _1639 = !_1605;
    float _1641 = _1637;
    if (!_1639)
    {
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1645 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1647 = _1573 + _1645;
        float _1649 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1651 = rsqrt(_1567);
        float _1653 = _1647 * _1643;
        float _1655 = _1653 * 0.15915493667125701904296875;
        float _1657 = _1655 * 6.283185482025146484375;
        float _1659 = sin(_1657);
        float _1661 = _1655 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        float _1665 = fma(_1659, _1649, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1667 = _1651 * _1665;
        float _1669 = _1663 + (-1.0);
        float _1671 = _1545 * _1667;
        float _1673 = _1549 * _1667;
        float _1675 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1677 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1679 = _1671 * _1671;
        float _1681 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1683 = fma(_1603, _1663, _1675);
        float _1685 = _1673 * _1673;
        _1641 = _1683;
        _1627 = _1679;
        _1623 = _1685;
        _1631 = _1677;
        _1635 = _1681;
        _1579 = _1655;
    }
    float _1687 = _1641;
    float _1689 = _1627;
    float _1691 = _1623;
    float _1693 = _1631;
    float _1695 = _1635;
    float _1697 = _1579;
    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1701 = _1687 + _1699;
    float _1703 = fma(_1395, _1615, _1601);
    float _1705 = fma(_1397, _1615, _1587);
    float _1707 = -_1387;
    float _1709 = fma(_1707, _1615, _1585);
    float _1711 = fma(_1701, _1701, _1689);
    float _1713 = fma(_1413, _1619, _1703);
    float _1715 = fma(_1409, _1619, _1705);
    float _1717 = fma(_1399, _1619, _1709);
    float _1719 = _1711 + _1691;
    float _1721 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1723 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1725 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_61.x = _543;
    out.m_61.y = _497;
    out.m_61.z = _487;
    float _1727 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1721);
    float _1729 = sqrt(_1719);
    float _1731 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1723);
    float _1733 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1725);
    float _1735 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1727);
    float _1737 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1731);
    float _1739 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1733);
    out.m_63.x = _1735;
    out.m_63.y = _1737;
    out.m_63.z = _1739;
    bool _1741 = _1729 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1743 = isnan(_1729);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1749 = _1745 || _1747;
    float _1751 = _1717;
    float _1753 = _1687;
    float _1755 = _1735;
    float _1757 = _1697;
    if (!_1749)
    {
        _1751 = 1.0;
    }
    float _1759 = _1751;
    bool _1761 = !_1749;
    float _1763 = _1759;
    if (!_1761)
    {
        bool _1765 = _1729 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1767 = isnan(_1729);
        bool _1769 = _1765 || _1767;
        bool _1771 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1773 = _1769 || _1771;
        if (!_1773)
        {
            float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1777 = _1729 + _1775;
            float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1781 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1779;
            float _1783 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1785 = _1783 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1787 = 1.0 / _1781;
            float _1789 = _1777 * _1787;
            float _1791 = fma(_1789, _1785, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1763 = _1791;
            _1793 = true;
        }
        else
        {
            bool _1795 = _1729 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1797 = isnan(_1729);
            bool _1799 = _1795 || _1797;
            bool _1801 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1803 = _1799 || _1801;
            if (!_1803)
            {
                float _1805 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1807 = _1729 + _1805;
                float _1809 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1811 = _1809 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1813 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1815 = _1813 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1817 = 1.0 / _1811;
                float _1819 = _1807 * _1817;
                float _1821 = fma(_1819, _1815, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1763 = _1821;
                _1793 = true;
            }
            else
            {
                _1763 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1793 = false;
    float _1823 = _1763;
    float _1825 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1827 = _1687 + _1825;
    float _1829 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1831 = _1693 + _1829;
    float _1833 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1835 = _1695 + _1833;
    float _1837 = fma(_1827, _1823, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1839 = fma(_1831, _1823, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1841 = fma(_1835, _1823, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1845 = _1837 + _1843;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1849 = _1839 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1853 = _1841 + _1851;
    float _1855 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1857 = _1845 * _1845;
    float _1859 = fma(_1849, _1849, _1857);
    float _1861 = fma(_1853, _1853, _1859);
    float _1863 = rsqrt(_1861);
    float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1867 = _1849 * _1865;
    float _1869 = _1853 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 * _1869;
    float _1875 = _1871 + _1873;
    float _1877 = sqrt(_1875);
    bool _1879 = _1877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1883 = _1877 + _1881;
    float _1885 = _1853;
    float _1887 = _1883;
    float _1889 = _1867;
    if (_1879)
    {
        float _1891 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1891;
    }
    float _1893 = _1885;
    if (_1879)
    {
        float _1895 = rsqrt(_1875);
        _1753 = _1895;
    }
    float _1897 = _1753;
    float _1899 = _1897;
    if (_1879)
    {
        float _1901 = _1883 * _1893;
        _1887 = _1901;
    }
    float _1903 = _1887;
    float _1905 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1879)
    {
        float _1907 = _1903 * 0.15915493667125701904296875;
        _1755 = _1907;
    }
    float _1909 = _1755;
    float _1911 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1913 = _1863;
    if (_1879)
    {
        float _1915 = _1909 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1923 = precise::max(0.0, _1921);
    float _1925 = _1857;
    float _1927 = _1923;
    float _1929 = _1921;
    if (_1879)
    {
        float _1931 = _1909 * 6.283185482025146484375;
        float _1933 = cos(_1931);
        _1925 = _1933;
    }
    float _1935 = _1925;
    float _1937 = -_1865;
    float _1939 = -_1923;
    float _1941 = fma(_1845, _1937, _1939);
    if (_1879)
    {
        float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1943;
    }
    float _1945 = _1927;
    float _1947 = sqrt(_1861);
    float _1949 = _1945;
    float _1951 = _1919;
    if (_1879)
    {
        float _1953 = fma(_1919, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = _1955;
    if (!_1879)
    {
        _1951 = _1869;
    }
    float _1959 = _1951;
    float _1961 = _1959;
    if (_1879)
    {
        float _1963 = _1935 + (-1.0);
        _1929 = _1963;
    }
    float _1965 = _1929;
    float _1967 = _1965;
    if (_1879)
    {
        float _1969 = _1897 * _1955;
        _1757 = _1969;
    }
    float _1971 = _1757;
    if (!_1879)
    {
        _1899 = _1941;
    }
    float _1973 = _1899;
    float _1975 = _1973;
    if (_1879)
    {
        float _1977 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1967 = _1977;
    }
    float _1979 = _1967;
    float _1981 = _1979;
    if (_1879)
    {
        float _1983 = _1867 * _1971;
        _1889 = _1983;
    }
    float _1985 = _1889;
    if (!_1879)
    {
        _1957 = _1871;
    }
    float _1987 = _1957;
    float _1989 = _1987;
    if (_1879)
    {
        float _1991 = _1869 * _1971;
        _1961 = _1991;
    }
    float _1993 = _1961;
    if (_1879)
    {
        float _1995 = fma(_1941, _1935, _1979);
        _1975 = _1995;
    }
    float _1997 = _1975;
    if (_1879)
    {
        float _1999 = _1985 * _1985;
        _1989 = _1999;
    }
    float _2001 = _1989;
    if (!_1879)
    {
        _1981 = _1873;
    }
    float _2003 = _1981;
    float _2005 = _2003;
    if (_1879)
    {
        float _2007 = _1993 * _1993;
        _2005 = _2007;
    }
    float _2009 = _2005;
    float _2011 = fma(_1997, _1997, _2001);
    float _2013 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2015 = _2011 + _2009;
    float _2017 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2021 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2019);
    float _2023 = precise::clamp(_2021, 0.0, 1.0);
    float _2025 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2013);
    float _2027 = rsqrt(_2015);
    float _2029 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2017);
    float _2031 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2033 = -_2023;
    float _2035 = _2033 + 1.0;
    float _2037 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2025);
    float _2039 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2029);
    float _2041 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2031);
    float _2043 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2045 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2047 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2041);
    float _2049 = abs(_2035);
    float _2051 = log2(_2049);
    float _2053 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2055 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _2027 * _1985;
    float _2059 = _2027 * _1997;
    float _2061 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = -_2053;
    float _2065 = fma(_2063, _1855, 1.0);
    float _2067 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2069 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1911);
    float _2071 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2073 = _2027 * _1993;
    float _2075 = -_2067;
    float _2077 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2075);
    float _2079 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2081 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2071);
    float _2083 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2085 = -_2073;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2077);
    float _2089 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2091 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2081);
    float _2093 = exp2(_2083);
    float _2095 = fma(_2087, -0.5, 0.5);
    float _2097 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2099 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2089);
    float _2101 = fma(_2087, 0.5, 0.5);
    float _2103 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2097);
    float _2105 = _2059 + 1.0;
    float _2107 = log2(_2065);
    float _2109 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2099);
    float _2111 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2103);
    float _2113 = fma(_2101, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2115 = fma(_2101, _2113, -0.212114393711090087890625);
    float _2117 = 1.0 / _2091;
    float _2119 = -_2059;
    float _2121 = fma(_2093, _2105, _2119);
    float _2123 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2109);
    float _2125 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2111);
    float _2127 = fma(_2101, _2115, 1.570728778839111328125);
    float _2129 = fma(_2121, 0.5, 0.5);
    float _2131 = sqrt(_2095);
    float _2133 = _2107 * 0.693147182464599609375;
    float _2135 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2137 = _2123 * _2117;
    float _2139 = _2125 * _2117;
    float _2141 = fma(_2137, 0.5, 0.5);
    float _2143 = fma(_2139, -0.5, 0.5);
    float _2145 = _2131 * 0.636619746685028076171875;
    float3 _5278 = float3(_2141, _2143, _2135);
    float _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5278, float3(0.0), isnan(_5278)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5278, float3(0.0), isnan(_5278)), level(0.0)).x;
    float3 _5289 = float3(_2141, _2143, _2135);
    float4 _2149 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5289, float3(0.0), isnan(_5289)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5289, float3(0.0), isnan(_5289)), level(0.0)).xyzw;
    float _2151 = _2149.x;
    float _2153 = _2149.y;
    float _2155 = _2149.z;
    float _2157 = _2149.w;
    float _2159 = -_2127;
    float _2161 = fma(_2145, _2159, 1.0);
    float2 _5310 = float2(_2161, _2129);
    float3 _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5310, float2(0.0), isnan(_5310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5310, float2(0.0), isnan(_5310)), level(0.0)).xyz;
    float _2167 = _2165.x;
    float _2169 = _2165.y;
    float _2171 = _2165.z;
    float _2173 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2175 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.x = _1525;
    out.m_65.y = _1571;
    out.m_65.z = _1527;
    float _2177 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2175);
    float _2179 = exp2(_2173);
    out.m_67.x = _1839;
    out.m_67.y = _1837;
    out.m_67.z = _1841;
    float _2181 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2177);
    out.m_49.x = 1.0;
    float _2183 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2181);
    float _2185 = _2183 + _2091;
    out.gl_Position.x = _2123;
    out.gl_Position.y = _2125;
    out.gl_Position.z = _2183;
    out.gl_Position.w = _2091;
    float _2187 = _2185 * 0.5;
    float _2189 = -_2179;
    float _2191 = _2189 + 1.0;
    float _2193 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2195 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.z = _2187;
    out.m_69.w = _2091;
    float _2197 = -_2193;
    float _2199 = _2197 + 1.0;
    out.m_71.w = _2195;
    float _2201 = _2193 * _2147;
    float _2203 = _2157 * _2199;
    float _2205 = _2157 * _2201;
    float _2207 = _2171 * _2201;
    float _2209 = fma(_2167, _2205, _2151);
    float _2211 = fma(_2169, _2205, _2153);
    float _2213 = fma(_2157, _2207, _2155);
    out.m_73.x = _2209;
    out.m_73.y = _2211;
    out.m_73.z = _2213;
    out.m_73.w = _2203;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1793 = false;
    bool _767 = false;
    bool _581 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_46.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2271 = as_type<float>(_113);
        out.gl_Position.z = _2271;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = _131;
    if (_127)
    {
        float _135 = float(_97);
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2341 = as_type<float>(_151);
        out.gl_Position.z = _2341;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    int _153 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _155 = _153;
    int _157 = 0;
    int _159 = _88(_155, _157, (*spvDescriptorSet0.support_buffer));
    float _161 = in.m_53.z;
    float _163 = in.m_55.z;
    float _165 = _131 + _161;
    float _167 = _165 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _169 = trunc(_163);
    int _171 = int(_169);
    float _173 = float(_159);
    int _175 = abs(_159);
    bool _177 = _159 == 0;
    float _179 = _167 * _173;
    float _181 = float(uint(_175));
    float _183 = trunc(_179);
    int _185 = int(_183);
    float _187 = 1.0 / _181;
    int _189 = abs(_185);
    uint _192 = uint(int(uint(_185) >> uint(31)));
    float _194 = float(uint(_189));
    int _196 = ~int(_192);
    int _198 = _196 + 1;
    int _200 = as_type<int>(_187) + (-2);
    float _202 = as_type<float>(_200) * _194;
    float _204 = trunc(_202);
    float _206 = precise::max(_204, 0.0);
    uint _208 = uint(_206);
    int _210 = ~int(_208);
    int _212 = _210 + 1;
    int _214 = _212 * _175;
    int _216 = _214 + _189;
    float _218 = float(uint(_216));
    float _220 = as_type<float>(_200) * _218;
    float _222 = trunc(_220);
    float _224 = precise::max(_222, 0.0);
    uint _226 = uint(_224);
    int _228 = int(_208) + int(_226);
    int _230 = ~_228;
    int _232 = _230 + 1;
    int _234 = _232 * _175;
    int _236 = _234 + _189;
    bool _238 = uint(_236) >= uint(_175);
    bool _240 = !_238;
    int _242 = _240 ? 0 : (-1);
    int _244 = ~_228;
    int _246 = _244 + _242;
    int _248 = _246 + 1;
    int _250 = _248 * _175;
    int _252 = _250 + _189;
    int _254 = _252 ^ _198;
    int _256 = ~_198;
    int _258 = _256 + _254;
    int _260 = _258 + 1;
    bool _262 = !_177;
    int _264 = _262 ? _260 : (-1);
    int _266 = _264;
    int _268 = 0;
    int _270 = _89(_266, _268, (*spvDescriptorSet0.support_buffer));
    int _272 = _171;
    int _274 = 0;
    int _276 = _89(_272, _274, (*spvDescriptorSet0.support_buffer));
    float4 _279 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_270, _276)), 0).xyzw;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float _287 = _279.w;
    float _289 = in.m_57.w;
    float _291 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _293 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _297 = _293 || _295;
    bool _299 = isnan(1.0);
    bool _301 = _297 || _299;
    float _303 = in.m_51.x;
    float _305 = in.m_51.y;
    float _307 = in.m_51.z;
    float _309 = in.m_46.x;
    float _311 = in.m_46.y;
    float _313 = in.m_46.z;
    float _315 = 0.0;
    float _317 = _291;
    if (!_301)
    {
        float _319 = _291 * _291;
        float _321 = _319 * 0.5;
        _315 = _321;
    }
    float _323 = _315;
    float _325 = _323;
    if (!_301)
    {
        float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _325 = _327;
    }
    float _329 = _325;
    bool _331 = !_301;
    float _333 = _329;
    if (!_331)
    {
        float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = log2(_335);
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _341 = _339 + 1.0;
        float _343 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = _291 * _337;
        float _347 = 1.0 / _341;
        float _349 = _343 * 0.693147182464599609375;
        float _351 = exp2(_345);
        float _353 = 1.0 / _349;
        float _355 = _351 + (-1.0);
        float _357 = -_355;
        float _359 = fma(_357, _353, _291);
        float _361 = _359 * _347;
        float _363 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _333 = _363;
    }
    float _365 = _333;
    bool _367 = !_301;
    if (!_367)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = 1.0 / _375;
        float _379 = _291 * _371;
        float _381 = exp2(_379);
        float _383 = -_381;
        float _385 = _383 + 1.0;
        float _387 = _385 * _377;
        _317 = _387;
    }
    float _389 = _317;
    float _391 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _393 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _395 = _264 + 1;
    float _397 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _399 = fma(_389, _303, _391);
    float _401 = fma(_389, _305, _393);
    int _403 = abs(_395);
    float _405 = fma(_389, _307, _397);
    float _407 = fma(_399, _289, _309);
    float _409 = fma(_401, _289, _311);
    float _411 = float(uint(_403));
    float _413 = fma(_405, _289, _313);
    uint _415 = as_type<uint>(half2(float2(_287, 0.0)));
    uint _417 = uint(int(uint(_395) >> uint(31)));
    float _419 = as_type<float>(_200) * _411;
    uint _421 = extract_bits(_415, 0u, 8u);
    int _423 = int(_421) & 255;
    uint _425 = extract_bits(_415, 8u, 8u);
    int _427 = int(_425) & 255;
    int _429 = _427 << 8;
    int _431 = _423 | _429;
    int _433 = ~int(_417);
    int _435 = _433 + 1;
    float _437 = trunc(_419);
    float _439 = precise::max(_437, 0.0);
    uint _441 = uint(_439);
    int _443 = ~int(_441);
    int _445 = _443 + 1;
    int _447 = _445 * _175;
    int _449 = _447 + _403;
    float _451 = float(uint(_449));
    float _453 = as_type<float>(_200) * _451;
    float _455 = trunc(_453);
    float _457 = precise::max(_455, 0.0);
    uint _459 = uint(_457);
    int _461 = int(_441) + int(_459);
    int _463 = ~_461;
    int _465 = _463 + 1;
    int _467 = _465 * _175;
    int _469 = _467 + _403;
    bool _471 = uint(_469) >= uint(_175);
    bool _473 = !_471;
    int _475 = _473 ? 0 : (-1);
    bool _477 = _431 >= 32768;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _481 = ~_461;
    int _483 = _481 + _475;
    int _485 = _483 + 1;
    float _487 = _479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _489 = _485 * _175;
    int _491 = _489 + _403;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _495 = _491 ^ _435;
    float _497 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _499 = ~_435;
    int _501 = _499 + _495;
    int _503 = _501 + 1;
    int _505 = _431 + (-1024);
    int _507 = _505;
    float _509 = _409;
    float _511 = _413;
    if (_477)
    {
        int _513 = ~_431;
        int _515 = _513 + 33792;
        int _517 = _515 + 1;
        _507 = _517;
    }
    int _519 = _507;
    bool _521 = !_177;
    int _523 = _521 ? _503 : (-1);
    int _525 = _519 + 30719;
    float _527 = float(_525);
    float _529 = fma(_527, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _533 = abs(_529);
    float _535 = -_533;
    float _537 = _535 + 1.0;
    float _539 = abs(_529);
    float _541 = fma(_539, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _543 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _545 = _529 < 0.0;
    float _547 = float(_545);
    int _549 = as_type<int>(_537) + (-218103808);
    float _551 = abs(_529);
    float _553 = fma(_551, _541, -0.212114393711090087890625);
    bool _555 = uint(_549) >= 1920991232u;
    float _557 = abs(_529);
    float _559 = fma(_557, _553, 1.570728778839111328125);
    bool _561 = !_555;
    float _579;
    if (!_561)
    {
        int _563 = as_type<int>(_537);
        int _565 = as_type<int>(_289);
        int _567 = 2368;
        int _569;
        int _571;
        int _573;
        int _575;
        int _577;
        _86(_563, _565, _567, _569, _571, _573, _575, _577, out.gl_Position, out.gl_PointSize);
        _579 = as_type<float>(_573);
        _581 = true;
    }
    else
    {
        float _583 = rsqrt(_537);
        float _585 = _537 * _583;
        float _587 = _583 * 0.5;
        float _589 = -_585;
        float _591 = 0.0 + _589;
        float _593 = fma(_587, _591, 0.5);
        float _595 = fma(_585, _593, _585);
        float _597 = -_595;
        float _599 = 0.0 + _597;
        float _601 = fma(_595, _599, _537);
        float _603 = fma(_587, _601, _595);
        _579 = _603;
    }
    _581 = false;
    float _605 = _579;
    int _607 = _523;
    int _609 = 0;
    int _611 = _89(_607, _609, (*spvDescriptorSet0.support_buffer));
    int _613 = _171;
    int _615 = 0;
    int _617 = _89(_613, _615, (*spvDescriptorSet0.support_buffer));
    float4 _619 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_611, _617)), 0).xyzw;
    float _621 = _619.x;
    float _623 = _619.y;
    float _625 = _619.z;
    float _627 = _619.w;
    float _629 = _559 * _605;
    float _631 = _547 * 2.0;
    float _633 = _527 * 3.883221149444580078125;
    float _635 = floor(_179);
    float _637 = -_631;
    float _639 = fma(_629, _637, _629);
    float _641 = _633 * 0.15915493667125701904296875;
    float _643 = fma(_547, 3.1415927410125732421875, _639);
    float _645 = _641 * 6.283185482025146484375;
    float _647 = cos(_645);
    float _649 = _643 * 0.15915493667125701904296875;
    float _651 = _649 * 6.283185482025146484375;
    float _653 = sin(_651);
    float _655 = -_635;
    float _657 = _179 + _655;
    float _659 = _641 * 6.283185482025146484375;
    float _661 = sin(_659);
    float _663 = _653 * _647;
    float _665 = _653 * _661;
    uint _667 = as_type<uint>(half2(float2(_627, 0.0)));
    float _669 = -_281;
    float _671 = _669 + _621;
    float _673 = -_283;
    float _675 = _673 + _623;
    uint _677 = extract_bits(_667, 0u, 8u);
    int _679 = int(_677) & 255;
    uint _681 = extract_bits(_667, 8u, 8u);
    int _683 = int(_681) & 255;
    int _685 = _683 << 8;
    int _687 = _679 | _685;
    float _689 = fma(_657, _671, _281);
    float _691 = fma(_657, _675, _283);
    bool _693 = _687 >= 32768;
    int _695 = _687 + (-1024);
    int _697 = _695;
    float _699 = _663;
    if (_693)
    {
        int _701 = ~_687;
        int _703 = _701 + 33792;
        int _705 = _703 + 1;
        _697 = _705;
    }
    int _707 = _697;
    int _709 = _707 + 30719;
    float _711 = float(_709);
    float _713 = fma(_711, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _715 = abs(_713);
    float _717 = -_715;
    float _719 = _717 + 1.0;
    float _721 = abs(_713);
    float _723 = fma(_721, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _725 = _713 < 0.0;
    float _727 = float(_725);
    int _729 = as_type<int>(_719) + (-218103808);
    float _731 = abs(_713);
    float _733 = fma(_731, _723, -0.212114393711090087890625);
    bool _735 = uint(_729) >= 1920991232u;
    float _737 = -_285;
    float _739 = _737 + _625;
    float _741 = abs(_713);
    float _743 = fma(_741, _733, 1.570728778839111328125);
    float _745 = fma(_657, _739, _285);
    bool _747 = !_735;
    float _765;
    if (!_747)
    {
        int _749 = as_type<int>(_719);
        int _751 = as_type<int>(_623);
        int _753 = 3280;
        int _755;
        int _757;
        int _759;
        int _761;
        int _763;
        _86(_749, _751, _753, _755, _757, _759, _761, _763, out.gl_Position, out.gl_PointSize);
        _765 = as_type<float>(_759);
        _767 = true;
    }
    else
    {
        float _769 = rsqrt(_719);
        float _771 = _719 * _769;
        float _773 = _769 * 0.5;
        float _775 = -_771;
        float _777 = 0.0 + _775;
        float _779 = fma(_773, _777, 0.5);
        float _781 = fma(_771, _779, _771);
        float _783 = -_781;
        float _785 = 0.0 + _783;
        float _787 = fma(_781, _785, _719);
        float _789 = fma(_773, _787, _781);
        _765 = _789;
    }
    _767 = false;
    float _791 = _765;
    float _793 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _795 = log2(_793);
    float _797 = in.m_53.x;
    float _799 = in.m_53.y;
    float _801 = in.m_53.z;
    float _803 = _743 * _791;
    float _805 = _711 * 3.883221149444580078125;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _809 = 1.0 + _807;
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _813 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _815 = isnan(1.0);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _821 = _817 || _819;
    float _823 = _795 * _131;
    float _825 = 1.0 / _809;
    bool _827 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _829 = isnan(0.0);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _835 = _831 || _833;
    float _837 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _839 = exp2(_823);
    float _841 = _801 * 2.0;
    float _843 = _799 * 2.0;
    float _845 = floor(_841);
    float _847 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _849 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _851 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _837);
    float _853 = _799 + _801;
    float _855 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _847);
    float _857 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _849);
    float _859 = _797 * 2.0;
    float _861 = floor(_843);
    float _863 = -_839;
    float _865 = _863 + 1.0;
    float _867 = _853 + (-1.0);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _879 = _877 != 0;
    float _881 = _799 + _797;
    float _883 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _855);
    float _885 = _835 ? _865 : 0.0;
    float _887 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _889 = floor(_859);
    bool _891 = !_871;
    int _893 = _891 ? 0 : 1;
    float _895 = _881 + (-1.0);
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _899 = _897 != 0;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _907 = _905 != 0;
    if (_821)
    {
        float _909 = _885 * _825;
        _133 = _909;
    }
    float _911 = _133;
    bool _913 = _845 >= 0.0;
    bool _915 = isnan(_845);
    bool _917 = _913 || _915;
    bool _919 = isnan(0.0);
    bool _921 = _917 || _919;
    bool _923 = !_879;
    int _925 = _923 ? 0 : 1;
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _929 = _845 > 0.0;
    int _931 = _921 ? 0 : 1;
    bool _933 = _861 > 0.0;
    float _935 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _937 = _861 >= 0.0;
    bool _939 = isnan(_861);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.0);
    bool _945 = _941 || _943;
    bool _947 = !_875;
    int _949 = _947 ? 0 : 1;
    bool _951 = _889 >= 0.0;
    bool _953 = isnan(_889);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    float _961 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _851);
    int _963 = ~_931;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _857);
    bool _971 = !_907;
    int _973 = _971 ? 0 : 1;
    float _975 = _911 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _977 = _967;
    if (!_929)
    {
        int _979 = ~_931;
        int _981 = _979 + 1;
        _977 = _981;
    }
    int _983 = _977;
    int _985 = _959 ? 0 : 1;
    float _987 = _975 * _927;
    int _989 = _945 ? 0 : 1;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1001 = _999 != 0;
    float _1003 = _911 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _1005 = _889 > 0.0;
    float _1007 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[203].x, _987);
    int _1009 = ~_985;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    float _1015 = _1003 * _811;
    bool _1017 = !_993;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = floor(_1007);
    float _1023 = float(_983);
    float _1025 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1015);
    int _1027 = abs(_1019);
    int _1029 = ~_989;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    int _1035 = _1033;
    int _1037 = _1013;
    if (!_933)
    {
        int _1039 = ~_989;
        int _1041 = _1039 + 1;
        _1035 = _1041;
    }
    int _1043 = _1035;
    float _1045 = floor(_1025);
    if (!_1005)
    {
        int _1047 = ~_985;
        int _1049 = _1047 + 1;
        _1037 = _1049;
    }
    int _1051 = _1037;
    bool _1053 = !_1001;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = float(_1051);
    float _1059 = _1007 + 0.25;
    int _1061 = abs(_1055);
    bool _1063 = !_997;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = floor(_1059);
    float _1069 = _1025 + 0.25;
    int _1071 = abs(_1065);
    float _1073 = float(_1043);
    float _1075 = floor(_1069);
    float _1077 = float(_1061);
    float _1079 = -_1021;
    float _1081 = _1007 + _1079;
    float _1083 = float(_1071);
    float _1085 = _1007 * 6.283185482025146484375;
    float _1087 = float(_1027);
    bool _1089 = _1081 >= 0.5;
    bool _1091 = isnan(_1081);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(0.5);
    bool _1097 = _1093 || _1095;
    float _1099 = _1083 * _1057;
    float _1101 = _1077 * _1073;
    float _1103 = -_1067;
    float _1105 = _1059 + _1103;
    int _1107 = abs(_949);
    float _1109 = -_1045;
    float _1111 = _1025 + _1109;
    bool _1113 = !_1097;
    float _1115 = _1113 ? 0.5 : (-0.5);
    float _1117 = _1085 * 0.15915493667125701904296875;
    bool _1119 = !_903;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = _1087 * _1023;
    bool _1125 = _1111 >= 0.5;
    bool _1127 = isnan(_1111);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan(0.5);
    bool _1133 = _1129 || _1131;
    float _1135 = _1101 * (-2.0);
    float _1137 = float(_1107);
    float _1139 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1141 = _1139 * 2.0;
    bool _1143 = _1105 > 0.5;
    float _1145 = _1117 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    int _1149 = abs(_1121);
    float _1151 = -_1075;
    float _1153 = _1069 + _1151;
    float _1155 = _1025 * 6.283185482025146484375;
    float _1157 = _1137 * _1141;
    int _1159 = abs(_893);
    float _1161 = _1123 * (-2.0);
    float _1163 = _1155 * 0.15915493667125701904296875;
    float _1165 = in.m_59.x;
    float _1167 = in.m_59.y;
    float _1169 = in.m_59.z;
    bool _1171 = !_1133;
    float _1173 = _1171 ? 0.5 : (-0.5);
    float _1175 = fma(_935, _1161, _935);
    float _1177 = float(_1149);
    float _1179 = _1105;
    float _1181 = _1153;
    if (_1143)
    {
        float _1183 = -_1105;
        float _1185 = _1183 + 1.0;
        _1179 = _1185;
    }
    float _1187 = _1179;
    float _1189 = _1163 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    bool _1193 = _1153 > 0.5;
    float _1195 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1197 = _1195 * 2.0;
    float _1199 = float(_1159);
    float _1201 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1203 = abs(_925);
    float _1205 = _1177 * _1197;
    bool _1207 = !_899;
    int _1209 = _1207 ? 0 : 1;
    float _1211 = fma(_1199, _1201, _1157);
    float _1213 = fma(_1187, 4.0, -1.0);
    int _1215 = abs(_1209);
    float _1217 = _1099 * (-2.0);
    float _1219 = float(_1203);
    if (_1193)
    {
        float _1221 = -_1153;
        float _1223 = _1221 + 1.0;
        _1181 = _1223;
    }
    float _1225 = _1181;
    float _1227 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1229 = float(_1215);
    float _1231 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1233 = abs(_973);
    float _1235 = fma(_1225, 4.0, -1.0);
    float _1237 = fma(_1219, _1227, _1211);
    float _1239 = fma(_887, _1217, _887);
    float _1241 = fma(_1217, _1167, _1167);
    float _1243 = fma(_1229, _1231, _1205);
    float _1245 = _799 + (-0.5);
    float _1247 = float(_1233);
    float _1249 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1251 = fma(_1237, 3.1415927410125732421875, _1165);
    float _1253 = rsqrt(_883);
    float _1255 = _797 + (-0.5);
    float _1257 = _797 + _801;
    float _1259 = fma(_1251, _1161, _1251);
    float _1261 = _801 + (-0.5);
    float _1263 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1259);
    float _1265 = rsqrt(_969);
    float _1267 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1241);
    float _1269 = fma(_1247, _1249, _1243);
    float _1271 = fma(_1175, _911, _1263);
    float _1273 = _1257 + (-1.0);
    float _1275 = fma(_1239, _911, _1267);
    float _1277 = _1271 * 0.15915493667125701904296875;
    float _1279 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1281 = fma(_1269, 3.1415927410125732421875, _1169);
    float _1283 = rsqrt(_961);
    float _1285 = in.m_57.x;
    float _1287 = in.m_57.y;
    float _1289 = in.m_57.z;
    float _1291 = fma(_1279, _1135, _1279);
    float _1293 = fma(_1281, _1135, _1281);
    float _1295 = _1275 * 0.15915493667125701904296875;
    float _1297 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1293);
    float _1299 = sqrt(_961);
    float _1301 = fma(_1291, _911, _1297);
    float _1303 = _1301 * 0.15915493667125701904296875;
    float _1305 = _691 * _1253;
    float _1307 = _1277 * 6.283185482025146484375;
    float _1309 = sin(_1307);
    float _1311 = _689 * _1283;
    float _1313 = _745 * _1265;
    float _1315 = _1299 * _1311;
    float _1317 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1319 = _1277 * 6.283185482025146484375;
    float _1321 = cos(_1319);
    float _1323 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1325 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1329 = _1299 * _1313;
    float _1331 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1333 = _1325 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1335 = _1299 * _1305;
    float _1337 = _1303 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1315);
    float _1343 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1329);
    float _1345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1335);
    bool _1347 = _1335 != 0.0;
    bool _1349 = isnan(_1335);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = _1341 * _1327;
    float _1359 = _1345 * _1333;
    float _1361 = _1303 * 6.283185482025146484375;
    float _1363 = cos(_1361);
    bool _1365 = _1315 == 0.0;
    bool _1367 = !_1355;
    bool _1369 = _1365 && _1367;
    bool _1371 = _1329 == 0.0;
    bool _1373 = _1371 && _1369;
    float _1375 = _1295 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = _1343 * _1331;
    float _1381 = _1321 * _1339;
    float _1383 = _1309 * _1339;
    float _1385 = _1295 * 6.283185482025146484375;
    float _1387 = sin(_1385);
    float _1389 = _1309 * _1363;
    float _1391 = _1321 * _1363;
    float _1393 = _1309 * _1377;
    float _1395 = _1339 * _1377;
    float _1397 = _1363 * _1377;
    float _1399 = _1321 * _1377;
    float _1401 = _1393 * _1359;
    float _1403 = -_1381;
    float _1405 = fma(_1387, _1389, _1403);
    float _1407 = fma(_1387, _1383, _1391);
    float _1409 = fma(_1387, _1391, _1383);
    float _1411 = -_1389;
    float _1413 = fma(_1387, _1381, _1411);
    float _1415 = _1405 * _1359;
    float _1417 = _1407 * _1359;
    float _1419 = -_1387;
    float _1421 = fma(_1419, _1357, _1401);
    float _1423 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1425 = fma(_1397, _1357, _1415);
    float _1427 = fma(_1395, _1357, _1417);
    float _1429 = fma(_1399, _1379, _1421);
    float _1431 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1433 = _1423 * _1423;
    float _1435 = fma(_1413, _1379, _1427);
    float _1437 = fma(_1409, _1379, _1425);
    float _1439 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1441 = fma(_1431, _1431, _1433);
    float _1443 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1447 = fma(_1439, _1439, _1441);
    float _1449 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1443);
    float _1451 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1453 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1445);
    float _1455 = sqrt(_1447);
    float _1457 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1449);
    float _1459 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1451);
    float _1461 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1453);
    float _1463 = _727 * 2.0;
    float _1465 = _1457 * _1457;
    float _1467 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1459);
    float _1469 = rsqrt(_1447);
    float _1471 = fma(_1461, _1461, _1465);
    float _1473 = -_1463;
    float _1475 = fma(_803, _1473, _803);
    float _1477 = fma(_1467, _1467, _1471);
    float _1479 = fma(_727, 3.1415927410125732421875, _1475);
    float _1481 = rsqrt(_1477);
    float _1483 = _1423 * _1469;
    float _1485 = _1431 * _1469;
    float _1487 = _1439 * _1469;
    float _1489 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1491 = _1457 * _1481;
    float _1493 = _1461 * _1481;
    float _1495 = _1467 * _1481;
    float _1497 = _1483 * _1491;
    float _1499 = fma(_1485, _1493, _1497);
    float _1501 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1503 = fma(_1487, _1495, _1499);
    float _1505 = _805 * 0.15915493667125701904296875;
    float _1507 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1489);
    float _1509 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1501);
    float _1511 = _1503 * _1455;
    float _1513 = _1505 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1507);
    float _1519 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1509);
    float _1521 = fma(_1485, _1511, _1461);
    float _1523 = fma(_1487, _1511, _1467);
    float _1525 = _1517 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1527 = _1519 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1529 = fma(_1483, _1511, _1457);
    float _1531 = _1505 * 6.283185482025146484375;
    float _1533 = sin(_1531);
    float _1535 = _1525 + _1521;
    float _1537 = _1527 + _1523;
    float _1539 = _1479 * 0.15915493667125701904296875;
    float _1541 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1545 = _1535 + _1543;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1549 = _1537 + _1547;
    float _1551 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1541);
    float _1553 = _1545 * _1545;
    float _1555 = _1549 * _1549;
    float _1557 = _1539 * 6.283185482025146484375;
    float _1559 = sin(_1557);
    float _1561 = -_529;
    float _1563 = _1561 + _713;
    float _1565 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1551);
    float _1567 = _1553 + _1555;
    float _1569 = fma(_657, _1563, _529);
    float _1571 = _1565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1573 = sqrt(_1567);
    float _1575 = _1569;
    float _1577 = _1563;
    float _1579 = _1529;
    if (!_1373)
    {
        float _1581 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1569);
        _1575 = _1581;
    }
    float _1583 = _1575;
    float _1585 = _1393 * _1583;
    float _1587 = _1405 * _1583;
    float _1589 = -_663;
    float _1591 = fma(_1559, _1515, _1589);
    float _1593 = -_665;
    float _1595 = fma(_1559, _1533, _1593);
    float _1597 = fma(_657, _1591, _663);
    float _1599 = fma(_657, _1595, _665);
    float _1601 = _1407 * _1583;
    float _1603 = _1571 + _1529;
    bool _1605 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1607 = _1597;
    float _1609 = _1599;
    float _1611 = _1583;
    if (!_1373)
    {
        float _1613 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1597);
        _1607 = _1613;
    }
    float _1615 = _1607;
    if (!_1373)
    {
        float _1617 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1599);
        _1609 = _1617;
    }
    float _1619 = _1609;
    if (!_1605)
    {
        _699 = _1555;
    }
    float _1621 = _699;
    float _1623 = _1621;
    if (!_1605)
    {
        _1611 = _1553;
    }
    float _1625 = _1611;
    float _1627 = _1625;
    if (!_1605)
    {
        _509 = _1535;
    }
    float _1629 = _509;
    float _1631 = _1629;
    if (!_1605)
    {
        _1577 = _1537;
    }
    float _1633 = _1577;
    float _1635 = _1633;
    if (!_1605)
    {
        _511 = _1603;
    }
    float _1637 = _511;
    bool _1639 = !_1605;
    float _1641 = _1637;
    if (!_1639)
    {
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1645 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1647 = _1573 + _1645;
        float _1649 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1651 = rsqrt(_1567);
        float _1653 = _1647 * _1643;
        float _1655 = _1653 * 0.15915493667125701904296875;
        float _1657 = _1655 * 6.283185482025146484375;
        float _1659 = sin(_1657);
        float _1661 = _1655 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        float _1665 = fma(_1659, _1649, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1667 = _1651 * _1665;
        float _1669 = _1663 + (-1.0);
        float _1671 = _1545 * _1667;
        float _1673 = _1549 * _1667;
        float _1675 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1677 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1679 = _1671 * _1671;
        float _1681 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1683 = fma(_1603, _1663, _1675);
        float _1685 = _1673 * _1673;
        _1641 = _1683;
        _1627 = _1679;
        _1623 = _1685;
        _1631 = _1677;
        _1635 = _1681;
        _1579 = _1655;
    }
    float _1687 = _1641;
    float _1689 = _1627;
    float _1691 = _1623;
    float _1693 = _1631;
    float _1695 = _1635;
    float _1697 = _1579;
    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1701 = _1687 + _1699;
    float _1703 = fma(_1395, _1615, _1601);
    float _1705 = fma(_1397, _1615, _1587);
    float _1707 = -_1387;
    float _1709 = fma(_1707, _1615, _1585);
    float _1711 = fma(_1701, _1701, _1689);
    float _1713 = fma(_1413, _1619, _1703);
    float _1715 = fma(_1409, _1619, _1705);
    float _1717 = fma(_1399, _1619, _1709);
    float _1719 = _1711 + _1691;
    float _1721 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1723 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1725 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_61.x = _543;
    out.m_61.y = _497;
    out.m_61.z = _487;
    float _1727 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1721);
    float _1729 = sqrt(_1719);
    float _1731 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1723);
    float _1733 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1725);
    float _1735 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1727);
    float _1737 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1731);
    float _1739 = fma(_1717, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1733);
    out.m_63.x = _1735;
    out.m_63.y = _1737;
    out.m_63.z = _1739;
    bool _1741 = _1729 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1743 = isnan(_1729);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1749 = _1745 || _1747;
    float _1751 = _1717;
    float _1753 = _1687;
    float _1755 = _1735;
    float _1757 = _1697;
    if (!_1749)
    {
        _1751 = 1.0;
    }
    float _1759 = _1751;
    bool _1761 = !_1749;
    float _1763 = _1759;
    if (!_1761)
    {
        bool _1765 = _1729 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1767 = isnan(_1729);
        bool _1769 = _1765 || _1767;
        bool _1771 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1773 = _1769 || _1771;
        if (!_1773)
        {
            float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1777 = _1729 + _1775;
            float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1781 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1779;
            float _1783 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1785 = _1783 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1787 = 1.0 / _1781;
            float _1789 = _1777 * _1787;
            float _1791 = fma(_1789, _1785, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1763 = _1791;
            _1793 = true;
        }
        else
        {
            bool _1795 = _1729 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1797 = isnan(_1729);
            bool _1799 = _1795 || _1797;
            bool _1801 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1803 = _1799 || _1801;
            if (!_1803)
            {
                float _1805 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1807 = _1729 + _1805;
                float _1809 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1811 = _1809 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1813 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1815 = _1813 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1817 = 1.0 / _1811;
                float _1819 = _1807 * _1817;
                float _1821 = fma(_1819, _1815, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1763 = _1821;
                _1793 = true;
            }
            else
            {
                _1763 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1793 = false;
    float _1823 = _1763;
    float _1825 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1827 = _1687 + _1825;
    float _1829 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1831 = _1693 + _1829;
    float _1833 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1835 = _1695 + _1833;
    float _1837 = fma(_1827, _1823, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1839 = fma(_1831, _1823, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1841 = fma(_1835, _1823, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1845 = _1837 + _1843;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1849 = _1839 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1853 = _1841 + _1851;
    float _1855 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1857 = _1845 * _1845;
    float _1859 = fma(_1849, _1849, _1857);
    float _1861 = fma(_1853, _1853, _1859);
    float _1863 = rsqrt(_1861);
    float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1867 = _1849 * _1865;
    float _1869 = _1853 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 * _1869;
    float _1875 = _1871 + _1873;
    float _1877 = sqrt(_1875);
    bool _1879 = _1877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1883 = _1877 + _1881;
    float _1885 = _1853;
    float _1887 = _1883;
    float _1889 = _1867;
    if (_1879)
    {
        float _1891 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1891;
    }
    float _1893 = _1885;
    if (_1879)
    {
        float _1895 = rsqrt(_1875);
        _1753 = _1895;
    }
    float _1897 = _1753;
    float _1899 = _1897;
    if (_1879)
    {
        float _1901 = _1883 * _1893;
        _1887 = _1901;
    }
    float _1903 = _1887;
    float _1905 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1879)
    {
        float _1907 = _1903 * 0.15915493667125701904296875;
        _1755 = _1907;
    }
    float _1909 = _1755;
    float _1911 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1913 = _1863;
    if (_1879)
    {
        float _1915 = _1909 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1923 = precise::max(0.0, _1921);
    float _1925 = _1857;
    float _1927 = _1923;
    float _1929 = _1921;
    if (_1879)
    {
        float _1931 = _1909 * 6.283185482025146484375;
        float _1933 = cos(_1931);
        _1925 = _1933;
    }
    float _1935 = _1925;
    float _1937 = -_1865;
    float _1939 = -_1923;
    float _1941 = fma(_1845, _1937, _1939);
    if (_1879)
    {
        float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1943;
    }
    float _1945 = _1927;
    float _1947 = sqrt(_1861);
    float _1949 = _1945;
    float _1951 = _1919;
    if (_1879)
    {
        float _1953 = fma(_1919, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = _1955;
    if (!_1879)
    {
        _1951 = _1869;
    }
    float _1959 = _1951;
    float _1961 = _1959;
    if (_1879)
    {
        float _1963 = _1935 + (-1.0);
        _1929 = _1963;
    }
    float _1965 = _1929;
    float _1967 = _1965;
    if (_1879)
    {
        float _1969 = _1897 * _1955;
        _1757 = _1969;
    }
    float _1971 = _1757;
    if (!_1879)
    {
        _1899 = _1941;
    }
    float _1973 = _1899;
    float _1975 = _1973;
    if (_1879)
    {
        float _1977 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1967 = _1977;
    }
    float _1979 = _1967;
    float _1981 = _1979;
    if (_1879)
    {
        float _1983 = _1867 * _1971;
        _1889 = _1983;
    }
    float _1985 = _1889;
    if (!_1879)
    {
        _1957 = _1871;
    }
    float _1987 = _1957;
    float _1989 = _1987;
    if (_1879)
    {
        float _1991 = _1869 * _1971;
        _1961 = _1991;
    }
    float _1993 = _1961;
    if (_1879)
    {
        float _1995 = fma(_1941, _1935, _1979);
        _1975 = _1995;
    }
    float _1997 = _1975;
    if (_1879)
    {
        float _1999 = _1985 * _1985;
        _1989 = _1999;
    }
    float _2001 = _1989;
    if (!_1879)
    {
        _1981 = _1873;
    }
    float _2003 = _1981;
    float _2005 = _2003;
    if (_1879)
    {
        float _2007 = _1993 * _1993;
        _2005 = _2007;
    }
    float _2009 = _2005;
    float _2011 = fma(_1997, _1997, _2001);
    float _2013 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2015 = _2011 + _2009;
    float _2017 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2021 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2019);
    float _2023 = precise::clamp(_2021, 0.0, 1.0);
    float _2025 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2013);
    float _2027 = rsqrt(_2015);
    float _2029 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2017);
    float _2031 = _1837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2033 = -_2023;
    float _2035 = _2033 + 1.0;
    float _2037 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2025);
    float _2039 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2029);
    float _2041 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2031);
    float _2043 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2045 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2047 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2041);
    float _2049 = abs(_2035);
    float _2051 = log2(_2049);
    float _2053 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2055 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _2027 * _1985;
    float _2059 = _2027 * _1997;
    float _2061 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = -_2053;
    float _2065 = fma(_2063, _1855, 1.0);
    float _2067 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2069 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1911);
    float _2071 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2073 = _2027 * _1993;
    float _2075 = -_2067;
    float _2077 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2075);
    float _2079 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2081 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2071);
    float _2083 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2085 = -_2073;
    float _2087 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2077);
    float _2089 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2091 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2081);
    float _2093 = exp2(_2083);
    float _2095 = fma(_2087, -0.5, 0.5);
    float _2097 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2099 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2089);
    float _2101 = fma(_2087, 0.5, 0.5);
    float _2103 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2097);
    float _2105 = _2059 + 1.0;
    float _2107 = log2(_2065);
    float _2109 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2099);
    float _2111 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2103);
    float _2113 = fma(_2101, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2115 = fma(_2101, _2113, -0.212114393711090087890625);
    float _2117 = 1.0 / _2091;
    float _2119 = -_2059;
    float _2121 = fma(_2093, _2105, _2119);
    float _2123 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2109);
    float _2125 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2111);
    float _2127 = fma(_2101, _2115, 1.570728778839111328125);
    float _2129 = fma(_2121, 0.5, 0.5);
    float _2131 = sqrt(_2095);
    float _2133 = _2107 * 0.693147182464599609375;
    float _2135 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2137 = _2123 * _2117;
    float _2139 = _2125 * _2117;
    float _2141 = fma(_2137, 0.5, 0.5);
    float _2143 = fma(_2139, -0.5, 0.5);
    float _2145 = _2131 * 0.636619746685028076171875;
    float3 _5278 = float3(_2141, _2143, _2135);
    float _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5278, float3(0.0), isnan(_5278)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5278, float3(0.0), isnan(_5278)), level(0.0)).x;
    float3 _5289 = float3(_2141, _2143, _2135);
    float4 _2149 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5289, float3(0.0), isnan(_5289)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5289, float3(0.0), isnan(_5289)), level(0.0)).xyzw;
    float _2151 = _2149.x;
    float _2153 = _2149.y;
    float _2155 = _2149.z;
    float _2157 = _2149.w;
    float _2159 = -_2127;
    float _2161 = fma(_2145, _2159, 1.0);
    float2 _5310 = float2(_2161, _2129);
    float3 _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5310, float2(0.0), isnan(_5310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5310, float2(0.0), isnan(_5310)), level(0.0)).xyz;
    float _2167 = _2165.x;
    float _2169 = _2165.y;
    float _2171 = _2165.z;
    float _2173 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2175 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.x = _1525;
    out.m_65.y = _1571;
    out.m_65.z = _1527;
    float _2177 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2175);
    float _2179 = exp2(_2173);
    out.m_67.x = _1839;
    out.m_67.y = _1837;
    out.m_67.z = _1841;
    float _2181 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2177);
    out.m_49.x = 1.0;
    float _2183 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2181);
    float _2185 = _2183 + _2091;
    out.gl_Position.x = _2123;
    out.gl_Position.y = _2125;
    out.gl_Position.z = _2183;
    out.gl_Position.w = _2091;
    float _2187 = _2185 * 0.5;
    float _2189 = -_2179;
    float _2191 = _2189 + 1.0;
    float _2193 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2195 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.z = _2187;
    out.m_69.w = _2091;
    float _2197 = -_2193;
    float _2199 = _2197 + 1.0;
    out.m_71.w = _2195;
    float _2201 = _2193 * _2147;
    float _2203 = _2157 * _2199;
    float _2205 = _2157 * _2201;
    float _2207 = _2171 * _2201;
    float _2209 = fma(_2167, _2205, _2151);
    float _2211 = fma(_2169, _2205, _2153);
    float _2213 = fma(_2157, _2207, _2155);
    out.m_73.x = _2209;
    out.m_73.y = _2211;
    out.m_73.z = _2213;
    out.m_73.w = _2203;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

