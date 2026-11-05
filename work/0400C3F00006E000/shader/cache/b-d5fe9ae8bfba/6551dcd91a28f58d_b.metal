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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_ESmplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    sampler fp_t_tcb_12Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _50(thread const int& _4086, thread const int& _4087, thread const int& _4088, thread int& _4089, thread int& _4090, thread int& _4091, thread int& _4092, thread int& _4093, thread int& _4094)
{
    float _4097 = as_type<float>(_4088) + 0.0;
    bool _4099 = _4097 != 0.0;
    bool _4101 = isnan(_4097);
    bool _4103 = _4099 || _4101;
    bool _4105 = isnan(0.0);
    bool _4107 = _4103 || _4105;
    int _4109 = as_type<int>(_4097);
    int _4111 = _4086;
    int _4113 = 0;
    int _4115 = _4087;
    int _4117 = _4107 ? (-1) : 0;
    if (!_4107)
    {
        float _4119 = as_type<float>(_4088) * 1.0;
        _4109 = as_type<int>(_4119);
    }
    int _4121 = _4109;
    bool _4123 = !_4107;
    int _4125 = _4121;
    if (!_4123)
    {
        float _4127 = as_type<float>(_4088) + 0.0;
        bool _4129 = _4127 >= 0.0;
        bool _4131 = isnan(_4127);
        bool _4133 = _4129 || _4131;
        bool _4135 = isnan(0.0);
        bool _4137 = _4133 || _4135;
        int _4139 = as_type<int>(_4127);
        _4117 = _4137 ? (-1) : 0;
        if (!_4137)
        {
            _4139 = 2147483647;
        }
        int _4141 = _4139;
        bool _4143 = !_4137;
        _4125 = _4141;
        if (!_4143)
        {
            float _4145 = abs(as_type<float>(_4088));
            float _4147 = _4145 + 0.0;
            bool _4149 = _4147 > as_type<float>(0x7f800000u /* inf */);
            bool _4151 = isnan(_4147);
            bool _4153 = _4149 || _4151;
            bool _4155 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4157 = _4153 || _4155;
            int _4159 = as_type<int>(_4147);
            _4113 = 2139095040;
            _4117 = _4157 ? (-1) : 0;
            if (_4157)
            {
                float _4161 = as_type<float>(_4088) + 1.0;
                _4159 = as_type<int>(_4161);
            }
            int _4163 = _4159;
            _4125 = _4163;
            if (!_4157)
            {
                float _4165 = abs(as_type<float>(_4088));
                float _4167 = _4165 + (-0.0);
                float _4169 = 0.0 + _4167;
                bool _4171 = _4169 != as_type<float>(0x7f800000u /* inf */);
                bool _4173 = isnan(_4169);
                bool _4175 = _4171 || _4173;
                bool _4177 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4179 = _4175 || _4177;
                int _4181 = as_type<int>(_4169);
                _4117 = _4179 ? (-1) : 0;
                if (!_4179)
                {
                    _4181 = _4088;
                }
                int _4183 = _4181;
                bool _4185 = !_4179;
                _4125 = _4183;
                if (!_4185)
                {
                    float _4187 = as_type<float>(_4088) * 18446744073709551616.0;
                    float _4189 = rsqrt(_4187);
                    float _4191 = _4187 * _4189;
                    float _4193 = _4189 * 0.5;
                    float _4195 = -_4191;
                    float _4197 = 0.0 + _4195;
                    float _4199 = fma(_4193, _4197, 0.5);
                    float _4201 = fma(_4191, _4199, _4191);
                    float _4203 = -_4201;
                    float _4205 = 0.0 + _4203;
                    float _4207 = fma(_4201, _4205, _4187);
                    float _4209 = fma(_4193, _4207, _4201);
                    float _4211 = _4209 * 2.3283064365386962890625e-10;
                    _4125 = as_type<int>(_4211);
                    _4111 = as_type<int>(_4187);
                    _4113 = as_type<int>(_4193);
                    _4115 = as_type<int>(_4201);
                }
            }
        }
    }
    int _4213 = _4125;
    int _4215 = _4111;
    int _4217 = _4113;
    int _4219 = _4115;
    int _4221 = _4117;
    _4089 = _4213;
    _4090 = _4215;
    _4091 = _4217;
    _4092 = _4219;
    _4093 = 0;
    _4094 = _4221;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _815 = false;
    bool _272 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_39.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_39.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_39.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    int _74 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _78 = _74 != 0;
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _82 = _80 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _98 = _96 != 0;
    int _100 = int(_78);
    float _102 = 1.0 / _54;
    float _104 = _102 * _60;
    float _106 = _102 * _66;
    float _108 = _102 * _72;
    float _110 = _104 * _104;
    float _112 = fma(_106, _106, _110);
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _116 = fma(_108, _108, _112);
    float _118 = precise::max(0.0, _114);
    float _120 = rsqrt(_116);
    float _122 = _106 * _120;
    float _124 = _108 * _120;
    float _126 = _104 * _120;
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _130 = _124 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _132 = -_126;
    float _134 = -_118;
    float _136 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].z, _134);
    float _138 = _128 * _128;
    float _140 = _130 * _130;
    float _142 = _138 + _140;
    float _144 = sqrt(_142);
    bool _146 = _144 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _148 = _120;
    float _150 = _118;
    float _152 = _136;
    float _154 = _128;
    float _156 = _130;
    if (!_146)
    {
        _148 = _140;
    }
    float _158 = _148;
    float _160 = _158;
    if (!_146)
    {
        _150 = _138;
    }
    float _162 = _150;
    bool _164 = !_146;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _172 = _144 + _170;
        float _174 = _136 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _176 = rsqrt(_142);
        float _178 = _172 * _168;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _180 * 6.283185482025146484375;
        float _184 = sin(_182);
        float _186 = _180 * 6.283185482025146484375;
        float _188 = cos(_186);
        float _190 = fma(_184, _174, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _192 = _176 * _190;
        float _194 = _188 + (-1.0);
        float _196 = _128 * _192;
        float _198 = _130 * _192;
        float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _202 = _198 * _198;
        float _204 = fma(_136, _188, _200);
        float _206 = _196 * _196;
        _152 = _204;
        _166 = _206;
        _160 = _202;
        _154 = _196;
        _156 = _198;
    }
    float _208 = _152;
    float _210 = _166;
    float _212 = _160;
    float _214 = _154;
    float _216 = _156;
    float _218 = fma(_208, _208, _210);
    float _220 = _218 + _212;
    float _222 = rsqrt(_220);
    float _224 = _222 * _208;
    float _226 = _222 * _214;
    float _228 = _222 * _216;
    float _230 = -_224;
    float _232 = precise::max(0.0, _230);
    float _234 = abs(_232);
    float _236 = -_234;
    float _238 = _236 + 1.0;
    float _240 = fma(_232, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _242 = as_type<int>(_238) + (-218103808);
    float _244 = fma(_232, _240, -0.212114393711090087890625);
    bool _246 = uint(_242) >= 1920991232u;
    float _248 = fma(_232, _244, 1.570728778839111328125);
    bool _250 = !_246;
    float _270;
    if (!_250)
    {
        int _252 = 0;
        int _254 = 0;
        int _256 = as_type<int>(_238);
        int _258;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        _50(_252, _254, _256, _258, _260, _262, _264, _266, _268);
        _270 = as_type<float>(_258);
        _272 = true;
    }
    else
    {
        float _274 = rsqrt(_238);
        float _276 = _238 * _274;
        float _278 = _274 * 0.5;
        float _280 = -_276;
        float _282 = 0.0 + _280;
        float _284 = fma(_278, _282, 0.5);
        float _286 = fma(_276, _284, _276);
        float _288 = -_286;
        float _290 = 0.0 + _288;
        float _292 = fma(_286, _290, _238);
        float _294 = fma(_278, _292, _286);
        _270 = _294;
    }
    _272 = false;
    float _296 = _270;
    bool _298 = _224 > 0.0;
    float _300 = _124 * _124;
    float _302 = _122 * _122;
    float _304 = _300 + _302;
    if (_298)
    {
        discard_fragment();
    }
    float _306 = rsqrt(_304);
    float _308 = _248 * _296;
    float _310 = _308 * 0.636619746685028076171875;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = sqrt(_316);
    float _320 = _124 * _306;
    float _322 = _122 * _306;
    float _324 = abs(_320);
    float _326 = abs(_322);
    float _328 = precise::max(_324, _326);
    float _330 = precise::max(_328, 9.9999997473787516355514526367188e-05);
    float _332 = -_318;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _330;
    float _338 = _334 * 0.5;
    float _340 = -_336;
    float _342 = _320 * _340;
    float _344 = _322 * _336;
    float _346 = fma(_342, _338, 0.5);
    float _348 = fma(_344, _338, 0.5);
    if (_298)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return out;
    }
    float2 _2040;
    _2040.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    _2040.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    float _350 = _2040.x;
    float _352 = _350 * 256.0;
    int _354 = int(_352);
    float _356 = -_126;
    float _358 = _356 + 1.0;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = -_126;
    float _364 = fma(_362, _126, 1.0);
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _124 * (-3.0);
    int _370 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _372 = _370 != 0;
    float _374 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _376 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _388 = fma(_126, _380, _374);
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _392 = _360;
    if (_372)
    {
        float _394 = sqrt(_366);
        _392 = _394;
    }
    float _396 = _392;
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _400 = -_124;
    float _402 = fma(_400, _382, _388);
    float _404 = fma(_124, _382, _388);
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _408 = fma(_126, _398, _376);
    float _410 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _414 = fma(_300, 3.0, -1.0);
    float _416 = fma(_126, _390, _378);
    float _418 = -_124;
    float _420 = fma(_418, _384, _408);
    float _422 = fma(_124, _384, _408);
    float _424 = -_122;
    float _426 = fma(_424, _386, _402);
    float _428 = -_124;
    float _430 = fma(_428, _406, _416);
    float _432 = fma(_124, _406, _416);
    float _434 = abs(_396);
    float _436 = log2(_434);
    float _438 = -_122;
    float _440 = fma(_438, _412, _430);
    float _442 = -_122;
    float _444 = fma(_442, _410, _420);
    float _446 = fma(_122, _412, _432);
    float _448 = fma(_122, _386, _404);
    float _450 = fma(_122, _410, _422);
    float _452 = -_126;
    float _454 = _122 * _452;
    float _456 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _458 = _122 * _126;
    float _460 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _462 = fma(_456, _454, _426);
    float _464 = fma(_456, _458, _448);
    float _466 = _122 * _124;
    float _468 = -_124;
    float _470 = fma(_468, _368, -1.0);
    float _472 = _226 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _474 = _436 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _476 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _478 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _480 = -_472;
    float _482 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _480);
    float _484 = fma(_476, _454, _444);
    float _486 = exp2(_474);
    float _488 = fma(_476, _458, _450);
    float _490 = fma(_460, _454, _440);
    float _492 = fma(_460, _458, _446);
    float _494 = -_124;
    float _496 = _126 * _494;
    float _498 = _126 * _124;
    float _500 = -_228;
    float _502 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[11].z, _482);
    float _504 = _486 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _506 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = fma(_478, _496, _462);
    float _512 = fma(_478, _498, _464);
    float _514 = -_508;
    float _516 = _514 + 1.0;
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _520 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _522 = fma(_502, 0.5, 0.5);
    float _524 = fma(_502, -0.5, 0.5);
    float _526 = fma(_518, _496, _484);
    float _528 = abs(_516);
    float _530 = log2(_528);
    float _532 = fma(_518, _498, _488);
    float _534 = fma(_520, _498, _492);
    float _536 = fma(_522, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _538 = in.m_44.x;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = in.m_44.y;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = fma(_520, _496, _490);
    float _552 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _554 = fma(_522, _536, -0.212114393711090087890625);
    float _556 = sqrt(_524);
    float _558 = fma(_552, _466, _510);
    float _560 = fma(_552, _466, _512);
    float _562 = fma(_522, _554, 1.570728778839111328125);
    float _564 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _566 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _568 = _530 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _570 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _572 = fma(_564, _466, _526);
    float _574 = fma(_564, _466, _532);
    float _576 = exp2(_568);
    float _578 = fma(_566, _466, _534);
    float _580 = fma(_570, _470, _558);
    float _582 = fma(_570, _414, _560);
    float _584 = _556 * 0.636619746685028076171875;
    float _586 = fma(_566, _466, _550);
    float _588 = _224 + 1.0;
    float _590 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _592 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _594 = -_562;
    float _596 = fma(_584, _594, 1.0);
    float _598 = fma(_590, _414, _574);
    float _600 = fma(_590, _470, _572);
    float _602 = fma(_592, _414, _578);
    float _604 = fma(_592, _470, _586);
    float _606 = -_224;
    float _608 = fma(_576, _588, _606);
    float _610 = _102 * _542;
    float _612 = _102 * _548;
    float _614 = fma(_224, -0.5, 0.5);
    float _616 = fma(_608, 0.5, 0.5);
    float _618 = float(uint(_354));
    float _620 = _618 * 0.00390625;
    float2 _2473 = float2(_346, _348);
    float4 _623 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2473, float2(0.0), isnan(_2473)), level(_620)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2473, float2(0.0), isnan(_2473)), level(_620)).xyzw;
    float _625 = _623.x;
    float _627 = _623.y;
    float _629 = _623.z;
    float _631 = _623.w;
    float2 _2492 = float2(_346, _348);
    float2 _635 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2492, float2(0.0), isnan(_2492)), level(_620)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2492, float2(0.0), isnan(_2492)), level(_620)).xy;
    float _637 = _635.x;
    float _639 = _635.y;
    float2 _2505 = float2(_346, _348);
    float2 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2505, float2(0.0), isnan(_2505)), level(_620)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2505, float2(0.0), isnan(_2505)), level(_620)).xy;
    float _643 = _641.x;
    float _645 = _641.y;
    float2 _2518 = float2(_346, _348);
    float4 _647 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2518, float2(0.0), isnan(_2518)), level(_620)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2518, float2(0.0), isnan(_2518)), level(_620)).xyzw;
    float _649 = _647.x;
    float _651 = _647.y;
    float _653 = _647.z;
    float _655 = _647.w;
    float2 _2535 = float2(_610, _612);
    float3 _659 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2535, float2(0.0), isnan(_2535))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2535, float2(0.0), isnan(_2535))).xyz;
    float _661 = _659.x;
    float _663 = _659.y;
    float _665 = _659.z;
    float2 _2549 = float2(_596, _614);
    float3 _667 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2549, float2(0.0), isnan(_2549))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2549, float2(0.0), isnan(_2549))).xyz;
    float _669 = _667.x;
    float _671 = _667.y;
    float _673 = _667.z;
    float2 _2563 = float2(_596, _616);
    float3 _675 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2563, float2(0.0), isnan(_2563))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2563, float2(0.0), isnan(_2563))).xyz;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    float _683 = -_126;
    float _685 = fma(_683, _126, _302);
    int _687 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _693 = _691 != 0;
    float _695 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _697 = fma(_695, _685, _580);
    float _699 = fma(_695, _685, _582);
    float _701 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _703 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _705 = fma(_701, _685, _600);
    float _707 = fma(_701, _685, _598);
    float _709 = fma(_703, _685, _604);
    float _711 = fma(_703, _685, _602);
    float _713 = _631 * _631;
    float _715 = -_639;
    float _717 = _715 + _645;
    float _719 = _655 * _655;
    float _721 = _713 * _713;
    float _723 = _637 * _639;
    float _725 = fma(_717, (*spvDescriptorSet0.fp_c3)._m0[0].x, _639);
    float _727 = _719 * _719;
    float _729 = _721 * 16.0;
    float _731 = precise::max(_725, 1.52587890625e-05);
    float _733 = _729 * _639;
    float _735 = -_723;
    float _737 = fma(_643, _645, _735);
    float _739 = _727 * 16.0;
    float _741 = _627 * _733;
    float _743 = 1.0 / _731;
    float _745 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[0].x, _723);
    float _747 = _739 * _645;
    float _749 = -_665;
    float _751 = _749 + 1.0;
    float _753 = _629 * _733;
    float _755 = _625 * _733;
    float _757 = -_741;
    float _759 = fma(_651, _747, _757);
    float _761 = _725 * _751;
    float _763 = -_753;
    float _765 = fma(_653, _747, _763);
    float _767 = -_755;
    float _769 = fma(_649, _747, _767);
    float _771 = fma(_759, (*spvDescriptorSet0.fp_c3)._m0[0].x, _741);
    float _773 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _753);
    float _775 = fma(_769, (*spvDescriptorSet0.fp_c3)._m0[0].x, _755);
    float _777 = _761 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _779 = _745 * _743;
    bool _781 = !_689;
    float _783 = _781 ? _779 : 0.0;
    bool _785 = !_693;
    int _787 = _693 ? (-1) : 0;
    float _789 = _783;
    int _803;
    int _805;
    int _807;
    int _809;
    int _811;
    int _813;
    if (!_785)
    {
        float _791 = _426 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _793 = _444 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _795 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _797 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _799 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _801 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _803 = as_type<int>(_797);
        _805 = as_type<int>(_799);
        _807 = as_type<int>(_801);
        _809 = as_type<int>(_791);
        _811 = as_type<int>(_793);
        _813 = as_type<int>(_795);
        _815 = true;
    }
    else
    {
        int _817 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _819 = _817 != 0;
        float _821 = _705 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _823 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _825 = _697 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _827 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _829 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _831 = _699 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _833 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _835 = as_type<int>(_821);
        int _837 = as_type<int>(_823);
        int _839 = as_type<int>(_825);
        int _841 = as_type<int>(_827);
        int _843 = as_type<int>(_831);
        _787 = _819 ? (-1) : 0;
        _807 = as_type<int>(_833);
        if (_819)
        {
            float _845 = _376 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _835 = as_type<int>(_845);
        }
        int _847 = _835;
        _811 = _847;
        if (_819)
        {
            float _849 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _837 = as_type<int>(_849);
        }
        int _851 = _837;
        _813 = _851;
        if (_819)
        {
            float _853 = _829 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _839 = as_type<int>(_853);
        }
        int _855 = _839;
        _809 = _855;
        if (_819)
        {
            _841 = _847;
        }
        int _857 = _841;
        _805 = _857;
        if (_819)
        {
            _843 = _855;
        }
        int _859 = _843;
        _803 = _859;
        if (_819)
        {
            _807 = _851;
        }
    }
    _815 = false;
    int _861 = _787;
    int _863 = _803;
    int _865 = _805;
    int _867 = _807;
    int _869 = _809;
    int _871 = _811;
    int _873 = _813;
    int _875 = 0;
    int _877 = _861;
    if (!_94)
    {
        int _879 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _881 = _879 != 0;
        _875 = _881 ? (-1) : 0;
    }
    int _883 = _875;
    float _885 = _530 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_94)
    {
        _877 = -1;
    }
    int _887 = _877;
    float _889 = _783 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _891 = _887;
    if (!_94)
    {
        int _893 = ~_883;
        bool _895 = !_98;
        int _897 = _893 & (_895 ? (-1) : 0);
        _891 = _897;
    }
    int _899 = _891;
    float _901 = _783 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _903 = _100 != 0;
    float _905 = exp2(_885);
    float _907 = _775 * _743;
    float _909 = _771 * _743;
    float _911 = _773 * _743;
    float _913 = _661 * _663;
    float _915 = _913 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    int _917 = _899;
    if (_90)
    {
        _917 = -1;
    }
    int _919 = _917;
    int _921 = ~_899;
    float _923 = (_921 != 0) ? as_type<float>(_863) : 0.0;
    int _925 = _919;
    if (!_90)
    {
        bool _927 = !_98;
        bool _929 = _927 && _86;
        bool _931 = !_903;
        bool _933 = _929 && _931;
        _925 = _933 ? (-1) : 0;
    }
    int _935 = _925;
    int _937 = ~_899;
    float _939 = (_937 != 0) ? as_type<float>(_865) : 0.0;
    int _941 = ~_899;
    float _943 = (_941 != 0) ? as_type<float>(_867) : 0.0;
    bool _945 = !_98;
    bool _947 = _86 && _945;
    int _949 = ~_935;
    float _951 = (_949 != 0) ? as_type<float>(_869) : 0.0;
    int _953 = ~_935;
    float _955 = (_953 != 0) ? as_type<float>(_871) : 0.0;
    int _957 = ~_935;
    float _959 = (_957 != 0) ? as_type<float>(_873) : 0.0;
    int _961 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _963 = _961 != 0;
    bool _965 = !_947;
    float _967 = _965 ? _889 : 0.0;
    float _969 = -_905;
    float _971 = _969 + 1.0;
    bool _973 = !_947;
    float _975 = _973 ? _901 : 0.0;
    float _977 = _971 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _979 = !_963;
    float _981 = _975 * _923;
    bool _983 = !_963;
    float _985 = -_977;
    float _987 = _985 + 1.0;
    float _989 = _975 * _939;
    bool _991 = !_979;
    float _993 = _991 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _995 = _975 * _943;
    bool _997 = !_983;
    float _999 = _997 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1001 = fma(_951, _967, _981);
    float _1003 = abs(_987);
    float _1005 = log2(_1003);
    float _1007 = fma(_955, _967, _989);
    float _1009 = fma(_959, _967, _995);
    bool _1011 = !_963;
    float _1013 = _993 * _1001;
    float _1015 = _999 * _1007;
    float _1017 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _1019 = _224 * _1017;
    bool _1021 = !_1011;
    float _1023 = _1021 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    int _1025 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1027 = _1025 != 0;
    float _1029 = _1015 * 0.715200006961822509765625;
    float _1031 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[26].x, _1019);
    float _1033 = _1023 * _1009;
    float _1035 = fma(_1013, 0.2125999927520751953125, _1029);
    bool _1037 = !_1027;
    float _1039 = _224 * (-10000.0);
    float _1041 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1043 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1045 = fma(_1033, 0.072200000286102294921875, _1035);
    float _1047 = _1037 ? _909 : 0.0;
    float _1049 = exp2(_1041);
    float _1051 = -_1015;
    float _1053 = _1051 + _1045;
    float _1055 = -_1013;
    float _1057 = _1055 + _1045;
    float _1059 = -_1033;
    float _1061 = _1059 + _1045;
    bool _1063 = !_1027;
    float _1065 = fma(_915, _1053, _1015);
    float _1067 = fma(_915, _1057, _1013);
    float _1069 = fma(_915, _1061, _1033);
    float _1071 = exp2(_1043);
    float _1073 = _1063 ? _907 : 0.0;
    bool _1075 = !_82;
    float _1077 = _1075 ? _1049 : 1.0;
    bool _1079 = !_1027;
    int _1081 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1083 = _1081 != 0;
    float _1085 = _783 * _1077;
    float _1087 = _1077 * _1065;
    float _1089 = _1079 ? _911 : 0.0;
    float _1091 = _1077 * _1067;
    bool _1093 = !_82;
    float _1095 = _1093 ? _1071 : 1.0;
    float _1097 = _86 ? _1085 : _1087;
    float _1099 = _86 ? _1085 : _1091;
    float _1101 = _1095 * _1047;
    float _1103 = _1085;
    int _1105 = as_type<int>(_1101);
    if (!_86)
    {
        float _1107 = _1077 * _1069;
        _1103 = _1107;
    }
    float _1109 = _1103;
    float _1111 = _1097 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1113 = _1095 * _1073;
    float _1115 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1111);
    float _1117 = _1111;
    if (_82)
    {
        _1117 = 0.0;
    }
    float _1119 = _1117;
    float _1121 = _1095 * _1089;
    float _1123 = _1099 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1125 = _1109 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1127 = _1123;
    float _1129 = _1121;
    float _1131 = _1125;
    float _1133 = _1119;
    if (_82)
    {
        _1105 = as_type<int>(_777);
    }
    int _1135 = _1105;
    float _1137 = fma(_1113, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1123);
    float _1139 = fma(_1121, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1125);
    int _1141 = _1135;
    int _1143 = _1135;
    float _1145 = _1137;
    if (_82)
    {
        _1127 = 0.0;
    }
    float _1147 = _1127;
    float _1149 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1151 = _1147;
    if (_82)
    {
        _789 = 0.0;
    }
    float _1153 = _789;
    bool _1155 = !_82;
    float _1157 = _1155 ? _977 : 0.0;
    float _1159 = _1153;
    if (_82)
    {
        _1129 = _1115;
    }
    float _1161 = _1129;
    float _1163 = _1161;
    float _1165 = _1161;
    if (_82)
    {
        _1131 = _1139;
    }
    float _1167 = _1131;
    float _1169 = _1167;
    float _1171 = _1167;
    if (!_82)
    {
        int _1173 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1175 = _1173 != 0;
        float _1177 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1179 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1181 = _1179 != 0;
        float _1183 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1185 = _681 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1187 = !_1181;
        float _1189 = _1187 ? _1183 : 0.0;
        bool _1191 = !_1181;
        float _1193 = _1191 ? _1177 : 0.0;
        bool _1195 = !_1181;
        float _1197 = _1195 ? _1185 : 0.0;
        float _1199 = _1157 * _1189;
        _1133 = _1199;
        if (!_1175)
        {
            _1141 = as_type<int>(_777);
        }
        int _1201 = _1141;
        float _1203 = _1157 * _1193;
        float _1205 = _1157 * _1197;
        _1143 = _1201;
        _1159 = _1205;
        _1151 = _1203;
        if (!_1175)
        {
            _1163 = _1115;
        }
        float _1207 = _1163;
        _1165 = _1207;
        if (!_1175)
        {
            _1169 = _1139;
        }
        float _1209 = _1169;
        bool _1211 = !_1175;
        _1171 = _1209;
        if (!_1211)
        {
            float _1213 = -_1157;
            float _1215 = _1213 + 1.0;
            float _1217 = precise::clamp(_1215, 0.0, 1.0);
            float _1219 = _777 * _1217;
            float _1221 = precise::max(_1219, 9.9999997473787516355514526367188e-05);
            float _1223 = 1.0 / _1221;
            float _1225 = _777 * _1223;
            float _1227 = _1137 * _1225;
            float _1229 = _1115 * _1225;
            float _1231 = _1139 * _1225;
            _1143 = as_type<int>(_1219);
            _1171 = _1231;
            _1159 = 0.0;
            _1165 = _1229;
            _1151 = 0.0;
            _1145 = _1227;
            _1133 = 0.0;
        }
    }
    int _1233 = _1143;
    float _1235 = _1171;
    float _1237 = _1159;
    float _1239 = _1165;
    float _1241 = _1151;
    float _1243 = _1145;
    float _1245 = _1133;
    bool _1247 = !_1083;
    float _1249 = _1247 ? as_type<float>(_1233) : 1.0;
    float _1251 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[26].z, _1031);
    float _1253 = abs(_1039);
    bool _1255 = _1253 > 0.00999999977648258209228515625;
    float _1257 = -_1149;
    float _1259 = exp2(_1257);
    float _1261 = -_1249;
    float _1263 = _1261 + 1.0;
    float _1265 = _1255 ? _1039 : 0.00999999977648258209228515625;
    float _1267 = _1235 + _1237;
    float _1269 = _1239 + _1241;
    float _1271 = fma(_1251, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1273 = _673 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1275 = abs(_1263);
    float _1277 = log2(_1275);
    float _1279 = _1265 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1281 = fma(_1271, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1283 = _1243 + _1245;
    int _1285 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1287 = _1285 != 0;
    float _1289 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1291 = fma(_1289, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1293 = precise::max(_1279, -127.0);
    float _1295 = abs(_1281);
    float _1297 = log2(_1295);
    float _1299 = _1277 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1301 = -_1293;
    float _1303 = exp2(_1301);
    float _1305 = _1297 * 1.5;
    float _1307 = exp2(_1299);
    float _1309 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1311 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1313 = 1.0 / _1293;
    float _1315 = -_1303;
    float _1317 = _1315 + 1.0;
    float _1319 = _1259 * _1317;
    float _1321 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1323 = -_1307;
    float _1325 = spvFAdd(_1323, 1.00010001659393310546875);
    float _1327 = -_1307;
    float _1329 = _1327 + 1.0;
    float _1331 = exp2(_1305);
    float _1333 = -_1249;
    float _1335 = _1333 + _1329;
    float _1337 = _1319 * _1313;
    float _1339 = _1309 * _1335;
    float _1341 = 1.0 / _1325;
    float _1343 = _1321 * _1335;
    float _1345 = _1273 * _1335;
    float _1347 = fma(_1269, _1249, _1339);
    float _1349 = _1337 * _1311;
    float _1351 = fma(_1283, _1249, _1343);
    float _1353 = fma(_1267, _1249, _1345);
    float _1355 = _1331 * 12.56637096405029296875;
    float _1357 = -_1349;
    float _1359 = exp2(_1357);
    float _1361 = _1341 * _1347;
    float _1363 = _1341 * _1351;
    float _1365 = _1341 * _1353;
    float _1367 = 1.0 / _1355;
    float _1369 = _1361 * 0.715200006961822509765625;
    float _1371 = fma(_1363, 0.2125999927520751953125, _1369);
    float _1373 = fma(_1365, 0.072200000286102294921875, _1371);
    float _1375 = 1.0 / _1373;
    float _1377 = _1291 * _1367;
    float _1379 = -_1359;
    float _1381 = _1379 + 1.0;
    float _1383 = _1381 * _1377;
    float _1385 = _1383 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1387 = _1383 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1389 = _1375 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1391 = precise::clamp(_1389, 0.0, 1.0);
    float _1393 = _1383 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1395 = fma(_1391, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1397 = _1395 * _1359;
    float _1399 = fma(_1363, _1397, _1385);
    float _1401 = fma(_1361, _1397, _1387);
    float _1403 = fma(_1365, _1397, _1393);
    bool _1405 = !_1287;
    float _1407 = _1307;
    float _1409 = _1365;
    float _1411 = _1403;
    int _1413 = as_type<int>(_1307);
    int _1415 = as_type<int>(_1387);
    int _1417 = as_type<int>(_1401);
    float _1419 = _1365;
    float _1421 = _1403;
    if (!_1405)
    {
        bool _1423 = _1329 != 1.0;
        bool _1425 = isnan(_1329);
        bool _1427 = _1423 || _1425;
        bool _1429 = isnan(1.0);
        bool _1431 = _1427 || _1429;
        float _1433 = -_1307;
        bool _1435 = _1433 != (-1.0);
        bool _1437 = isnan(_1433);
        bool _1439 = _1435 || _1437;
        bool _1441 = isnan(-1.0);
        bool _1443 = _1439 || _1441;
        float _1445 = -_1307;
        bool _1447 = _1445 == (-1.0);
        bool _1449 = !_1431;
        bool _1451 = _1447 || _1449;
        bool _1453 = _1329 == 1.0;
        bool _1455 = _1453 && _1443;
        bool _1457 = !_1451;
        float _1459 = _1457 ? _1329 : 0.0;
        bool _1461 = !_1455;
        float _1463 = _1461 ? 0.0 : 1.0;
        float _1465 = _1451 ? 0.0 : 0.5;
        float _1467 = _1459 * 0.715200006961822509765625;
        float _1469 = fma(_1463, 0.2125999927520751953125, _1467);
        float _1471 = fma(_1465, 0.072200000286102294921875, _1469);
        float _1473 = 1.0 / _1471;
        float _1475 = _1473 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1477 = precise::clamp(_1475, 0.0, 1.0);
        float _1479 = fma(_1477, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1481 = _1463 * _1479;
        float _1483 = _1459 * _1479;
        float _1485 = _1465 * _1479;
        out.m_42.x = _1481;
        out.m_42.y = _1483;
        out.m_42.z = _1485;
        out.m_42.w = 1.0;
        return out;
    }
    bool _1487 = _100 != 0;
    bool _1489 = !_1487;
    if (!_1489)
    {
        if (_90)
        {
            _1407 = 0.0;
        }
        float _1491 = _1407;
        float _1493 = _1491;
        if (_90)
        {
            _1409 = 0.0;
        }
        float _1495 = _1409;
        float _1497 = _1495;
        if (!_90)
        {
            float _1499 = _955 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1497 = _1499;
        }
        float _1501 = _1497;
        float _1503 = _1501;
        if (!_90)
        {
            float _1505 = _951 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1493 = _1505;
        }
        float _1507 = _1493;
        float _1509 = _1507;
        if (!_94)
        {
            float _1511 = fma(_939, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1501);
            _1503 = _1511;
        }
        float _1513 = _1503;
        if (_90)
        {
            _1411 = 0.0;
        }
        float _1515 = _1411;
        float _1517 = _1515;
        if (!_90)
        {
            float _1519 = _959 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1517 = _1519;
        }
        float _1521 = _1517;
        float _1523 = _1513 * 0.715200006961822509765625;
        float _1525 = _1521;
        if (!_94)
        {
            float _1527 = fma(_923, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1507);
            _1509 = _1527;
        }
        float _1529 = _1509;
        if (!_94)
        {
            float _1531 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1521);
            _1525 = _1531;
        }
        float _1533 = _1525;
        float _1535 = fma(_1529, 0.2125999927520751953125, _1523);
        float _1537 = fma(_1533, 0.072200000286102294921875, _1535);
        float _1539 = 1.0 / _1537;
        float _1541 = _1539 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1543 = precise::clamp(_1541, 0.0, 1.0);
        float _1545 = fma(_1543, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1547 = _1545 * _1529;
        float _1549 = _1545 * _1513;
        float _1551 = _1545 * _1533;
        out.m_42.x = _1547;
        out.m_42.y = _1549;
        out.m_42.z = _1551;
        out.m_42.w = 1.0;
        return out;
    }
    if (!_98)
    {
        _1413 = as_type<int>(_1401);
    }
    int _1553 = _1413;
    float _1555 = as_type<float>(_1553);
    if (!_98)
    {
        _1415 = as_type<int>(_1399);
    }
    int _1557 = _1415;
    if (!_98)
    {
        _1417 = as_type<int>(_1329);
    }
    int _1559 = _1417;
    if (!_98)
    {
        out.m_42.x = as_type<float>(_1557);
        out.m_42.y = as_type<float>(_1553);
        out.m_42.z = _1403;
        out.m_42.w = as_type<float>(_1559);
        return out;
    }
    if (_90)
    {
        _1555 = 0.0;
    }
    float _1561 = _1555;
    float _1563 = _1561;
    if (_90)
    {
        _1419 = 0.0;
    }
    float _1565 = _1419;
    float _1567 = _1565;
    if (!_90)
    {
        float _1569 = _955 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1567 = _1569;
    }
    float _1571 = _1567;
    float _1573 = _1571;
    if (!_90)
    {
        float _1575 = _951 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1563 = _1575;
    }
    float _1577 = _1563;
    float _1579 = _1577;
    if (!_94)
    {
        float _1581 = fma(_939, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1571);
        _1573 = _1581;
    }
    float _1583 = _1573;
    if (_90)
    {
        _1421 = 0.0;
    }
    float _1585 = _1421;
    float _1587 = _1585;
    if (!_90)
    {
        float _1589 = _959 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1587 = _1589;
    }
    float _1591 = _1587;
    float _1593 = _1583 * 0.715200006961822509765625;
    float _1595 = _1591;
    if (!_94)
    {
        float _1597 = fma(_923, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1577);
        _1579 = _1597;
    }
    float _1599 = _1579;
    if (!_94)
    {
        float _1601 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1591);
        _1595 = _1601;
    }
    float _1603 = _1595;
    float _1605 = fma(_1599, 0.2125999927520751953125, _1593);
    float _1607 = fma(_1603, 0.072200000286102294921875, _1605);
    float _1609 = 1.0 / _1607;
    float _1611 = _1609 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1613 = precise::clamp(_1611, 0.0, 1.0);
    float _1615 = fma(_1613, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1617 = _1615 * _1599;
    float _1619 = _1615 * _1583;
    float _1621 = _1615 * _1603;
    out.m_42.x = _1617;
    out.m_42.y = _1619;
    out.m_42.z = _1621;
    out.m_42.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _815 = false;
    bool _272 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_39.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_39.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_39.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    int _74 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _78 = _74 != 0;
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _82 = _80 != 0;
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _86 = _84 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _98 = _96 != 0;
    int _100 = int(_78);
    float _102 = 1.0 / _54;
    float _104 = _102 * _60;
    float _106 = _102 * _66;
    float _108 = _102 * _72;
    float _110 = _104 * _104;
    float _112 = fma(_106, _106, _110);
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _116 = fma(_108, _108, _112);
    float _118 = precise::max(0.0, _114);
    float _120 = rsqrt(_116);
    float _122 = _106 * _120;
    float _124 = _108 * _120;
    float _126 = _104 * _120;
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _130 = _124 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _132 = -_126;
    float _134 = -_118;
    float _136 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].z, _134);
    float _138 = _128 * _128;
    float _140 = _130 * _130;
    float _142 = _138 + _140;
    float _144 = sqrt(_142);
    bool _146 = _144 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _148 = _120;
    float _150 = _118;
    float _152 = _136;
    float _154 = _128;
    float _156 = _130;
    if (!_146)
    {
        _148 = _140;
    }
    float _158 = _148;
    float _160 = _158;
    if (!_146)
    {
        _150 = _138;
    }
    float _162 = _150;
    bool _164 = !_146;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _172 = _144 + _170;
        float _174 = _136 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _176 = rsqrt(_142);
        float _178 = _172 * _168;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _180 * 6.283185482025146484375;
        float _184 = sin(_182);
        float _186 = _180 * 6.283185482025146484375;
        float _188 = cos(_186);
        float _190 = fma(_184, _174, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _192 = _176 * _190;
        float _194 = _188 + (-1.0);
        float _196 = _128 * _192;
        float _198 = _130 * _192;
        float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _202 = _198 * _198;
        float _204 = fma(_136, _188, _200);
        float _206 = _196 * _196;
        _152 = _204;
        _166 = _206;
        _160 = _202;
        _154 = _196;
        _156 = _198;
    }
    float _208 = _152;
    float _210 = _166;
    float _212 = _160;
    float _214 = _154;
    float _216 = _156;
    float _218 = fma(_208, _208, _210);
    float _220 = _218 + _212;
    float _222 = rsqrt(_220);
    float _224 = _222 * _208;
    float _226 = _222 * _214;
    float _228 = _222 * _216;
    float _230 = -_224;
    float _232 = precise::max(0.0, _230);
    float _234 = abs(_232);
    float _236 = -_234;
    float _238 = _236 + 1.0;
    float _240 = fma(_232, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _242 = as_type<int>(_238) + (-218103808);
    float _244 = fma(_232, _240, -0.212114393711090087890625);
    bool _246 = uint(_242) >= 1920991232u;
    float _248 = fma(_232, _244, 1.570728778839111328125);
    bool _250 = !_246;
    float _270;
    if (!_250)
    {
        int _252 = 0;
        int _254 = 0;
        int _256 = as_type<int>(_238);
        int _258;
        int _260;
        int _262;
        int _264;
        int _266;
        int _268;
        _50(_252, _254, _256, _258, _260, _262, _264, _266, _268);
        _270 = as_type<float>(_258);
        _272 = true;
    }
    else
    {
        float _274 = rsqrt(_238);
        float _276 = _238 * _274;
        float _278 = _274 * 0.5;
        float _280 = -_276;
        float _282 = 0.0 + _280;
        float _284 = fma(_278, _282, 0.5);
        float _286 = fma(_276, _284, _276);
        float _288 = -_286;
        float _290 = 0.0 + _288;
        float _292 = fma(_286, _290, _238);
        float _294 = fma(_278, _292, _286);
        _270 = _294;
    }
    _272 = false;
    float _296 = _270;
    bool _298 = _224 > 0.0;
    float _300 = _124 * _124;
    float _302 = _122 * _122;
    float _304 = _300 + _302;
    if (_298)
    {
        discard_fragment();
    }
    float _306 = rsqrt(_304);
    float _308 = _248 * _296;
    float _310 = _308 * 0.636619746685028076171875;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -_312;
    float _316 = _314 + 1.0;
    float _318 = sqrt(_316);
    float _320 = _124 * _306;
    float _322 = _122 * _306;
    float _324 = abs(_320);
    float _326 = abs(_322);
    float _328 = precise::max(_324, _326);
    float _330 = precise::max(_328, 9.9999997473787516355514526367188e-05);
    float _332 = -_318;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _330;
    float _338 = _334 * 0.5;
    float _340 = -_336;
    float _342 = _320 * _340;
    float _344 = _322 * _336;
    float _346 = fma(_342, _338, 0.5);
    float _348 = fma(_344, _338, 0.5);
    if (_298)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    float2 _2040;
    _2040.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    _2040.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_346, _348));
    float _350 = _2040.x;
    float _352 = _350 * 256.0;
    int _354 = int(_352);
    float _356 = -_126;
    float _358 = _356 + 1.0;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = -_126;
    float _364 = fma(_362, _126, 1.0);
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _124 * (-3.0);
    int _370 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _372 = _370 != 0;
    float _374 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _376 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _378 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _388 = fma(_126, _380, _374);
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _392 = _360;
    if (_372)
    {
        float _394 = sqrt(_366);
        _392 = _394;
    }
    float _396 = _392;
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _400 = -_124;
    float _402 = fma(_400, _382, _388);
    float _404 = fma(_124, _382, _388);
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _408 = fma(_126, _398, _376);
    float _410 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _414 = fma(_300, 3.0, -1.0);
    float _416 = fma(_126, _390, _378);
    float _418 = -_124;
    float _420 = fma(_418, _384, _408);
    float _422 = fma(_124, _384, _408);
    float _424 = -_122;
    float _426 = fma(_424, _386, _402);
    float _428 = -_124;
    float _430 = fma(_428, _406, _416);
    float _432 = fma(_124, _406, _416);
    float _434 = abs(_396);
    float _436 = log2(_434);
    float _438 = -_122;
    float _440 = fma(_438, _412, _430);
    float _442 = -_122;
    float _444 = fma(_442, _410, _420);
    float _446 = fma(_122, _412, _432);
    float _448 = fma(_122, _386, _404);
    float _450 = fma(_122, _410, _422);
    float _452 = -_126;
    float _454 = _122 * _452;
    float _456 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _458 = _122 * _126;
    float _460 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _462 = fma(_456, _454, _426);
    float _464 = fma(_456, _458, _448);
    float _466 = _122 * _124;
    float _468 = -_124;
    float _470 = fma(_468, _368, -1.0);
    float _472 = _226 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _474 = _436 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _476 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _478 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _480 = -_472;
    float _482 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[11].y, _480);
    float _484 = fma(_476, _454, _444);
    float _486 = exp2(_474);
    float _488 = fma(_476, _458, _450);
    float _490 = fma(_460, _454, _440);
    float _492 = fma(_460, _458, _446);
    float _494 = -_124;
    float _496 = _126 * _494;
    float _498 = _126 * _124;
    float _500 = -_228;
    float _502 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[11].z, _482);
    float _504 = _486 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _506 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = fma(_478, _496, _462);
    float _512 = fma(_478, _498, _464);
    float _514 = -_508;
    float _516 = _514 + 1.0;
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _520 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _522 = fma(_502, 0.5, 0.5);
    float _524 = fma(_502, -0.5, 0.5);
    float _526 = fma(_518, _496, _484);
    float _528 = abs(_516);
    float _530 = log2(_528);
    float _532 = fma(_518, _498, _488);
    float _534 = fma(_520, _498, _492);
    float _536 = fma(_522, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _538 = in.m_44.x;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = in.m_44.y;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = fma(_520, _496, _490);
    float _552 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _554 = fma(_522, _536, -0.212114393711090087890625);
    float _556 = sqrt(_524);
    float _558 = fma(_552, _466, _510);
    float _560 = fma(_552, _466, _512);
    float _562 = fma(_522, _554, 1.570728778839111328125);
    float _564 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _566 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _568 = _530 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _570 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _572 = fma(_564, _466, _526);
    float _574 = fma(_564, _466, _532);
    float _576 = exp2(_568);
    float _578 = fma(_566, _466, _534);
    float _580 = fma(_570, _470, _558);
    float _582 = fma(_570, _414, _560);
    float _584 = _556 * 0.636619746685028076171875;
    float _586 = fma(_566, _466, _550);
    float _588 = _224 + 1.0;
    float _590 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _592 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _594 = -_562;
    float _596 = fma(_584, _594, 1.0);
    float _598 = fma(_590, _414, _574);
    float _600 = fma(_590, _470, _572);
    float _602 = fma(_592, _414, _578);
    float _604 = fma(_592, _470, _586);
    float _606 = -_224;
    float _608 = fma(_576, _588, _606);
    float _610 = _102 * _542;
    float _612 = _102 * _548;
    float _614 = fma(_224, -0.5, 0.5);
    float _616 = fma(_608, 0.5, 0.5);
    float _618 = float(uint(_354));
    float _620 = _618 * 0.00390625;
    float2 _2473 = float2(_346, _348);
    float4 _623 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2473, float2(0.0), isnan(_2473)), level(_620)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2473, float2(0.0), isnan(_2473)), level(_620)).xyzw;
    float _625 = _623.x;
    float _627 = _623.y;
    float _629 = _623.z;
    float _631 = _623.w;
    float2 _2492 = float2(_346, _348);
    float2 _635 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2492, float2(0.0), isnan(_2492)), level(_620)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2492, float2(0.0), isnan(_2492)), level(_620)).xy;
    float _637 = _635.x;
    float _639 = _635.y;
    float2 _2505 = float2(_346, _348);
    float2 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2505, float2(0.0), isnan(_2505)), level(_620)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2505, float2(0.0), isnan(_2505)), level(_620)).xy;
    float _643 = _641.x;
    float _645 = _641.y;
    float2 _2518 = float2(_346, _348);
    float4 _647 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2518, float2(0.0), isnan(_2518)), level(_620)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2518, float2(0.0), isnan(_2518)), level(_620)).xyzw;
    float _649 = _647.x;
    float _651 = _647.y;
    float _653 = _647.z;
    float _655 = _647.w;
    float2 _2535 = float2(_610, _612);
    float3 _659 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2535, float2(0.0), isnan(_2535))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2535, float2(0.0), isnan(_2535))).xyz;
    float _661 = _659.x;
    float _663 = _659.y;
    float _665 = _659.z;
    float2 _2549 = float2(_596, _614);
    float3 _667 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2549, float2(0.0), isnan(_2549))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2549, float2(0.0), isnan(_2549))).xyz;
    float _669 = _667.x;
    float _671 = _667.y;
    float _673 = _667.z;
    float2 _2563 = float2(_596, _616);
    float3 _675 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2563, float2(0.0), isnan(_2563))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2563, float2(0.0), isnan(_2563))).xyz;
    float _677 = _675.x;
    float _679 = _675.y;
    float _681 = _675.z;
    float _683 = -_126;
    float _685 = fma(_683, _126, _302);
    int _687 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _693 = _691 != 0;
    float _695 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _697 = fma(_695, _685, _580);
    float _699 = fma(_695, _685, _582);
    float _701 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _703 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _705 = fma(_701, _685, _600);
    float _707 = fma(_701, _685, _598);
    float _709 = fma(_703, _685, _604);
    float _711 = fma(_703, _685, _602);
    float _713 = _631 * _631;
    float _715 = -_639;
    float _717 = _715 + _645;
    float _719 = _655 * _655;
    float _721 = _713 * _713;
    float _723 = _637 * _639;
    float _725 = fma(_717, (*spvDescriptorSet0.fp_c3)._m0[0].x, _639);
    float _727 = _719 * _719;
    float _729 = _721 * 16.0;
    float _731 = precise::max(_725, 1.52587890625e-05);
    float _733 = _729 * _639;
    float _735 = -_723;
    float _737 = fma(_643, _645, _735);
    float _739 = _727 * 16.0;
    float _741 = _627 * _733;
    float _743 = 1.0 / _731;
    float _745 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[0].x, _723);
    float _747 = _739 * _645;
    float _749 = -_665;
    float _751 = _749 + 1.0;
    float _753 = _629 * _733;
    float _755 = _625 * _733;
    float _757 = -_741;
    float _759 = fma(_651, _747, _757);
    float _761 = _725 * _751;
    float _763 = -_753;
    float _765 = fma(_653, _747, _763);
    float _767 = -_755;
    float _769 = fma(_649, _747, _767);
    float _771 = fma(_759, (*spvDescriptorSet0.fp_c3)._m0[0].x, _741);
    float _773 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _753);
    float _775 = fma(_769, (*spvDescriptorSet0.fp_c3)._m0[0].x, _755);
    float _777 = _761 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _779 = _745 * _743;
    bool _781 = !_689;
    float _783 = _781 ? _779 : 0.0;
    bool _785 = !_693;
    int _787 = _693 ? (-1) : 0;
    float _789 = _783;
    int _803;
    int _805;
    int _807;
    int _809;
    int _811;
    int _813;
    if (!_785)
    {
        float _791 = _426 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _793 = _444 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _795 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _797 = _448 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _799 = _450 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _801 = _446 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _803 = as_type<int>(_797);
        _805 = as_type<int>(_799);
        _807 = as_type<int>(_801);
        _809 = as_type<int>(_791);
        _811 = as_type<int>(_793);
        _813 = as_type<int>(_795);
        _815 = true;
    }
    else
    {
        int _817 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _819 = _817 != 0;
        float _821 = _705 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _823 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _825 = _697 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _827 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _829 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _831 = _699 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _833 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _835 = as_type<int>(_821);
        int _837 = as_type<int>(_823);
        int _839 = as_type<int>(_825);
        int _841 = as_type<int>(_827);
        int _843 = as_type<int>(_831);
        _787 = _819 ? (-1) : 0;
        _807 = as_type<int>(_833);
        if (_819)
        {
            float _845 = _376 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _835 = as_type<int>(_845);
        }
        int _847 = _835;
        _811 = _847;
        if (_819)
        {
            float _849 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _837 = as_type<int>(_849);
        }
        int _851 = _837;
        _813 = _851;
        if (_819)
        {
            float _853 = _829 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _839 = as_type<int>(_853);
        }
        int _855 = _839;
        _809 = _855;
        if (_819)
        {
            _841 = _847;
        }
        int _857 = _841;
        _805 = _857;
        if (_819)
        {
            _843 = _855;
        }
        int _859 = _843;
        _803 = _859;
        if (_819)
        {
            _807 = _851;
        }
    }
    _815 = false;
    int _861 = _787;
    int _863 = _803;
    int _865 = _805;
    int _867 = _807;
    int _869 = _809;
    int _871 = _811;
    int _873 = _813;
    int _875 = 0;
    int _877 = _861;
    if (!_94)
    {
        int _879 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _881 = _879 != 0;
        _875 = _881 ? (-1) : 0;
    }
    int _883 = _875;
    float _885 = _530 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_94)
    {
        _877 = -1;
    }
    int _887 = _877;
    float _889 = _783 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _891 = _887;
    if (!_94)
    {
        int _893 = ~_883;
        bool _895 = !_98;
        int _897 = _893 & (_895 ? (-1) : 0);
        _891 = _897;
    }
    int _899 = _891;
    float _901 = _783 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _903 = _100 != 0;
    float _905 = exp2(_885);
    float _907 = _775 * _743;
    float _909 = _771 * _743;
    float _911 = _773 * _743;
    float _913 = _661 * _663;
    float _915 = _913 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    int _917 = _899;
    if (_90)
    {
        _917 = -1;
    }
    int _919 = _917;
    int _921 = ~_899;
    float _923 = (_921 != 0) ? as_type<float>(_863) : 0.0;
    int _925 = _919;
    if (!_90)
    {
        bool _927 = !_98;
        bool _929 = _927 && _86;
        bool _931 = !_903;
        bool _933 = _929 && _931;
        _925 = _933 ? (-1) : 0;
    }
    int _935 = _925;
    int _937 = ~_899;
    float _939 = (_937 != 0) ? as_type<float>(_865) : 0.0;
    int _941 = ~_899;
    float _943 = (_941 != 0) ? as_type<float>(_867) : 0.0;
    bool _945 = !_98;
    bool _947 = _86 && _945;
    int _949 = ~_935;
    float _951 = (_949 != 0) ? as_type<float>(_869) : 0.0;
    int _953 = ~_935;
    float _955 = (_953 != 0) ? as_type<float>(_871) : 0.0;
    int _957 = ~_935;
    float _959 = (_957 != 0) ? as_type<float>(_873) : 0.0;
    int _961 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _963 = _961 != 0;
    bool _965 = !_947;
    float _967 = _965 ? _889 : 0.0;
    float _969 = -_905;
    float _971 = _969 + 1.0;
    bool _973 = !_947;
    float _975 = _973 ? _901 : 0.0;
    float _977 = _971 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _979 = !_963;
    float _981 = _975 * _923;
    bool _983 = !_963;
    float _985 = -_977;
    float _987 = _985 + 1.0;
    float _989 = _975 * _939;
    bool _991 = !_979;
    float _993 = _991 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _995 = _975 * _943;
    bool _997 = !_983;
    float _999 = _997 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1001 = fma(_951, _967, _981);
    float _1003 = abs(_987);
    float _1005 = log2(_1003);
    float _1007 = fma(_955, _967, _989);
    float _1009 = fma(_959, _967, _995);
    bool _1011 = !_963;
    float _1013 = _993 * _1001;
    float _1015 = _999 * _1007;
    float _1017 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _1019 = _224 * _1017;
    bool _1021 = !_1011;
    float _1023 = _1021 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    int _1025 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1027 = _1025 != 0;
    float _1029 = _1015 * 0.715200006961822509765625;
    float _1031 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[26].x, _1019);
    float _1033 = _1023 * _1009;
    float _1035 = fma(_1013, 0.2125999927520751953125, _1029);
    bool _1037 = !_1027;
    float _1039 = _224 * (-10000.0);
    float _1041 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1043 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1045 = fma(_1033, 0.072200000286102294921875, _1035);
    float _1047 = _1037 ? _909 : 0.0;
    float _1049 = exp2(_1041);
    float _1051 = -_1015;
    float _1053 = _1051 + _1045;
    float _1055 = -_1013;
    float _1057 = _1055 + _1045;
    float _1059 = -_1033;
    float _1061 = _1059 + _1045;
    bool _1063 = !_1027;
    float _1065 = fma(_915, _1053, _1015);
    float _1067 = fma(_915, _1057, _1013);
    float _1069 = fma(_915, _1061, _1033);
    float _1071 = exp2(_1043);
    float _1073 = _1063 ? _907 : 0.0;
    bool _1075 = !_82;
    float _1077 = _1075 ? _1049 : 1.0;
    bool _1079 = !_1027;
    int _1081 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1083 = _1081 != 0;
    float _1085 = _783 * _1077;
    float _1087 = _1077 * _1065;
    float _1089 = _1079 ? _911 : 0.0;
    float _1091 = _1077 * _1067;
    bool _1093 = !_82;
    float _1095 = _1093 ? _1071 : 1.0;
    float _1097 = _86 ? _1085 : _1087;
    float _1099 = _86 ? _1085 : _1091;
    float _1101 = _1095 * _1047;
    float _1103 = _1085;
    int _1105 = as_type<int>(_1101);
    if (!_86)
    {
        float _1107 = _1077 * _1069;
        _1103 = _1107;
    }
    float _1109 = _1103;
    float _1111 = _1097 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1113 = _1095 * _1073;
    float _1115 = fma(_1101, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1111);
    float _1117 = _1111;
    if (_82)
    {
        _1117 = 0.0;
    }
    float _1119 = _1117;
    float _1121 = _1095 * _1089;
    float _1123 = _1099 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1125 = _1109 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1127 = _1123;
    float _1129 = _1121;
    float _1131 = _1125;
    float _1133 = _1119;
    if (_82)
    {
        _1105 = as_type<int>(_777);
    }
    int _1135 = _1105;
    float _1137 = fma(_1113, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1123);
    float _1139 = fma(_1121, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1125);
    int _1141 = _1135;
    int _1143 = _1135;
    float _1145 = _1137;
    if (_82)
    {
        _1127 = 0.0;
    }
    float _1147 = _1127;
    float _1149 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1151 = _1147;
    if (_82)
    {
        _789 = 0.0;
    }
    float _1153 = _789;
    bool _1155 = !_82;
    float _1157 = _1155 ? _977 : 0.0;
    float _1159 = _1153;
    if (_82)
    {
        _1129 = _1115;
    }
    float _1161 = _1129;
    float _1163 = _1161;
    float _1165 = _1161;
    if (_82)
    {
        _1131 = _1139;
    }
    float _1167 = _1131;
    float _1169 = _1167;
    float _1171 = _1167;
    if (!_82)
    {
        int _1173 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1175 = _1173 != 0;
        float _1177 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1179 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1181 = _1179 != 0;
        float _1183 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1185 = _681 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1187 = !_1181;
        float _1189 = _1187 ? _1183 : 0.0;
        bool _1191 = !_1181;
        float _1193 = _1191 ? _1177 : 0.0;
        bool _1195 = !_1181;
        float _1197 = _1195 ? _1185 : 0.0;
        float _1199 = _1157 * _1189;
        _1133 = _1199;
        if (!_1175)
        {
            _1141 = as_type<int>(_777);
        }
        int _1201 = _1141;
        float _1203 = _1157 * _1193;
        float _1205 = _1157 * _1197;
        _1143 = _1201;
        _1159 = _1205;
        _1151 = _1203;
        if (!_1175)
        {
            _1163 = _1115;
        }
        float _1207 = _1163;
        _1165 = _1207;
        if (!_1175)
        {
            _1169 = _1139;
        }
        float _1209 = _1169;
        bool _1211 = !_1175;
        _1171 = _1209;
        if (!_1211)
        {
            float _1213 = -_1157;
            float _1215 = _1213 + 1.0;
            float _1217 = precise::clamp(_1215, 0.0, 1.0);
            float _1219 = _777 * _1217;
            float _1221 = precise::max(_1219, 9.9999997473787516355514526367188e-05);
            float _1223 = 1.0 / _1221;
            float _1225 = _777 * _1223;
            float _1227 = _1137 * _1225;
            float _1229 = _1115 * _1225;
            float _1231 = _1139 * _1225;
            _1143 = as_type<int>(_1219);
            _1171 = _1231;
            _1159 = 0.0;
            _1165 = _1229;
            _1151 = 0.0;
            _1145 = _1227;
            _1133 = 0.0;
        }
    }
    int _1233 = _1143;
    float _1235 = _1171;
    float _1237 = _1159;
    float _1239 = _1165;
    float _1241 = _1151;
    float _1243 = _1145;
    float _1245 = _1133;
    bool _1247 = !_1083;
    float _1249 = _1247 ? as_type<float>(_1233) : 1.0;
    float _1251 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[26].z, _1031);
    float _1253 = abs(_1039);
    bool _1255 = _1253 > 0.00999999977648258209228515625;
    float _1257 = -_1149;
    float _1259 = exp2(_1257);
    float _1261 = -_1249;
    float _1263 = _1261 + 1.0;
    float _1265 = _1255 ? _1039 : 0.00999999977648258209228515625;
    float _1267 = _1235 + _1237;
    float _1269 = _1239 + _1241;
    float _1271 = fma(_1251, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1273 = _673 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1275 = abs(_1263);
    float _1277 = log2(_1275);
    float _1279 = _1265 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1281 = fma(_1271, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1283 = _1243 + _1245;
    int _1285 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1287 = _1285 != 0;
    float _1289 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1291 = fma(_1289, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1293 = precise::max(_1279, -127.0);
    float _1295 = abs(_1281);
    float _1297 = log2(_1295);
    float _1299 = _1277 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1301 = -_1293;
    float _1303 = exp2(_1301);
    float _1305 = _1297 * 1.5;
    float _1307 = exp2(_1299);
    float _1309 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1311 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1313 = 1.0 / _1293;
    float _1315 = -_1303;
    float _1317 = _1315 + 1.0;
    float _1319 = _1259 * _1317;
    float _1321 = _669 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1323 = -_1307;
    float _1325 = spvFAdd(_1323, 1.00010001659393310546875);
    float _1327 = -_1307;
    float _1329 = _1327 + 1.0;
    float _1331 = exp2(_1305);
    float _1333 = -_1249;
    float _1335 = _1333 + _1329;
    float _1337 = _1319 * _1313;
    float _1339 = _1309 * _1335;
    float _1341 = 1.0 / _1325;
    float _1343 = _1321 * _1335;
    float _1345 = _1273 * _1335;
    float _1347 = fma(_1269, _1249, _1339);
    float _1349 = _1337 * _1311;
    float _1351 = fma(_1283, _1249, _1343);
    float _1353 = fma(_1267, _1249, _1345);
    float _1355 = _1331 * 12.56637096405029296875;
    float _1357 = -_1349;
    float _1359 = exp2(_1357);
    float _1361 = _1341 * _1347;
    float _1363 = _1341 * _1351;
    float _1365 = _1341 * _1353;
    float _1367 = 1.0 / _1355;
    float _1369 = _1361 * 0.715200006961822509765625;
    float _1371 = fma(_1363, 0.2125999927520751953125, _1369);
    float _1373 = fma(_1365, 0.072200000286102294921875, _1371);
    float _1375 = 1.0 / _1373;
    float _1377 = _1291 * _1367;
    float _1379 = -_1359;
    float _1381 = _1379 + 1.0;
    float _1383 = _1381 * _1377;
    float _1385 = _1383 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1387 = _1383 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1389 = _1375 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1391 = precise::clamp(_1389, 0.0, 1.0);
    float _1393 = _1383 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1395 = fma(_1391, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1397 = _1395 * _1359;
    float _1399 = fma(_1363, _1397, _1385);
    float _1401 = fma(_1361, _1397, _1387);
    float _1403 = fma(_1365, _1397, _1393);
    bool _1405 = !_1287;
    float _1407 = _1307;
    float _1409 = _1365;
    float _1411 = _1403;
    int _1413 = as_type<int>(_1307);
    int _1415 = as_type<int>(_1387);
    int _1417 = as_type<int>(_1401);
    float _1419 = _1365;
    float _1421 = _1403;
    if (!_1405)
    {
        bool _1423 = _1329 != 1.0;
        bool _1425 = isnan(_1329);
        bool _1427 = _1423 || _1425;
        bool _1429 = isnan(1.0);
        bool _1431 = _1427 || _1429;
        float _1433 = -_1307;
        bool _1435 = _1433 != (-1.0);
        bool _1437 = isnan(_1433);
        bool _1439 = _1435 || _1437;
        bool _1441 = isnan(-1.0);
        bool _1443 = _1439 || _1441;
        float _1445 = -_1307;
        bool _1447 = _1445 == (-1.0);
        bool _1449 = !_1431;
        bool _1451 = _1447 || _1449;
        bool _1453 = _1329 == 1.0;
        bool _1455 = _1453 && _1443;
        bool _1457 = !_1451;
        float _1459 = _1457 ? _1329 : 0.0;
        bool _1461 = !_1455;
        float _1463 = _1461 ? 0.0 : 1.0;
        float _1465 = _1451 ? 0.0 : 0.5;
        float _1467 = _1459 * 0.715200006961822509765625;
        float _1469 = fma(_1463, 0.2125999927520751953125, _1467);
        float _1471 = fma(_1465, 0.072200000286102294921875, _1469);
        float _1473 = 1.0 / _1471;
        float _1475 = _1473 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1477 = precise::clamp(_1475, 0.0, 1.0);
        float _1479 = fma(_1477, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1481 = _1463 * _1479;
        float _1483 = _1459 * _1479;
        float _1485 = _1465 * _1479;
        out.m_42.x = _1481;
        out.m_42.y = _1483;
        out.m_42.z = _1485;
        out.m_42.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    bool _1487 = _100 != 0;
    bool _1489 = !_1487;
    if (!_1489)
    {
        if (_90)
        {
            _1407 = 0.0;
        }
        float _1491 = _1407;
        float _1493 = _1491;
        if (_90)
        {
            _1409 = 0.0;
        }
        float _1495 = _1409;
        float _1497 = _1495;
        if (!_90)
        {
            float _1499 = _955 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1497 = _1499;
        }
        float _1501 = _1497;
        float _1503 = _1501;
        if (!_90)
        {
            float _1505 = _951 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1493 = _1505;
        }
        float _1507 = _1493;
        float _1509 = _1507;
        if (!_94)
        {
            float _1511 = fma(_939, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1501);
            _1503 = _1511;
        }
        float _1513 = _1503;
        if (_90)
        {
            _1411 = 0.0;
        }
        float _1515 = _1411;
        float _1517 = _1515;
        if (!_90)
        {
            float _1519 = _959 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1517 = _1519;
        }
        float _1521 = _1517;
        float _1523 = _1513 * 0.715200006961822509765625;
        float _1525 = _1521;
        if (!_94)
        {
            float _1527 = fma(_923, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1507);
            _1509 = _1527;
        }
        float _1529 = _1509;
        if (!_94)
        {
            float _1531 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1521);
            _1525 = _1531;
        }
        float _1533 = _1525;
        float _1535 = fma(_1529, 0.2125999927520751953125, _1523);
        float _1537 = fma(_1533, 0.072200000286102294921875, _1535);
        float _1539 = 1.0 / _1537;
        float _1541 = _1539 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1543 = precise::clamp(_1541, 0.0, 1.0);
        float _1545 = fma(_1543, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1547 = _1545 * _1529;
        float _1549 = _1545 * _1513;
        float _1551 = _1545 * _1533;
        out.m_42.x = _1547;
        out.m_42.y = _1549;
        out.m_42.z = _1551;
        out.m_42.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    if (!_98)
    {
        _1413 = as_type<int>(_1401);
    }
    int _1553 = _1413;
    float _1555 = as_type<float>(_1553);
    if (!_98)
    {
        _1415 = as_type<int>(_1399);
    }
    int _1557 = _1415;
    if (!_98)
    {
        _1417 = as_type<int>(_1329);
    }
    int _1559 = _1417;
    if (!_98)
    {
        out.m_42.x = as_type<float>(_1557);
        out.m_42.y = as_type<float>(_1553);
        out.m_42.z = _1403;
        out.m_42.w = as_type<float>(_1559);
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    if (_90)
    {
        _1555 = 0.0;
    }
    float _1561 = _1555;
    float _1563 = _1561;
    if (_90)
    {
        _1419 = 0.0;
    }
    float _1565 = _1419;
    float _1567 = _1565;
    if (!_90)
    {
        float _1569 = _955 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1567 = _1569;
    }
    float _1571 = _1567;
    float _1573 = _1571;
    if (!_90)
    {
        float _1575 = _951 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1563 = _1575;
    }
    float _1577 = _1563;
    float _1579 = _1577;
    if (!_94)
    {
        float _1581 = fma(_939, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1571);
        _1573 = _1581;
    }
    float _1583 = _1573;
    if (_90)
    {
        _1421 = 0.0;
    }
    float _1585 = _1421;
    float _1587 = _1585;
    if (!_90)
    {
        float _1589 = _959 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1587 = _1589;
    }
    float _1591 = _1587;
    float _1593 = _1583 * 0.715200006961822509765625;
    float _1595 = _1591;
    if (!_94)
    {
        float _1597 = fma(_923, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1577);
        _1579 = _1597;
    }
    float _1599 = _1579;
    if (!_94)
    {
        float _1601 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1591);
        _1595 = _1601;
    }
    float _1603 = _1595;
    float _1605 = fma(_1599, 0.2125999927520751953125, _1593);
    float _1607 = fma(_1603, 0.072200000286102294921875, _1605);
    float _1609 = 1.0 / _1607;
    float _1611 = _1609 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1613 = precise::clamp(_1611, 0.0, 1.0);
    float _1615 = fma(_1613, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1617 = _1615 * _1599;
    float _1619 = _1615 * _1583;
    float _1621 = _1615 * _1603;
    out.m_42.x = _1617;
    out.m_42.y = _1619;
    out.m_42.z = _1621;
    out.m_42.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

