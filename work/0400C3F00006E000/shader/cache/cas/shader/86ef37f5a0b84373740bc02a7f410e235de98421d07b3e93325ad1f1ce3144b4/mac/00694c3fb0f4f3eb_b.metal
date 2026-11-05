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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c1 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    device _23* cp_s1 [[id(2)]];
    device _23* cp_s2 [[id(3)]];
    device _23* cp_s3 [[id(4)]];
    device _23* cp_s4 [[id(5)]];
    device _23* cp_s5 [[id(6)]];
    device _23* cp_s6 [[id(7)]];
    device _23* cp_s7 [[id(8)]];
    device _23* cp_s8 [[id(9)]];
    device _23* cp_s9 [[id(10)]];
    device _23* cp_s10 [[id(11)]];
    device _23* cp_s11 [[id(12)]];
    device _23* cp_s12 [[id(13)]];
    device _23* cp_s13 [[id(14)]];
    device _23* cp_s14 [[id(15)]];
    device _23* cp_s15 [[id(16)]];
    texture2d_array<float> cp_t_tcb_16 [[id(17)]];
    sampler cp_t_tcb_16Smplr [[id(18)]];
    texture2d_array<float> cp_t_tcb_14 [[id(19)]];
    sampler cp_t_tcb_14Smplr [[id(20)]];
    texture2d<float> cp_t_tcb_2A [[id(21)]];
    sampler cp_t_tcb_2ASmplr [[id(22)]];
    texture2d<float> cp_t_tcb_2C [[id(23)]];
    sampler cp_t_tcb_2CSmplr [[id(24)]];
    texture2d<float> cp_t_tcb_26 [[id(25)]];
    sampler cp_t_tcb_26Smplr [[id(26)]];
    sampler cp_t_tcb_14Smplr_w [[id(27)]];
    sampler cp_t_tcb_2ASmplr_w [[id(28)]];
    sampler cp_t_tcb_2CSmplr_w [[id(29)]];
    sampler cp_t_tcb_26Smplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

