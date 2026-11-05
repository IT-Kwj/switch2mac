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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_12 [[id(3)]];
    sampler fp_t_tcb_12Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_14 [[id(13)]];
    sampler fp_t_tcb_14Smplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_12Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_ESmplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    sampler fp_t_tcb_10Smplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
    float4 m_46 [[color(1)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _54(thread const int& _2101, thread const int& _2102, thread const int& _2103, thread const int& _2104, thread int& _2105, thread int& _2106, thread int& _2107, thread int& _2108, thread int& _2109, thread int& _2110)
{
    float _2113 = as_type<float>(_2101) + 0.0;
    bool _2115 = _2113 != 0.0;
    bool _2117 = isnan(_2113);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan(0.0);
    bool _2123 = _2119 || _2121;
    int _2125 = as_type<int>(_2113);
    int _2127 = _2102;
    int _2129 = _2103;
    int _2131 = _2123 ? (-1) : 0;
    if (!_2123)
    {
        float _2133 = as_type<float>(_2101) * 1.0;
        _2125 = as_type<int>(_2133);
    }
    int _2135 = _2125;
    bool _2137 = !_2123;
    int _2139 = _2135;
    if (!_2137)
    {
        float _2141 = as_type<float>(_2101) + 0.0;
        bool _2143 = _2141 >= 0.0;
        bool _2145 = isnan(_2141);
        bool _2147 = _2143 || _2145;
        bool _2149 = isnan(0.0);
        bool _2151 = _2147 || _2149;
        int _2153 = as_type<int>(_2141);
        _2131 = _2151 ? (-1) : 0;
        if (!_2151)
        {
            _2153 = 2147483647;
        }
        int _2155 = _2153;
        bool _2157 = !_2151;
        _2139 = _2155;
        if (!_2157)
        {
            float _2159 = abs(as_type<float>(_2101));
            float _2161 = _2159 + 0.0;
            bool _2163 = _2161 > as_type<float>(0x7f800000u /* inf */);
            bool _2165 = isnan(_2161);
            bool _2167 = _2163 || _2165;
            bool _2169 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2171 = _2167 || _2169;
            int _2173 = as_type<int>(_2161);
            _2131 = _2171 ? (-1) : 0;
            if (_2171)
            {
                float _2175 = as_type<float>(_2101) + 1.0;
                _2173 = as_type<int>(_2175);
            }
            int _2177 = _2173;
            _2139 = _2177;
            if (!_2171)
            {
                float _2179 = abs(as_type<float>(_2101));
                float _2181 = _2179 + (-0.0);
                float _2183 = 0.0 + _2181;
                bool _2185 = _2183 != as_type<float>(0x7f800000u /* inf */);
                bool _2187 = isnan(_2183);
                bool _2189 = _2185 || _2187;
                bool _2191 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2193 = _2189 || _2191;
                int _2195 = as_type<int>(_2183);
                _2131 = _2193 ? (-1) : 0;
                if (!_2193)
                {
                    _2195 = _2101;
                }
                int _2197 = _2195;
                bool _2199 = !_2193;
                _2139 = _2197;
                if (!_2199)
                {
                    float _2201 = as_type<float>(_2101) * 18446744073709551616.0;
                    float _2203 = rsqrt(_2201);
                    float _2205 = _2201 * _2203;
                    float _2207 = _2203 * 0.5;
                    float _2209 = -_2205;
                    float _2211 = 0.0 + _2209;
                    float _2213 = fma(_2207, _2211, 0.5);
                    float _2215 = fma(_2205, _2213, _2205);
                    float _2217 = -_2215;
                    float _2219 = 0.0 + _2217;
                    float _2221 = fma(_2215, _2219, _2201);
                    float _2223 = fma(_2207, _2221, _2215);
                    float _2225 = _2223 * 2.3283064365386962890625e-10;
                    _2139 = as_type<int>(_2225);
                    _2127 = as_type<int>(_2215);
                    _2129 = as_type<int>(_2211);
                }
            }
        }
    }
    int _2227 = _2139;
    int _2229 = _2127;
    int _2231 = _2129;
    int _2233 = _2131;
    _2105 = _2227;
    _2106 = _2104;
    _2107 = 0;
    _2108 = _2229;
    _2109 = _2231;
    _2110 = _2233;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _252 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_41.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_41.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_41.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _80 = precise::max(0.0, _78);
    float _82 = 1.0 / _58;
    float _84 = _82 * _64;
    float _86 = _82 * _70;
    float _88 = _82 * _76;
    float _90 = _84 * _84;
    float _92 = fma(_86, _86, _90);
    float _94 = fma(_88, _88, _92);
    float _96 = rsqrt(_94);
    float _98 = _86 * _96;
    float _100 = _88 * _96;
    float _102 = _84 * _96;
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _108 = -_102;
    float _110 = -_80;
    float _112 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[13].z, _110);
    float _114 = _104 * _104;
    float _116 = _106 * _106;
    float _118 = _114 + _116;
    float _120 = sqrt(_118);
    bool _124 = _120 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _126 = _96;
    float _128 = _80;
    float _130 = _112;
    float _132 = _104;
    float _134 = _106;
    if (!_124)
    {
        _126 = _116;
    }
    float _136 = _126;
    float _138 = _136;
    if (!_124)
    {
        _128 = _114;
    }
    float _140 = _128;
    bool _142 = !_124;
    float _144 = _140;
    if (!_142)
    {
        float _146 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _148 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _150 = _120 + _148;
        float _152 = _112 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _154 = rsqrt(_118);
        float _156 = _150 * _146;
        float _158 = _156 * 0.15915493667125701904296875;
        float _160 = _158 * 6.283185482025146484375;
        float _162 = sin(_160);
        float _164 = _158 * 6.283185482025146484375;
        float _166 = cos(_164);
        float _168 = fma(_162, _152, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _170 = _154 * _168;
        float _172 = _166 + (-1.0);
        float _174 = _104 * _170;
        float _176 = _106 * _170;
        float _178 = _172 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _180 = _176 * _176;
        float _182 = fma(_112, _166, _178);
        float _184 = _174 * _174;
        _130 = _182;
        _144 = _184;
        _138 = _180;
        _132 = _174;
        _134 = _176;
    }
    float _186 = _130;
    float _188 = _144;
    float _190 = _138;
    float _192 = _132;
    float _194 = _134;
    float _196 = fma(_186, _186, _188);
    float _198 = _196 + _190;
    float _200 = rsqrt(_198);
    float _202 = _200 * _186;
    float _204 = _200 * _192;
    float _206 = _200 * _194;
    float _208 = -_202;
    float _210 = precise::max(0.0, _208);
    float _212 = abs(_210);
    float _214 = -_212;
    float _216 = _214 + 1.0;
    float _218 = fma(_210, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _220 = as_type<int>(_216) + (-218103808);
    float _222 = fma(_210, _218, -0.212114393711090087890625);
    bool _224 = uint(_220) >= 1920991232u;
    float _226 = fma(_210, _222, 1.570728778839111328125);
    bool _228 = !_224;
    float _250;
    if (!_228)
    {
        int _230 = as_type<int>(_216);
        int _232 = 0;
        int _234 = 0;
        int _236 = 1136;
        int _238;
        int _240;
        int _242;
        int _244;
        int _246;
        int _248;
        _54(_230, _232, _234, _236, _238, _240, _242, _244, _246, _248);
        _250 = as_type<float>(_238);
        _252 = true;
    }
    else
    {
        float _254 = rsqrt(_216);
        float _256 = _216 * _254;
        float _258 = _254 * 0.5;
        float _260 = -_256;
        float _262 = 0.0 + _260;
        float _264 = fma(_258, _262, 0.5);
        float _266 = fma(_256, _264, _256);
        float _268 = -_266;
        float _270 = 0.0 + _268;
        float _272 = fma(_266, _270, _216);
        float _274 = fma(_258, _272, _266);
        _250 = _274;
    }
    _252 = false;
    float _276 = _250;
    bool _278 = _202 > 0.0;
    float _280 = _226 * _276;
    float _282 = _100 * _100;
    float _284 = _98 * _98;
    float _286 = _280 * 0.636619746685028076171875;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    if (_278)
    {
        discard_fragment();
    }
    float _290 = -_288;
    float _292 = _290 + 1.0;
    float _294 = _282 + _284;
    float _296 = sqrt(_292);
    float _298 = rsqrt(_294);
    float _300 = -_296;
    float _302 = _300 + 1.0;
    float _304 = _302 * 0.5;
    float _306 = _100 * _298;
    float _308 = _98 * _298;
    float _310 = abs(_306);
    float _312 = abs(_308);
    float _314 = precise::max(_310, _312);
    if (_278)
    {
        out.m_44.x = 0.0;
        out.m_44.y = 0.0;
        out.m_44.z = 0.0;
        out.m_44.w = 0.0;
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return out;
    }
    float _316 = in.m_48.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_48.y;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = precise::max(_314, 9.9999997473787516355514526367188e-05);
    float _330 = 1.0 / _328;
    float _332 = -_330;
    float _334 = _306 * _332;
    float _336 = _308 * _330;
    float _338 = fma(_334, _304, 0.5);
    float _340 = fma(_336, _304, 0.5);
    float _342 = _82 * _320;
    float _344 = _82 * _326;
    float2 _1244;
    _1244.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_338, _340));
    _1244.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_338, _340));
    float _346 = _1244.x;
    float _348 = _346 * 256.0;
    int _350 = int(_348);
    float2 _1254 = float2(_342, _344);
    float2 _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1254, float2(0.0), isnan(_1254))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1254, float2(0.0), isnan(_1254))).xy;
    float _356 = _354.x;
    float _358 = _354.y;
    float _360 = -_102;
    float _362 = _360 + 1.0;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _204 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _368 = -_100;
    float _370 = _102 * _368;
    float _372 = -_366;
    float _374 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[11].y, _372);
    float _376 = abs(_364);
    float _378 = log2(_376);
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _384 = _102 * _380;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _388 = _102 * _382;
    float _390 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _384);
    float _392 = -_206;
    float _394 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[11].z, _374);
    float _396 = _102 * _386;
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _400 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _388);
    float _402 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _404 = _378 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _408 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _396);
    float _410 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _412 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _414 = -_100;
    float _416 = fma(_414, _406, _390);
    float _418 = exp2(_404);
    float _420 = fma(_100, _406, _390);
    float _422 = -_100;
    float _424 = fma(_422, _398, _408);
    float _426 = fma(_100, _398, _408);
    float _428 = -_100;
    float _430 = fma(_428, _410, _400);
    float _432 = fma(_100, _410, _400);
    float _434 = _102 * _100;
    float _436 = _418 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _438 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _444 = -_440;
    float _446 = _444 + 1.0;
    float _448 = -_98;
    float _450 = fma(_448, _442, _416);
    float _452 = fma(_98, _442, _420);
    float _454 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _456 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _458 = abs(_446);
    float _460 = log2(_458);
    float _462 = fma(_394, 0.5, 0.5);
    float _464 = fma(_394, -0.5, 0.5);
    float _466 = -_98;
    float _468 = fma(_466, _456, _430);
    float _470 = fma(_98, _456, _432);
    float _472 = -_98;
    float _474 = fma(_472, _454, _424);
    float _476 = fma(_98, _454, _426);
    float _478 = fma(_462, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _480 = sqrt(_464);
    float _482 = -_102;
    float _484 = _98 * _482;
    float _486 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _488 = _98 * _102;
    float _490 = fma(_462, _478, -0.212114393711090087890625);
    float _492 = fma(_486, _484, _474);
    float _494 = fma(_486, _488, _476);
    float _496 = _460 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _498 = fma(_462, _490, 1.570728778839111328125);
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _502 = fma(_402, _484, _468);
    float _504 = _202 + 1.0;
    float _506 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _508 = exp2(_496);
    float _510 = fma(_500, _484, _450);
    float _512 = _480 * 0.636619746685028076171875;
    float _514 = fma(_500, _488, _452);
    float _516 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _518 = fma(_506, _370, _510);
    float _520 = -_498;
    float _522 = fma(_512, _520, 1.0);
    float _524 = fma(_506, _434, _514);
    float _526 = fma(_516, _370, _492);
    float _528 = fma(_412, _370, _502);
    float _530 = fma(_516, _434, _494);
    float _532 = fma(_402, _488, _470);
    float _534 = -_202;
    float _536 = fma(_508, _504, _534);
    float _538 = fma(_536, 0.5, 0.5);
    float _540 = float(uint(_350));
    float _542 = fma(_356, 2.0, -1.0);
    float _544 = fma(_358, 2.0, -1.0);
    float _546 = _540 * 0.00390625;
    float _548 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[22].x, _342);
    float _550 = fma(_544, (*spvDescriptorSet0.fp_c3)._m0[22].y, _344);
    float2 _1579 = float2(_338, _340);
    float2 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1579, float2(0.0), isnan(_1579)), level(_546)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1579, float2(0.0), isnan(_1579)), level(_546)).xy;
    float _554 = _552.x;
    float _556 = _552.y;
    float2 _1592 = float2(_338, _340);
    float2 _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1592, float2(0.0), isnan(_1592)), level(_546)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1592, float2(0.0), isnan(_1592)), level(_546)).xy;
    float _560 = _558.x;
    float _562 = _558.y;
    float2 _1605 = float2(_338, _340);
    float4 _565 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1605, float2(0.0), isnan(_1605)), level(_546)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1605, float2(0.0), isnan(_1605)), level(_546)).xyzw;
    float _567 = _565.x;
    float _569 = _565.y;
    float _571 = _565.z;
    float _573 = _565.w;
    float2 _1622 = float2(_338, _340);
    float4 _575 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1622, float2(0.0), isnan(_1622)), level(_546)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1622, float2(0.0), isnan(_1622)), level(_546)).xyzw;
    float _577 = _575.x;
    float _579 = _575.y;
    float _581 = _575.z;
    float _583 = _575.w;
    float2 _1639 = float2(_522, _538);
    float3 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1639, float2(0.0), isnan(_1639))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1639, float2(0.0), isnan(_1639))).xyz;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float2 _1653 = float2(_548, _550);
    float4 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1653, float2(0.0), isnan(_1653))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1653, float2(0.0), isnan(_1653))).xyzw;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float _603 = _595.w;
    float _605 = fma(_412, _434, _532);
    float _607 = _98 * _100;
    float _609 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _611 = -_102;
    float _613 = fma(_611, _102, _284);
    float _615 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _617 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _619 = fma(_609, _607, _526);
    float _621 = fma(_609, _607, _530);
    float _623 = _100 * (-3.0);
    float _625 = fma(_617, _607, _528);
    float _627 = _460 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _629 = fma(_617, _607, _605);
    float _631 = fma(_615, _607, _518);
    float _633 = fma(_615, _607, _524);
    float _635 = exp2(_627);
    float _637 = fma(_282, 3.0, -1.0);
    float _639 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _641 = -_100;
    float _643 = fma(_641, _623, -1.0);
    float _645 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _647 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _649 = fma(_639, _637, _621);
    float _651 = fma(_645, _643, _631);
    float _653 = fma(_639, _643, _619);
    float _655 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _657 = fma(_647, _643, _625);
    float _659 = fma(_645, _637, _633);
    float _661 = fma(_647, _637, _629);
    float _663 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _665 = fma(_655, _613, _653);
    float _667 = fma(_655, _613, _649);
    float _669 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _671 = -_635;
    float _673 = _671 + 1.0;
    float _675 = fma(_663, _613, _651);
    float _677 = fma(_663, _613, _659);
    float _679 = fma(_669, _613, _657);
    float _681 = fma(_669, _613, _661);
    float _683 = _673 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _685 = -_683;
    float _687 = _685 + 1.0;
    float _689 = _683 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _691 = abs(_687);
    float _693 = log2(_691);
    float _695 = _554 * _556;
    float _697 = -_556;
    float _699 = _697 + _562;
    float _701 = _573 * _573;
    float _703 = _583 * _583;
    float _705 = -_695;
    float _707 = fma(_560, _562, _705);
    float _709 = fma(_699, (*spvDescriptorSet0.fp_c3)._m0[0].x, _556);
    float _711 = _701 * _701;
    float _713 = _703 * _703;
    float _715 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[0].x, _695);
    float _717 = precise::max(_709, 1.52587890625e-05);
    float _719 = _711 * 16.0;
    float _721 = _693 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _723 = _693 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _725 = _556 * _719;
    float _727 = 1.0 / _717;
    float _729 = _567 * _725;
    float _731 = _569 * _725;
    float _733 = _571 * _725;
    float _735 = _713 * 16.0;
    float _737 = exp2(_721);
    float _739 = _562 * _735;
    float _741 = -_731;
    float _743 = fma(_579, _739, _741);
    float _745 = -_729;
    float _747 = fma(_577, _739, _745);
    float _749 = _715 * _727;
    float _751 = -_733;
    float _753 = fma(_581, _739, _751);
    float _755 = fma(_743, (*spvDescriptorSet0.fp_c3)._m0[0].x, _731);
    float _757 = fma(_747, (*spvDescriptorSet0.fp_c3)._m0[0].x, _729);
    float _759 = _749 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _761 = _749 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _763 = fma(_753, (*spvDescriptorSet0.fp_c3)._m0[0].x, _733);
    float _765 = _759 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _767 = _761 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _769 = exp2(_723);
    float _771 = _737 * _727;
    float _773 = _677 * _765;
    float _775 = _667 * _765;
    float _777 = _681 * _765;
    float _779 = _755 * _771;
    float _781 = fma(_675, _767, _773);
    float _783 = fma(_665, _767, _775);
    float _785 = fma(_679, _767, _777);
    float _787 = _757 * _771;
    float _789 = _781 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _791 = _783 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _793 = _785 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _795 = _763 * _771;
    float _797 = _769 * _789;
    float _799 = _769 * _791;
    float _801 = _769 * _793;
    float _803 = _797 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _805 = _801 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _807 = fma(_779, (*spvDescriptorSet0.fp_c3)._m0[27].y, _803);
    float _809 = _799 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _811 = fma(_787, (*spvDescriptorSet0.fp_c3)._m0[27].x, _809);
    float _813 = fma(_591, _689, _807);
    float _815 = fma(_795, (*spvDescriptorSet0.fp_c3)._m0[27].z, _805);
    float _817 = fma(_589, _689, _811);
    float _819 = _813 * 0.715200006961822509765625;
    float _821 = fma(_593, _689, _815);
    float _823 = fma(_817, 0.2125999927520751953125, _819);
    float _825 = fma(_821, 0.072200000286102294921875, _823);
    float _827 = 1.0 / _825;
    float _829 = _827 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _831 = precise::clamp(_829, 0.0, 1.0);
    float _833 = fma(_831, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _835 = _833 * _603;
    float _837 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _839 = fma(_817, _835, _597);
    float _841 = fma(_813, _835, _599);
    float _843 = fma(_821, _835, _601);
    out.m_44.x = _839;
    out.m_44.y = _841;
    out.m_44.z = _843;
    out.m_44.w = _837;
    out.m_46.x = _839;
    out.m_46.y = _841;
    out.m_46.z = _843;
    out.m_46.w = _837;
    return out;
}