static inline __attribute__((always_inline))
void _87(thread const int& _21139, thread const int& _21140, thread const int& _21141, thread const int& _21142, thread int& _21143, thread int& _21144, thread int& _21145, thread int& _21146, thread int& _21147, thread int& _21148)
{
    float _21151 = as_type<float>(_21141) + 0.0;
    bool _21153 = _21151 != 0.0;
    bool _21155 = isnan(_21151);
    bool _21157 = _21153 || _21155;
    bool _21159 = isnan(0.0);
    bool _21161 = _21157 || _21159;
    int _21163 = _21139;
    int _21165 = _21140;
    int _21167 = _21141;
    int _21169 = _21161 ? (-1) : 0;
    if (!_21161)
    {
        float _21171 = as_type<float>(_21141) * 1.0;
        _21163 = as_type<int>(_21171);
    }
    int _21173 = _21163;
    bool _21175 = !_21161;
    int _21177 = _21173;
    int _21179 = _21173;
    if (!_21175)
    {
        float _21181 = as_type<float>(_21141) + 0.0;
        bool _21183 = _21181 >= 0.0;
        bool _21185 = isnan(_21181);
        bool _21187 = _21183 || _21185;
        bool _21189 = isnan(0.0);
        bool _21191 = _21187 || _21189;
        _21169 = _21191 ? (-1) : 0;
        if (!_21191)
        {
            _21177 = 2147483647;
        }
        int _21193 = _21177;
        bool _21195 = !_21191;
        int _21197 = _21193;
        _21179 = _21193;
        if (!_21195)
        {
            float _21199 = as_type<float>(_21141) + 0.0;
            bool _21201 = _21199 > as_type<float>(0x7f800000u /* inf */);
            bool _21203 = isnan(_21199);
            bool _21205 = _21201 || _21203;
            bool _21207 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _21209 = _21205 || _21207;
            _21169 = _21209 ? (-1) : 0;
            if (_21209)
            {
                float _21211 = as_type<float>(_21141) + 1.0;
                _21197 = as_type<int>(_21211);
            }
            int _21213 = _21197;
            int _21215 = _21213;
            _21179 = _21213;
            if (!_21209)
            {
                float _21217 = 0.0 + as_type<float>(_21141);
                bool _21219 = _21217 != as_type<float>(0x7f800000u /* inf */);
                bool _21221 = isnan(_21217);
                bool _21223 = _21219 || _21221;
                bool _21225 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _21227 = _21223 || _21225;
                _21169 = _21227 ? (-1) : 0;
                if (!_21227)
                {
                    _21215 = _21141;
                }
                int _21229 = _21215;
                bool _21231 = !_21227;
                _21179 = _21229;
                if (!_21231)
                {
                    float _21233 = as_type<float>(_21141) * 18446744073709551616.0;
                    float _21235 = rsqrt(_21233);
                    float _21237 = _21233 * _21235;
                    float _21239 = _21235 * 0.5;
                    float _21241 = -_21237;
                    float _21243 = 0.0 + _21241;
                    float _21245 = fma(_21239, _21243, 0.5);
                    float _21247 = fma(_21237, _21245, _21237);
                    float _21249 = -_21247;
                    float _21251 = 0.0 + _21249;
                    float _21253 = fma(_21247, _21251, _21233);
                    float _21255 = fma(_21239, _21253, _21247);
                    float _21257 = _21255 * 2.3283064365386962890625e-10;
                    _21179 = as_type<int>(_21257);
                    _21165 = as_type<int>(_21247);
                    _21167 = as_type<int>(_21243);
                }
            }
        }
    }
    int _21259 = _21179;
    int _21261 = _21165;
    int _21263 = _21167;
    int _21265 = _21169;
    _21143 = _21142;
    _21144 = 0;
    _21145 = _21259;
    _21146 = _21261;
    _21147 = _21263;
    _21148 = _21265;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _8328 = false;
    bool _7852 = false;
    bool _7588 = false;
    bool _7224 = false;
    bool _6566 = false;
    bool _6394 = false;
    bool _6040 = false;
    bool _5102 = false;
    bool _4848 = false;
    bool _4480 = false;
    bool _3592 = false;
    bool _2938 = false;
    bool _2982 = false;
    bool _2770 = false;
    bool _548 = false;
    float _91 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _93 = as_type<float>(gl_LocalInvocationID.x);
    float _95 = as_type<float>(gl_WorkGroupID.x);
    int _97 = as_type<int>(_95) << 5;
    int _99 = _97 + as_type<int>(_93);
    float _101 = trunc(_91);
    int _103 = int(_101);
    bool _107 = _99 >= _103;
    int _109 = _103;
    if (_107)
    {
        _109 = 0;
    }
    int _111 = _109;
    int _113 = _111;
    int _115 = _111;
    if (!_107)
    {
        int _117 = _99 << 4;
        int _119 = _117 + 12;
        uint _122 = uint(int(uint(_119) >> uint(2)));
        float _124 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_122)]);
        float _126 = trunc(_124);
        int _128 = int(_126);
        bool _130 = _128 >= 1;
        int _132 = _130 ? (-1) : 0;
        if (!_130)
        {
            _113 = 0;
        }
        int _134 = _113;
        bool _136 = !_130;
        _115 = _134;
        if (!_136)
        {
            float _138 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _140 = uint(int(uint(_119) >> uint(2)));
            float _142 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_140)]);
            float _144 = float(_128);
            float _146 = -_142;
            float _148 = _138 + _146;
            bool _150 = _148 > _144;
            int _152 = as_type<int>(_138);
            if (!_150)
            {
                bool _154 = _138 >= _142;
                bool _156 = isnan(_138);
                bool _158 = _154 || _156;
                bool _160 = isnan(_142);
                bool _162 = _158 || _160;
                _132 = _162 ? (-1) : 0;
            }
            int _164 = _132;
            if (_150)
            {
                _152 = 0;
            }
            int _166 = _152;
            _115 = _166;
            if (!_150)
            {
                int _168 = ~_164;
                int _170 = (_168 != 0) ? 0 : 1;
                _115 = _170;
            }
        }
    }
    int _172 = _115;
    int _174 = _172 & 1;
    bool _176 = _174 != 0;
    if (!_176)
    {
        return;
    }
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _182 = _99 << 4;
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _186 = _182 + 12;
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _192 = uint(int(uint(_186) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_192)]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _198 = uint(int(uint(_182) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_198)]);
    int _202 = _182 + 4;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_204)]);
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _218 = uint(int(uint(_182) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_218)]);
    int _222 = _182 + 4;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_224)]);
    int _228 = _182 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_230)]);
    uint _234 = uint(int(uint(_186) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_234)]);
    uint _238 = uint(int(uint(_182) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_238)]);
    int _242 = _182 + 4;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_244)]);
    int _248 = _182 + 8;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_250)]);
    float _254 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _260 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _262 = uint(int(uint(_182) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_262)]);
    int _266 = _182 + 4;
    uint _268 = uint(int(uint(_266) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_268)]);
    int _272 = _182 + 8;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    float _276 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_274)]);
    uint _278 = uint(int(uint(_186) >> uint(2)));
    float _280 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_278)]);
    bool _282 = _178 > 0.0;
    float _284 = abs(_180);
    float _286 = log2(_284);
    bool _288 = _184 > 0.0;
    float _290 = 0.0;
    float _292 = _196;
    float _294 = _210;
    float _296 = _216;
    float _298 = _220;
    float _300 = _226;
    float _302 = _232;
    float _304 = _236;
    float _306 = _208;
    float _308 = _254;
    float _310 = _256;
    float _312 = _258;
    float _314 = _260;
    if (_282)
    {
        float _316 = 1.0 / _178;
        _290 = _316;
    }
    float _318 = _290;
    float _320 = _188 * _286;
    float _322 = -_194;
    float _324 = _190 + _322;
    float _326 = _196 * _184;
    float _328 = exp2(_320);
    float _330 = _318;
    if (_282)
    {
        float _332 = _324 * _318;
        _330 = _332;
    }
    float _334 = _330;
    if (_288)
    {
        float _336 = -_326;
        float _338 = fma(_200, _336, _196);
        _292 = _338;
    }
    float _340 = _292;
    int _342 = as_type<int>(_208) & 512;
    bool _344 = _342 != 0;
    float _346 = _188 * _210;
    float _348 = _340;
    bool _350 = _344;
    if (_282)
    {
        float _352 = precise::min(_334, 1.0);
        _294 = _352;
    }
    float _354 = _294;
    float _356 = _212 * _346;
    float _358 = _356;
    if (_282)
    {
        float _360 = _354 * _340;
        _348 = _360;
    }
    float _362 = _348;
    float _364 = _214 * _346;
    float _366 = _216 * _346;
    float _368 = _236 * _188;
    float _370 = _188 * _362;
    float _372 = fma(_220, _328, _356);
    float _374 = fma(_226, _328, _364);
    float _376 = fma(_232, _328, _366);
    float _378 = fma(_220, _368, _240);
    float _380 = fma(_226, _368, _246);
    float _382 = fma(_232, _368, _252);
    float _384 = _254 * _370;
    float _386 = _256 * _370;
    float _388 = _258 * _370;
    bool _390 = !_344;
    float _392 = _328;
    float _394 = _364;
    float _396 = _368;
    float _398 = _370;
    float _400 = _378;
    float _402 = _386;
    int _404 = as_type<int>(_264);
    int _406 = as_type<int>(_270);
    int _408 = as_type<int>(_276);
    int _410 = as_type<int>(_264);
    int _412 = as_type<int>(_270);
    int _414 = as_type<int>(_276);
    int _416 = as_type<int>(_264);
    int _418 = as_type<int>(_270);
    int _420 = as_type<int>(_276);
    float _542;
    float _544;
    float _546;
    if (!_390)
    {
        float _422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _438 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _440 = _426 * _428;
        float _442 = _426 * _430;
        float _444 = _424 * _428;
        float _446 = -_440;
        float _448 = fma(_422, _432, _446);
        float _450 = -_442;
        float _452 = fma(_424, _432, _450);
        float _454 = -_444;
        float _456 = fma(_422, _430, _454);
        float _458 = _436 * _422;
        float _460 = _436 * _448;
        float _462 = _438 * _424;
        float _464 = _434 * _430;
        float _466 = -_458;
        float _468 = fma(_434, _424, _466);
        float _470 = -_460;
        float _472 = fma(_434, _452, _470);
        float _474 = _436 * _432;
        float _476 = _438 * _428;
        float _478 = -_464;
        float _480 = fma(_436, _428, _478);
        float _482 = fma(_438, _456, _472);
        float _484 = -_474;
        float _486 = fma(_438, _430, _484);
        float _488 = -_476;
        float _490 = fma(_434, _432, _488);
        float _492 = _434 * _426;
        float _494 = 1.0 / _482;
        float _496 = -_422;
        float _498 = fma(_496, _432, _440);
        float _500 = -_462;
        float _502 = fma(_436, _426, _500);
        float _504 = -_492;
        float _506 = fma(_438, _422, _504);
        float _508 = _486 * _494;
        float _510 = _490 * _494;
        float _512 = _480 * _494;
        float _514 = _384 * _494;
        float _516 = _386 * _508;
        float _518 = _386 * _510;
        float _520 = _386 * _512;
        float _522 = _498 * _494;
        float _524 = _502 * _494;
        float _526 = fma(_452, _514, _516);
        float _528 = _506 * _494;
        float _530 = _468 * _494;
        float _532 = fma(_384, _522, _518);
        float _534 = fma(_456, _514, _520);
        float _536 = fma(_388, _524, _526);
        float _538 = fma(_388, _528, _532);
        float _540 = fma(_388, _530, _534);
        _298 = _422;
        _300 = _508;
        _302 = _426;
        _396 = _440;
        _304 = _434;
        _398 = _436;
        _306 = _438;
        _358 = _482;
        _308 = _534;
        _310 = _514;
        _312 = _532;
        _314 = _526;
        _542 = _538;
        _544 = _536;
        _546 = _540;
        _548 = true;
    }
    else
    {
        int _550 = as_type<int>(_208) & 1024;
        bool _552 = _550 != 0;
        if (_552)
        {
            _350 = true;
        }
        bool _554 = _350;
        bool _556 = _554;
        if (!_552)
        {
            int _558 = as_type<int>(_208) & 2048;
            bool _560 = _558 != 0;
            _556 = _560;
        }
        bool _562 = _556;
        if (!_562)
        {
            _296 = _384;
        }
        float _564 = _296;
        _544 = _564;
        if (!_562)
        {
            _392 = _386;
        }
        float _566 = _392;
        _542 = _566;
        if (!_562)
        {
            _394 = _388;
        }
        float _568 = _394;
        bool _570 = !_562;
        _546 = _568;
        if (!_570)
        {
            uint _572 = uint(int(uint(_182) >> uint(2)));
            float _574 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_572)]);
            int _576 = _182 + 4;
            uint _578 = uint(int(uint(_576) >> uint(2)));
            float _580 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_578)]);
            int _582 = _182 + 8;
            uint _584 = uint(int(uint(_582) >> uint(2)));
            float _586 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_584)]);
            uint _588 = uint(int(uint(_182) >> uint(2)));
            float _590 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_588)]);
            int _592 = _182 + 4;
            uint _594 = uint(int(uint(_592) >> uint(2)));
            float _596 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_594)]);
            int _598 = _182 + 8;
            uint _600 = uint(int(uint(_598) >> uint(2)));
            float _602 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_600)]);
            uint _604 = uint(int(uint(_182) >> uint(2)));
            float _606 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_604)]);
            int _608 = _182 + 4;
            uint _610 = uint(int(uint(_608) >> uint(2)));
            float _612 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_610)]);
            int _614 = _182 + 8;
            uint _616 = uint(int(uint(_614) >> uint(2)));
            float _618 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_616)]);
            float _620 = _586 * _590;
            float _622 = _586 * _596;
            float _624 = _580 * _590;
            float _626 = -_620;
            float _628 = fma(_574, _602, _626);
            float _630 = -_622;
            float _632 = fma(_580, _602, _630);
            float _634 = -_624;
            float _636 = fma(_574, _596, _634);
            float _638 = _612 * _574;
            float _640 = _612 * _628;
            float _642 = _618 * _580;
            float _644 = _606 * _596;
            float _646 = -_638;
            float _648 = fma(_606, _580, _646);
            float _650 = -_640;
            float _652 = fma(_606, _632, _650);
            float _654 = _612 * _602;
            float _656 = _618 * _590;
            float _658 = -_644;
            float _660 = fma(_612, _590, _658);
            float _662 = fma(_618, _636, _652);
            float _664 = -_654;
            float _666 = fma(_618, _596, _664);
            float _668 = -_656;
            float _670 = fma(_606, _602, _668);
            float _672 = _606 * _586;
            float _674 = 1.0 / _662;
            float _676 = -_574;
            float _678 = fma(_676, _602, _620);
            float _680 = -_642;
            float _682 = fma(_612, _586, _680);
            float _684 = -_672;
            float _686 = fma(_618, _574, _684);
            float _688 = _666 * _674;
            float _690 = _670 * _674;
            float _692 = _660 * _674;
            float _694 = _384 * _674;
            float _696 = _386 * _688;
            float _698 = _386 * _690;
            float _700 = _386 * _692;
            float _702 = _678 * _674;
            float _704 = _682 * _674;
            float _706 = fma(_632, _694, _696);
            float _708 = _686 * _674;
            float _710 = _648 * _674;
            float _712 = fma(_384, _702, _698);
            float _714 = fma(_636, _694, _700);
            float _716 = fma(_388, _704, _706);
            float _718 = fma(_388, _708, _712);
            float _720 = fma(_388, _710, _714);
            _298 = _574;
            _300 = _688;
            _302 = _586;
            _396 = _620;
            _304 = _606;
            _398 = _612;
            _306 = _618;
            _358 = _662;
            _308 = _714;
            _310 = _694;
            _312 = _712;
            _314 = _706;
            _542 = _718;
            _544 = _716;
            _546 = _720;
        }
    }
    _548 = false;
    float _722 = _298;
    float _724 = _300;
    float _726 = _302;
    float _728 = _396;
    float _730 = _304;
    float _732 = _398;
    float _734 = _306;
    float _736 = _358;
    float _738 = _308;
    float _740 = _310;
    float _742 = _312;
    float _744 = _314;
    float _746 = _542;
    float _748 = _544;
    float _750 = _546;
    uint _752 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_752)] = as_type<uint>(_280);
    float _754 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _756 = as_type<int>(_754) & 512;
    bool _758 = _756 != 0;
    int _760 = as_type<int>(_754) & 1024;
    bool _762 = _760 != 0;
    float _764 = _722;
    float _766 = _724;
    float _768 = _726;
    float _770 = _728;
    float _772 = _746;
    float _774 = _748;
    if (_758)
    {
        float _776 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _778 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _780 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _782 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _764 = _776;
        _766 = _778;
        _768 = _780;
        _770 = _782;
    }
    float _784 = _764;
    float _786 = _766;
    float _788 = _768;
    float _790 = _770;
    float _792 = _730;
    float _794 = _732;
    float _796 = _734;
    float _798 = _736;
    if (_758)
    {
        float _800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _802 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _804 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _806 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _792 = _800;
        _794 = _802;
        _796 = _804;
        _798 = _806;
    }
    float _808 = _792;
    float _810 = _794;
    float _812 = _796;
    float _814 = _798;
    float _816 = _738;
    float _818 = _740;
    float _820 = _742;
    float _822 = _744;
    if (_758)
    {
        float _824 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _826 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _828 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _830 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _816 = _824;
        _818 = _826;
        _820 = _828;
        _822 = _830;
    }
    float _832 = _816;
    float _834 = _818;
    float _836 = _820;
    float _838 = _822;
    float _840 = _380 + _746;
    float _842 = _378 + _748;
    float _844 = _382 + _750;
    float _846 = _840;
    if (!_758)
    {
        _400 = 0.0;
    }
    float _848 = _400;
    float _850 = _848;
    if (!_758)
    {
        _402 = 0.0;
    }
    float _852 = _402;
    float _854 = _852;
    if (!_758)
    {
        _772 = 0.0;
    }
    float _856 = _772;
    int _858 = as_type<int>(_754) & 2048;
    bool _860 = _858 != 0;
    float _862 = _784;
    float _864 = _856;
    if (_758)
    {
        float _866 = _840 * _786;
        _774 = _866;
    }
    float _868 = _774;
    float _870 = _810;
    float _872 = _834;
    float _874 = _832;
    float _876 = _812;
    if (_758)
    {
        float _878 = _840 * _810;
        _870 = _878;
    }
    float _880 = _870;
    float _882 = _880;
    if (_758)
    {
        float _884 = fma(_842, _784, _868);
        _862 = _884;
    }
    float _886 = _862;
    float _888 = _886;
    if (_758)
    {
        float _890 = _840 * _834;
        _872 = _890;
    }
    float _892 = _872;
    if (_758)
    {
        float _894 = fma(_842, _808, _880);
        _882 = _894;
    }
    float _896 = _882;
    if (_758)
    {
        float _898 = fma(_844, _788, _886);
        _888 = _898;
    }
    float _900 = _888;
    if (_758)
    {
        float _902 = fma(_842, _832, _892);
        _874 = _902;
    }
    float _904 = _874;
    float _906 = _904;
    if (_758)
    {
        float _908 = fma(_844, _812, _896);
        _876 = _908;
    }
    float _910 = _876;
    if (_758)
    {
        float _912 = _790 + _900;
        _850 = _912;
    }
    float _914 = _850;
    float _916 = _914;
    if (_758)
    {
        float _918 = fma(_844, _836, _904);
        _906 = _918;
    }
    float _920 = _906;
    if (_758)
    {
        float _922 = _814 + _910;
        _854 = _922;
    }
    float _924 = _854;
    float _926 = _924;
    if (_758)
    {
        float _928 = _838 + _920;
        _864 = _928;
    }
    float _930 = _864;
    bool _932 = !_762;
    float _934 = _930;
    if (!_932)
    {
        float _936 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _938 = uint(int(uint(_182) >> uint(2)));
        float _940 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_938)]);
        int _942 = _182 + 4;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        float _946 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_944)]);
        int _948 = _182 + 8;
        uint _950 = uint(int(uint(_948) >> uint(2)));
        float _952 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_950)]);
        uint _954 = uint(int(uint(_182) >> uint(2)));
        float _956 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_954)]);
        int _958 = _182 + 4;
        uint _960 = uint(int(uint(_958) >> uint(2)));
        float _962 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_960)]);
        int _964 = _182 + 8;
        uint _966 = uint(int(uint(_964) >> uint(2)));
        float _968 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_966)]);
        uint _970 = uint(int(uint(_182) >> uint(2)));
        float _972 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_970)]);
        int _974 = _182 + 4;
        uint _976 = uint(int(uint(_974) >> uint(2)));
        float _978 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_976)]);
        int _980 = _182 + 8;
        uint _982 = uint(int(uint(_980) >> uint(2)));
        float _984 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_982)]);
        float _986 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _988 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _990 = _840 * _946;
        float _992 = _840 * _962;
        float _994 = _840 * _978;
        float _996 = fma(_842, _940, _990);
        float _998 = fma(_842, _956, _992);
        float _1000 = fma(_842, _972, _994);
        float _1002 = fma(_844, _952, _996);
        float _1004 = fma(_844, _968, _998);
        float _1006 = fma(_844, _984, _1000);
        float _1008 = _936 + _1002;
        float _1010 = _986 + _1004;
        float _1012 = _988 + _1006;
        _926 = _1010;
        _916 = _1008;
        _934 = _1012;
    }
    float _1014 = _926;
    float _1016 = _916;
    float _1018 = _934;
    bool _1020 = !_860;
    float _1022 = _1014;
    float _1024 = _1016;
    float _1026 = _1018;
    if (!_1020)
    {
        uint _1028 = uint(int(uint(_182) >> uint(2)));
        float _1030 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1028)]);
        int _1032 = _182 + 4;
        uint _1034 = uint(int(uint(_1032) >> uint(2)));
        float _1036 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1034)]);
        int _1038 = _182 + 8;
        uint _1040 = uint(int(uint(_1038) >> uint(2)));
        float _1042 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1040)]);
        int _1044 = _182 + 12;
        uint _1046 = uint(int(uint(_1044) >> uint(2)));
        float _1048 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1046)]);
        uint _1050 = uint(int(uint(_182) >> uint(2)));
        float _1052 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1050)]);
        int _1054 = _182 + 4;
        uint _1056 = uint(int(uint(_1054) >> uint(2)));
        float _1058 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1056)]);
        int _1060 = _182 + 8;
        uint _1062 = uint(int(uint(_1060) >> uint(2)));
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1062)]);
        int _1066 = _182 + 12;
        uint _1068 = uint(int(uint(_1066) >> uint(2)));
        float _1070 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1068)]);
        uint _1072 = uint(int(uint(_182) >> uint(2)));
        float _1074 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1072)]);
        int _1076 = _182 + 4;
        uint _1078 = uint(int(uint(_1076) >> uint(2)));
        float _1080 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1078)]);
        int _1082 = _182 + 8;
        uint _1084 = uint(int(uint(_1082) >> uint(2)));
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1084)]);
        int _1088 = _182 + 12;
        uint _1090 = uint(int(uint(_1088) >> uint(2)));
        float _1092 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1090)]);
        float _1094 = _840 * _1036;
        float _1096 = _840 * _1058;
        float _1098 = _840 * _1080;
        float _1100 = fma(_842, _1030, _1094);
        float _1102 = fma(_842, _1052, _1096);
        float _1104 = fma(_842, _1074, _1098);
        float _1106 = fma(_844, _1042, _1100);
        float _1108 = fma(_844, _1064, _1102);
        float _1110 = fma(_844, _1086, _1104);
        float _1112 = _1106 + _1048;
        float _1114 = _1108 + _1070;
        float _1116 = _1110 + _1092;
        _1022 = _1114;
        _1024 = _1112;
        _1026 = _1116;
    }
    float _1118 = _1022;
    float _1120 = _1024;
    float _1122 = _1026;
    float _1124 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1126 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1128 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1130 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1132 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1134 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1136 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1138 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1140 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1142 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1144 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1146 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1148 = _1126 * _1118;
    float _1150 = fma(_1124, _1120, _1148);
    float _1152 = fma(_1128, _1122, _1150);
    float _1154 = _1130 + _1152;
    float _1156 = -_1154;
    bool _1158 = _1132 >= _1156;
    bool _1160 = isnan(_1132);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(_1156);
    bool _1166 = _1162 || _1164;
    float _1168 = -_1154;
    bool _1170 = _1134 >= _1168;
    bool _1172 = isnan(_1134);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(_1168);
    bool _1178 = _1174 || _1176;
    int _1180 = _1166 ? 0 : 1;
    int _1182 = 2;
    float _1184 = _1120;
    if (_1166)
    {
        _1182 = 1;
    }
    int _1186 = _1182;
    int _1188 = _1186;
    if (_1178)
    {
        _1188 = _1180;
    }
    int _1190 = _1188;
    int _1192 = _1190 << 6;
    int _1194 = _1192 + 96;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    float _1198 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1196)]);
    int _1200 = _1194 + 4;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    float _1204 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1202)]);
    int _1206 = _1194 + 8;
    uint _1208 = uint(int(uint(_1206) >> uint(2)));
    float _1210 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1208)]);
    int _1212 = _1194 + 12;
    uint _1214 = uint(int(uint(_1212) >> uint(2)));
    float _1216 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1214)]);
    int _1218 = _1192 + 48;
    int _1220 = _1192 + 64;
    uint _1222 = uint(int(uint(_1218) >> uint(2)));
    float _1224 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1222)]);
    int _1226 = _1218 + 4;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    float _1230 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1228)]);
    int _1232 = _1218 + 8;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    float _1236 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1234)]);
    int _1238 = _1218 + 12;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    float _1242 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1240)]);
    uint _1244 = uint(int(uint(_1220) >> uint(2)));
    float _1246 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1244)]);
    int _1248 = _1220 + 4;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    float _1252 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1250)]);
    int _1254 = _1220 + 8;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    float _1258 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1256)]);
    int _1260 = _1220 + 12;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    float _1264 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1262)]);
    int _1266 = _1192 + 80;
    float _1268 = _1136 + 1.0;
    float _1270 = _1268 + _1118;
    uint _1272 = uint(int(uint(_1266) >> uint(2)));
    float _1274 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1272)]);
    int _1276 = _1266 + 4;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    float _1280 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1278)]);
    int _1282 = _1266 + 8;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    float _1286 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1284)]);
    int _1288 = _1266 + 12;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    float _1292 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1290)]);
    float _1294 = _1270 * _1140;
    float _1296 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _1298 = fma(_1138, _1120, _1294);
    float _1300 = fma(_1142, _1122, _1298);
    float _1302 = _1144 + _1300;
    float _1304 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1306 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1308 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1310 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1312 = trunc(_1302);
    int _1314 = int(_1312);
    int _1316 = ~as_type<int>(_1146);
    int _1318 = _1314 + _1316;
    int _1320 = _1318 + 1;
    bool _1322 = _1320 >= 0;
    int _1324 = _1314;
    float _1326 = as_type<float>(_1190);
    if (_1322)
    {
        float _1328 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1324 = as_type<int>(_1328);
    }
    int _1330 = _1324;
    float _1332 = _1270 * _1204;
    float _1334 = fma(_1198, _1120, _1332);
    float _1336 = fma(_1210, _1122, _1334);
    float _1338 = _1216 + _1336;
    float _1340 = _1270 * _1230;
    float _1342 = 1.0 / _1338;
    float _1344 = fma(_1224, _1120, _1340);
    float _1346 = _1270 * _1252;
    float _1348 = fma(_1236, _1122, _1344);
    float _1350 = fma(_1246, _1120, _1346);
    float _1352 = _1242 + _1348;
    float _1354 = fma(_1258, _1122, _1350);
    float _1356 = _1352 * _1342;
    float _1358 = _1264 + _1354;
    bool _1360 = _1356 >= 0.0;
    float _1362 = _1358 * _1342;
    bool _1364 = _1356 <= 1.0;
    bool _1366 = _1364 && _1360;
    bool _1368 = _1362 >= 0.0;
    bool _1370 = _1368 && _1366;
    bool _1372 = _1362 <= 1.0;
    bool _1374 = _1372 && _1370;
    float _1376 = _1270 * _1280;
    float _1378 = fma(_1274, _1120, _1376);
    float _1380 = _1352;
    float _1382 = _1242;
    int _1384 = _1374 ? (-1) : 0;
    if (_1374)
    {
        float _1386 = float(_1190);
        _1326 = _1386;
    }
    float _1388 = _1326;
    float _1390 = fma(_1286, _1122, _1378);
    float _1392 = _1388;
    if (_1374)
    {
        float _1394 = rint(_1388);
        float _1396 = precise::max(_1394, 0.0);
        uint _1398 = uint(_1396);
        uint _1400 = clamp(_1398, 0u, 65535u);
        _1392 = as_type<float>(_1400);
    }
    float _1402 = _1392;
    float _1404 = _1292 + _1390;
    float _1406 = _1404 * _1342;
    float _1408 = _1362;
    if (_1374)
    {
        float3 _10547 = float3(_1356, _1362, float(as_type<int>(_1402)));
        float3 _10551 = select(_10547, float3(0.0), isnan(_10547));
        float _1410 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _10551.xy, uint(rint(_10551.z)), _1406, level(0.0));
        _1408 = _1410;
    }
    float _1412 = _1408;
    float _1414 = _1270 * _1306;
    float _1416 = fma(_1304, _1120, _1414);
    float _1418 = fma(_1308, _1122, _1416);
    float _1420 = _1310 + _1418;
    float _1422 = trunc(_1420);
    int _1424 = int(_1422);
    bool _1426 = _1330 <= _1320;
    bool _1428 = !_1322;
    bool _1430 = _1426 || _1428;
    int _1432 = ~as_type<int>(_1296);
    int _1434 = _1424 + _1432;
    int _1436 = _1434 + 1;
    bool _1438 = _1436 < 0;
    bool _1440 = _1438 || _1430;
    int _1442 = as_type<int>(_1416);
    float _1444 = as_type<float>(_1424);
    if (!_1440)
    {
        float _1446 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1442 = as_type<int>(_1446);
    }
    int _1448 = _1442;
    bool _1450 = _1448 <= _1436;
    bool _1452 = _1450 || _1440;
    if (_1452)
    {
        _1444 = 1.0;
    }
    float _1454 = _1444;
    float _1456 = _1454;
    if (!_1452)
    {
        float _1458 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1460 = _1436 * as_type<int>(_1458);
        int _1462 = _1460 + _1320;
        int _1464 = _1462 << 2;
        uint _1466 = uint(int(uint(_1462) >> uint(2)));
        int _1468 = 12 & _1464;
        int _1470 = int(_1466) << 4;
        int _1472 = _1470 + _1468;
        int _1474 = _1472 + 400;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        float _1478 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1476)]);
        float _1480 = floor(_1420);
        float _1482 = floor(_1302);
        float _1484 = -_1480;
        float _1486 = _1420 + _1484;
        float _1488 = -_1482;
        float _1490 = _1302 + _1488;
        float _1492 = rint(_1478);
        float _1494 = precise::max(_1492, 0.0);
        uint _1496 = uint(_1494);
        uint _1498 = clamp(_1496, 0u, 65535u);
        float3 _10686 = float3(_1490, _1486, float(int(_1498)));
        float3 _10688 = select(_10686, float3(0.0), isnan(_10686));
        float _1500 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _10688.xy, uint(rint(_10688.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _10688.xy, uint(rint(_10688.z)), level(0.0)).x;
        int _1502 = _1462 << 4;
        int _1504 = _1502 + 2048;
        uint _1506 = uint(int(uint(_1504) >> uint(2)));
        float _1508 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1506)]);
        int _1510 = _1504 + 4;
        uint _1512 = uint(int(uint(_1510) >> uint(2)));
        float _1514 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1512)]);
        int _1516 = _1504 + 8;
        uint _1518 = uint(int(uint(_1516) >> uint(2)));
        float _1520 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1518)]);
        int _1522 = _1504 + 12;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        float _1526 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1524)]);
        float _1528 = _1270 * _1514;
        float _1530 = fma(_1508, _1120, _1528);
        float _1532 = fma(_1520, _1122, _1530);
        float _1534 = _1526 + _1532;
        float _1536 = precise::clamp(_1534, 0.0, 1.0);
        float _1538 = -_1536;
        float _1540 = _1538 + _1500;
        float _1542 = fma(_1540, 500.0, 1.5);
        float _1544 = exp2(_1542);
        float _1546 = 0.0 + _1544;
        float _1548 = precise::clamp(_1546, 0.0, 1.0);
        _1184 = 500.0;
        _1456 = _1548;
        _1380 = as_type<float>(_1498);
        _1382 = _1490;
    }
    float _1550 = _1184;
    float _1552 = _1456;
    float _1554 = _1380;
    float _1556 = _1382;
    uint _1558 = uint(int(uint(_182) >> uint(2)));
    float _1560 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1558)]);
    float _1562 = _1550;
    if (!_1374)
    {
        _1562 = 1.0;
    }
    float _1564 = _1562;
    bool _1566 = _324 > 0.001000000047497451305389404296875;
    bool _1568 = isnan(_324);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(0.001000000047497451305389404296875);
    bool _1574 = _1570 || _1572;
    float _1576 = _1564;
    if (_1374)
    {
        bool _1578 = _1412 >= _1406;
        bool _1580 = isnan(_1412);
        bool _1582 = _1578 || _1580;
        bool _1584 = isnan(_1406);
        bool _1586 = _1582 || _1584;
        float _1588 = float(_1586);
        _1576 = _1588;
    }
    float _1590 = _1576;
    float _1592 = -_1590;
    float _1594 = fma(_1592, _1552, 1.0);
    float _1596 = -_1560;
    float _1598 = _1594 + _1596;
    float _1600 = _1594;
    if (_1574)
    {
        float _1602 = fma(_1598, 0.0500000007450580596923828125, _1560);
        _1600 = _1602;
    }
    float _1604 = _1600;
    float _1606 = precise::max(0.0, _1604);
    float _1608 = precise::min(_1606, 0.999000012874603271484375);
    uint _1610 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1610)] = as_type<uint>(_1608);
    float _1612 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    uint _1614 = uint(int(uint(_182) >> uint(2)));
    float _1616 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1614)]);
    int _1618 = _182 + 4;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    float _1622 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1620)]);
    int _1624 = _182 + 8;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    float _1628 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1626)]);
    int _1630 = _182 + 12;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    float _1634 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1632)]);
    float _1636 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _1638 = _99 << 5;
    float _1640 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[82]);
    uint _1642 = uint(int(uint(_1638) >> uint(2)));
    float _1644 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1642)]);
    int _1646 = _1638 + 4;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    float _1650 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1648)]);
    int _1652 = _1638 + 8;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    float _1656 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1654)]);
    int _1658 = _1638 + 12;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    float _1662 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1660)]);
    float _1664 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[80]);
    float _1666 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[79]);
    float _1668 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[2607]);
    int _1670 = as_type<int>(_1612) & 512;
    bool _1672 = _1670 != 0;
    float _1674 = _1412;
    float _1676 = _1406;
    float _1678 = _1554;
    float _1680 = _1556;
    if (_1672)
    {
        float _1682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1674 = _1682;
        _1676 = _1684;
        _1678 = _1686;
        _1680 = _1688;
    }
    float _1690 = _1674;
    float _1692 = _1676;
    float _1694 = _1678;
    float _1696 = _1680;
    float _1698 = 0.0;
    float _1700 = 0.0;
    float _1702 = 0.0;
    float _1704 = 0.0;
    if (_1672)
    {
        float _1706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1698 = _1706;
        _1700 = _1708;
        _1702 = _1710;
        _1704 = _1712;
    }
    float _1714 = _1698;
    float _1716 = _1700;
    float _1718 = _1702;
    float _1720 = _1704;
    float _1722 = 0.0;
    float _1724 = 0.0;
    float _1726 = 0.0;
    float _1728 = 0.0;
    if (_1672)
    {
        float _1730 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1732 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1734 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1722 = _1730;
        _1724 = _1732;
        _1726 = _1734;
        _1728 = _1736;
    }
    float _1738 = _1722;
    float _1740 = _1724;
    float _1742 = _1726;
    float _1744 = _1728;
    float _1746 = -_1636;
    float _1748 = _1622 + _1746;
    int _1750 = as_type<int>(_1612) & 1024;
    bool _1752 = _1750 != 0;
    int _1754 = _1638 + 16;
    uint _1756 = uint(int(uint(_182) >> uint(2)));
    float _1758 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1756)]);
    int _1760 = _182 + 4;
    uint _1762 = uint(int(uint(_1760) >> uint(2)));
    float _1764 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1762)]);
    int _1766 = _182 + 8;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    float _1770 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1768)]);
    int _1772 = _182 + 12;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    float _1776 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1774)]);
    float _1778 = precise::max(0.0, _1640);
    uint _1780 = uint(int(uint(_1754) >> uint(2)));
    float _1782 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1780)]);
    int _1784 = _1754 + 4;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    float _1788 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1786)]);
    int _1790 = _1754 + 8;
    uint _1792 = uint(int(uint(_1790) >> uint(2)));
    float _1794 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1792)]);
    int _1796 = _1754 + 12;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    float _1800 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1798)]);
    float _1802 = 0.0;
    float _1804 = _1634;
    int _1806 = as_type<int>(_1622);
    float _1808 = _1644;
    float _1810 = _1650;
    float _1812 = _1656;
    float _1814 = _1662;
    float _1816 = _1628;
    float _1818 = as_type<float>(_1750);
    if (!_1672)
    {
        _1802 = 0.0;
    }
    float _1820 = _1802;
    uint _1822 = uint(int(uint(_182) >> uint(2)));
    float _1824 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1822)]);
    float _1826 = _1820;
    if (!_1672)
    {
        _1804 = 0.0;
    }
    float _1828 = _1804;
    int _1830 = _182 + 8;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    float _1834 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1832)]);
    bool _1836 = _1778 != 0.0;
    bool _1838 = isnan(_1778);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan(0.0);
    bool _1844 = _1840 || _1842;
    uint _1846 = uint(int(uint(_182) >> uint(2)));
    float _1848 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1846)]);
    int _1850 = _182 + 4;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    float _1854 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1852)]);
    int _1856 = _182 + 8;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    float _1860 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1858)]);
    int _1862 = _182 + 12;
    uint _1864 = uint(int(uint(_1862) >> uint(2)));
    float _1866 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1864)]);
    float _1868 = _1692;
    float _1870 = _1716;
    float _1872 = _1740;
    float _1874 = _1694;
    float _1876 = _1718;
    float _1878 = _1742;
    float _1880 = _1738;
    float _1882 = _1828;
    float _1884 = _1744;
    float _1886 = _1714;
    float _1888 = _1720;
    if (_1672)
    {
        float _1890 = _1748 * _1692;
        _1868 = _1890;
    }
    float _1892 = _1868;
    float _1894 = _1892;
    if (_1672)
    {
        float _1896 = _1748 * _1716;
        _1870 = _1896;
    }
    float _1898 = _1870;
    float _1900 = _1898;
    if (_1672)
    {
        float _1902 = fma(_1616, _1690, _1892);
        _1894 = _1902;
    }
    float _1904 = _1894;
    if (_1672)
    {
        float _1906 = _1748 * _1740;
        _1872 = _1906;
    }
    float _1908 = _1872;
    float _1910 = _1908;
    if (_1672)
    {
        float _1912 = fma(_1616, _1714, _1898);
        _1900 = _1912;
    }
    float _1914 = _1900;
    float _1916 = _1914;
    if (_1672)
    {
        float _1918 = fma(_1616, _1738, _1908);
        _1910 = _1918;
    }
    float _1920 = _1910;
    float _1922 = _1920;
    if (_1672)
    {
        float _1924 = fma(_1628, _1694, _1904);
        _1874 = _1924;
    }
    float _1926 = _1874;
    if (_1672)
    {
        float _1928 = fma(_1628, _1718, _1914);
        _1876 = _1928;
    }
    float _1930 = _1876;
    float _1932 = _1930;
    if (_1672)
    {
        float _1934 = fma(_1628, _1742, _1920);
        _1878 = _1934;
    }
    float _1936 = _1878;
    float _1938 = _1936;
    if (!_1672)
    {
        _1880 = 0.0;
    }
    float _1940 = _1880;
    float _1942 = _1940;
    if (_1672)
    {
        float _1944 = _1696 + _1926;
        _1942 = _1944;
    }
    float _1946 = _1942;
    float _1948 = _1946;
    if (_1672)
    {
        float _1950 = _1720 + _1930;
        _1826 = _1950;
    }
    float _1952 = _1826;
    int _1954 = as_type<int>(_1612) & 2048;
    bool _1956 = _1954 != 0;
    float _1958 = _1952;
    float _1960 = as_type<float>(_1954);
    if (_1672)
    {
        float _1962 = _1744 + _1936;
        _1882 = _1962;
    }
    float _1964 = _1882;
    float _1966 = _1644 + _1650;
    bool _1968 = !_1752;
    float _1970 = _1964;
    int _1972 = as_type<int>(_1776);
    float _1974 = _1966;
    float _1976 = _1782;
    float _1978 = _1788;
    float _1980 = _1794;
    float _1982 = _1800;
    float _1984 = _1824;
    float _1986 = _1834;
    float _1988 = _1668;
    float _1990 = _1668;
    if (!_1968)
    {
        float _1992 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1994 = uint(int(uint(_182) >> uint(2)));
        float _1996 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1994)]);
        int _1998 = _182 + 4;
        uint _2000 = uint(int(uint(_1998) >> uint(2)));
        float _2002 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2000)]);
        int _2004 = _182 + 8;
        uint _2006 = uint(int(uint(_2004) >> uint(2)));
        float _2008 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2006)]);
        int _2010 = _182 + 12;
        uint _2012 = uint(int(uint(_2010) >> uint(2)));
        float _2014 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2012)]);
        uint _2016 = uint(int(uint(_182) >> uint(2)));
        float _2018 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2016)]);
        int _2020 = _182 + 4;
        uint _2022 = uint(int(uint(_2020) >> uint(2)));
        float _2024 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2022)]);
        int _2026 = _182 + 8;
        uint _2028 = uint(int(uint(_2026) >> uint(2)));
        float _2030 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2028)]);
        int _2032 = _182 + 12;
        uint _2034 = uint(int(uint(_2032) >> uint(2)));
        float _2036 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2034)]);
        uint _2038 = uint(int(uint(_182) >> uint(2)));
        float _2040 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2038)]);
        int _2042 = _182 + 4;
        uint _2044 = uint(int(uint(_2042) >> uint(2)));
        float _2046 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2044)]);
        int _2048 = _182 + 8;
        uint _2050 = uint(int(uint(_2048) >> uint(2)));
        float _2052 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2050)]);
        float _2054 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2056 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2058 = _1748 * _2002;
        float _2060 = _1748 * _2024;
        float _2062 = _1748 * _2046;
        float _2064 = fma(_1616, _1996, _2058);
        float _2066 = fma(_1616, _2018, _2060);
        float _2068 = fma(_1616, _2040, _2062);
        float _2070 = fma(_1628, _2008, _2064);
        float _2072 = fma(_1628, _2030, _2066);
        float _2074 = fma(_1628, _2052, _2068);
        float _2076 = _1992 + _2070;
        float _2078 = _2054 + _2072;
        float _2080 = _2056 + _2074;
        _1948 = _2078;
        _1922 = _2064;
        _1938 = _2070;
        _1884 = _2014;
        _1886 = _2018;
        _1916 = _2066;
        _1932 = _2072;
        _1888 = _2036;
        _1958 = _2076;
        _1970 = _2080;
    }
    float _2082 = _1948;
    float _2084 = _1922;
    float _2086 = _1938;
    float _2088 = _1884;
    float _2090 = _1886;
    float _2092 = _1916;
    float _2094 = _1932;
    float _2096 = _1888;
    float _2098 = _1958;
    float _2100 = _1970;
    bool _2102 = !_1956;
    float _2104 = _2086;
    float _2106 = _2090;
    float _2108 = _2098;
    float _2110 = _2100;
    float _2112 = _2084;
    float _2114 = _2092;
    float _2116 = _2082;
    float _2118 = _2094;
    float _2120 = _2088;
    float _2122 = _2096;
    if (!_2102)
    {
        uint _2124 = uint(int(uint(_182) >> uint(2)));
        float _2126 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2124)]);
        int _2128 = _182 + 4;
        uint _2130 = uint(int(uint(_2128) >> uint(2)));
        float _2132 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2130)]);
        int _2134 = _182 + 8;
        uint _2136 = uint(int(uint(_2134) >> uint(2)));
        float _2138 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2136)]);
        int _2140 = _182 + 12;
        uint _2142 = uint(int(uint(_2140) >> uint(2)));
        float _2144 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2142)]);
        uint _2146 = uint(int(uint(_182) >> uint(2)));
        float _2148 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2146)]);
        int _2150 = _182 + 4;
        uint _2152 = uint(int(uint(_2150) >> uint(2)));
        float _2154 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2152)]);
        int _2156 = _182 + 8;
        uint _2158 = uint(int(uint(_2156) >> uint(2)));
        float _2160 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2158)]);
        int _2162 = _182 + 12;
        uint _2164 = uint(int(uint(_2162) >> uint(2)));
        float _2166 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2164)]);
        uint _2168 = uint(int(uint(_182) >> uint(2)));
        float _2170 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2168)]);
        int _2172 = _182 + 4;
        uint _2174 = uint(int(uint(_2172) >> uint(2)));
        float _2176 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2174)]);
        int _2178 = _182 + 8;
        uint _2180 = uint(int(uint(_2178) >> uint(2)));
        float _2182 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2180)]);
        int _2184 = _182 + 12;
        uint _2186 = uint(int(uint(_2184) >> uint(2)));
        float _2188 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2186)]);
        float _2190 = _1748 * _2132;
        float _2192 = _1748 * _2154;
        float _2194 = _1748 * _2176;
        float _2196 = fma(_1616, _2126, _2190);
        float _2198 = fma(_1616, _2148, _2192);
        float _2200 = fma(_1616, _2170, _2194);
        float _2202 = fma(_1628, _2138, _2196);
        float _2204 = fma(_1628, _2160, _2198);
        float _2206 = fma(_1628, _2182, _2200);
        float _2208 = _2202 + _2144;
        float _2210 = _2204 + _2166;
        float _2212 = _2206 + _2188;
        _2104 = _2202;
        _2106 = _2148;
        _2108 = _2208;
        _2110 = _2212;
        _2112 = _2196;
        _2114 = _2198;
        _2116 = _2210;
        _2118 = _2204;
        _2120 = _2144;
        _2122 = _2166;
    }
    float _2214 = _2104;
    float _2216 = _2106;
    float _2218 = _2108;
    float _2220 = _2110;
    float _2222 = _2112;
    float _2224 = _2114;
    float _2226 = _2116;
    float _2228 = _2118;
    float _2230 = _2120;
    float _2232 = _2122;
    float _2234 = _1656 + _1966;
    float _2236 = _2218;
    float _2238 = _2220;
    float _2240 = _2218;
    float _2242 = _2220;
    float _2244 = _2222;
    float _2246 = _2216;
    float _2248 = _2214;
    float _2250 = _2230;
    float _2252 = _2234;
    float _2254 = _2226;
    float _2256 = _2226;
    float _2258 = _2224;
    float _2260 = _2228;
    float _2262 = _2232;
    if (!_1844)
    {
        _1384 = 0;
    }
    int _2264 = _1384;
    int _2266 = _2264;
    if (!_1844)
    {
        _1972 = as_type<int>(_1758);
    }
    int _2268 = _1972;
    float _2270 = -_1662;
    bool _2272 = _2234 != _2270;
    bool _2274 = isnan(_2234);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan(_2270);
    bool _2280 = _2276 || _2278;
    int _2282 = 0;
    bool _2284 = _2280;
    int _2286 = _2268;
    if (!_1844)
    {
        _2282 = as_type<int>(_1764);
    }
    int _2288 = _2282;
    int _2290 = _2280 ? 0 : 1;
    int _2292 = _2288;
    int _2294 = _2290;
    int _2296 = _2290;
    int _2298 = _2288;
    if (!_1844)
    {
        _1806 = as_type<int>(_1770);
    }
    int _2300 = _1806;
    bool _2302 = !_1844;
    int _2304 = _2300;
    if (!_2302)
    {
        uint _2306 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _2308 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2306)]);
        int _2310 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
        uint _2312 = uint(int(uint(_2310) >> uint(2)));
        float _2314 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2312)]);
        int _2316 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
        uint _2318 = uint(int(uint(_2316) >> uint(2)));
        float _2320 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2318)]);
        int _2322 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
        uint _2324 = uint(int(uint(_2322) >> uint(2)));
        float _2326 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2324)]);
        float _2328 = _1778 * 0.5;
        float _2330 = 1.0 / _1778;
        float _2332 = -_2314;
        float _2334 = fma(_2328, _2332, _2308);
        float _2336 = -_2328;
        float _2338 = _2336 + _2334;
        float _2340 = -_2326;
        float _2342 = fma(_2328, _2340, _2320);
        float _2344 = -_2338;
        float _2346 = _2344 + _2218;
        float _2348 = -_2328;
        float _2350 = _2348 + _2342;
        float _2352 = _2346 * _2330;
        float _2354 = -_2350;
        float _2356 = _2354 + _2220;
        float _2358 = floor(_2352);
        float _2360 = _2356 * _2330;
        float _2362 = floor(_2360);
        float _2364 = -_2358;
        float _2366 = fma(_1778, _2364, _2346);
        bool _2368 = _2366 != _2346;
        bool _2370 = isnan(_2366);
        bool _2372 = _2368 || _2370;
        bool _2374 = isnan(_2346);
        bool _2376 = _2372 || _2374;
        float _2378 = -_2362;
        float _2380 = fma(_1778, _2378, _2356);
        bool _2382 = _2380 == _2356;
        bool _2384 = !_2376;
        bool _2386 = _2382 && _2384;
        bool _2388 = !_2386;
        int _2390 = as_type<int>(_2356);
        int _2392 = as_type<int>(_2358);
        _2244 = _2360;
        _1974 = _2346;
        _2266 = _2388 ? (-1) : 0;
        _2246 = _2380;
        _2248 = _2350;
        _2250 = _2366;
        _2284 = _2386;
        _2252 = _2338;
        if (_2386)
        {
            _2390 = as_type<int>(_1758);
        }
        int _2394 = _2390;
        int _2396 = _2394;
        if (!_2386)
        {
            float _2398 = _2338 + _2366;
            _2236 = _2398;
        }
        float _2400 = _2236;
        _2240 = _2400;
        if (_2386)
        {
            _2292 = as_type<int>(_1764);
        }
        int _2402 = _2292;
        int _2404 = _2402;
        if (!_2386)
        {
            float _2406 = _2350 + _2380;
            _2238 = _2406;
        }
        float _2408 = _2238;
        _2242 = _2408;
        if (_2386)
        {
            _2392 = as_type<int>(_1770);
        }
        int _2410 = _2392;
        _2304 = _2410;
        if (!_2386)
        {
            _2294 = 1;
        }
        int _2412 = _2294;
        _2296 = _2412;
        if (!_2386)
        {
            _2396 = 0;
        }
        int _2414 = _2396;
        _2286 = _2414;
        if (!_2386)
        {
            _2404 = 0;
        }
        int _2416 = _2404;
        _2298 = _2416;
        if (!_2386)
        {
            _2304 = 0;
        }
    }
    int _2418 = _2296;
    float _2420 = _2240;
    float _2422 = _2242;
    float _2424 = _2244;
    float _2426 = _1974;
    int _2428 = _2266;
    float _2430 = _2246;
    float _2432 = _2248;
    float _2434 = _2250;
    bool _2436 = _2284;
    float _2438 = _2252;
    int _2440 = _2286;
    int _2442 = _2298;
    int _2444 = _2304;
    int _2446 = _2418 & 1;
    bool _2448 = _2446 != 0;
    float _2450 = _1664 * 0.5;
    float _2452 = -_1636;
    float _2454 = _840 + _2452;
    float _2456 = precise::max(_2450, 0.001000000047497451305389404296875);
    float _2458 = precise::min(_2456, 10000.0);
    float _2460 = _2438;
    float _2462 = _2426;
    bool _2464 = _2436;
    float _2466 = _2450;
    float _2468 = _2424;
    float _2470 = _2432;
    float _2472 = _2434;
    float _2474 = _2430;
    float _2476 = as_type<float>(_2440);
    float _2478 = as_type<float>(_2444);
    if (!_2448)
    {
        _2460 = _1644;
    }
    float _2480 = _2460;
    float _2482 = _2480;
    if (!_2448)
    {
        _2462 = _1650;
    }
    float _2484 = _2462;
    float _2486 = _2484;
    if (!_2448)
    {
        _1808 = _1656;
    }
    float _2488 = _1808;
    float _2490 = _2488;
    if (!_2448)
    {
        _1810 = _1662;
    }
    float _2492 = _1810;
    float _2494 = _2492;
    if (!_2448)
    {
        _1812 = _1782;
    }
    float _2496 = _1812;
    float _2498 = _2496;
    if (!_2448)
    {
        _2464 = false;
    }
    bool _2500 = _2464;
    bool _2502 = _2500;
    if (!_2448)
    {
        _1814 = _1788;
    }
    float _2504 = _1814;
    float _2506 = _2504;
    if (!_2448)
    {
        _846 = _1794;
    }
    float _2508 = _846;
    float _2510 = _2508;
    if (!_2448)
    {
        _2466 = _1800;
    }
    float _2512 = _2466;
    int _2514 = 0;
    float _2516 = _2512;
    if (!_2448)
    {
        _2514 = as_type<int>(_1616);
    }
    int _2518 = _2514;
    int _2520 = 0;
    int _2522 = _2518;
    int _2524 = _2518;
    if (!_2448)
    {
        _2520 = as_type<int>(_1748);
    }
    int _2526 = _2520;
    int _2528 = 0;
    int _2530 = _2526;
    if (!_2448)
    {
        _2528 = as_type<int>(_1628);
    }
    int _2532 = _2528;
    bool _2534 = !_2448;
    int _2536 = _2532;
    int _2538 = _2532;
    float _2540 = 0.0;
    float _2542 = 0.0;
    if (!_2534)
    {
        float _2544 = fma(_2420, 6.2500002968590706586837768554688e-05, 0.5);
        float _2546 = fma(_2422, 6.2500002968590706586837768554688e-05, 0.5);
        float _2548 = fma(_2420, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2550 = fma(_2422, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2552 = fma(_2422, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _12162 = float2(_2544, _2546);
        float2 _2556 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12162, float2(0.0), isnan(_12162)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12162, float2(0.0), isnan(_12162)), level(0.0)).xy;
        float _2558 = _2556.x;
        float _2560 = _2556.y;
        float _2562 = fma(_2420, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float _2564 = fma(_2420, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _2566 = fma(_2422, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float2 _12183 = float2(_2548, _2550);
        float _2568 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12183, float2(0.0), isnan(_12183)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12183, float2(0.0), isnan(_12183)), level(0.0)).x;
        float2 _12191 = float2(_2548, _2552);
        float _2570 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12191, float2(0.0), isnan(_12191)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12191, float2(0.0), isnan(_12191)), level(0.0)).x;
        float2 _12199 = float2(_2562, _2550);
        float _2572 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12199, float2(0.0), isnan(_12199)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12199, float2(0.0), isnan(_12199)), level(0.0)).x;
        float2 _12207 = float2(_2564, _2546);
        float2 _2574 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12207, float2(0.0), isnan(_12207)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12207, float2(0.0), isnan(_12207)), level(0.0)).xy;
        float _2576 = _2574.x;
        float _2578 = _2574.y;
        float2 _12219 = float2(_2544, _2566);
        float2 _2580 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12219, float2(0.0), isnan(_12219)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12219, float2(0.0), isnan(_12219)), level(0.0)).xy;
        float _2582 = _2580.x;
        float _2584 = _2580.y;
        float2 _12231 = float2(_2562, _2552);
        float _2586 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12231, float2(0.0), isnan(_12231)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12231, float2(0.0), isnan(_12231)), level(0.0)).x;
        float _2588 = -_2560;
        float _2590 = _2558 + _2588;
        float _2592 = _2590 * 2000.0;
        float _2594 = abs(_2592);
        bool _2596 = _2594 >= 2.0;
        bool _2598 = isnan(_2594);
        bool _2600 = _2596 || _2598;
        bool _2602 = isnan(2.0);
        bool _2604 = _2600 || _2602;
        float _2606 = _2592;
        float _2608 = _2550;
        float _2610 = _2546;
        if (_2604)
        {
            int _2612 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 4;
            uint _2614 = uint(int(uint(_2612) >> uint(2)));
            float _2616 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2614)]);
            _2606 = _2616;
        }
        float _2618 = _2606;
        float _2620 = -_2558;
        float _2622 = _2620 + _2568;
        float _2624 = -_2558;
        float _2626 = _2624 + _2570;
        float _2628 = _2622 * 2000.0;
        float _2630 = _2626 * 2000.0;
        float _2632 = -_2558;
        float _2634 = _2632 + _2576;
        float _2636 = -_2558;
        float _2638 = _2636 + _2572;
        float _2640 = abs(_2628);
        float _2642 = abs(_2630);
        float _2644 = precise::max(_2640, _2642);
        float _2646 = _2558 * 2000.0;
        float _2648 = -_2558;
        float _2650 = _2648 + _2582;
        float _2652 = _2634 * 1000.0;
        float _2654 = _2638 * 2000.0;
        float _2656 = _2618;
        float _2658 = _2646;
        float _2660 = _2626;
        float _2662 = _2654;
        if (_2604)
        {
            float _2664 = _2646 + (-2.0);
            _2608 = _2664;
        }
        float _2666 = _2608;
        float _2668 = _2650 * 1000.0;
        float _2670 = -_2558;
        float _2672 = _2670 + _2586;
        float _2674 = abs(_2654);
        float _2676 = precise::max(_2644, _2674);
        float _2678 = _2672 * 2000.0;
        float _2680 = abs(_2678);
        float _2682 = precise::max(_2676, _2680);
        float _2684 = _2668;
        _2258 = _2678;
        if (_2604)
        {
            float _2686 = _2618 + 10.0;
            _2656 = _2686;
        }
        float _2688 = _2656;
        bool _2690 = _2688 < _2666;
        bool _2692 = !_2604;
        bool _2694 = _2690 || _2692;
        float _2696 = fma(_2652, _2652, 0.0625);
        float _2698 = fma(_2668, _2668, _2696);
        float _2700 = rsqrt(_2698);
        float _2702 = _2700 * 0.25;
        float _2704 = _2652 * _2700;
        float _2706 = _2668 * _2700;
        bool _2708 = _2702 < 0.891006529331207275390625;
        bool _2710 = _2708 || _2694;
        bool _2712 = _2682 >= 2.0;
        bool _2714 = isnan(_2682);
        bool _2716 = _2712 || _2714;
        bool _2718 = isnan(2.0);
        bool _2720 = _2716 || _2718;
        bool _2722 = _2720 || _2710;
        bool _2724 = !_2722;
        float _2726 = _2702;
        float _2728 = _2706;
        float _2730 = _2704;
        float _2762;
        float _2764;
        float _2766;
        float _2768;
        if (!_2724)
        {
            float _2732 = -_2560;
            float _2734 = _2732 + _2578;
            float _2736 = -_2560;
            float _2738 = _2736 + _2584;
            float _2740 = _2560 * 2000.0;
            float _2742 = _2734 * 1000.0;
            float _2744 = _2738 * 1000.0;
            float _2746 = fma(_2742, _2742, 0.0625);
            float _2748 = fma(_2744, _2744, _2746);
            float _2750 = rsqrt(_2748);
            float _2752 = -_2744;
            float _2754 = fma(_2752, _2750, -0.0);
            float _2756 = -_2742;
            float _2758 = fma(_2756, _2750, -0.0);
            float _2760 = _2750 * 0.25;
            _2762 = _2740;
            _2764 = _2758;
            _2766 = _2754;
            _2768 = _2760;
            _2770 = true;
        }
        else
        {
            float _2772 = _2706 * _2706;
            float _2774 = 1.0 / _2702;
            float _2776 = -_2704;
            float _2778 = (-0.0) + _2776;
            float _2780 = fma(_2704, _2704, _2772);
            float _2782 = -_2706;
            float _2784 = (-0.0) + _2782;
            float _2786 = sqrt(_2780);
            bool _2788 = _2786 > 9.9999997473787516355514526367188e-05;
            float _2790 = _2786 * _2774;
            float _2792 = _2772;
            _2764 = _2778;
            _2766 = _2784;
            _2768 = _2702;
            if (_2788)
            {
                float _2794 = abs(_2704);
                float _2796 = abs(_2706);
                float _2798 = precise::max(_2794, _2796);
                _2684 = _2798;
            }
            float _2800 = _2684;
            if (!_2788)
            {
                _2792 = 0.0;
            }
            float _2802 = _2792;
            float _2804 = _2800;
            float _2806 = _2802;
            if (_2788)
            {
                float _2808 = 1.0 / _2800;
                _2804 = _2808;
            }
            float _2810 = _2804;
            if (_2788)
            {
                float _2812 = _2786 * _2810;
                _2806 = _2812;
            }
            float _2814 = _2806;
            float _2816 = _2814 * 0.9649016857147216796875;
            float _2818 = -_2816;
            float _2820 = fma(_2818, _2790, _2646);
            _2762 = _2820;
        }
        _2770 = false;
        float _2822 = _2762;
        float _2824 = _2764;
        float _2826 = _2766;
        float _2828 = _2768;
        float2 _12541 = float2(_2544, _2546);
        float _2830 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12541, float2(0.0), isnan(_12541)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12541, float2(0.0), isnan(_12541)), level(0.0)).y;
        float _2832 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[81]);
        bool _2834 = _2226 >= _2822;
        int _2836 = (_2834 ? (-1) : 0) | _2428;
        float _2838 = 0.0 + _2832;
        float _2840 = precise::clamp(_2838, 0.0, 1.0);
        bool _2842 = _1866 >= _2840;
        int _2844 = (_2842 ? (-1) : 0) & _2836;
        int _2846 = ~_2844;
        float _2848 = _2822;
        float _2850 = _2822;
        _2262 = _2830;
        float _2912;
        float _2914;
        float _2916;
        float _2918;
        float _2920;
        float _2922;
        float _2924;
        float _2926;
        float _2928;
        bool _2930;
        float _2932;
        float _2934;
        float _2936;
        if (!(_2846 != 0))
        {
            float _2852 = _1854 * 6.283185482025146484375;
            float _2854 = _1848 * 6.283185482025146484375;
            float _2856 = _1860 * 6.283185482025146484375;
            if (_2428 != 0)
            {
                float _2858 = fma(_1854, _1778, _2822);
                _2254 = _2858;
            }
            float _2860 = _2254;
            float _2862 = _2852 * _2852;
            float _2864 = fma(_2854, _2854, _2862);
            float _2866 = fma(_2856, _2856, _2864);
            float _2868 = sqrt(_2866);
            float _2870 = rsqrt(_2866);
            float _2872 = _2868 * 0.5;
            bool _2874 = _2868 != 0.0;
            bool _2876 = isnan(_2868);
            bool _2878 = _2874 || _2876;
            bool _2880 = isnan(0.0);
            bool _2882 = _2878 || _2880;
            float _2884 = _2872 * 0.15915493667125701904296875;
            float _2886 = _2884 * 6.283185482025146484375;
            float _2888 = sin(_2886);
            float _2890 = _2854 * _2870;
            float _2892 = _2852 * _2870;
            float _2894 = _2856 * _2870;
            float _2896 = _2882 ? _2890 : 0.0;
            float _2898 = _2884 * 6.283185482025146484375;
            float _2900 = cos(_2898);
            float _2902 = _2882 ? _2892 : 0.0;
            float _2904 = _2882 ? _2894 : 0.0;
            float _2906 = _2896 * _2888;
            float _2908 = _2902 * _2888;
            float _2910 = _2904 * _2888;
            _2912 = _2904;
            _2914 = _2866;
            _2916 = _2884;
            _2918 = _2888;
            _2920 = _2860;
            _2922 = _2860;
            _2924 = _2906;
            _2926 = _2910;
            _2928 = _2900;
            _2930 = _2882;
            _2932 = _2908;
            _2934 = _2868;
            _2936 = 0.0;
            _2938 = true;
        }
        else
        {
            float _2940 = _2824 * _2824;
            float _2942 = fma(_2826, _2826, _2940);
            float _2944 = sqrt(_2942);
            float _2946 = precise::max(_2944, -1.0);
            float _2948 = precise::min(_2946, 1.0);
            float _2950 = abs(_2948);
            float _2952 = fma(_2950, -0.5, 0.5);
            int _2954 = as_type<int>(_2952) + (-218103808);
            bool _2956 = uint(_2954) >= 1920991232u;
            bool _2958 = !_2956;
            int _2980;
            if (!_2958)
            {
                int _2960 = 1056964608;
                int _2962 = as_type<int>(_2700);
                int _2964 = as_type<int>(_2952);
                int _2966 = 10496;
                int _2968;
                int _2970;
                int _2972;
                int _2974;
                int _2976;
                int _2978;
                _87(_2960, _2962, _2964, _2966, _2968, _2970, _2972, _2974, _2976, _2978);
                _2980 = _2972;
                _2982 = true;
            }
            else
            {
                float _2984 = rsqrt(_2952);
                float _2986 = _2952 * _2984;
                float _2988 = _2984 * 0.5;
                float _2990 = -_2986;
                float _2992 = 0.0 + _2990;
                float _2994 = fma(_2988, _2992, 0.5);
                float _2996 = fma(_2986, _2994, _2986);
                float _2998 = -_2996;
                float _3000 = 0.0 + _2998;
                float _3002 = fma(_2996, _3000, _2952);
                float _3004 = fma(_2988, _3002, _2996);
                _2980 = as_type<int>(_3004);
            }
            _2982 = false;
            int _3006 = _2980;
            float _3008 = abs(_2948);
            bool _3010 = _3008 > 0.569999992847442626953125;
            float _3012 = _2944 + 9.9999997473787516355514526367188e-06;
            float _3014 = _1860 * 6.283185482025146484375;
            float _3016 = abs(_2948);
            float _3018 = _3010 ? as_type<float>(_3006) : _3016;
            float _3020 = -_2822;
            float _3022 = fma(_2830, 2000.0, _3020);
            float _3024 = 1.0 / _3012;
            float _3026 = _3014 * _2828;
            float _3028 = _3018 * _3018;
            float _3030 = _3014 * _2824;
            float _3032 = _3014 * _2826;
            float _3034 = _3026 * _3026;
            float _3036 = fma(_3028, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
            float _3038 = fma(_3030, _3030, _3034);
            float _3040 = fma(_3028, _3036, 0.0467568598687648773193359375);
            float _3042 = fma(_3032, _3032, _3038);
            float _3044 = fma(_3028, _3040, 0.074846573173999786376953125);
            float _3046 = _3024 * _2824;
            float _3048 = sqrt(_3042);
            float _3050 = fma(_3028, _3044, 0.166670143604278564453125);
            float _3052 = _3028 * _3050;
            float _3054 = rsqrt(_3042);
            float _3056 = fma(_3018, _3052, _3018);
            float _3058 = _3056;
            _2728 = _3022;
            if (_3010)
            {
                float _3060 = fma(_3056, -2.0, 1.57079637050628662109375);
                _3058 = _3060;
            }
            float _3062 = _3058;
            bool _3064 = _2948 >= 0.0;
            bool _3066 = isnan(_2948);
            bool _3068 = _3064 || _3066;
            bool _3070 = isnan(0.0);
            bool _3072 = _3068 || _3070;
            float _3074 = -_2826;
            float _3076 = _3024 * _3074;
            float _3078 = _3048 * 0.5;
            bool _3080 = _3048 != 0.0;
            bool _3082 = isnan(_3048);
            bool _3084 = _3080 || _3082;
            bool _3086 = isnan(0.0);
            bool _3088 = _3084 || _3086;
            bool _3090 = !_3072;
            float _3092 = -_3062;
            float _3094 = _3090 ? _3092 : _3062;
            float _3096 = _3078 * 0.15915493667125701904296875;
            float _3098 = abs(_3022);
            bool _3100 = _3098 >= 2.0;
            bool _3102 = isnan(_3098);
            bool _3104 = _3100 || _3102;
            bool _3106 = isnan(2.0);
            bool _3108 = _3104 || _3106;
            float _3110 = _3094 * _3046;
            float _3112 = _3094 * _3076;
            float _3114 = _3096 * 6.283185482025146484375;
            float _3116 = sin(_3114);
            float _3118 = _3030 * _3054;
            float _3120 = _3110 * _3110;
            float _3122 = _3032 * _3054;
            float _3124 = _3026 * _3054;
            bool _3126 = _2828 <= 0.891006529331207275390625;
            bool _3128 = !_3108;
            bool _3130 = _3126 || _3128;
            float _3132 = fma(_3112, _3112, _3120);
            float _3134 = _3088 ? _3118 : 0.0;
            float _3136 = _3096 * 6.283185482025146484375;
            float _3138 = cos(_3136);
            float _3140 = _3088 ? _3122 : 0.0;
            float _3142 = _3088 ? _3124 : 0.0;
            float _3144 = sqrt(_3132);
            float _3146 = _3134 * _3116;
            _2658 = _3138;
            _2660 = _3054;
            _2610 = _3096;
            _2662 = _3048;
            _2930 = _3130;
            if (_3130)
            {
                float _3148 = _2822 + (-1000.0);
                _2848 = _3148;
            }
            float _3150 = _2848;
            float _3152 = rsqrt(_3132);
            float _3154 = _3144 * 0.5;
            bool _3156 = _3144 != 0.0;
            bool _3158 = isnan(_3144);
            bool _3160 = _3156 || _3158;
            bool _3162 = isnan(0.0);
            bool _3164 = _3160 || _3162;
            float _3166 = _3140 * _3116;
            float _3168 = _3142 * _3116;
            float _3170 = _3154 * 0.15915493667125701904296875;
            float _3172 = _3170 * 6.283185482025146484375;
            float _3174 = sin(_3172);
            float _3176 = _3112 * _3152;
            float _3178 = _3110 * _3152;
            float _3180 = _3164 ? _3176 : 0.0;
            float _3182 = _3170 * 6.283185482025146484375;
            float _3184 = cos(_3182);
            float _3186 = _3164 ? _3178 : 0.0;
            float _3188 = _3180 * _3174;
            float _3190 = _3186 * _3174;
            float _3192 = _3190 * _3146;
            float _3194 = _3190 * _3166;
            float _3196 = _3184 * _3146;
            float _3198 = _3184 * _3166;
            float _3200 = fma(_3188, _3146, _3194);
            float _3202 = fma(_3188, _3138, _3196);
            float _3204 = fma(_3190, _3138, _3198);
            float _3206 = fma(_3190, _3168, _3202);
            float _3208 = -_3192;
            float _3210 = fma(_3188, _3166, _3208);
            float _3212 = -_3188;
            float _3214 = fma(_3212, _3168, _3204);
            float _3216 = fma(_3184, _3168, _3210);
            float _3218 = -_3200;
            float _3220 = fma(_3184, _3138, _3218);
            _2912 = _3188;
            _2914 = _3166;
            _2916 = _3204;
            _2918 = _3198;
            _2726 = _3200;
            _2730 = _3196;
            _2920 = _3170;
            _2922 = _3150;
            _2924 = _3206;
            _2926 = _3214;
            _2928 = _3220;
            _2850 = _3150;
            _2932 = _3216;
            _2934 = _3210;
            _2936 = 1.0;
        }
        _2938 = false;
        float _3222 = _2912;
        float _3224 = _2914;
        float _3226 = _2916;
        float _3228 = _2918;
        float _3230 = _2726;
        float _3232 = _2658;
        float _3234 = _2728;
        float _3236 = _2730;
        float _3238 = _2920;
        float _3240 = _2660;
        float _3242 = _2610;
        float _3244 = _2662;
        float _3246 = _2922;
        float _3248 = _2924;
        float _3250 = _2926;
        float _3252 = _2928;
        float _3254 = _2850;
        bool _3256 = _2930;
        float _3258 = _2932;
        float _3260 = _2934;
        float _3262 = _2936;
        bool _3264 = !_1672;
        bool _3266 = _3256;
        float _3268 = _3226;
        float _3270 = _3228;
        float _3272 = _3260;
        float _3274 = _3254;
        float _3276 = _3222;
        float _3278 = _3224;
        _1976 = _3230;
        _1978 = _3232;
        _1980 = _3234;
        _1982 = _3236;
        _2256 = _3238;
        _2468 = _3240;
        _2470 = _3242;
        _2472 = _3244;
        _2530 = as_type<int>(_3246);
        _2486 = _3258;
        _2516 = _3262;
        if (!_3264)
        {
            float _3280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3282 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3284 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3286 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3288 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
            float _3290 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
            float _3292 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
            float _3294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
            float _3296 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3298 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3300 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3302 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3304 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3306 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3308 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3310 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _3312 = _3286 * _3292;
            float _3314 = _3286 * _3290;
            float _3316 = _3286 * _3288;
            float _3318 = _3302 * _3292;
            float _3320 = _3302 * _3290;
            float _3322 = _3302 * _3288;
            float _3324 = _3302 * _3284;
            float _3326 = _3302 * _3282;
            float _3328 = _3302 * _3280;
            float _3330 = -_3312;
            float _3332 = fma(_3284, _3294, _3330);
            float _3334 = -_3314;
            float _3336 = fma(_3282, _3294, _3334);
            float _3338 = -_3316;
            float _3340 = fma(_3280, _3294, _3338);
            float _3342 = -_3318;
            float _3344 = fma(_3300, _3294, _3342);
            float _3346 = -_3320;
            float _3348 = fma(_3298, _3294, _3346);
            float _3350 = -_3322;
            float _3352 = fma(_3296, _3294, _3350);
            float _3354 = _3284 * _3290;
            float _3356 = _3284 * _3288;
            float _3358 = _3282 * _3288;
            float _3360 = _3300 * _3290;
            float _3362 = -_3324;
            float _3364 = fma(_3300, _3286, _3362);
            float _3366 = -_3326;
            float _3368 = fma(_3298, _3286, _3366);
            float _3370 = -_3328;
            float _3372 = fma(_3296, _3286, _3370);
            float _3374 = _3300 * _3288;
            float _3376 = -_3354;
            float _3378 = fma(_3282, _3292, _3376);
            float _3380 = -_3356;
            float _3382 = fma(_3280, _3292, _3380);
            float _3384 = _3300 * _3282;
            float _3386 = _3300 * _3280;
            float _3388 = -_3358;
            float _3390 = fma(_3280, _3290, _3388);
            float _3392 = -_3360;
            float _3394 = fma(_3298, _3292, _3392);
            float _3396 = _3298 * _3280;
            float _3398 = _3300 * _3340;
            float _3400 = -_3374;
            float _3402 = fma(_3296, _3292, _3400);
            float _3404 = -_3384;
            float _3406 = fma(_3298, _3284, _3404);
            float _3408 = -_3396;
            float _3410 = fma(_3296, _3282, _3408);
            float _3412 = _3300 * _3336;
            float _3414 = -_3398;
            float _3416 = fma(_3296, _3332, _3414);
            float _3418 = _3298 * _3288;
            float _3420 = _3298 * _3340;
            float _3422 = -_3412;
            float _3424 = fma(_3298, _3332, _3422);
            float _3426 = fma(_3302, _3382, _3416);
            float _3428 = -_3418;
            float _3430 = fma(_3296, _3290, _3428);
            float _3432 = -_3420;
            float _3434 = fma(_3296, _3336, _3432);
            float _3436 = _3298 * _3382;
            float _3438 = fma(_3302, _3378, _3424);
            float _3440 = _3306 * _3426;
            float _3442 = -_3386;
            float _3444 = fma(_3296, _3284, _3442);
            float _3446 = _3308 * _3336;
            float _3448 = -_3436;
            float _3450 = fma(_3296, _3378, _3448);
            float _3452 = fma(_3302, _3390, _3434);
            float _3454 = -_3440;
            float _3456 = fma(_3304, _3438, _3454);
            float _3458 = -_3446;
            float _3460 = fma(_3306, _3332, _3458);
            float _3462 = fma(_3300, _3390, _3450);
            float _3464 = _3308 * _3340;
            float _3466 = fma(_3308, _3452, _3456);
            float _3468 = _3306 * _3340;
            float _3470 = _3308 * _3352;
            float _3472 = -_3464;
            float _3474 = fma(_3304, _3332, _3472);
            float _3476 = -_3310;
            float _3478 = fma(_3476, _3462, _3466);
            float _3480 = _3308 * _3348;
            float _3482 = -_3468;
            float _3484 = fma(_3304, _3336, _3482);
            float _3486 = fma(_3310, _3378, _3460);
            float _3488 = 1.0 / _3478;
            float _3490 = -_3480;
            float _3492 = fma(_3306, _3344, _3490);
            float _3494 = -_3470;
            float _3496 = fma(_3304, _3344, _3494);
            float _3498 = _3306 * _3352;
            float _3500 = fma(_3310, _3390, _3484);
            float _3502 = _3308 * _3368;
            float _3504 = _3308 * _3372;
            float _3506 = _3306 * _3372;
            float _3508 = fma(_3310, _3382, _3474);
            float _3510 = -_3498;
            float _3512 = fma(_3304, _3348, _3510);
            float _3514 = -_3502;
            float _3516 = fma(_3306, _3364, _3514);
            float _3518 = -_3504;
            float _3520 = fma(_3304, _3364, _3518);
            float _3522 = -_3506;
            float _3524 = fma(_3304, _3368, _3522);
            float _3526 = fma(_3310, _3394, _3492);
            float _3528 = fma(_3310, _3402, _3496);
            float _3530 = fma(_3310, _3430, _3512);
            float _3532 = _3486 * _3488;
            float _3534 = _3426 * _3488;
            float _3536 = _3500 * _3488;
            float _3538 = _3438 * _3488;
            float _3540 = _3508 * _3488;
            float _3542 = _3534 * _2420;
            float _3544 = _3532 * _3246;
            float _3546 = _3452 * _3488;
            float _3548 = _3536 * _3246;
            float _3550 = -_3542;
            float _3552 = fma(_3540, _3246, _3550);
            float _3554 = -_3544;
            float _3556 = fma(_3538, _2420, _3554);
            float _3558 = _3526 * _3488;
            float _3560 = _3528 * _3488;
            float _3562 = -_3548;
            float _3564 = fma(_3546, _2420, _3562);
            float _3566 = _3530 * _3488;
            float _3568 = fma(_3310, _3406, _3516);
            float _3570 = fma(_3310, _3444, _3520);
            float _3572 = fma(_3558, _2422, _3556);
            float _3574 = -_3560;
            float _3576 = fma(_3574, _2422, _3552);
            float _3578 = fma(_3310, _3410, _3524);
            float _3580 = fma(_3566, _2422, _3564);
            float _3582 = -_3568;
            float _3584 = fma(_3582, _3488, _3572);
            float _3586 = fma(_3570, _3488, _3576);
            float _3588 = -_3578;
            float _3590 = fma(_3588, _3488, _3580);
            _1976 = _3546;
            _1978 = _3580;
            _1980 = _3532;
            _1982 = _3498;
            _2256 = _3558;
            _2468 = _3488;
            _2470 = _3568;
            _2472 = _3302;
            _2474 = _3540;
            _2258 = _3306;
            _2260 = _3566;
            _2262 = _3310;
            _2494 = _3252;
            _2502 = true;
            _2524 = as_type<int>(_3584);
            _2482 = _3248;
            _2490 = _3250;
            _2530 = as_type<int>(_3586);
            _2538 = as_type<int>(_3590);
            _2540 = _3394;
            _2542 = _3348;
            _2506 = 0.0;
            _2498 = 0.0;
            _2510 = 0.0;
            _3592 = true;
        }
        else
        {
            bool _3594 = !_1752;
            if (!_3594)
            {
                float _3596 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _3598 = uint(int(uint(_182) >> uint(2)));
                float _3600 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3598)]);
                int _3602 = _182 + 4;
                uint _3604 = uint(int(uint(_3602) >> uint(2)));
                float _3606 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3604)]);
                int _3608 = _182 + 8;
                uint _3610 = uint(int(uint(_3608) >> uint(2)));
                float _3612 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3610)]);
                uint _3614 = uint(int(uint(_182) >> uint(2)));
                float _3616 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3614)]);
                int _3618 = _182 + 4;
                uint _3620 = uint(int(uint(_3618) >> uint(2)));
                float _3622 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3620)]);
                int _3624 = _182 + 8;
                uint _3626 = uint(int(uint(_3624) >> uint(2)));
                float _3628 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3626)]);
                uint _3630 = uint(int(uint(_182) >> uint(2)));
                float _3632 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3630)]);
                int _3634 = _182 + 4;
                uint _3636 = uint(int(uint(_3634) >> uint(2)));
                float _3638 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3636)]);
                int _3640 = _182 + 8;
                uint _3642 = uint(int(uint(_3640) >> uint(2)));
                float _3644 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3642)]);
                float _3646 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3648 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3650 = _3612 * _3616;
                float _3652 = _3612 * _3622;
                float _3654 = -_3650;
                float _3656 = fma(_3600, _3628, _3654);
                float _3658 = _3606 * _3616;
                float _3660 = -_3652;
                float _3662 = fma(_3606, _3628, _3660);
                float _3664 = _3638 * _3656;
                float _3666 = -_3658;
                float _3668 = fma(_3600, _3622, _3666);
                float _3670 = -_3664;
                float _3672 = fma(_3632, _3662, _3670);
                float _3674 = fma(_3644, _3668, _3672);
                float _3676 = 1.0 / _3674;
                float _3678 = _3596 * _3628;
                float _3680 = _3596 * _3622;
                float _3682 = _3596 * _3616;
                float _3684 = _3638 * _3628;
                float _3686 = _3644 * _3616;
                float _3688 = -_3680;
                float _3690 = fma(_3606, _3646, _3688);
                float _3692 = _3632 * _3622;
                float _3694 = -_3684;
                float _3696 = fma(_3644, _3622, _3694);
                float _3698 = -_3678;
                float _3700 = fma(_3612, _3646, _3698);
                float _3702 = -_3682;
                float _3704 = fma(_3600, _3646, _3702);
                float _3706 = _3644 * _3606;
                float _3708 = _3632 * _3612;
                float _3710 = -_3686;
                float _3712 = fma(_3632, _3628, _3710);
                float _3714 = _3638 * _3600;
                float _3716 = -_3692;
                float _3718 = fma(_3638, _3616, _3716);
                float _3720 = -_3706;
                float _3722 = fma(_3638, _3612, _3720);
                float _3724 = -_3600;
                float _3726 = fma(_3724, _3628, _3650);
                float _3728 = -_3708;
                float _3730 = fma(_3644, _3600, _3728);
                float _3732 = _3644 * _3690;
                float _3734 = _3696 * _3676;
                float _3736 = _3712 * _3676;
                float _3738 = -_3714;
                float _3740 = fma(_3632, _3606, _3738);
                float _3742 = _3718 * _3676;
                float _3744 = _3644 * _3704;
                float _3746 = _3638 * _3704;
                float _3748 = -_3732;
                float _3750 = fma(_3638, _3700, _3748);
                float _3752 = _3734 * _3246;
                float _3754 = _3736 * _3246;
                float _3756 = _3742 * _3246;
                float _3758 = _3726 * _3676;
                float _3760 = _3662 * _3676;
                float _3762 = _3668 * _3676;
                float _3764 = -_3744;
                float _3766 = fma(_3632, _3700, _3764);
                float _3768 = fma(_3758, _2420, _3754);
                float _3770 = fma(_3760, _2420, _3752);
                float _3772 = fma(_3762, _2420, _3756);
                float _3774 = _3730 * _3676;
                float _3776 = _3722 * _3676;
                float _3778 = _3740 * _3676;
                float _3780 = -_3746;
                float _3782 = fma(_3632, _3690, _3780);
                float _3784 = fma(_3774, _2422, _3768);
                float _3786 = fma(_3776, _2422, _3770);
                float _3788 = fma(_3648, _3656, _3766);
                float _3790 = fma(_3648, _3662, _3750);
                float _3792 = fma(_3778, _2422, _3772);
                float _3794 = fma(_3648, _3668, _3782);
                float _3796 = fma(_3788, _3676, _3784);
                float _3798 = -_3790;
                float _3800 = fma(_3798, _3676, _3786);
                float _3802 = -_3794;
                float _3804 = fma(_3802, _3676, _3792);
                _1976 = _3778;
                _1978 = _3722;
                _1980 = _3628;
                _1982 = _3726;
                _2256 = _3794;
                _2468 = _3786;
                _2470 = _3644;
                _2472 = _3768;
                _2474 = _3656;
                _2258 = _3696;
                _2262 = _3730;
                _2494 = _3252;
                _2502 = true;
                _2524 = as_type<int>(_3800);
                _2482 = _3248;
                _2490 = _3250;
                _2530 = as_type<int>(_3796);
                _2538 = as_type<int>(_3804);
                _2540 = _3740;
                _2542 = _3746;
                _2506 = 0.0;
                _2498 = 0.0;
                _2510 = 0.0;
                _3592 = true;
            }
            else
            {
                if (!_1956)
                {
                    _3266 = true;
                }
                bool _3806 = _3266;
                _2502 = _3806;
                if (!_1956)
                {
                    _3268 = 0.0;
                    _3270 = 0.0;
                }
                float _3808 = _3268;
                float _3810 = _3270;
                _2506 = _3810;
                _2498 = _3808;
                if (!_1956)
                {
                    _3272 = 0.0;
                }
                float _3812 = _3272;
                _2510 = _3812;
                if (!_1956)
                {
                    _3274 = _3248;
                }
                float _3814 = _3274;
                _2482 = _3814;
                if (!_1956)
                {
                    _3276 = _3250;
                }
                float _3816 = _3276;
                _2490 = _3816;
                if (!_1956)
                {
                    _3278 = _3252;
                }
                float _3818 = _3278;
                _2494 = _3818;
                if (!_1956)
                {
                    _2522 = as_type<int>(_2420);
                }
                int _3820 = _2522;
                _2524 = _3820;
                if (!_1956)
                {
                    _2536 = as_type<int>(_2422);
                }
                int _3822 = _2536;
                bool _3824 = !_1956;
                _2538 = _3822;
                _2540 = 0.0;
                _2542 = 0.0;
                if (!_3824)
                {
                    uint _3826 = uint(int(uint(_182) >> uint(2)));
                    float _3828 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3826)]);
                    int _3830 = _182 + 4;
                    uint _3832 = uint(int(uint(_3830) >> uint(2)));
                    float _3834 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3832)]);
                    int _3836 = _182 + 8;
                    uint _3838 = uint(int(uint(_3836) >> uint(2)));
                    float _3840 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3838)]);
                    int _3842 = _182 + 12;
                    uint _3844 = uint(int(uint(_3842) >> uint(2)));
                    float _3846 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3844)]);
                    uint _3848 = uint(int(uint(_182) >> uint(2)));
                    float _3850 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3848)]);
                    int _3852 = _182 + 4;
                    uint _3854 = uint(int(uint(_3852) >> uint(2)));
                    float _3856 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3854)]);
                    int _3858 = _182 + 8;
                    uint _3860 = uint(int(uint(_3858) >> uint(2)));
                    float _3862 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3860)]);
                    int _3864 = _182 + 12;
                    uint _3866 = uint(int(uint(_3864) >> uint(2)));
                    float _3868 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3866)]);
                    uint _3870 = uint(int(uint(_182) >> uint(2)));
                    float _3872 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3870)]);
                    int _3874 = _182 + 4;
                    uint _3876 = uint(int(uint(_3874) >> uint(2)));
                    float _3878 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3876)]);
                    int _3880 = _182 + 8;
                    uint _3882 = uint(int(uint(_3880) >> uint(2)));
                    float _3884 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3882)]);
                    int _3886 = _182 + 12;
                    uint _3888 = uint(int(uint(_3886) >> uint(2)));
                    float _3890 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3888)]);
                    float _3892 = _3840 * _3850;
                    float _3894 = _3840 * _3856;
                    float _3896 = _3834 * _3850;
                    float _3898 = _3862 * _3846;
                    float _3900 = -_3892;
                    float _3902 = fma(_3828, _3862, _3900);
                    float _3904 = -_3894;
                    float _3906 = fma(_3834, _3862, _3904);
                    float _3908 = -_3896;
                    float _3910 = fma(_3828, _3856, _3908);
                    float _3912 = _3856 * _3846;
                    float _3914 = _3878 * _3902;
                    float _3916 = _3850 * _3846;
                    float _3918 = _3878 * _3862;
                    float _3920 = -_3898;
                    float _3922 = fma(_3840, _3868, _3920);
                    float _3924 = -_3914;
                    float _3926 = fma(_3872, _3906, _3924);
                    float _3928 = -_3912;
                    float _3930 = fma(_3834, _3868, _3928);
                    float _3932 = -_3916;
                    float _3934 = fma(_3828, _3868, _3932);
                    float _3936 = -_3918;
                    float _3938 = fma(_3884, _3856, _3936);
                    float _3940 = fma(_3884, _3910, _3926);
                    float _3942 = _3872 * _3856;
                    float _3944 = _3884 * _3850;
                    float _3946 = _3884 * _3834;
                    float _3948 = _3872 * _3840;
                    float _3950 = -_3828;
                    float _3952 = fma(_3950, _3862, _3892);
                    float _3954 = 1.0 / _3940;
                    float _3956 = -_3944;
                    float _3958 = fma(_3872, _3862, _3956);
                    float _3960 = -_3942;
                    float _3962 = fma(_3878, _3850, _3960);
                    float _3964 = -_3946;
                    float _3966 = fma(_3878, _3840, _3964);
                    float _3968 = -_3948;
                    float _3970 = fma(_3884, _3828, _3968);
                    float _3972 = _3878 * _3828;
                    float _3974 = _3878 * _3934;
                    float _3976 = _3884 * _3930;
                    float _3978 = _3884 * _3934;
                    float _3980 = -_3972;
                    float _3982 = fma(_3872, _3834, _3980);
                    float _3984 = -_3974;
                    float _3986 = fma(_3872, _3930, _3984);
                    float _3988 = -_3976;
                    float _3990 = fma(_3878, _3922, _3988);
                    float _3992 = -_3978;
                    float _3994 = fma(_3872, _3922, _3992);
                    float _3996 = fma(_3910, _3890, _3986);
                    float _3998 = fma(_3906, _3890, _3990);
                    float _4000 = _3938 * _3954;
                    float _4002 = _3958 * _3954;
                    float _4004 = _3962 * _3954;
                    float _4006 = _3952 * _3954;
                    float _4008 = _4000 * _3246;
                    float _4010 = _4002 * _3246;
                    float _4012 = _3906 * _3954;
                    float _4014 = _4004 * _3246;
                    float _4016 = _3910 * _3954;
                    float _4018 = fma(_4006, _2420, _4010);
                    float _4020 = fma(_4012, _2420, _4008);
                    float _4022 = _3970 * _3954;
                    float _4024 = _3966 * _3954;
                    float _4026 = fma(_4016, _2420, _4014);
                    float _4028 = _3982 * _3954;
                    float _4030 = fma(_4022, _2422, _4018);
                    float _4032 = fma(_4024, _2422, _4020);
                    float _4034 = fma(_3902, _3890, _3994);
                    float _4036 = fma(_4028, _2422, _4026);
                    float _4038 = -_3998;
                    float _4040 = fma(_4038, _3954, _4032);
                    float _4042 = fma(_4034, _3954, _4030);
                    float _4044 = -_3996;
                    float _4046 = fma(_4044, _3954, _4036);
                    _1976 = _4024;
                    _1978 = _3972;
                    _1980 = _4002;
                    _1982 = _3944;
                    _2256 = _3872;
                    _2468 = _3878;
                    _2470 = _4034;
                    _2472 = _3890;
                    _2474 = _4006;
                    _2258 = _3922;
                    _2260 = _4022;
                    _2262 = _3934;
                    _2494 = _3252;
                    _2502 = true;
                    _2524 = as_type<int>(_4040);
                    _2482 = _3248;
                    _2490 = _3250;
                    _2530 = as_type<int>(_4042);
                    _2538 = as_type<int>(_4046);
                    _2540 = _3948;
                    _2542 = _3910;
                    _2506 = 0.0;
                    _2498 = 0.0;
                    _2510 = 0.0;
                }
            }
        }
    }
    _3592 = false;
    float _4048 = _1976;
    float _4050 = _1978;
    float _4052 = _1980;
    float _4054 = _1982;
    float _4056 = _2256;
    float _4058 = _2468;
    float _4060 = _2470;
    float _4062 = _2472;
    float _4064 = _2474;
    float _4066 = _2258;
    float _4068 = _2260;
    float _4070 = _2262;
    float _4072 = _2494;
    bool _4074 = _2502;
    int _4076 = _2524;
    float _4078 = _2482;
    float _4080 = _2490;
    int _4082 = _2530;
    float _4084 = _2486;
    int _4086 = _2538;
    float _4088 = _2540;
    float _4090 = _2542;
    float _4092 = _2506;
    float _4094 = _2498;
    float _4096 = _2510;
    float _4098 = _2516;
    float _4100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4102 = _4048;
    float _4104 = _4050;
    float _4106 = _4052;
    float _4108 = _4054;
    float _4110 = _4090;
    float _4112 = _4088;
    float _4114 = _4096;
    float _4116 = _4092;
    float _4118 = _4094;
    if (_1672)
    {
        float _4120 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4122 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4124 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4126 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4102 = _4120;
        _4104 = _4122;
        _4106 = _4124;
        _4108 = _4126;
    }
    float _4128 = _4102;
    float _4130 = _4104;
    float _4132 = _4106;
    float _4134 = _4108;
    float _4136 = _4056;
    float _4138 = _4058;
    float _4140 = _4060;
    float _4142 = _4062;
    if (_1672)
    {
        float _4144 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4146 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4148 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4150 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4136 = _4144;
        _4138 = _4146;
        _4140 = _4148;
        _4142 = _4150;
    }
    float _4152 = _4136;
    float _4154 = _4138;
    float _4156 = _4140;
    float _4158 = _4142;
    float _4160 = _4064;
    float _4162 = _4066;
    float _4164 = _4068;
    float _4166 = _4070;
    if (_1672)
    {
        float _4168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4170 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4172 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4160 = _4168;
        _4162 = _4170;
        _4164 = _4172;
        _4166 = _4174;
    }
    float _4176 = _4160;
    float _4178 = _4162;
    float _4180 = _4164;
    float _4182 = _4166;
    float _4184 = _4072 * 2.0;
    float _4186 = _4074 ? as_type<float>(_4076) : _1616;
    float _4188 = _4078 * _4078;
    float _4190 = _4188 * 2.0;
    float _4192 = _4074 ? as_type<float>(_4076) : _842;
    float _4194 = _4184 * _4080;
    float _4196 = _4074 ? as_type<float>(_2440) : _1758;
    float _4198 = _4078 * 2.0;
    float _4200 = _4074 ? as_type<float>(_4082) : _1748;
    float _4202 = _4184 * _4078;
    float _4204 = _4074 ? as_type<float>(_4082) : _2454;
    float _4206 = _4074 ? as_type<float>(_2442) : _1764;
    float _4208 = _4084 * 2.0;
    float _4210 = _4074 ? as_type<float>(_2442) : _374;
    float _4212 = fma(_4198, _4084, _4194);
    float _4214 = _4074 ? as_type<float>(_4086) : _1628;
    float _4216 = -_4194;
    float _4218 = fma(_4198, _4084, _4216);
    float _4220 = _4074 ? as_type<float>(_4086) : _844;
    float _4222 = _4080 * 2.0;
    float _4224 = _4074 ? as_type<float>(_2444) : _1770;
    float _4226 = _4184 * _4084;
    float _4228 = _4074 ? as_type<float>(_2440) : _372;
    float _4230 = fma(_4208, _4080, _4202);
    float _4232 = -_4226;
    float _4234 = fma(_4222, _4078, _4232);
    float _4236 = fma(_4222, _4078, _4226);
    float _4238 = -_4202;
    float _4240 = fma(_4208, _4080, _4238);
    float _4242 = -_4190;
    float _4244 = _4242 + 1.0;
    float _4246 = _4074 ? as_type<float>(_2444) : _376;
    float _4248 = fma(_4206, _4100, _4200);
    float _4250 = fma(_4224, _4100, _4214);
    float _4252 = fma(_4196, _4100, _4186);
    float _4254 = _4226;
    float _4256 = _4224;
    float _4258 = _4128;
    float _4260 = _4244;
    float _4262 = _4196;
    float _4264 = _4186;
    float _4266 = _4130;
    float _4268 = _4132;
    float _4270 = _4134;
    float _4272 = _4246;
    float _4274 = _4200;
    float _4276 = _4192;
    float _4278 = _4236;
    if (_1672)
    {
        float _4280 = _4248 * _4130;
        _4254 = _4280;
    }
    float _4282 = _4254;
    float _4284 = _4178;
    float _4286 = _4156;
    float _4288 = _4180;
    float _4290 = _4154;
    float _4292 = _4158;
    if (_1672)
    {
        float _4294 = _4248 * _4154;
        _4256 = _4294;
    }
    float _4296 = _4256;
    if (_1672)
    {
        float _4298 = fma(_4252, _4128, _4282);
        _4258 = _4298;
    }
    float _4300 = _4258;
    float _4302 = _4084 * _4084;
    float _4304 = _4300;
    float _4306 = _4302;
    if (_1672)
    {
        float _4308 = _4248 * _4178;
        _4284 = _4308;
    }
    float _4310 = _4284;
    float _4312 = _4310;
    if (_1672)
    {
        float _4314 = fma(_4252, _4152, _4296);
        _2476 = _4314;
    }
    float _4316 = _2476;
    float _4318 = _4080 * _4080;
    float _4320 = fma(_4302, -2.0, 1.0);
    float _4322 = _4318;
    float _4324 = _4316;
    if (_1672)
    {
        float _4326 = fma(_4252, _4176, _4310);
        _4312 = _4326;
    }
    float _4328 = _4312;
    float _4330 = _4328;
    if (_1672)
    {
        float _4332 = fma(_4250, _4132, _4300);
        _4304 = _4332;
    }
    float _4334 = _4304;
    float _4336 = _4334;
    if (_1672)
    {
        float _4338 = fma(_4250, _4156, _4316);
        _4286 = _4338;
    }
    float _4340 = _4286;
    float _4342 = fma(_4318, -2.0, 1.0);
    if (_1672)
    {
        float _4344 = fma(_4250, _4180, _4328);
        _4288 = _4344;
    }
    float _4346 = _4288;
    float _4348 = fma(_4302, -2.0, _4244);
    float _4350 = fma(_4318, -2.0, _4320);
    float _4352 = 0.0;
    if (_1672)
    {
        float _4354 = _4334 + _4134;
        _4352 = _4354;
    }
    float _4356 = _4352;
    float _4358 = _4356;
    float _4360 = _4356;
    if (_1672)
    {
        float _4362 = _4340 + _4158;
        _4110 = _4362;
    }
    float _4364 = _4110;
    float _4366 = _4364;
    float _4368 = _4364;
    if (_1672)
    {
        float _4370 = _4346 + _4182;
        _4112 = _4370;
    }
    float _4372 = _4112;
    float _4374 = -_4190;
    float _4376 = _4374 + _4342;
    float _4378 = _4372;
    float _4380 = _4372;
    if (!_1672)
    {
        bool _4382 = !_1752;
        if (!_4382)
        {
            float _4384 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _4386 = uint(int(uint(_182) >> uint(2)));
            float _4388 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4386)]);
            int _4390 = _182 + 4;
            uint _4392 = uint(int(uint(_4390) >> uint(2)));
            float _4394 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4392)]);
            int _4396 = _182 + 8;
            uint _4398 = uint(int(uint(_4396) >> uint(2)));
            float _4400 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4398)]);
            int _4402 = _182 + 12;
            uint _4404 = uint(int(uint(_4402) >> uint(2)));
            float _4406 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4404)]);
            uint _4408 = uint(int(uint(_182) >> uint(2)));
            float _4410 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4408)]);
            int _4412 = _182 + 4;
            uint _4414 = uint(int(uint(_4412) >> uint(2)));
            float _4416 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4414)]);
            int _4418 = _182 + 8;
            uint _4420 = uint(int(uint(_4418) >> uint(2)));
            float _4422 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4420)]);
            int _4424 = _182 + 12;
            uint _4426 = uint(int(uint(_4424) >> uint(2)));
            float _4428 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4426)]);
            uint _4430 = uint(int(uint(_182) >> uint(2)));
            float _4432 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4430)]);
            int _4434 = _182 + 4;
            uint _4436 = uint(int(uint(_4434) >> uint(2)));
            float _4438 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4436)]);
            int _4440 = _182 + 8;
            uint _4442 = uint(int(uint(_4440) >> uint(2)));
            float _4444 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4442)]);
            int _4446 = _182 + 12;
            uint _4448 = uint(int(uint(_4446) >> uint(2)));
            float _4450 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4448)]);
            float _4452 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _4454 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _4456 = _4394 * _4248;
            float _4458 = _4416 * _4248;
            float _4460 = _4438 * _4248;
            float _4462 = fma(_4388, _4252, _4456);
            float _4464 = fma(_4410, _4252, _4458);
            float _4466 = fma(_4432, _4252, _4460);
            float _4468 = fma(_4400, _4250, _4462);
            float _4470 = fma(_4422, _4250, _4464);
            float _4472 = fma(_4444, _4250, _4466);
            float _4474 = _4384 + _4468;
            float _4476 = _4452 + _4470;
            float _4478 = _4454 + _4472;
            _4306 = _4388;
            _4260 = _4468;
            _4322 = _4400;
            _4324 = _4406;
            _4262 = _4410;
            _2478 = _4470;
            _1816 = _4422;
            _4264 = _4428;
            _4336 = _4432;
            _4266 = _4472;
            _4268 = _4444;
            _4270 = _4450;
            _4360 = _4474;
            _4380 = _4478;
            _4368 = _4476;
            _4480 = true;
        }
        else
        {
            if (!_1956)
            {
                _4358 = _4252;
            }
            float _4482 = _4358;
            _4360 = _4482;
            if (!_1956)
            {
                _4366 = _4248;
            }
            float _4484 = _4366;
            _4368 = _4484;
            if (!_1956)
            {
                _4378 = _4250;
            }
            float _4486 = _4378;
            bool _4488 = !_1956;
            _4380 = _4486;
            if (!_4488)
            {
                uint _4490 = uint(int(uint(_182) >> uint(2)));
                float _4492 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4490)]);
                int _4494 = _182 + 4;
                uint _4496 = uint(int(uint(_4494) >> uint(2)));
                float _4498 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4496)]);
                int _4500 = _182 + 8;
                uint _4502 = uint(int(uint(_4500) >> uint(2)));
                float _4504 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4502)]);
                int _4506 = _182 + 12;
                uint _4508 = uint(int(uint(_4506) >> uint(2)));
                float _4510 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4508)]);
                uint _4512 = uint(int(uint(_182) >> uint(2)));
                float _4514 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4512)]);
                int _4516 = _182 + 4;
                uint _4518 = uint(int(uint(_4516) >> uint(2)));
                float _4520 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4518)]);
                int _4522 = _182 + 8;
                uint _4524 = uint(int(uint(_4522) >> uint(2)));
                float _4526 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4524)]);
                int _4528 = _182 + 12;
                uint _4530 = uint(int(uint(_4528) >> uint(2)));
                float _4532 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4530)]);
                uint _4534 = uint(int(uint(_182) >> uint(2)));
                float _4536 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4534)]);
                int _4538 = _182 + 4;
                uint _4540 = uint(int(uint(_4538) >> uint(2)));
                float _4542 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4540)]);
                int _4544 = _182 + 8;
                uint _4546 = uint(int(uint(_4544) >> uint(2)));
                float _4548 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4546)]);
                int _4550 = _182 + 12;
                uint _4552 = uint(int(uint(_4550) >> uint(2)));
                float _4554 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4552)]);
                float _4556 = _4498 * _4248;
                float _4558 = _4520 * _4248;
                float _4560 = _4542 * _4248;
                float _4562 = fma(_4492, _4252, _4556);
                float _4564 = fma(_4514, _4252, _4558);
                float _4566 = fma(_4536, _4252, _4560);
                float _4568 = fma(_4504, _4250, _4562);
                float _4570 = fma(_4526, _4250, _4564);
                float _4572 = fma(_4548, _4250, _4566);
                float _4574 = _4568 + _4510;
                float _4576 = _4570 + _4532;
                float _4578 = _4572 + _4554;
                _4306 = _4492;
                _4260 = _4562;
                _4322 = _4568;
                _4324 = _4510;
                _4262 = _4514;
                _2478 = _4564;
                _1816 = _4570;
                _4264 = _4532;
                _4336 = _4536;
                _4266 = _4566;
                _4268 = _4572;
                _4270 = _4554;
                _4360 = _4574;
                _4380 = _4578;
                _4368 = _4576;
            }
        }
    }
    _4480 = false;
    float _4580 = _4306;
    float _4582 = _4260;
    float _4584 = _4322;
    float _4586 = _4324;
    float _4588 = _4262;
    float _4590 = _2478;
    float _4592 = _1816;
    float _4594 = _4264;
    float _4596 = _4336;
    float _4598 = _4266;
    float _4600 = _4268;
    float _4602 = _4270;
    float _4604 = _4360;
    float _4606 = _4380;
    float _4608 = _4368;
    float _4610 = _4580;
    float _4612 = _4582;
    float _4614 = _4584;
    float _4616 = _4586;
    if (_1672)
    {
        float _4618 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4620 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4622 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4624 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4610 = _4618;
        _4612 = _4620;
        _4614 = _4622;
        _4616 = _4624;
    }
    float _4626 = _4610;
    float _4628 = _4612;
    float _4630 = _4614;
    float _4632 = _4616;
    float _4634 = _4588;
    float _4636 = _4590;
    float _4638 = _4592;
    float _4640 = _4594;
    if (_1672)
    {
        float _4642 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4644 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4646 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4648 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4634 = _4642;
        _4636 = _4644;
        _4638 = _4646;
        _4640 = _4648;
    }
    float _4650 = _4634;
    float _4652 = _4636;
    float _4654 = _4638;
    float _4656 = _4640;
    float _4658 = _4596;
    float _4660 = _4598;
    float _4662 = _4600;
    float _4664 = _4602;
    if (_1672)
    {
        float _4666 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4668 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4670 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4672 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4658 = _4666;
        _4660 = _4668;
        _4662 = _4670;
        _4664 = _4672;
    }
    float _4674 = _4658;
    float _4676 = _4660;
    float _4678 = _4662;
    float _4680 = _4664;
    float _4682 = _4210 * 59.999996185302734375;
    float _4684 = _4228 * 59.999996185302734375;
    float _4686 = _4246 * 59.999996185302734375;
    float _4688 = _4632;
    float _4690 = _4628;
    float _4692 = _4630;
    float _4694 = _4626;
    if (_1672)
    {
        float _4696 = _4682 * _4628;
        _4688 = _4696;
    }
    float _4698 = _4688;
    float _4700 = _4656;
    float _4702 = _4698;
    float _4704 = _4652;
    float _4706 = _4654;
    if (_1672)
    {
        float _4708 = _4682 * _4652;
        _4700 = _4708;
    }
    float _4710 = _4700;
    float _4712 = _4710;
    if (_1672)
    {
        float _4714 = fma(_4684, _4626, _4698);
        _4702 = _4714;
    }
    float _4716 = _4702;
    float _4718 = _4680;
    float _4720 = _4716;
    float _4722 = _4676;
    float _4724 = _4678;
    if (_1672)
    {
        float _4726 = _4682 * _4676;
        _4718 = _4726;
    }
    float _4728 = _4718;
    float _4730 = _4728;
    if (_1672)
    {
        float _4732 = fma(_4684, _4650, _4710);
        _4712 = _4732;
    }
    float _4734 = _4712;
    float _4736 = _4734;
    if (_1672)
    {
        float _4738 = fma(_4686, _4630, _4716);
        _4720 = _4738;
    }
    float _4740 = _4720;
    float _4742 = _4740;
    float _4744 = _4740;
    if (_1672)
    {
        float _4746 = fma(_4684, _4674, _4728);
        _4730 = _4746;
    }
    float _4748 = _4730;
    float _4750 = _4748;
    if (_1672)
    {
        float _4752 = fma(_4686, _4654, _4734);
        _4736 = _4752;
    }
    float _4754 = _4736;
    float _4756 = _4754;
    float _4758 = _4754;
    if (_1672)
    {
        float _4760 = fma(_4686, _4678, _4748);
        _4750 = _4760;
    }
    float _4762 = _4750;
    float _4764 = _4762;
    float _4766 = _4762;
    if (!_1672)
    {
        bool _4768 = !_1752;
        if (!_4768)
        {
            uint _4770 = uint(int(uint(_182) >> uint(2)));
            float _4772 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4770)]);
            int _4774 = _182 + 4;
            uint _4776 = uint(int(uint(_4774) >> uint(2)));
            float _4778 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4776)]);
            int _4780 = _182 + 8;
            uint _4782 = uint(int(uint(_4780) >> uint(2)));
            float _4784 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4782)]);
            int _4786 = _182 + 12;
            uint _4788 = uint(int(uint(_4786) >> uint(2)));
            float _4790 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4788)]);
            uint _4792 = uint(int(uint(_182) >> uint(2)));
            float _4794 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4792)]);
            int _4796 = _182 + 4;
            uint _4798 = uint(int(uint(_4796) >> uint(2)));
            float _4800 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4798)]);
            int _4802 = _182 + 8;
            uint _4804 = uint(int(uint(_4802) >> uint(2)));
            float _4806 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4804)]);
            uint _4808 = uint(int(uint(_182) >> uint(2)));
            float _4810 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4808)]);
            int _4812 = _182 + 4;
            uint _4814 = uint(int(uint(_4812) >> uint(2)));
            float _4816 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4814)]);
            int _4818 = _182 + 8;
            uint _4820 = uint(int(uint(_4818) >> uint(2)));
            float _4822 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4820)]);
            int _4824 = _182 + 12;
            uint _4826 = uint(int(uint(_4824) >> uint(2)));
            float _4828 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4826)]);
            float _4830 = _4778 * _4682;
            float _4832 = _4800 * _4682;
            float _4834 = _4816 * _4682;
            float _4836 = fma(_4772, _4684, _4830);
            float _4838 = fma(_4794, _4684, _4832);
            float _4840 = fma(_4810, _4684, _4834);
            float _4842 = fma(_4784, _4686, _4836);
            float _4844 = fma(_4806, _4686, _4838);
            float _4846 = fma(_4822, _4686, _4840);
            _4290 = _4836;
            _4292 = _4790;
            _4330 = _4838;
            _4272 = _4822;
            _4274 = _4828;
            _4758 = _4844;
            _4744 = _4842;
            _4766 = _4846;
            _4848 = true;
        }
        else
        {
            if (!_1956)
            {
                _4742 = _4684;
            }
            float _4850 = _4742;
            _4744 = _4850;
            if (!_1956)
            {
                _4756 = _4682;
            }
            float _4852 = _4756;
            _4758 = _4852;
            if (!_1956)
            {
                _4764 = _4686;
            }
            float _4854 = _4764;
            bool _4856 = !_1956;
            _4766 = _4854;
            if (!_4856)
            {
                uint _4858 = uint(int(uint(_182) >> uint(2)));
                float _4860 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4858)]);
                int _4862 = _182 + 4;
                uint _4864 = uint(int(uint(_4862) >> uint(2)));
                float _4866 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4864)]);
                int _4868 = _182 + 8;
                uint _4870 = uint(int(uint(_4868) >> uint(2)));
                float _4872 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4870)]);
                int _4874 = _182 + 12;
                uint _4876 = uint(int(uint(_4874) >> uint(2)));
                float _4878 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4876)]);
                uint _4880 = uint(int(uint(_182) >> uint(2)));
                float _4882 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4880)]);
                int _4884 = _182 + 4;
                uint _4886 = uint(int(uint(_4884) >> uint(2)));
                float _4888 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4886)]);
                int _4890 = _182 + 8;
                uint _4892 = uint(int(uint(_4890) >> uint(2)));
                float _4894 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4892)]);
                uint _4896 = uint(int(uint(_182) >> uint(2)));
                float _4898 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4896)]);
                int _4900 = _182 + 4;
                uint _4902 = uint(int(uint(_4900) >> uint(2)));
                float _4904 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4902)]);
                int _4906 = _182 + 8;
                uint _4908 = uint(int(uint(_4906) >> uint(2)));
                float _4910 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4908)]);
                int _4912 = _182 + 12;
                uint _4914 = uint(int(uint(_4912) >> uint(2)));
                float _4916 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4914)]);
                float _4918 = _4866 * _4682;
                float _4920 = _4888 * _4682;
                float _4922 = _4904 * _4682;
                float _4924 = fma(_4860, _4684, _4918);
                float _4926 = fma(_4882, _4684, _4920);
                float _4928 = fma(_4898, _4684, _4922);
                float _4930 = fma(_4872, _4686, _4924);
                float _4932 = fma(_4894, _4686, _4926);
                float _4934 = fma(_4910, _4686, _4928);
                _4290 = _4924;
                _4292 = _4878;
                _4330 = _4926;
                _4272 = _4910;
                _4274 = _4916;
                _4758 = _4932;
                _4744 = _4930;
                _4766 = _4934;
            }
        }
    }
    _4848 = false;
    float _4936 = _4290;
    float _4938 = _4292;
    float _4940 = _4330;
    float _4942 = _4272;
    float _4944 = _4274;
    float _4946 = _4758;
    float _4948 = _4744;
    float _4950 = _4766;
    float _4952 = -_4248;
    float _4954 = _4952 + _4204;
    float _4956 = -_4252;
    float _4958 = _4956 + _4192;
    float _4960 = -_4250;
    float _4962 = _4960 + _4220;
    float _4964 = _4936;
    float _4966 = _4938;
    float _4968 = _4940;
    float _4970 = _4944;
    float _4972 = _4942;
    float _4974 = _4948;
    float _4976 = _4946;
    float _4978 = _4950;
    if (_1672)
    {
        float _4980 = _4954 * _4628;
        _4964 = _4980;
    }
    float _4982 = _4964;
    float _4984 = _4982;
    if (_1672)
    {
        float _4986 = _4954 * _4652;
        _4966 = _4986;
    }
    float _4988 = _4966;
    float _4990 = _4988;
    if (_1672)
    {
        float _4992 = _4954 * _4676;
        _4968 = _4992;
    }
    float _4994 = _4968;
    float _4996 = _4994;
    if (_1672)
    {
        float _4998 = fma(_4958, _4626, _4982);
        _4984 = _4998;
    }
    float _5000 = _4984;
    if (_1672)
    {
        float _5002 = fma(_4958, _4650, _4988);
        _4990 = _5002;
    }
    float _5004 = _4990;
    if (_1672)
    {
        float _5006 = fma(_4958, _4674, _4994);
        _4996 = _5006;
    }
    float _5008 = _4996;
    if (_1672)
    {
        float _5010 = fma(_4962, _4630, _5000);
        _4970 = _5010;
    }
    float _5012 = _4970;
    float _5014 = _5012;
    float _5016 = _5012;
    if (_1672)
    {
        float _5018 = fma(_4962, _4654, _5004);
        _4276 = _5018;
    }
    float _5020 = _4276;
    float _5022 = _5020;
    float _5024 = _5020;
    if (_1672)
    {
        float _5026 = fma(_4962, _4678, _5008);
        _4972 = _5026;
    }
    float _5028 = _4972;
    float _5030 = _5028;
    float _5032 = _5028;
    if (!_1672)
    {
        bool _5034 = !_1752;
        if (!_5034)
        {
            uint _5036 = uint(int(uint(_182) >> uint(2)));
            float _5038 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5036)]);
            int _5040 = _182 + 4;
            uint _5042 = uint(int(uint(_5040) >> uint(2)));
            float _5044 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5042)]);
            int _5046 = _182 + 8;
            uint _5048 = uint(int(uint(_5046) >> uint(2)));
            float _5050 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5048)]);
            uint _5052 = uint(int(uint(_182) >> uint(2)));
            float _5054 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5052)]);
            int _5056 = _182 + 4;
            uint _5058 = uint(int(uint(_5056) >> uint(2)));
            float _5060 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5058)]);
            int _5062 = _182 + 8;
            uint _5064 = uint(int(uint(_5062) >> uint(2)));
            float _5066 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5064)]);
            uint _5068 = uint(int(uint(_182) >> uint(2)));
            float _5070 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5068)]);
            int _5072 = _182 + 4;
            uint _5074 = uint(int(uint(_5072) >> uint(2)));
            float _5076 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5074)]);
            int _5078 = _182 + 8;
            uint _5080 = uint(int(uint(_5078) >> uint(2)));
            float _5082 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5080)]);
            float _5084 = _5044 * _4954;
            float _5086 = _5060 * _4954;
            float _5088 = _5076 * _4954;
            float _5090 = fma(_5038, _4958, _5084);
            float _5092 = fma(_5054, _4958, _5086);
            float _5094 = fma(_5070, _4958, _5088);
            float _5096 = fma(_5050, _4962, _5090);
            float _5098 = fma(_5066, _4962, _5092);
            float _5100 = fma(_5082, _4962, _5094);
            _5032 = _5100;
            _5016 = _5096;
            _5024 = _5098;
            _5102 = true;
        }
        else
        {
            if (!_1956)
            {
                _5014 = _4958;
            }
            float _5104 = _5014;
            _5016 = _5104;
            if (!_1956)
            {
                _5022 = _4954;
            }
            float _5106 = _5022;
            _5024 = _5106;
            if (!_1956)
            {
                _5030 = _4962;
            }
            float _5108 = _5030;
            bool _5110 = !_1956;
            _5032 = _5108;
            if (!_5110)
            {
                uint _5112 = uint(int(uint(_182) >> uint(2)));
                float _5114 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5112)]);
                int _5116 = _182 + 4;
                uint _5118 = uint(int(uint(_5116) >> uint(2)));
                float _5120 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5118)]);
                int _5122 = _182 + 8;
                uint _5124 = uint(int(uint(_5122) >> uint(2)));
                float _5126 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5124)]);
                uint _5128 = uint(int(uint(_182) >> uint(2)));
                float _5130 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5128)]);
                int _5132 = _182 + 4;
                uint _5134 = uint(int(uint(_5132) >> uint(2)));
                float _5136 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5134)]);
                int _5138 = _182 + 8;
                uint _5140 = uint(int(uint(_5138) >> uint(2)));
                float _5142 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5140)]);
                uint _5144 = uint(int(uint(_182) >> uint(2)));
                float _5146 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5144)]);
                int _5148 = _182 + 4;
                uint _5150 = uint(int(uint(_5148) >> uint(2)));
                float _5152 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5150)]);
                int _5154 = _182 + 8;
                uint _5156 = uint(int(uint(_5154) >> uint(2)));
                float _5158 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5156)]);
                float _5160 = _5120 * _4954;
                float _5162 = _5136 * _4954;
                float _5164 = _5152 * _4954;
                float _5166 = fma(_5114, _4958, _5160);
                float _5168 = fma(_5130, _4958, _5162);
                float _5170 = fma(_5146, _4958, _5164);
                float _5172 = fma(_5126, _4962, _5166);
                float _5174 = fma(_5142, _4962, _5168);
                float _5176 = fma(_5158, _4962, _5170);
                _5032 = _5176;
                _5016 = _5172;
                _5024 = _5174;
            }
        }
    }
    _5102 = false;
    float _5178 = _5032;
    float _5180 = _5016;
    float _5182 = _5024;
    int _5184 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
    uint _5186 = uint(int(uint(_5184) >> uint(2)));
    float _5188 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5186)]);
    int _5190 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
    uint _5192 = uint(int(uint(_5190) >> uint(2)));
    float _5194 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5192)]);
    int _5196 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
    uint _5198 = uint(int(uint(_5196) >> uint(2)));
    float _5200 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5198)]);
    uint _5202 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
    float _5204 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5202)]);
    float _5206 = fma(_4604, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5208 = fma(_4606, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5210 = fma(_4604, 6.2500002968590706586837768554688e-05, 0.5);
    float _5212 = fma(_4606, 6.2500002968590706586837768554688e-05, 0.5);
    float _5214 = fma(_4606, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5216 = fma(_4604, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5218 = fma(_4604, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5220 = fma(_4606, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5222 = _5188 * _5188;
    float _5224 = fma(_5194, _5194, _5222);
    float _5226 = rsqrt(_5224);
    float _5228 = _5226 * (-20.0);
    float _5230 = fma(_5188, _5228, _5200);
    float _5232 = fma(_5194, _5228, _5204);
    float _5234 = _5230 * 0.5;
    float _5236 = _5232 * 0.5;
    float _5238 = floor(_5236);
    float _5240 = floor(_5234);
    float _5242 = fma(_5238, 2.0, -32.0);
    float _5244 = -_5242;
    float _5246 = _5244 + _4604;
    float _5248 = fma(_5240, 2.0, -32.0);
    float _5250 = -_5248;
    float _5252 = _5250 + _4606;
    float _5254 = _5246 * 0.015625;
    float _5256 = _5252 * 0.015625;
    float2 _16262 = float2(_5254, _5256);
    float2 _5258 = dm_bs(spvDescriptorSet0.cp_t_tcb_26.sample(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_16262, float2(0.0), isnan(_16262)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_26, spvDescriptorSet0.cp_t_tcb_26Smplr_w, select(_16262, float2(0.0), isnan(_16262)), level(0.0)).xy;
    float _5260 = _5258.x;
    float _5262 = _5258.y;
    float2 _16274 = float2(_5206, _5208);
    float _5264 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16274, float2(0.0), isnan(_16274)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16274, float2(0.0), isnan(_16274)), level(0.0)).x;
    float2 _16282 = float2(_5210, _5212);
    float2 _5266 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16282, float2(0.0), isnan(_16282)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16282, float2(0.0), isnan(_16282)), level(0.0)).xy;
    float _5268 = _5266.x;
    float _5270 = _5266.y;
    float2 _16294 = float2(_5206, _5214);
    float _5272 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16294, float2(0.0), isnan(_16294)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16294, float2(0.0), isnan(_16294)), level(0.0)).x;
    float2 _16302 = float2(_5216, _5208);
    float _5274 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16302, float2(0.0), isnan(_16302)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16302, float2(0.0), isnan(_16302)), level(0.0)).x;
    float2 _16310 = float2(_5216, _5214);
    float _5276 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16310, float2(0.0), isnan(_16310)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16310, float2(0.0), isnan(_16310)), level(0.0)).x;
    float2 _16318 = float2(_5218, _5212);
    float _5278 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16318, float2(0.0), isnan(_16318)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16318, float2(0.0), isnan(_16318)), level(0.0)).x;
    float2 _16326 = float2(_5210, _5220);
    float _5280 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16326, float2(0.0), isnan(_16326)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16326, float2(0.0), isnan(_16326)), level(0.0)).x;
    float2 _16334 = float2(_5210, _5212);
    float _5282 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_16334, float2(0.0), isnan(_16334)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_16334, float2(0.0), isnan(_16334)), level(0.0)).y;
    float2 _16342 = float2(_5218, _5212);
    float2 _5284 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16342, float2(0.0), isnan(_16342)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16342, float2(0.0), isnan(_16342)), level(0.0)).xy;
    float _5286 = _5284.x;
    float _5288 = _5284.y;
    float2 _16354 = float2(_5210, _5220);
    float2 _5290 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16354, float2(0.0), isnan(_16354)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16354, float2(0.0), isnan(_16354)), level(0.0)).xy;
    float _5292 = _5290.x;
    float _5294 = _5290.y;
    float _5296 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[73]);
    float _5298 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[72]);
    float _5300 = _1866 * 19.23889923095703125;
    float _5302 = _5300 * 0.15915493667125701904296875;
    float _5304 = _5302 * 6.283185482025146484375;
    float _5306 = sin(_5304);
    float _5308 = _1860 * 19.23889923095703125;
    float _5310 = fma(_200, 3.1415927410125732421875, -1.57079637050628662109375);
    float _5312 = _5308 * 0.15915493667125701904296875;
    float _5314 = _5310 * 0.15915493667125701904296875;
    float _5316 = _5314 * 6.283185482025146484375;
    float _5318 = sin(_5316);
    float _5320 = _5306 * 34873.41015625;
    float _5322 = _5312 * 6.283185482025146484375;
    float _5324 = sin(_5322);
    float _5326 = _5314 * 6.283185482025146484375;
    float _5328 = cos(_5326);
    float _5330 = floor(_5320);
    float _5332 = 1.0 / _4100;
    float _5334 = _5324 * 34873.41015625;
    float _5336 = floor(_5334);
    float _5338 = -_5330;
    float _5340 = _5338 + _5320;
    float _5342 = _5332 * 59.999996185302734375;
    float _5344 = -_5336;
    float _5346 = _5334 + _5344;
    float _5348 = _5178 * _5342;
    float _5350 = _5262 * 14.99999904632568359375;
    float _5352 = _5260 * 14.99999904632568359375;
    float _5354 = _5350 * _5318;
    float _5356 = _5350 * _5328;
    float _5358 = _5350 * _5350;
    float _5360 = -_5354;
    float _5362 = fma(_5352, _5328, _5360);
    float _5364 = fma(_5352, _5318, _5356);
    float _5366 = _5268 * 2000.0;
    float _5368 = fma(_5352, _5352, _5358);
    float _5370 = _5180 * _5342;
    float _5372 = fma(_5340, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _5374 = -_5270;
    float _5376 = _5268 + _5374;
    float _5378 = _5366 + (-2.0);
    float _5380 = -_5268;
    float _5382 = _5380 + _5278;
    float _5384 = _5376 * 2000.0;
    float _5386 = -_5268;
    float _5388 = _5386 + _5280;
    bool _5390 = _4608 >= _5378;
    bool _5392 = isnan(_4608);
    bool _5394 = _5390 || _5392;
    bool _5396 = isnan(_5378);
    bool _5398 = _5394 || _5396;
    float _5400 = _5382 * 1000.0;
    float _5402 = _5388 * 1000.0;
    float _5404 = abs(_5384);
    bool _5406 = _5404 < 2.0;
    bool _5408 = !_5398;
    bool _5410 = _5406 || _5408;
    float _5412 = fma(_5400, _5400, 0.0625);
    float _5414 = -_5296;
    float _5416 = _5414 + 1.0;
    float _5418 = fma(_5402, _5402, _5412);
    float _5420 = fma(_206, _5296, _5416);
    float _5422 = fma(_5346, _5346, 0.0400000028312206268310546875);
    float _5424 = rsqrt(_5418);
    float _5426 = fma(_5372, _5372, _5422);
    float _5428 = -_5268;
    float _5430 = _5428 + _5264;
    float _5432 = -_5268;
    float _5434 = _5432 + _5272;
    float _5436 = _5182 * _5342;
    float _5438 = -_5268;
    float _5440 = _5438 + _5274;
    float _5442 = _5430 * 2000.0;
    float _5444 = _5434 * 2000.0;
    float _5446 = sqrt(_5426);
    float _5448 = -_5268;
    float _5450 = _5448 + _5276;
    float _5452 = _5440 * 2000.0;
    float _5454 = abs(_5442);
    float _5456 = abs(_5444);
    float _5458 = precise::max(_5454, _5456);
    float _5460 = sqrt(_5368);
    float _5462 = _5450 * 2000.0;
    float _5464 = _5424 * 0.25;
    float _5466 = abs(_5452);
    float _5468 = precise::max(_5458, _5466);
    float _5470 = abs(_5462);
    float _5472 = precise::max(_5468, _5470);
    bool _5474 = _5464 < 0.891006529331207275390625;
    bool _5476 = _5474 || _5410;
    float _5478 = _5446 + 9.9999997473787516355514526367188e-06;
    bool _5480 = _5472 >= 2.0;
    bool _5482 = isnan(_5472);
    bool _5484 = _5480 || _5482;
    bool _5486 = isnan(2.0);
    bool _5488 = _5484 || _5486;
    bool _5490 = _5488 || _5476;
    float _5492 = 1.0 / _5478;
    float _5494 = sqrt(_5460);
    float _5496 = _5270 * 2000.0;
    float _5498 = _5400;
    float _5500 = _5496;
    float _5502 = _5362;
    float _5504 = _5370;
    float _5506 = _5348;
    float _5508 = _5294;
    float _5510 = _5288;
    if (!_5490)
    {
        float _5512 = _5402 * _5424;
        float _5514 = _5400 * _5424;
        float _5516 = _5512 * _5512;
        float _5518 = fma(_5514, _5514, _5516);
        float _5520 = sqrt(_5518);
        bool _5522 = _5520 > 9.9999997473787516355514526367188e-05;
        float _5524 = _5516;
        if (_5522)
        {
            float _5526 = abs(_5514);
            float _5528 = abs(_5512);
            float _5530 = precise::max(_5526, _5528);
            _5498 = _5530;
        }
        float _5532 = _5498;
        float _5534 = 1.0 / _5464;
        if (!_5522)
        {
            _5524 = 0.0;
        }
        float _5536 = _5524;
        float _5538 = _5532;
        float _5540 = _5536;
        if (_5522)
        {
            float _5542 = 1.0 / _5532;
            _5538 = _5542;
        }
        float _5544 = _5538;
        float _5546 = _5520 * _5534;
        if (_5522)
        {
            float _5548 = _5520 * _5544;
            _5540 = _5548;
        }
        float _5550 = _5540;
        float _5552 = _5550 * 0.9649016857147216796875;
        float _5554 = -_5552;
        float _5556 = fma(_5554, _5546, _5366);
        _5500 = _5556;
    }
    float _5558 = _5500;
    float _5560 = -_5558;
    float _5562 = _4608 + _5560;
    float _5564 = _5492 * _5346;
    bool _5566 = _5494 >= 0.5;
    float _5568 = _5492 * 0.20000000298023223876953125;
    float _5570 = abs(_5562);
    float _5572 = _5570 * 0.20000000298023223876953125;
    float _5574 = precise::clamp(_5572, 0.0, 1.0);
    float _5576 = _4376 * _5564;
    float _5578 = -_5492;
    float _5580 = _5372 * _5578;
    bool _5582 = _5494 >= 1.0;
    float _5584 = -_5574;
    float _5586 = _5584 + 1.0;
    float _5588 = fma(_4212, _5568, _5576);
    float _5590 = _5298 * 300.0;
    float _5592 = _4218 * _5564;
    float _5594 = _5586 * _5586;
    float _5596 = _4230 * _5564;
    float _5598 = _5366 + (-2.0);
    float _5600 = fma(_4350, _5568, _5592);
    float _5602 = _5594 * _5594;
    float _5604 = _5298 * 500.0;
    float _5606 = fma(_4240, _5580, _5588);
    float _5608 = fma(_4234, _5568, _5596);
    float _5610 = _5420 * _5602;
    float _5612 = fma(_4236, _5580, _5600);
    float _5614 = -_5268;
    float _5616 = _5614 + _5286;
    float _5618 = -_5268;
    float _5620 = _5618 + _5292;
    float _5622 = _5588;
    float _5624 = _5604;
    float _5626 = _5568;
    if (_5566)
    {
        float _5628 = _5590 * _5610;
        _5622 = _5628;
    }
    float _5630 = _5622;
    float _5632 = _5630;
    if (_5582)
    {
        float _5634 = _5604 * _5610;
        _5624 = _5634;
    }
    float _5636 = _5624;
    float _5638 = fma(_4348, _5580, _5608);
    float _5640 = _4240 * 0.100000001490116119384765625;
    if (_5566)
    {
        float _5642 = _5362 * _5630;
        _5502 = _5642;
    }
    float _5644 = _5502;
    if (_5566)
    {
        float _5646 = _5364 * _5630;
        _5632 = _5646;
    }
    float _5648 = _5632;
    float _5650 = _5436;
    if (_5582)
    {
        float _5652 = _5494 * _5636;
        _5626 = _5652;
    }
    float _5654 = _5626;
    if (_5566)
    {
        float _5656 = fma(_4100, _5644, _5370);
        _5504 = _5656;
    }
    float _5658 = _5504;
    float _5660 = _4236 * 0.100000001490116119384765625;
    float _5662 = _4348 * 0.100000001490116119384765625;
    float _5664 = _5658;
    if (_5582)
    {
        float _5666 = fma(_4100, _5654, _5436);
        _5650 = _5666;
    }
    float _5668 = _5650;
    float _5670 = fma(_4212, 0.20000000298023223876953125, _5640);
    float _5672 = fma(_4350, 0.20000000298023223876953125, _5660);
    float _5674 = fma(_4234, 0.20000000298023223876953125, _5662);
    float _5676 = _4234 * (-0.20000000298023223876953125);
    float _5678 = _5668;
    if (_5566)
    {
        float _5680 = fma(_4100, _5648, _5348);
        _5506 = _5680;
    }
    float _5682 = _5506;
    float _5684 = _5672 * _4092;
    float _5686 = _5674 * _4094;
    float _5688 = _4212 * (-0.20000000298023223876953125);
    float _5690 = _5676 * _4094;
    float _5692 = -_5684;
    float _5694 = fma(_5670, _4094, _5692);
    float _5696 = _4350 * (-0.20000000298023223876953125);
    float _5698 = _5670 * _4096;
    float _5700 = -_5686;
    float _5702 = fma(_5672, _4096, _5700);
    float _5704 = _5688 * _4096;
    float _5706 = -_5668;
    float _5708 = _4946 + _5706;
    float _5710 = -_5690;
    float _5712 = fma(_5696, _4096, _5710);
    float _5714 = -_5698;
    float _5716 = fma(_5674, _4092, _5714);
    float _5718 = -_5658;
    float _5720 = _4948 + _5718;
    float _5722 = -_5704;
    float _5724 = fma(_5676, _4092, _5722);
    float _5726 = _5696 * _4092;
    float _5728 = _5708 + _5712;
    float _5730 = _5708 + _5702;
    float _5732 = -_5682;
    float _5734 = _4950 + _5732;
    float _5736 = _5720 + _5716;
    float _5738 = _5720 + _5724;
    float _5740 = -_5726;
    float _5742 = fma(_5688, _4094, _5740);
    float _5744 = _5728 * _5728;
    float _5746 = _5734 + _5694;
    float _5748 = -_5270;
    float _5750 = _5268 + _5748;
    float _5752 = _5734 + _5742;
    float _5754 = fma(_5738, _5738, _5744);
    float _5756 = _5730 * _5730;
    float _5758 = _5750 * 2000.0;
    bool _5760 = _4608 >= _5598;
    bool _5762 = isnan(_4608);
    bool _5764 = _5760 || _5762;
    bool _5766 = isnan(_5598);
    bool _5768 = _5764 || _5766;
    float _5770 = fma(_5752, _5752, _5754);
    float _5772 = fma(_5736, _5736, _5756);
    float _5774 = _5620 * 1000.0;
    float _5776 = abs(_5758);
    bool _5778 = _5776 < 2.0;
    bool _5780 = !_5768;
    bool _5782 = _5778 || _5780;
    float _5784 = rsqrt(_5770);
    float _5786 = fma(_5746, _5746, _5772);
    float _5788 = _4240 * 0.980571091175079345703125;
    float _5790 = _4348 * 0.980571091175079345703125;
    float _5792 = fma(_4376, 0.19611422717571258544921875, _5788);
    float _5794 = fma(_4230, 0.19611422717571258544921875, _5790);
    float _5796 = sqrt(_5770);
    float _5798 = rsqrt(_5786);
    float _5800 = _5738 * _5784;
    float _5802 = _5728 * _5784;
    float _5804 = _5752 * _5784;
    float _5806 = sqrt(_5786);
    bool _5808 = _5796 != 0.0;
    bool _5810 = isnan(_5796);
    bool _5812 = _5808 || _5810;
    bool _5814 = isnan(0.0);
    bool _5816 = _5812 || _5814;
    float _5818 = _5616 * 1000.0;
    float _5820 = _5816 ? _5802 : 0.0;
    float _5822 = fma(_5818, _5818, 0.0625);
    float _5824 = _5816 ? _5800 : 0.0;
    float _5826 = _5730 * _5798;
    float _5828 = _5736 * _5798;
    float _5830 = fma(_5774, _5774, _5822);
    float _5832 = _5746 * _5798;
    float _5834 = _5816 ? _5804 : 0.0;
    bool _5836 = _5806 != 0.0;
    bool _5838 = isnan(_5806);
    bool _5840 = _5836 || _5838;
    bool _5842 = isnan(0.0);
    bool _5844 = _5840 || _5842;
    float _5846 = _4236 * 0.980571091175079345703125;
    float _5848 = rsqrt(_5830);
    float _5850 = _5844 ? _5826 : 0.0;
    float _5852 = fma(_4218, 0.19611422717571258544921875, _5846);
    float _5854 = _5844 ? _5828 : 0.0;
    float _5856 = _5844 ? _5832 : 0.0;
    float _5858 = _5850 * _5792;
    float _5860 = fma(_5854, _5852, _5858);
    float _5862 = _5820 * _5606;
    float _5864 = fma(_5856, _5794, _5860);
    float _5866 = fma(_5824, _5612, _5862);
    float _5868 = _5786 * _5864;
    float _5870 = fma(_5834, _5638, _5866);
    float _5872 = _5848 * 0.25;
    float _5874 = _5794 * _5868;
    float _5876 = _5770 * _5870;
    float _5878 = _5852 * _5868;
    bool _5880 = _5872 < 0.891006529331207275390625;
    bool _5882 = _5880 || _5782;
    float _5884 = _5792 * _5868;
    float _5886 = _5606 * _5876;
    float _5888 = _5638 * _5876;
    bool _5890 = _5472 >= 2.0;
    bool _5892 = isnan(_5472);
    bool _5894 = _5890 || _5892;
    bool _5896 = isnan(2.0);
    bool _5898 = _5894 || _5896;
    bool _5900 = _5898 || _5882;
    float _5902 = -_5884;
    float _5904 = _5674 * _5902;
    float _5906 = -_5886;
    float _5908 = _5676 * _5906;
    float _5910 = _5612 * _5876;
    float _5912 = -_5874;
    float _5914 = -_5888;
    float _5916 = _5912 + _5914;
    float _5918 = -_5874;
    float _5920 = -_5904;
    float _5922 = fma(_5670, _5918, _5920);
    float _5924 = -_5888;
    float _5926 = -_5908;
    float _5928 = fma(_5688, _5924, _5926);
    float _5930 = -_5874;
    float _5932 = _5672 * _5930;
    float _5934 = -_5888;
    float _5936 = _5696 * _5934;
    float _5938 = -_5878;
    float _5940 = _5670 * _5938;
    float _5942 = -_5910;
    float _5944 = _5688 * _5942;
    float _5946 = -_5878;
    float _5948 = -_5932;
    float _5950 = fma(_5674, _5946, _5948);
    float _5952 = -_5910;
    float _5954 = -_5936;
    float _5956 = fma(_5676, _5952, _5954);
    float _5958 = -_5884;
    float _5960 = -_5940;
    float _5962 = fma(_5672, _5958, _5960);
    float _5964 = -_5886;
    float _5966 = -_5944;
    float _5968 = fma(_5696, _5964, _5966);
    float _5970 = _5922 + _5928;
    float _5972 = _5818 * _5848;
    float _5974 = -_5878;
    float _5976 = -_5910;
    float _5978 = _5974 + _5976;
    float _5980 = -_5884;
    float _5982 = -_5886;
    float _5984 = _5980 + _5982;
    float _5986 = _5950 + _5956;
    float _5988 = _5962 + _5968;
    float _5990 = _5774 * _5848;
    float _5992 = _2458 * 0.5;
    float _5994 = _2458 * 0.300000011920928955078125;
    bool _5996 = !_5900;
    float _5998 = _5978;
    float _6000 = _5916;
    float _6032;
    float _6034;
    float _6036;
    float _6038;
    if (!_5996)
    {
        float _6002 = -_5270;
        float _6004 = _6002 + _5288;
        float _6006 = -_5270;
        float _6008 = _6006 + _5294;
        float _6010 = _5270 * 2000.0;
        float _6012 = _6004 * 1000.0;
        float _6014 = _6008 * 1000.0;
        float _6016 = fma(_6012, _6012, 0.0625);
        float _6018 = fma(_6014, _6014, _6016);
        float _6020 = rsqrt(_6018);
        float _6022 = -_6012;
        float _6024 = fma(_6022, _6020, -0.0);
        float _6026 = -_6014;
        float _6028 = fma(_6026, _6020, -0.0);
        float _6030 = _6020 * 0.25;
        _6032 = _6010;
        _6034 = _6030;
        _6036 = _6024;
        _6038 = _6028;
        _6040 = true;
    }
    else
    {
        float _6042 = _5990 * _5990;
        float _6044 = 1.0 / _5872;
        float _6046 = -_5990;
        float _6048 = (-0.0) + _6046;
        float _6050 = fma(_5972, _5972, _6042);
        float _6052 = sqrt(_6050);
        bool _6054 = _6052 > 9.9999997473787516355514526367188e-05;
        float _6056 = _6052 * _6044;
        float _6058 = _6042;
        _6038 = _6048;
        _5510 = _6056;
        if (_6054)
        {
            float _6060 = abs(_5972);
            float _6062 = abs(_5990);
            float _6064 = precise::max(_6060, _6062);
            _5508 = _6064;
        }
        float _6066 = _5508;
        float _6068 = -_5972;
        float _6070 = (-0.0) + _6068;
        _6036 = _6070;
        if (!_6054)
        {
            _6058 = 0.0;
        }
        float _6072 = _6058;
        float _6074 = _6066;
        float _6076 = _6072;
        if (_6054)
        {
            float _6078 = 1.0 / _6066;
            _6074 = _6078;
        }
        float _6080 = _6074;
        if (_6054)
        {
            float _6082 = _6052 * _6080;
            _6076 = _6082;
        }
        float _6084 = _6076;
        float _6086 = _6084 * 0.9649016857147216796875;
        float _6088 = -_6086;
        float _6090 = fma(_6088, _6056, _5366);
        _6032 = _6090;
        _6034 = _5872;
    }
    _6040 = false;
    float _6092 = _6032;
    float _6094 = _6034;
    float _6096 = _6036;
    float _6098 = _6038;
    float _6100 = _5510;
    float _6102 = -_4608;
    float _6104 = _6102 + _6092;
    bool _6106 = _6092 >= _4608;
    bool _6108 = isnan(_6092);
    bool _6110 = _6106 || _6108;
    bool _6112 = isnan(_4608);
    bool _6114 = _6110 || _6112;
    float _6116 = -_6092;
    float _6118 = fma(_5282, 2000.0, _6116);
    bool _6120 = _6092 > _4608;
    float _6122 = _6104 * _6104;
    float _6124 = precise::max(_1666, 0.001000000047497451305389404296875);
    bool _6126 = !_6120;
    float _6128 = _6126 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _6130 = _4098 >= 0.5;
    float _6132 = sqrt(_6122);
    int _6134 = ~as_type<int>(_6128);
    int _6136 = _6134 + 1;
    int _6138 = _6136 + 1;
    float _6140 = abs(_6118);
    bool _6142 = _6140 >= 2.0;
    bool _6144 = isnan(_6140);
    bool _6146 = _6142 || _6144;
    bool _6148 = isnan(2.0);
    bool _6150 = _6146 || _6148;
    int _6152 = _6138;
    float _6154 = _6128;
    float _6156 = _6100;
    float _6158 = _6096;
    if (_6114)
    {
        int _6160 = ~as_type<int>(_6128);
        int _6162 = _6160 + 1;
        _6152 = _6162;
    }
    int _6164 = _6152;
    bool _6166 = _6094 >= 0.891006529331207275390625;
    bool _6168 = _6166 && _6150;
    float _6170 = float(_6164);
    float _6172 = precise::min(_6124, 10000.0);
    float _6174 = _6132 * _6170;
    bool _6176 = !_6130;
    float _6178 = _6174;
    float _6180 = _6132;
    float _6182 = _6170;
    float _6276;
    float _6278;
    float _6512;
    float _6514;
    float _6516;
    float _6518;
    float _6520;
    float _6522;
    float _6524;
    float _6560;
    float _6562;
    float _6564;
    if (!_6176)
    {
        bool _6184 = _4342 > _4190;
        bool _6186 = _4342 >= _4190;
        bool _6188 = isnan(_4342);
        bool _6190 = _6186 || _6188;
        bool _6192 = isnan(_4190);
        bool _6194 = _6190 || _6192;
        int _6196 = _6194 ? 0 : 1;
        int _6198 = ~_6196;
        int _6200 = _6198 + 1;
        int _6202 = _6200 + 1;
        int _6204 = _6202;
        int _6206 = _6194 ? (-1) : 0;
        if (!_6184)
        {
            int _6208 = ~_6196;
            int _6210 = _6208 + 1;
            _6204 = _6210;
        }
        int _6212 = _6204;
        bool _6214 = _4098 != 1.0;
        bool _6216 = isnan(_4098);
        bool _6218 = _6214 || _6216;
        bool _6220 = isnan(1.0);
        bool _6222 = _6218 || _6220;
        float _6224 = float(_6212);
        float _6226 = _4376 * _6224;
        float _6228 = _4218 * _6224;
        float _6230 = _4230 * _6224;
        float _6232 = _4946 * _6094;
        float _6234 = _6226 * _6094;
        float _6236 = fma(_4948, _6096, _6232);
        float _6238 = fma(_6228, _6096, _6234);
        float _6240 = fma(_4950, _6098, _6236);
        float _6242 = fma(_6230, _6098, _6238);
        float _6244 = abs(_6242);
        float _6246 = -_6244;
        float _6248 = _6246 + 1.0;
        bool _6250 = _6240 <= 0.0;
        float _6252 = float(_6250);
        float _6254 = abs(_6248);
        float _6256 = log2(_6254);
        float _6258 = _6240 * _6252;
        float _6260 = -_6258;
        float _6262 = fma(_6096, _6260, _4948);
        float _6264 = -_6258;
        float _6266 = fma(_6094, _6264, _4946);
        float _6268 = -_6258;
        float _6270 = fma(_6098, _6268, _4950);
        float _6272 = _6256 * 0.20000000298023223876953125;
        float _6274 = exp2(_6272);
        _6276 = _6262;
        _6278 = _6266;
        int _6324;
        float _6386;
        int _6388;
        float _6390;
        float _6392;
        if (!_6222)
        {
            float _6280 = _6266 * _6266;
            float _6282 = _4094 * 0.89999997615814208984375;
            float _6284 = _4092 * 0.89999997615814208984375;
            float _6286 = _4096 * 0.89999997615814208984375;
            float _6288 = fma(_6262, _6262, _6280);
            float _6290 = fma(_6270, _6270, _6288);
            float _6292 = sqrt(_6290);
            bool _6294 = _6292 > 0.5;
            bool _6296 = !_6294;
            if (!_6296)
            {
                bool _6298 = _6242 > 0.0;
                bool _6300 = _6242 >= 0.0;
                bool _6302 = isnan(_6242);
                bool _6304 = _6300 || _6302;
                bool _6306 = isnan(0.0);
                bool _6308 = _6304 || _6306;
                float _6310 = precise::max(_1834, 0.100000001490116119384765625);
                int _6312 = _6308 ? 0 : 1;
                float _6314 = precise::max(_1824, 0.100000001490116119384765625);
                int _6316 = ~_6312;
                int _6318 = _6316 + 1;
                int _6320 = _6318 + 1;
                int _6322 = _6320;
                _6206 = _6308 ? (-1) : 0;
                _6324 = _6298 ? (-1) : 0;
                if (!_6298)
                {
                    int _6326 = ~_6312;
                    int _6328 = _6326 + 1;
                    _6322 = _6328;
                }
                int _6330 = _6322;
                float _6332 = float(_6330);
                float _6334 = _6228 * _6332;
                float _6336 = _6230 * _6332;
                float _6338 = _6226 * _6332;
                float _6340 = _6270 * _6334;
                float _6342 = _6266 * _6336;
                float _6344 = -_6340;
                float _6346 = fma(_6262, _6336, _6344);
                float _6348 = _6262 * _6338;
                float _6350 = -_6342;
                float _6352 = fma(_6270, _6338, _6350);
                float _6354 = _6346 * _6346;
                float _6356 = -_6348;
                float _6358 = fma(_6266, _6334, _6356);
                float _6360 = fma(_6352, _6352, _6354);
                float _6362 = fma(_6358, _6358, _6360);
                float _6364 = _6310 + _6314;
                float _6366 = 1.0 / _6364;
                float _6368 = sqrt(_6362);
                float _6370 = _6366 * 0.4000000059604644775390625;
                float _6372 = _6292 * _6370;
                float _6374 = _6368 + 9.9999997473787516355514526367188e-06;
                float _6376 = 1.0 / _6374;
                float _6378 = _6372 * _6376;
                float _6380 = fma(_6352, _6378, _6282);
                float _6382 = fma(_6346, _6378, _6284);
                float _6384 = fma(_6358, _6378, _6286);
                _6386 = _6380;
                _6388 = 1065353216;
                _6390 = _6382;
                _6392 = _6384;
                _6394 = true;
            }
            else
            {
                bool _6396 = _6274 > 0.5;
                bool _6398 = _6174 > (-0.800000011920928955078125);
                bool _6400 = _6398 && _6396;
                bool _6402 = !_6400;
                int _6404 = _6402 ? 1065353216 : 1056964608;
                _6386 = _6282;
                _6324 = _6400 ? (-1) : 0;
                _6388 = _6404;
                _6390 = _6284;
                _6392 = _6286;
                _6394 = true;
            }
        }
        else
        {
            bool _6406 = _6242 > 0.0;
            bool _6408 = _6242 >= 0.0;
            bool _6410 = isnan(_6242);
            bool _6412 = _6408 || _6410;
            bool _6414 = isnan(0.0);
            bool _6416 = _6412 || _6414;
            int _6418 = _6416 ? 0 : 1;
            int _6420 = ~_6418;
            int _6422 = _6420 + 1;
            int _6424 = _6422 + 1;
            int _6426 = _6424;
            _6206 = _6416 ? (-1) : 0;
            if (!_6406)
            {
                int _6428 = ~_6418;
                int _6430 = _6428 + 1;
                _6426 = _6430;
            }
            int _6432 = _6426;
            bool _6434 = _6274 >= 0.300000011920928955078125;
            bool _6436 = isnan(_6274);
            bool _6438 = _6434 || _6436;
            bool _6440 = isnan(0.300000011920928955078125);
            bool _6442 = _6438 || _6440;
            float _6444 = float(_6432);
            int _6446 = _6442 ? as_type<int>(_4098) : 1065353216;
            float _6448 = _6230 * _6444;
            float _6450 = _6228 * _6444;
            float _6452 = _6226 * _6444;
            float _6454 = _6448 * _6094;
            float _6456 = _6450 * _6098;
            float _6458 = _6452 * _6096;
            float _6460 = -_6454;
            float _6462 = fma(_6452, _6098, _6460);
            float _6464 = _6274 * 10.0;
            float _6466 = -_6456;
            float _6468 = fma(_6448, _6096, _6466);
            float _6470 = -_6458;
            float _6472 = fma(_6450, _6094, _6470);
            float _6474 = _6464 * _6462;
            float _6476 = _6464 * _6468;
            float _6478 = _6464 * _6472;
            _6386 = _6474;
            _6324 = _6442 ? (-1) : 0;
            _6388 = _6446;
            _6390 = _6476;
            _6392 = _6478;
        }
        _6394 = false;
        int _6480 = _6206;
        float _6482 = _6386;
        int _6484 = _6324;
        int _6486 = _6388;
        float _6488 = _6390;
        float _6490 = _6392;
        bool _6492 = _6104 >= (-0.20000000298023223876953125);
        bool _6494 = isnan(_6104);
        bool _6496 = _6492 || _6494;
        bool _6498 = isnan(-0.20000000298023223876953125);
        bool _6500 = _6496 || _6498;
        float _6502 = _5658 * 0.20000000298023223876953125;
        float _6504 = _5668 * 0.20000000298023223876953125;
        float _6506 = _5682 * 0.20000000298023223876953125;
        int _6508 = _6480;
        int _6510 = _6484;
        _6512 = _6504;
        _5998 = _6502;
        _6000 = _6506;
        _6514 = 0.0;
        _6516 = 0.0;
        _6518 = 0.0;
        _6520 = _6270;
        _6522 = _6488;
        _6524 = _6490;
        if (_6500)
        {
            bool _6526 = _6174 > 2.0;
            _6508 = _6526 ? (-1) : 0;
        }
        int _6528 = _6508;
        if (!_6500)
        {
            _6510 = -1;
        }
        int _6530 = _6510;
        int _6532 = _6530;
        if (_6500)
        {
            bool _6534 = _6104 >= (-0.20000000298023223876953125);
            int _6536 = (_6534 ? (-1) : 0) & _6528;
            _6532 = _6536;
        }
        int _6538 = _6532;
        int _6540 = ~_6538;
        bool _6542 = !_6168;
        int _6544 = _6540 & (_6542 ? (-1) : 0);
        bool _6546 = !_6168;
        int _6548 = _6538 & (_6546 ? (-1) : 0);
        int _6550 = _6544 | _6548;
        int _6552 = _6538 & (_6168 ? (-1) : 0);
        int _6554 = _6550 | _6552;
        int _6556 = ~_6554;
        float _6558 = (_6556 != 0) ? as_type<float>(_6486) : 0.0;
        _6560 = _6558;
        _6562 = 0.0;
        _6564 = _6482;
        _6566 = true;
    }
    else
    {
        bool _6568 = _6174 < 0.0;
        bool _6570 = _6568 && _6168;
        bool _6572 = _6174 > (-0.800000011920928955078125);
        bool _6574 = _6572 && _6570;
        if (_6574)
        {
            float _6576 = _4946 * _6094;
            _6178 = _6576;
        }
        float _6578 = _6178;
        float _6580 = _6578;
        if (!_6574)
        {
            _6180 = 0.0;
        }
        float _6582 = _6180;
        float _6584 = _6582;
        if (!_6574)
        {
            _5664 = _5984;
        }
        float _6586 = _5664;
        float _6588 = _6586;
        if (_6574)
        {
            float _6590 = fma(_4948, _6096, _6578);
            _6580 = _6590;
        }
        float _6592 = _6580;
        float _6594 = _6592;
        if (!_6574)
        {
            _6154 = _5970;
        }
        float _6596 = _6154;
        float _6598 = _6596;
        if (!_6574)
        {
            _6156 = _5986;
        }
        float _6600 = _6156;
        float _6602 = _6600;
        if (_6574)
        {
            float _6604 = fma(_4950, _6098, _6592);
            _6594 = _6604;
        }
        float _6606 = _6594;
        float _6608 = _6606;
        if (!_6574)
        {
            _5678 = _5988;
        }
        float _6610 = _5678;
        float _6612 = _6610;
        if (!_6574)
        {
            _1984 = _4092;
        }
        float _6614 = _1984;
        float _6616 = _6614;
        if (_6574)
        {
            float _6618 = -_6096;
            float _6620 = fma(_6618, _6606, _4948);
            _4974 = _6620;
        }
        float _6622 = _4974;
        _6276 = _6622;
        if (_6574)
        {
            float _6624 = -_6094;
            float _6626 = fma(_6624, _6606, _4946);
            _4976 = _6626;
        }
        float _6628 = _4976;
        _6278 = _6628;
        if (_6574)
        {
            float _6630 = -_6098;
            float _6632 = fma(_6630, _6606, _4950);
            _4978 = _6632;
        }
        float _6634 = _4978;
        _6520 = _6634;
        if (!_6574)
        {
            _6608 = _4094;
        }
        float _6636 = _6608;
        float _6638 = _6636;
        if (!_6574)
        {
            _1986 = _4096;
        }
        float _6640 = _1986;
        float _6642 = _6640;
        if (!_6574)
        {
            _6182 = _4098;
        }
        float _6644 = _6182;
        _6560 = _6644;
        if (_6574)
        {
            _6584 = _6104;
        }
        float _6646 = _6584;
        _6562 = _6646;
        if (_6574)
        {
            _6588 = _5984;
        }
        float _6648 = _6588;
        _6512 = _6648;
        if (_6574)
        {
            _6598 = _5970;
        }
        float _6650 = _6598;
        _6514 = _6650;
        if (_6574)
        {
            _6602 = _5986;
        }
        float _6652 = _6602;
        _6516 = _6652;
        if (_6574)
        {
            _6612 = _5988;
        }
        float _6654 = _6612;
        _6518 = _6654;
        if (_6574)
        {
            _6638 = _4094;
        }
        float _6656 = _6638;
        _6564 = _6656;
        if (_6574)
        {
            _6616 = _4092;
        }
        float _6658 = _6616;
        _6522 = _6658;
        if (_6574)
        {
            _6642 = _4096;
        }
        float _6660 = _6642;
        _6524 = _6660;
        if (_6574)
        {
            _6560 = 0.5;
        }
    }
    _6566 = false;
    float _6662 = _6560;
    float _6664 = _6512;
    float _6666 = _5998;
    float _6668 = _6000;
    float _6670 = _6276;
    float _6672 = _6278;
    float _6674 = _6514;
    float _6676 = _6516;
    float _6678 = _6518;
    float _6680 = _6520;
    float _6682 = _6562;
    float _6684 = _6522;
    float _6686 = _6564;
    float _6688 = _6524;
    float _6690 = 1.0 / _6172;
    bool _6692 = _6662 >= 0.5;
    float _6694 = _6690 * _6664;
    float _6696 = _6690 * _6666;
    float _6698 = _6690 * _6668;
    float _6700 = _6694 * _6694;
    float _6702 = fma(_6696, _6696, _6700);
    float _6704 = fma(_6698, _6698, _6702);
    float _6706 = _2458 * _2458;
    float _6708 = _5994 * _5994;
    float _6710 = sqrt(_6704);
    float _6712 = fma(_5992, _5992, _6706);
    float _6714 = fma(_5994, _5994, _6706);
    float _6716 = fma(_5992, _5992, _6708);
    float _6718 = _6712 * 0.083333335816860198974609375;
    float _6720 = _6714 * 0.083333335816860198974609375;
    float _6722 = _6716 * 0.083333335816860198974609375;
    float _6724 = _4218 * _6718;
    float _6726 = _4376 * _6718;
    float _6728 = _4230 * _6718;
    float _6730 = _4350 * _6720;
    float _6732 = _4218 * _6724;
    float _6734 = _4376 * _6724;
    float _6736 = _4230 * _6724;
    bool _6738 = _6710 > 80.0;
    float _6740 = _4376 * _6726;
    float _6742 = _4376 * _6728;
    float _6744 = _4230 * _6726;
    float _6746 = _4230 * _6728;
    float _6748 = _4212 * _6720;
    float _6750 = _4218 * _6726;
    float _6752 = fma(_4350, _6730, _6732);
    float _6754 = fma(_4212, _6730, _6734);
    float _6756 = fma(_4234, _6730, _6736);
    float _6758 = _4234 * _6720;
    float _6760 = _4218 * _6728;
    float _6762 = fma(_4350, _6748, _6750);
    float _6764 = _6730;
    float _6766 = _6762;
    float _6768 = _6748;
    float _6770 = _6674;
    float _6772 = _6672;
    if (_6738)
    {
        float _6774 = rsqrt(_6704);
        _6764 = _6774;
    }
    float _6776 = _6764;
    float _6778 = _4236 * _6722;
    float _6780 = _4240 * _6722;
    float _6782 = fma(_4212, _6758, _6742);
    float _6784 = fma(_4234, _6758, _6746);
    float _6786 = _4348 * _6722;
    float _6788 = fma(_4350, _6758, _6760);
    float _6790 = fma(_4236, _6778, _6752);
    float _6792 = fma(_4240, _6778, _6754);
    float _6794 = fma(_4234, _6748, _6744);
    float _6796 = fma(_4348, _6778, _6756);
    float _6798 = fma(_4240, _6786, _6782);
    float _6800 = fma(_4348, _6786, _6784);
    float _6802 = fma(_4212, _6748, _6740);
    float _6804 = fma(_4348, _6780, _6794);
    float _6806 = _6798 * _6796;
    float _6808 = _6792 * _6800;
    float _6810 = fma(_4236, _6780, _6762);
    float _6812 = fma(_4236, _6786, _6788);
    float _6814 = fma(_4240, _6780, _6802);
    float _6816 = _6776;
    float _6818 = _6792;
    float _6820 = _6790;
    float _6822 = _6796;
    if (_6738)
    {
        float _6824 = _6776 * 80.0;
        _4278 = _6824;
    }
    float _6826 = _4278;
    float _6828 = _6798 * _6804;
    float _6830 = -_6806;
    float _6832 = _6808 + _6830;
    if (!_6738)
    {
        _6766 = _6696;
    }
    float _6834 = _6766;
    float _6836 = _6834;
    if (_6738)
    {
        float _6838 = _6696 * _6826;
        _6836 = _6838;
    }
    float _6840 = _6836;
    if (!_6738)
    {
        _6768 = _6694;
    }
    float _6842 = _6768;
    float _6844 = _6842;
    if (_6738)
    {
        float _6846 = _6694 * _6826;
        _6844 = _6846;
    }
    float _6848 = _6844;
    if (!_6738)
    {
        _6816 = _6698;
    }
    float _6850 = _6816;
    float _6852 = _6850;
    if (_6738)
    {
        float _6854 = _6698 * _6826;
        _6852 = _6854;
    }
    float _6856 = _6852;
    float _6858 = _6814 * _6796;
    float _6860 = -_6828;
    float _6862 = fma(_6814, _6800, _6860);
    float _6864 = _6810 * _6832;
    float _6866 = _6798 * _4092;
    float _6868 = -_6858;
    float _6870 = fma(_6792, _6804, _6868);
    float _6872 = _6792 * _4092;
    float _6874 = -_6864;
    float _6876 = fma(_6790, _6862, _6874);
    float _6878 = _6814 * _4092;
    float _6880 = fma(_6812, _4094, _6866);
    float _6882 = fma(_6790, _4094, _6872);
    float _6884 = fma(_6812, _6870, _6876);
    float _6886 = fma(_6810, _4094, _6878);
    float _6888 = fma(_6800, _4096, _6880);
    float _6890 = fma(_6796, _4096, _6882);
    float _6892 = _4100 * 0.01666666753590106964111328125;
    bool _6894 = _6884 != 0.0;
    bool _6896 = isnan(_6884);
    bool _6898 = _6894 || _6896;
    bool _6900 = isnan(0.0);
    bool _6902 = _6898 || _6900;
    float _6904 = fma(_6804, _4096, _6886);
    float _6906 = _6888 * _4092;
    float _6908 = _6890 * _4096;
    float _6910 = fma(_6892, _6840, _6670);
    float _6912 = _6904 * _4094;
    float _6914 = -_6906;
    float _6916 = fma(_6904, _4096, _6914);
    float _6918 = -_6908;
    float _6920 = fma(_6888, _4094, _6918);
    float _6922 = fma(_6892, _6848, _6672);
    float _6924 = -_6912;
    float _6926 = fma(_6890, _4092, _6924);
    float _6928 = _6916 + _6674;
    float _6930 = _6920 + _6676;
    float _6932 = _6912;
    float _6934 = _6922;
    float _6936 = _6910;
    float _6938 = _6922;
    if (!_6902)
    {
        _6770 = _6804;
    }
    float _6940 = _6770;
    float _6942 = _6940;
    if (!_6902)
    {
        _6772 = _6800;
    }
    float _6944 = _6772;
    float _6946 = _6944;
    if (!_6902)
    {
        _6932 = _6814;
    }
    float _6948 = _6932;
    float _6950 = _6948;
    if (!_6902)
    {
        _4114 = _6798;
    }
    float _6952 = _4114;
    float _6954 = _6952;
    if (!_6902)
    {
        _4116 = _6810;
    }
    float _6956 = _4116;
    float _6958 = _6956;
    if (!_6902)
    {
        _4118 = _6812;
    }
    float _6960 = _4118;
    bool _6962 = !_6902;
    float _6964 = _6960;
    if (!_6962)
    {
        float _6966 = 1.0 / _6884;
        float _6968 = _6790 * _6798;
        float _6970 = _6810 * _6800;
        float _6972 = _6812 * _6814;
        float _6974 = _6790 * _6804;
        float _6976 = -_6968;
        float _6978 = fma(_6812, _6792, _6976);
        float _6980 = _6812 * _6796;
        float _6982 = _6810 * _6792;
        float _6984 = -_6970;
        float _6986 = fma(_6812, _6804, _6984);
        float _6988 = -_6972;
        float _6990 = fma(_6810, _6798, _6988);
        float _6992 = -_6808;
        float _6994 = _6992 + _6806;
        float _6996 = -_6974;
        float _6998 = fma(_6810, _6796, _6996);
        float _7000 = -_6980;
        float _7002 = fma(_6790, _6800, _7000);
        float _7004 = -_6982;
        float _7006 = fma(_6790, _6814, _7004);
        float _7008 = _6986 * _6966;
        float _7010 = _6990 * _6966;
        float _7012 = _6994 * _6966;
        float _7014 = _6978 * _6966;
        float _7016 = _6862 * _6966;
        float _7018 = _6870 * _6966;
        float _7020 = _7002 * _6966;
        float _7022 = _6998 * _6966;
        float _7024 = _7006 * _6966;
        _6818 = _7012;
        _6950 = _7020;
        _6954 = _7014;
        _6820 = _7016;
        _6958 = _7008;
        _6964 = _7010;
        _6822 = _7018;
        _6942 = _7022;
        _6946 = _7024;
    }
    float _7026 = _6818;
    float _7028 = _6950;
    float _7030 = _6954;
    float _7032 = _6820;
    float _7034 = _6958;
    float _7036 = _6964;
    float _7038 = _6822;
    float _7040 = _6942;
    float _7042 = _6946;
    float _7044 = _6930 * _7026;
    float _7046 = _6930 * _7028;
    float _7048 = _6930 * _7030;
    float _7050 = _6926 + _6678;
    float _7052 = fma(_6928, _7032, _7044);
    float _7054 = fma(_6928, _7034, _7046);
    float _7056 = fma(_6928, _7036, _7048);
    float _7058 = fma(_6892, _6856, _6680);
    float _7060 = fma(_7050, _7038, _7052);
    float _7062 = fma(_7050, _7040, _7054);
    float _7064 = fma(_7050, _7042, _7056);
    bool _7066 = !_6692;
    float _7068 = _7058;
    float _7070 = _7058;
    float _7072 = _7062;
    float _7074 = _7060;
    float _7076 = _7064;
    if (!_7066)
    {
        float _7078 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
        float _7080 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
        float _7082 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
        float _7084 = _6922 * _6922;
        float _7086 = fma(_6910, _6910, _7084);
        float _7088 = fma(_7058, _7058, _7086);
        float _7090 = sqrt(_7088);
        float _7092 = _7090 + 9.9999997473787516355514526367188e-06;
        float _7094 = 1.0 / _7092;
        float _7096 = _6910 * _7094;
        float _7098 = _7058 * _7094;
        if (_1672)
        {
            float _7100 = _7080 * _4628;
            _4690 = _7100;
        }
        float _7102 = _4690;
        float _7104 = _7102;
        if (_1672)
        {
            float _7106 = _7080 * _4652;
            _4704 = _7106;
        }
        float _7108 = _4704;
        float _7110 = _7108;
        if (_1672)
        {
            float _7112 = _7080 * _4676;
            _4722 = _7112;
        }
        float _7114 = _4722;
        float _7116 = _6922 * _7094;
        float _7118 = _7114;
        if (_1672)
        {
            float _7120 = fma(_7078, _4626, _7102);
            _7104 = _7120;
        }
        float _7122 = _7104;
        if (_1672)
        {
            float _7124 = fma(_7078, _4650, _7108);
            _7110 = _7124;
        }
        float _7126 = _7110;
        if (_1672)
        {
            float _7128 = fma(_7078, _4674, _7114);
            _7118 = _7128;
        }
        float _7130 = _7118;
        if (_1672)
        {
            float _7132 = fma(_7082, _4630, _7122);
            _4692 = _7132;
        }
        float _7134 = _4692;
        float _7136 = _7134;
        float _7138 = _7134;
        if (_1672)
        {
            float _7140 = fma(_7082, _4654, _7126);
            _4706 = _7140;
        }
        float _7142 = _4706;
        float _7144 = _7142;
        float _7146 = _7142;
        if (_1672)
        {
            float _7148 = fma(_7082, _4678, _7130);
            _4724 = _7148;
        }
        float _7150 = _4724;
        float _7152 = _7150;
        float _7154 = _7150;
        if (!_1672)
        {
            bool _7156 = !_1752;
            if (!_7156)
            {
                uint _7158 = uint(int(uint(_182) >> uint(2)));
                float _7160 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7158)]);
                int _7162 = _182 + 4;
                uint _7164 = uint(int(uint(_7162) >> uint(2)));
                float _7166 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7164)]);
                int _7168 = _182 + 8;
                uint _7170 = uint(int(uint(_7168) >> uint(2)));
                float _7172 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7170)]);
                uint _7174 = uint(int(uint(_182) >> uint(2)));
                float _7176 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7174)]);
                int _7178 = _182 + 4;
                uint _7180 = uint(int(uint(_7178) >> uint(2)));
                float _7182 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7180)]);
                int _7184 = _182 + 8;
                uint _7186 = uint(int(uint(_7184) >> uint(2)));
                float _7188 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7186)]);
                uint _7190 = uint(int(uint(_182) >> uint(2)));
                float _7192 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7190)]);
                int _7194 = _182 + 4;
                uint _7196 = uint(int(uint(_7194) >> uint(2)));
                float _7198 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7196)]);
                int _7200 = _182 + 8;
                uint _7202 = uint(int(uint(_7200) >> uint(2)));
                float _7204 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7202)]);
                float _7206 = _7166 * _7080;
                float _7208 = _7182 * _7080;
                float _7210 = _7198 * _7080;
                float _7212 = fma(_7160, _7078, _7206);
                float _7214 = fma(_7176, _7078, _7208);
                float _7216 = fma(_7192, _7078, _7210);
                float _7218 = fma(_7172, _7082, _7212);
                float _7220 = fma(_7188, _7082, _7214);
                float _7222 = fma(_7204, _7082, _7216);
                _7146 = _7220;
                _7138 = _7218;
                _7154 = _7222;
                _7224 = true;
            }
            else
            {
                if (!_1956)
                {
                    _7136 = _7078;
                }
                float _7226 = _7136;
                _7138 = _7226;
                if (!_1956)
                {
                    _7144 = _7080;
                }
                float _7228 = _7144;
                _7146 = _7228;
                if (!_1956)
                {
                    _7152 = _7082;
                }
                float _7230 = _7152;
                bool _7232 = !_1956;
                _7154 = _7230;
                if (!_7232)
                {
                    uint _7234 = uint(int(uint(_182) >> uint(2)));
                    float _7236 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7234)]);
                    int _7238 = _182 + 4;
                    uint _7240 = uint(int(uint(_7238) >> uint(2)));
                    float _7242 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7240)]);
                    int _7244 = _182 + 8;
                    uint _7246 = uint(int(uint(_7244) >> uint(2)));
                    float _7248 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7246)]);
                    uint _7250 = uint(int(uint(_182) >> uint(2)));
                    float _7252 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7250)]);
                    int _7254 = _182 + 4;
                    uint _7256 = uint(int(uint(_7254) >> uint(2)));
                    float _7258 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7256)]);
                    int _7260 = _182 + 8;
                    uint _7262 = uint(int(uint(_7260) >> uint(2)));
                    float _7264 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7262)]);
                    uint _7266 = uint(int(uint(_182) >> uint(2)));
                    float _7268 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7266)]);
                    int _7270 = _182 + 4;
                    uint _7272 = uint(int(uint(_7270) >> uint(2)));
                    float _7274 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7272)]);
                    int _7276 = _182 + 8;
                    uint _7278 = uint(int(uint(_7276) >> uint(2)));
                    float _7280 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7278)]);
                    float _7282 = _7242 * _7080;
                    float _7284 = _7258 * _7080;
                    float _7286 = _7274 * _7080;
                    float _7288 = fma(_7236, _7078, _7282);
                    float _7290 = fma(_7252, _7078, _7284);
                    float _7292 = fma(_7268, _7078, _7286);
                    float _7294 = fma(_7248, _7082, _7288);
                    float _7296 = fma(_7264, _7082, _7290);
                    float _7298 = fma(_7280, _7082, _7292);
                    _7146 = _7296;
                    _7138 = _7294;
                    _7154 = _7298;
                }
            }
        }
        _7224 = false;
        float _7300 = _7146;
        float _7302 = _7138;
        float _7304 = _7154;
        float _7306 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
        float _7308 = _7306 * 59.999996185302734375;
        float _7310 = _7300 * _7308;
        float _7312 = _7302 * _7308;
        float _7314 = _4100 * _7310;
        float _7316 = _7304 * _7308;
        float _7318 = _4100 * _7312;
        float _7320 = _7314 * _6094;
        float _7322 = _4100 * _7316;
        float _7324 = fma(_7318, _6096, _7320);
        float _7326 = fma(_7322, _6098, _7324);
        float _7328 = -_6094;
        float _7330 = fma(_7326, _7328, _7314);
        float _7332 = -_6096;
        float _7334 = fma(_7326, _7332, _7318);
        float _7336 = -_6098;
        float _7338 = fma(_7326, _7336, _7322);
        float _7340 = _7330 * _7330;
        float _7342 = fma(_7334, _7334, _7340);
        float _7344 = fma(_7338, _7338, _7342);
        float _7346 = sqrt(_7344);
        float _7348 = _7346 + 9.9999997473787516355514526367188e-06;
        float _7350 = 1.0 / _7348;
        float _7352 = _7330 * _7350;
        float _7354 = _7334 * _7350;
        float _7356 = _7338 * _7350;
        float _7358 = _6922 * _7352;
        float _7360 = fma(_6910, _7354, _7358);
        float _7362 = fma(_7058, _7356, _7360);
        float _7364 = _7362 * 0.5;
        bool _7366 = _7362 >= 0.0;
        float _7368 = float(_7366);
        float _7370 = precise::min(_7346, _7364);
        float _7372 = _7370 * _7368;
        float _7374 = -_7372;
        float _7376 = fma(_7352, _7374, _6922);
        float _7378 = -_7372;
        float _7380 = fma(_7354, _7378, _6910);
        float _7382 = -_7372;
        float _7384 = fma(_7356, _7382, _7058);
        float _7386 = _7376 * _7376;
        float _7388 = fma(_7380, _7380, _7386);
        float _7390 = fma(_7384, _7384, _7388);
        float _7392 = sqrt(_7390);
        bool _7394 = _7392 > 0.5;
        bool _7396 = isnan(_7392);
        bool _7398 = _7394 || _7396;
        bool _7400 = isnan(0.5);
        bool _7402 = _7398 || _7400;
        float _7404 = _7388;
        float _7406 = _7356;
        _6158 = _7392;
        if (!_7402)
        {
            float _7408 = _1668 * 20.0;
            _7404 = _7408;
        }
        float _7410 = _7404;
        float _7412 = _7410;
        if (_7402)
        {
            float _7414 = _1668 * 10.0;
            _7068 = _7414;
        }
        float _7416 = _7068;
        float _7418 = _7416;
        if (!_7402)
        {
            float _7420 = _4100 * _7410;
            _7412 = _7420;
        }
        float _7422 = _7412;
        float _7424 = _7422;
        if (_7402)
        {
            float _7426 = _4100 * _7416;
            _7418 = _7426;
        }
        float _7428 = _7418;
        float _7430 = _7428;
        if (!_7402)
        {
            float _7432 = _7422 * 0.01666666753590106964111328125;
            _7424 = _7432;
        }
        float _7434 = _7424;
        float _7436 = _7434;
        if (_7402)
        {
            float _7438 = _7428 * 0.01666666753590106964111328125;
            _7430 = _7438;
        }
        float _7440 = _7430;
        float _7442 = _7440;
        if (!_7402)
        {
            float _7444 = precise::min(_7392, _7434);
            _1988 = _7444;
        }
        float _7446 = _1988;
        _1990 = _7446;
        if (_7402)
        {
            float _7448 = precise::min(_7392, _7440);
            _7406 = _7448;
        }
        float _7450 = _7406;
        _4694 = _7450;
        if (!_7402)
        {
            float _7452 = -_7096;
            float _7454 = fma(_7452, _7446, _7380);
            _7436 = _7454;
        }
        float _7456 = _7436;
        float _7458 = _7456;
        if (!_7402)
        {
            float _7460 = -_7116;
            float _7462 = fma(_7460, _7446, _7376);
            _6934 = _7462;
        }
        float _7464 = _6934;
        float _7466 = _7464;
        if (!_7402)
        {
            float _7468 = -_7098;
            float _7470 = fma(_7468, _7446, _7384);
            _7442 = _7470;
        }
        float _7472 = _7442;
        _7070 = _7472;
        if (_7402)
        {
            float _7474 = -_7096;
            float _7476 = fma(_7474, _7450, _7380);
            _7458 = _7476;
        }
        float _7478 = _7458;
        _6936 = _7478;
        if (_7402)
        {
            float _7480 = -_7116;
            float _7482 = fma(_7480, _7450, _7376);
            _7466 = _7482;
        }
        float _7484 = _7466;
        _6938 = _7484;
        if (_7402)
        {
            float _7486 = -_7098;
            float _7488 = fma(_7486, _7450, _7384);
            _7070 = _7488;
        }
    }
    float _7490 = _4694;
    float _7492 = _6936;
    float _7494 = _6158;
    float _7496 = _6938;
    float _7498 = _7070;
    float _7500 = _1990;
    bool _7502 = !_1672;
    float _7504 = _7490;
    float _7506 = _7500;
    float _7508 = _7494;
    float _7582;
    float _7584;
    float _7586;
    if (!_7502)
    {
        float _7510 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7512 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7514 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7516 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7518 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _7520 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _7522 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _7524 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _7526 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _7528 = _7514 * _7516;
        float _7530 = _7514 * _7518;
        float _7532 = -_7528;
        float _7534 = fma(_7510, _7520, _7532);
        float _7536 = -_7530;
        float _7538 = fma(_7512, _7520, _7536);
        float _7540 = _7512 * _7516;
        float _7542 = _7526 * _7516;
        float _7544 = _7524 * _7534;
        float _7546 = _7522 * _7518;
        float _7548 = -_7540;
        float _7550 = fma(_7510, _7518, _7548);
        float _7552 = -_7542;
        float _7554 = fma(_7522, _7520, _7552);
        float _7556 = -_7544;
        float _7558 = fma(_7522, _7538, _7556);
        float _7560 = -_7546;
        float _7562 = fma(_7524, _7516, _7560);
        float _7564 = fma(_7526, _7550, _7558);
        float _7566 = _7524 * _7520;
        float _7568 = -_7566;
        float _7570 = fma(_7526, _7518, _7568);
        float _7572 = 1.0 / _7564;
        float _7574 = _7572 * _6682;
        float _7576 = _7570 * _7574;
        float _7578 = _7554 * _7574;
        float _7580 = _7562 * _7574;
        _7582 = _7576;
        _7584 = _7580;
        _7586 = _7578;
        _7588 = true;
    }
    else
    {
        bool _7590 = _1750 != 0;
        bool _7592 = _1954 != 0;
        bool _7594 = _7592 || _7590;
        if (!_7594)
        {
            _7504 = 0.0;
        }
        float _7596 = _7504;
        _7582 = _7596;
        if (!_7594)
        {
            _7506 = _6682;
        }
        float _7598 = _7506;
        _7586 = _7598;
        if (!_7594)
        {
            _7508 = 0.0;
        }
        float _7600 = _7508;
        bool _7602 = !_7594;
        _7584 = _7600;
        if (!_7602)
        {
            uint _7604 = uint(int(uint(_182) >> uint(2)));
            float _7606 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7604)]);
            int _7608 = _182 + 4;
            uint _7610 = uint(int(uint(_7608) >> uint(2)));
            float _7612 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7610)]);
            int _7614 = _182 + 8;
            uint _7616 = uint(int(uint(_7614) >> uint(2)));
            float _7618 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7616)]);
            uint _7620 = uint(int(uint(_182) >> uint(2)));
            float _7622 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7620)]);
            int _7624 = _182 + 4;
            uint _7626 = uint(int(uint(_7624) >> uint(2)));
            float _7628 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7626)]);
            int _7630 = _182 + 8;
            uint _7632 = uint(int(uint(_7630) >> uint(2)));
            float _7634 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7632)]);
            uint _7636 = uint(int(uint(_182) >> uint(2)));
            float _7638 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7636)]);
            int _7640 = _182 + 4;
            uint _7642 = uint(int(uint(_7640) >> uint(2)));
            float _7644 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7642)]);
            int _7646 = _182 + 8;
            uint _7648 = uint(int(uint(_7646) >> uint(2)));
            float _7650 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7648)]);
            float _7652 = _7618 * _7622;
            float _7654 = _7618 * _7628;
            float _7656 = _7612 * _7622;
            float _7658 = -_7652;
            float _7660 = fma(_7606, _7634, _7658);
            float _7662 = -_7654;
            float _7664 = fma(_7612, _7634, _7662);
            float _7666 = -_7656;
            float _7668 = fma(_7606, _7628, _7666);
            float _7670 = _7644 * _7660;
            float _7672 = _7638 * _7628;
            float _7674 = -_7670;
            float _7676 = fma(_7638, _7664, _7674);
            float _7678 = _7644 * _7634;
            float _7680 = -_7672;
            float _7682 = fma(_7644, _7622, _7680);
            float _7684 = fma(_7650, _7668, _7676);
            float _7686 = _7650 * _7622;
            float _7688 = -_7678;
            float _7690 = fma(_7650, _7628, _7688);
            float _7692 = -_7686;
            float _7694 = fma(_7638, _7634, _7692);
            float _7696 = 1.0 / _7684;
            float _7698 = _7696 * _6682;
            float _7700 = _7690 * _7698;
            float _7702 = _7694 * _7698;
            float _7704 = _7682 * _7698;
            _7582 = _7700;
            _7584 = _7704;
            _7586 = _7702;
        }
    }
    _7588 = false;
    float _7706 = _7582;
    float _7708 = _7584;
    float _7710 = _7586;
    float _7712 = _7492 * 0.01666666753590106964111328125;
    float _7714 = _4252 + _7706;
    float _7716 = _4250 + _7708;
    float _7718 = _7496 * 0.01666666753590106964111328125;
    float _7720 = _7498 * 0.01666666753590106964111328125;
    bool _7722 = !_1672;
    float _7724 = _7708;
    float _7846;
    float _7848;
    float _7850;
    if (!_7722)
    {
        float _7726 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7728 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7730 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7732 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7734 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _7736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _7738 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _7740 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _7742 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _7744 = _7730 * _7732;
        float _7746 = _7730 * _7734;
        float _7748 = _7728 * _7732;
        float _7750 = -_7744;
        float _7752 = fma(_7726, _7736, _7750);
        float _7754 = -_7746;
        float _7756 = fma(_7728, _7736, _7754);
        float _7758 = -_7748;
        float _7760 = fma(_7726, _7734, _7758);
        float _7762 = _7742 * _7728;
        float _7764 = _7740 * _7752;
        float _7766 = _7740 * _7736;
        float _7768 = _7742 * _7732;
        float _7770 = _7738 * _7734;
        float _7772 = -_7764;
        float _7774 = fma(_7738, _7756, _7772);
        float _7776 = -_7762;
        float _7778 = fma(_7740, _7730, _7776);
        float _7780 = -_7770;
        float _7782 = fma(_7740, _7732, _7780);
        float _7784 = fma(_7742, _7760, _7774);
        float _7786 = _7740 * _7726;
        float _7788 = 1.0 / _7784;
        float _7790 = -_7786;
        float _7792 = fma(_7738, _7728, _7790);
        float _7794 = _7738 * _7730;
        float _7796 = -_7766;
        float _7798 = fma(_7742, _7734, _7796);
        float _7800 = -_7768;
        float _7802 = fma(_7738, _7736, _7800);
        float _7804 = -_7726;
        float _7806 = fma(_7804, _7736, _7744);
        float _7808 = -_7794;
        float _7810 = fma(_7742, _7726, _7808);
        float _7812 = _7798 * _7788;
        float _7814 = _7802 * _7788;
        float _7816 = _7782 * _7788;
        float _7818 = _7806 * _7788;
        float _7820 = _7718 * _7812;
        float _7822 = _7718 * _7814;
        float _7824 = _7718 * _7816;
        float _7826 = _7712 * _7788;
        float _7828 = _7778 * _7788;
        float _7830 = _7810 * _7788;
        float _7832 = _7792 * _7788;
        float _7834 = fma(_7756, _7826, _7820);
        float _7836 = fma(_7712, _7818, _7822);
        float _7838 = fma(_7760, _7826, _7824);
        float _7840 = fma(_7720, _7828, _7834);
        float _7842 = fma(_7720, _7830, _7836);
        float _7844 = fma(_7720, _7832, _7838);
        _7846 = _7840;
        _7848 = _7842;
        _7850 = _7844;
        _7852 = true;
    }
    else
    {
        bool _7854 = _1750 != 0;
        bool _7856 = _1954 != 0;
        bool _7858 = _7856 || _7854;
        if (!_7858)
        {
            _1818 = _7712;
        }
        float _7860 = _1818;
        _7846 = _7860;
        if (!_7858)
        {
            _1960 = _7718;
        }
        float _7862 = _1960;
        _7848 = _7862;
        if (!_7858)
        {
            _7724 = _7720;
        }
        float _7864 = _7724;
        bool _7866 = !_7858;
        _7850 = _7864;
        if (!_7866)
        {
            uint _7868 = uint(int(uint(_182) >> uint(2)));
            float _7870 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7868)]);
            int _7872 = _182 + 4;
            uint _7874 = uint(int(uint(_7872) >> uint(2)));
            float _7876 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7874)]);
            int _7878 = _182 + 8;
            uint _7880 = uint(int(uint(_7878) >> uint(2)));
            float _7882 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7880)]);
            uint _7884 = uint(int(uint(_182) >> uint(2)));
            float _7886 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7884)]);
            int _7888 = _182 + 4;
            uint _7890 = uint(int(uint(_7888) >> uint(2)));
            float _7892 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7890)]);
            int _7894 = _182 + 8;
            uint _7896 = uint(int(uint(_7894) >> uint(2)));
            float _7898 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7896)]);
            uint _7900 = uint(int(uint(_182) >> uint(2)));
            float _7902 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7900)]);
            int _7904 = _182 + 4;
            uint _7906 = uint(int(uint(_7904) >> uint(2)));
            float _7908 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7906)]);
            int _7910 = _182 + 8;
            uint _7912 = uint(int(uint(_7910) >> uint(2)));
            float _7914 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7912)]);
            float _7916 = _7882 * _7886;
            float _7918 = _7882 * _7892;
            float _7920 = _7876 * _7886;
            float _7922 = -_7916;
            float _7924 = fma(_7870, _7898, _7922);
            float _7926 = -_7918;
            float _7928 = fma(_7876, _7898, _7926);
            float _7930 = -_7920;
            float _7932 = fma(_7870, _7892, _7930);
            float _7934 = _7908 * _7870;
            float _7936 = _7908 * _7924;
            float _7938 = _7914 * _7876;
            float _7940 = _7902 * _7892;
            float _7942 = -_7934;
            float _7944 = fma(_7902, _7876, _7942);
            float _7946 = -_7936;
            float _7948 = fma(_7902, _7928, _7946);
            float _7950 = _7908 * _7898;
            float _7952 = _7914 * _7886;
            float _7954 = -_7938;
            float _7956 = fma(_7908, _7882, _7954);
            float _7958 = fma(_7914, _7932, _7948);
            float _7960 = _7902 * _7882;
            float _7962 = -_7950;
            float _7964 = fma(_7914, _7892, _7962);
            float _7966 = -_7952;
            float _7968 = fma(_7902, _7898, _7966);
            float _7970 = 1.0 / _7958;
            float _7972 = -_7940;
            float _7974 = fma(_7908, _7886, _7972);
            float _7976 = -_7960;
            float _7978 = fma(_7914, _7870, _7976);
            float _7980 = -_7870;
            float _7982 = fma(_7980, _7898, _7916);
            float _7984 = _7964 * _7970;
            float _7986 = _7968 * _7970;
            float _7988 = _7974 * _7970;
            float _7990 = _7712 * _7970;
            float _7992 = _7984 * _7718;
            float _7994 = _7986 * _7718;
            float _7996 = _7988 * _7718;
            float _7998 = _7982 * _7970;
            float _8000 = _7956 * _7970;
            float _8002 = _7978 * _7970;
            float _8004 = fma(_7928, _7990, _7992);
            float _8006 = _7944 * _7970;
            float _8008 = fma(_7998, _7712, _7994);
            float _8010 = fma(_7932, _7990, _7996);
            float _8012 = fma(_8000, _7720, _8004);
            float _8014 = fma(_8002, _7720, _8008);
            float _8016 = fma(_8006, _7720, _8010);
            _7846 = _8012;
            _7848 = _8014;
            _7850 = _8016;
        }
    }
    _7852 = false;
    float _8018 = _7846;
    float _8020 = _7848;
    float _8022 = _7850;
    float _8024 = _7062 * _7062;
    float _8026 = _4100 * (-0.0291463173925876617431640625);
    float _8028 = fma(_7060, _7060, _8024);
    float _8030 = exp2(_8026);
    float _8032 = fma(_7064, _7064, _8028);
    float _8034 = sqrt(_8032);
    float _8036 = _8034 * 0.01666666753590106964111328125;
    bool _8038 = _8036 > 1.57079637050628662109375;
    float _8040 = _8036;
    if (_8038)
    {
        float _8042 = rsqrt(_8032);
        _8040 = _8042;
    }
    float _8044 = _8040;
    float _8046 = _8044;
    if (_8038)
    {
        float _8048 = _8044 * 94.24777984619140625;
        _8046 = _8048;
    }
    float _8050 = _8046;
    if (_8038)
    {
        float _8052 = _7062 * _8050;
        _7072 = _8052;
    }
    float _8054 = _7072;
    if (_8038)
    {
        float _8056 = _7060 * _8050;
        _7074 = _8056;
    }
    float _8058 = _7074;
    if (_8038)
    {
        float _8060 = _7064 * _8050;
        _7076 = _8060;
    }
    float _8062 = _7076;
    float _8064 = fma(_6892, _8054, _6684);
    float _8066 = fma(_6892, _8058, _6686);
    float _8068 = fma(_6892, _8062, _6688);
    float _8070 = _8064 * _8030;
    float _8072 = _8066 * _8030;
    float _8074 = _8068 * _8030;
    float _8076 = _8070 * _8070;
    float _8078 = fma(_8072, _8072, _8076);
    float _8080 = fma(_8074, _8074, _8078);
    float _8082 = sqrt(_8080);
    bool _8084 = _8082 > 31.4159259796142578125;
    float _8086 = _8082;
    float _8088 = _8068;
    float _8090 = _8070;
    float _8092 = _8072;
    float _8094 = _8074;
    if (_8084)
    {
        float _8096 = rsqrt(_8080);
        _8086 = _8096;
    }
    float _8098 = _8086;
    if (_8084)
    {
        float _8100 = _8098 * 31.4159259796142578125;
        _8088 = _8100;
    }
    float _8102 = _8088;
    if (_8084)
    {
        float _8104 = _8070 * _8102;
        _8090 = _8104;
    }
    float _8106 = _8090;
    if (_8084)
    {
        float _8108 = _8072 * _8102;
        _8092 = _8108;
    }
    float _8110 = _8092;
    if (_8084)
    {
        float _8112 = _8074 * _8102;
        _8094 = _8112;
    }
    float _8114 = _8094;
    float _8116 = _6892 * _8106;
    float _8118 = _6892 * _8110;
    float _8120 = _6892 * _8114;
    float _8122 = _8116 * _8116;
    float _8124 = fma(_8118, _8118, _8122);
    float _8126 = fma(_8120, _8120, _8124);
    float _8128 = sqrt(_8126);
    float _8130 = rsqrt(_8126);
    float _8132 = _8128 * 0.5;
    bool _8134 = _8128 != 0.0;
    bool _8136 = isnan(_8128);
    bool _8138 = _8134 || _8136;
    bool _8140 = isnan(0.0);
    bool _8142 = _8138 || _8140;
    float _8144 = _8132 * 0.15915493667125701904296875;
    float _8146 = _8144 * 6.283185482025146484375;
    float _8148 = sin(_8146);
    float _8150 = _8116 * _8130;
    float _8152 = _8120 * _8130;
    float _8154 = _8118 * _8130;
    float _8156 = _8142 ? _8150 : 0.0;
    float _8158 = _8142 ? _8152 : 0.0;
    float _8160 = _8144 * 6.283185482025146484375;
    float _8162 = cos(_8160);
    float _8164 = _8142 ? _8154 : 0.0;
    float _8166 = _8156 * _8148;
    float _8168 = _8158 * _8148;
    float _8170 = _8164 * _8148;
    float _8172 = _8166 * _4078;
    float _8174 = _8168 * _4084;
    float _8176 = _8166 * _4084;
    float _8178 = _8166 * _4072;
    float _8180 = -_8172;
    float _8182 = fma(_8170, _4084, _8180);
    float _8184 = -_8174;
    float _8186 = fma(_8166, _4080, _8184);
    float _8188 = _8168 * _4072;
    float _8190 = _8170 * _4072;
    float _8192 = _8170 * _4080;
    float _8194 = fma(_8170, _4078, _8176);
    float _8196 = fma(_8162, _4084, _8178);
    float _8198 = fma(_8162, _4080, _8188);
    float _8200 = fma(_8162, _4078, _8190);
    float _8202 = -_8192;
    float _8204 = fma(_8168, _4078, _8202);
    float _8206 = fma(_8168, _4080, _8194);
    float _8208 = _8198 + _8182;
    float _8210 = _8200 + _8186;
    float _8212 = _8196 + _8204;
    float _8214 = -_8206;
    float _8216 = fma(_8162, _4072, _8214);
    uint _8218 = uint(int(uint(_1638) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8218)] = as_type<uint>(_8210);
    int _8220 = _1638 + 4;
    uint _8222 = uint(int(uint(_8220) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8222)] = as_type<uint>(_8212);
    int _8224 = _1638 + 8;
    uint _8226 = uint(int(uint(_8224) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8226)] = as_type<uint>(_8208);
    int _8228 = _1638 + 12;
    uint _8230 = uint(int(uint(_8228) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8230)] = as_type<uint>(_8216);
    uint _8232 = uint(int(uint(_1754) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8232)] = as_type<uint>(_8110);
    int _8234 = _1754 + 4;
    uint _8236 = uint(int(uint(_8234) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8236)] = as_type<uint>(_8106);
    int _8238 = _1754 + 8;
    uint _8240 = uint(int(uint(_8238) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8240)] = as_type<uint>(_8114);
    int _8242 = _1754 + 12;
    uint _8244 = uint(int(uint(_8242) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8244)] = as_type<uint>(_6662);
    float _8246 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _8248 = _182 + 4;
    float _8250 = -_240;
    float _8252 = _8250 + _7714;
    uint _8254 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8254)] = as_type<uint>(_280);
    float _8256 = -_252;
    float _8258 = _8256 + _7716;
    int _8260 = _182 + 8;
    uint _8262 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8262)] = as_type<uint>(_7714);
    float _8264 = _4248 + _8246;
    float _8266 = _8264 + _7710;
    float _8268 = -_246;
    float _8270 = _8268 + _8266;
    uint _8272 = uint(int(uint(_8248) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8272)] = as_type<uint>(_8266);
    uint _8274 = uint(int(uint(_8260) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8274)] = as_type<uint>(_7716);
    uint _8276 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_8276)] = as_type<uint>(_8018);
    uint _8278 = uint(int(uint(_8248) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_8278)] = as_type<uint>(_8020);
    uint _8280 = uint(int(uint(_8260) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_8280)] = as_type<uint>(_8022);
    uint _8282 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8282)] = as_type<uint>(_8252);
    uint _8284 = uint(int(uint(_8248) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8284)] = as_type<uint>(_8270);
    uint _8286 = uint(int(uint(_8260) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8286)] = as_type<uint>(_8258);
    float _8288 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _8290 = _8270 * _8270;
    float _8292 = _8020 * _8020;
    float _8294 = fma(_8252, _8252, _8290);
    float _8296 = fma(_8018, _8018, _8292);
    float _8298 = fma(_8258, _8258, _8294);
    float _8300 = fma(_8022, _8022, _8296);
    float _8302 = sqrt(_8298);
    float _8304 = sqrt(_8300);
    bool _8306 = _8302 >= 9.9999999747524270787835121154785e-07;
    bool _8308 = isnan(_8302);
    bool _8310 = _8306 || _8308;
    bool _8312 = isnan(9.9999999747524270787835121154785e-07);
    bool _8314 = _8310 || _8312;
    float _8316 = _8304;
    if (!_8314)
    {
        bool _8318 = _190 != _194;
        bool _8320 = isnan(_190);
        bool _8322 = _8318 || _8320;
        bool _8324 = isnan(_194);
        bool _8326 = _8322 || _8324;
        _8328 = _8326;
        if (!_8328)
        {
            float _8330 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _8332 = _8330 > 0.0;
            bool _8334 = !_8332;
            if (!_8334)
            {
                float _8336 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _8338 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _8340 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _8342 = _8338 * _8338;
                float _8344 = fma(_8336, _8336, _8342);
                float _8346 = fma(_8340, _8340, _8344);
                float _8348 = rsqrt(_8346);
                float _8350 = _8348 * 9.9999999747524270787835121154785e-07;
                float _8352 = _8336 * _8350;
                float _8354 = _8338 * _8350;
                float _8356 = _8340 * _8350;
                _416 = as_type<int>(_8352);
                _418 = as_type<int>(_8354);
                _420 = as_type<int>(_8356);
                _8328 = true;
            }
            else
            {
                bool _8358 = _8304 >= 9.9999999747524270787835121154785e-07;
                bool _8360 = isnan(_8304);
                bool _8362 = _8358 || _8360;
                bool _8364 = isnan(9.9999999747524270787835121154785e-07);
                bool _8366 = _8362 || _8364;
                if (!_8366)
                {
                    float _8368 = _8266 * _8266;
                    float _8370 = fma(_7714, _7714, _8368);
                    float _8372 = fma(_7716, _7716, _8370);
                    float _8374 = sqrt(_8372);
                    bool _8376 = _8374 >= 9.9999999747524270787835121154785e-07;
                    bool _8378 = isnan(_8374);
                    bool _8380 = _8376 || _8378;
                    bool _8382 = isnan(9.9999999747524270787835121154785e-07);
                    bool _8384 = _8380 || _8382;
                    float _8386 = _8374;
                    if (_8384)
                    {
                        float _8388 = rsqrt(_8372);
                        _8386 = _8388;
                    }
                    float _8390 = _8386;
                    if (!_8384)
                    {
                        _404 = 0;
                    }
                    int _8392 = _404;
                    int _8394 = _8392;
                    if (!_8384)
                    {
                        _406 = 897988541;
                    }
                    int _8396 = _406;
                    int _8398 = _8396;
                    if (!_8384)
                    {
                        _408 = 0;
                    }
                    int _8400 = _408;
                    int _8402 = _8400;
                    if (_8384)
                    {
                        float _8404 = _8390 * 9.9999999747524270787835121154785e-07;
                        _8316 = _8404;
                    }
                    float _8406 = _8316;
                    if (_8384)
                    {
                        float _8408 = _7714 * _8406;
                        _8394 = as_type<int>(_8408);
                    }
                    int _8410 = _8394;
                    _416 = _8410;
                    if (_8384)
                    {
                        float _8412 = _8266 * _8406;
                        _8398 = as_type<int>(_8412);
                    }
                    int _8414 = _8398;
                    _418 = _8414;
                    if (_8384)
                    {
                        float _8416 = _7716 * _8406;
                        _8402 = as_type<int>(_8416);
                    }
                    int _8418 = _8402;
                    _420 = _8418;
                    _8328 = true;
                }
                else
                {
                    float _8420 = rsqrt(_8300);
                    float _8422 = _8420 * 9.9999999747524270787835121154785e-07;
                    float _8424 = _8018 * _8422;
                    float _8426 = _8020 * _8422;
                    float _8428 = _8022 * _8422;
                    _416 = as_type<int>(_8424);
                    _418 = as_type<int>(_8426);
                    _420 = as_type<int>(_8428);
                    _8328 = true;
                }
            }
        }
    }
    else
    {
        float _8430 = _8304 * _8288;
        bool _8432 = _8430 >= 0.001000000047497451305389404296875;
        bool _8434 = isnan(_8430);
        bool _8436 = _8432 || _8434;
        bool _8438 = isnan(0.001000000047497451305389404296875);
        bool _8440 = _8436 || _8438;
        bool _8442 = _8430 > 0.0;
        bool _8444 = !_8440;
        bool _8446 = _8442 && _8444;
        bool _8448 = _8302 < 0.001000000047497451305389404296875;
        bool _8450 = _8448 && _8446;
        if (!_8450)
        {
            _410 = as_type<int>(_8252);
        }
        int _8452 = _410;
        int _8454 = _8452;
        if (_8450)
        {
            float _8456 = _8288 * _8018;
            _8454 = as_type<int>(_8456);
        }
        int _8458 = _8454;
        _416 = _8458;
        if (!_8450)
        {
            _412 = as_type<int>(_8270);
        }
        int _8460 = _412;
        int _8462 = _8460;
        if (_8450)
        {
            float _8464 = _8288 * _8020;
            _8462 = as_type<int>(_8464);
        }
        int _8466 = _8462;
        _418 = _8466;
        if (!_8450)
        {
            _414 = as_type<int>(_8258);
        }
        int _8468 = _414;
        _420 = _8468;
        if (_8450)
        {
            float _8470 = _8288 * _8022;
            _420 = as_type<int>(_8470);
        }
    }
    _8328 = false;
    int _8472 = _416;
    int _8474 = _418;
    int _8476 = _420;
    uint _8478 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8478)] = uint(_8472);
    uint _8480 = uint(int(uint(_8248) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8480)] = uint(_8474);
    uint _8482 = uint(int(uint(_8260) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8482)] = uint(_8476);
}

