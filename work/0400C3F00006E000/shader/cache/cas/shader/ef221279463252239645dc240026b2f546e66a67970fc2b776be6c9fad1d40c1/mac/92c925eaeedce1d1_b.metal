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
void _87(thread const int& _25137, thread const int& _25138, thread const int& _25139, thread const int& _25140, thread int& _25141, thread int& _25142, thread int& _25143, thread int& _25144, thread int& _25145)
{
    float _25148 = as_type<float>(_25139) + 0.0;
    bool _25150 = _25148 != 0.0;
    bool _25152 = isnan(_25148);
    bool _25154 = _25150 || _25152;
    bool _25156 = isnan(0.0);
    bool _25158 = _25154 || _25156;
    int _25160 = as_type<int>(_25148);
    int _25162 = _25138;
    int _25164 = _25158 ? (-1) : 0;
    if (!_25158)
    {
        float _25166 = as_type<float>(_25139) * 1.0;
        _25160 = as_type<int>(_25166);
    }
    int _25168 = _25160;
    bool _25170 = !_25158;
    int _25172 = _25168;
    if (!_25170)
    {
        float _25174 = as_type<float>(_25139) + 0.0;
        bool _25176 = _25174 >= 0.0;
        bool _25178 = isnan(_25174);
        bool _25180 = _25176 || _25178;
        bool _25182 = isnan(0.0);
        bool _25184 = _25180 || _25182;
        int _25186 = as_type<int>(_25174);
        _25164 = _25184 ? (-1) : 0;
        if (!_25184)
        {
            _25186 = 2147483647;
        }
        int _25188 = _25186;
        bool _25190 = !_25184;
        _25172 = _25188;
        if (!_25190)
        {
            float _25192 = as_type<float>(_25139) + 0.0;
            bool _25194 = _25192 > as_type<float>(0x7f800000u /* inf */);
            bool _25196 = isnan(_25192);
            bool _25198 = _25194 || _25196;
            bool _25200 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _25202 = _25198 || _25200;
            int _25204 = as_type<int>(_25192);
            _25164 = _25202 ? (-1) : 0;
            if (_25202)
            {
                float _25206 = as_type<float>(_25139) + 1.0;
                _25204 = as_type<int>(_25206);
            }
            int _25208 = _25204;
            _25172 = _25208;
            if (!_25202)
            {
                float _25210 = 0.0 + as_type<float>(_25139);
                bool _25212 = _25210 != as_type<float>(0x7f800000u /* inf */);
                bool _25214 = isnan(_25210);
                bool _25216 = _25212 || _25214;
                bool _25218 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _25220 = _25216 || _25218;
                int _25222 = as_type<int>(_25210);
                _25164 = _25220 ? (-1) : 0;
                if (!_25220)
                {
                    _25222 = _25139;
                }
                int _25224 = _25222;
                bool _25226 = !_25220;
                _25172 = _25224;
                if (!_25226)
                {
                    float _25228 = as_type<float>(_25139) * 18446744073709551616.0;
                    float _25230 = rsqrt(_25228);
                    float _25232 = _25228 * _25230;
                    float _25234 = _25230 * 0.5;
                    float _25236 = -_25232;
                    float _25238 = 0.0 + _25236;
                    float _25240 = fma(_25234, _25238, 0.5);
                    float _25242 = fma(_25232, _25240, _25232);
                    float _25244 = -_25242;
                    float _25246 = 0.0 + _25244;
                    float _25248 = fma(_25242, _25246, _25228);
                    float _25250 = fma(_25234, _25248, _25242);
                    float _25252 = _25250 * 2.3283064365386962890625e-10;
                    _25172 = as_type<int>(_25252);
                    _25162 = as_type<int>(_25242);
                }
            }
        }
    }
    int _25254 = _25172;
    int _25256 = _25162;
    int _25258 = _25164;
    _25141 = _25254;
    _25142 = _25140;
    _25143 = 0;
    _25144 = _25256;
    _25145 = _25258;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _9948 = false;
    bool _8310 = false;
    bool _8014 = false;
    bool _7626 = false;
    bool _6978 = false;
    bool _6810 = false;
    bool _6454 = false;
    bool _5518 = false;
    bool _5260 = false;
    bool _4882 = false;
    bool _3996 = false;
    bool _3340 = false;
    bool _3382 = false;
    bool _3170 = false;
    bool _926 = false;
    float _91 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _93 = as_type<float>(gl_LocalInvocationID.x);
    float _95 = as_type<float>(gl_WorkGroupID.x);
    int _97 = as_type<int>(_95) << 5;
    int _99 = _97 + as_type<int>(_93);
    float _101 = trunc(_91);
    int _103 = int(_101);
    bool _107 = _99 >= _103;
    int _109 = 0;
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
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _182 = _99 << 4;
    int _184 = as_type<int>(_178) & 512;
    bool _186 = _184 != 0;
    uint _188 = uint(int(uint(_182) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_188)]);
    int _192 = _182 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_194)]);
    int _198 = _182 + 8;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_200)]);
    int _204 = _182 + 12;
    uint _206 = uint(int(uint(_182) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_206)]);
    int _210 = _182 + 4;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_212)]);
    int _216 = _182 + 8;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_218)]);
    uint _222 = uint(int(uint(_182) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_222)]);
    int _226 = _182 + 4;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    float _230 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_228)]);
    int _232 = _182 + 8;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_234)]);
    float _238 = 0.0;
    float _240 = 0.0;
    float _242 = 0.0;
    if (_186)
    {
        float _244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _238 = _244;
        _240 = _246;
        _242 = _248;
    }
    float _250 = _238;
    float _252 = _240;
    float _254 = _242;
    float _256 = 0.0;
    float _258 = 0.0;
    float _260 = 0.0;
    if (_186)
    {
        float _262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _256 = _262;
        _258 = _264;
        _260 = _266;
    }
    float _268 = _256;
    float _270 = _258;
    float _272 = _260;
    float _274 = 0.0;
    float _276 = 0.0;
    float _278 = 0.0;
    if (_186)
    {
        float _280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _282 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _284 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _274 = _280;
        _276 = _282;
        _278 = _284;
    }
    float _286 = _274;
    float _288 = _276;
    float _290 = _278;
    uint _292 = uint(int(uint(_182) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_292)]);
    int _296 = _182 + 4;
    uint _298 = uint(int(uint(_296) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_298)]);
    uint _302 = uint(int(uint(_204) >> uint(2)));
    float _304 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_302)]);
    uint _306 = uint(int(uint(_204) >> uint(2)));
    float _308 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_306)]);
    float _310 = _268;
    float _312 = _250;
    float _314 = _286;
    float _316 = _270;
    float _318 = _252;
    float _320 = _288;
    float _322 = _272;
    float _324 = _254;
    float _326 = _290;
    float _328 = _268;
    float _330 = _270;
    float _332 = _250;
    float _334 = _272;
    float _336 = _252;
    float _338 = _286;
    float _340 = _254;
    float _342 = _288;
    float _344 = _290;
    float _346 = _236;
    float _348 = _230;
    int _350 = as_type<int>(_208);
    int _352 = as_type<int>(_214);
    int _354 = as_type<int>(_220);
    int _356 = as_type<int>(_208);
    int _358 = as_type<int>(_214);
    int _360 = as_type<int>(_220);
    int _362 = as_type<int>(_208);
    int _364 = as_type<int>(_214);
    int _366 = as_type<int>(_220);
    if (!_186)
    {
        int _368 = _182 + 4;
        int _370 = _182 + 8;
        uint _372 = uint(int(uint(_182) >> uint(2)));
        float _374 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_372)]);
        uint _376 = uint(int(uint(_368) >> uint(2)));
        float _378 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_376)]);
        uint _380 = uint(int(uint(_370) >> uint(2)));
        float _382 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_380)]);
        uint _384 = uint(int(uint(_182) >> uint(2)));
        float _386 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_384)]);
        uint _388 = uint(int(uint(_368) >> uint(2)));
        float _390 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_388)]);
        uint _392 = uint(int(uint(_370) >> uint(2)));
        float _394 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_392)]);
        uint _396 = uint(int(uint(_182) >> uint(2)));
        float _398 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_396)]);
        uint _400 = uint(int(uint(_368) >> uint(2)));
        float _402 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_400)]);
        uint _404 = uint(int(uint(_370) >> uint(2)));
        float _406 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_404)]);
        float _408 = _374 * _374;
        float _410 = _378 * _378;
        float _412 = _382 * _382;
        float _414 = fma(_386, _386, _408);
        float _416 = fma(_390, _390, _410);
        float _418 = fma(_394, _394, _412);
        float _420 = fma(_398, _398, _414);
        float _422 = fma(_402, _402, _416);
        float _424 = fma(_406, _406, _418);
        float _426 = sqrt(_420);
        float _428 = sqrt(_422);
        float _430 = sqrt(_424);
        bool _432 = _426 > 0.0;
        bool _434 = _428 > 0.0;
        bool _436 = _430 > 0.0;
        float _438 = 0.0;
        if (_432)
        {
            float _440 = rsqrt(_420);
            _438 = _440;
        }
        float _442 = _438;
        float _444 = _428;
        if (_434)
        {
            float _446 = rsqrt(_422);
            _444 = _446;
        }
        float _448 = _444;
        float _450 = _430;
        if (_436)
        {
            float _452 = rsqrt(_424);
            _450 = _452;
        }
        float _454 = _450;
        if (!_432)
        {
            _310 = 0.0;
        }
        float _456 = _310;
        float _458 = _456;
        if (_432)
        {
            float _460 = _374 * _442;
            _458 = _460;
        }
        float _462 = _458;
        _328 = _462;
        if (!_432)
        {
            _312 = 0.0;
        }
        float _464 = _312;
        float _466 = _464;
        if (_432)
        {
            float _468 = _386 * _442;
            _466 = _468;
        }
        float _470 = _466;
        _332 = _470;
        if (!_432)
        {
            _314 = 0.0;
        }
        float _472 = _314;
        float _474 = _472;
        if (_432)
        {
            float _476 = _398 * _442;
            _474 = _476;
        }
        float _478 = _474;
        _338 = _478;
        if (!_434)
        {
            _316 = 0.0;
        }
        float _480 = _316;
        float _482 = _480;
        if (_434)
        {
            float _484 = _378 * _448;
            _482 = _484;
        }
        float _486 = _482;
        _330 = _486;
        if (!_434)
        {
            _318 = 0.0;
        }
        float _488 = _318;
        float _490 = _488;
        if (_434)
        {
            float _492 = _390 * _448;
            _490 = _492;
        }
        float _494 = _490;
        _336 = _494;
        if (!_434)
        {
            _320 = 0.0;
        }
        float _496 = _320;
        float _498 = _496;
        if (_434)
        {
            float _500 = _402 * _448;
            _498 = _500;
        }
        float _502 = _498;
        _342 = _502;
        if (!_436)
        {
            _322 = 0.0;
        }
        float _504 = _322;
        float _506 = _504;
        if (!_436)
        {
            _324 = 0.0;
        }
        float _508 = _324;
        float _510 = _508;
        if (_436)
        {
            float _512 = _382 * _454;
            _506 = _512;
        }
        float _514 = _506;
        _334 = _514;
        if (!_436)
        {
            _326 = 0.0;
        }
        float _516 = _326;
        _344 = _516;
        if (_436)
        {
            float _518 = _394 * _454;
            _510 = _518;
        }
        float _520 = _510;
        _340 = _520;
        if (_436)
        {
            float _522 = _406 * _454;
            _344 = _522;
        }
    }
    float _524 = _328;
    float _526 = _330;
    float _528 = _332;
    float _530 = _334;
    float _532 = _336;
    float _534 = _338;
    float _536 = _340;
    float _538 = _342;
    float _540 = _344;
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[27]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[24]);
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[25]);
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[26]);
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[27]);
    float _564 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _566 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _568 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _570 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _572 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _574 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _576 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    float _578 = abs(_180);
    float _580 = log2(_578);
    uint _582 = uint(int(uint(_204) >> uint(2)));
    float _584 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_582)]);
    float _586 = _544 * _548;
    float _588 = _542 * _548;
    float _590 = _550 * _580;
    float _592 = _586 * _524;
    float _594 = _546 * _548;
    float _596 = trunc(_552);
    int _598 = int(_596);
    float _600 = _586 * _526;
    float _602 = fma(_588, _528, _592);
    float _604 = _586 * _530;
    float _606 = exp2(_590);
    float _608 = fma(_588, _532, _600);
    float _610 = fma(_594, _534, _602);
    float _612 = fma(_588, _536, _604);
    bool _614 = _554 > 0.0;
    float _616 = fma(_594, _538, _608);
    float _618 = _550 * _610;
    float _620 = fma(_594, _540, _612);
    bool _622 = _598 != 1;
    float _624 = _550 * _616;
    float _626 = _308 * _550;
    float _628 = _550 * _620;
    float _630 = fma(_224, _626, _190);
    float _632 = fma(_224, _606, _618);
    float _634 = fma(_230, _606, _624);
    float _636 = fma(_230, _626, _196);
    float _638 = fma(_236, _626, _202);
    float _640 = fma(_236, _606, _628);
    float _642 = _308 * _558;
    float _644 = _628;
    float _646 = _642;
    float _648 = _568;
    float _650 = _606;
    float _652 = _572;
    float _654 = _576;
    float _656 = _558;
    float _658 = _562;
    float _660 = _630;
    float _662 = _594;
    if (_614)
    {
        float _664 = 1.0 / _554;
        _644 = _664;
    }
    float _666 = _644;
    float _668 = _308 * _556;
    float _670 = _550 * _642;
    float _672 = _308 * _560;
    float _674 = _550 * _668;
    float _676 = _674;
    float _678 = _670;
    float _680 = _668;
    float _682 = _672;
    if (!_622)
    {
        float _684 = _670 * _524;
        _646 = _684;
    }
    float _686 = _646;
    bool _688 = _564 > 0.0;
    float _690 = _686;
    bool _692 = _688;
    if (!_622)
    {
        float _694 = _670 * _526;
        _346 = _694;
    }
    float _696 = _346;
    float _698 = _696;
    if (!_622)
    {
        float _700 = _670 * _530;
        _348 = _700;
    }
    float _702 = _348;
    float _704 = _550 * _672;
    float _706 = _702;
    float _708 = _704;
    if (!_622)
    {
        float _710 = fma(_674, _528, _686);
        _690 = _710;
    }
    float _712 = _690;
    float _714 = -_304;
    float _716 = _566 + _714;
    float _718 = _712;
    float _720 = _716;
    if (!_622)
    {
        float _722 = fma(_674, _532, _696);
        _698 = _722;
    }
    float _724 = _698;
    float _726 = _724;
    if (!_622)
    {
        float _728 = fma(_674, _536, _702);
        _706 = _728;
    }
    float _730 = _706;
    float _732 = _730;
    if (!_622)
    {
        float _734 = fma(_704, _534, _712);
        _676 = _734;
    }
    float _736 = _676;
    if (_614)
    {
        float _738 = _716 * _666;
        _718 = _738;
    }
    float _740 = _718;
    float _742 = _568 * _564;
    float _744 = _740;
    if (_614)
    {
        float _746 = precise::min(_740, 1.0);
        _744 = _746;
    }
    float _748 = _744;
    if (_688)
    {
        float _750 = -_742;
        float _752 = fma(_294, _750, _568);
        _648 = _752;
    }
    float _754 = _648;
    float _756 = _754;
    if (!_622)
    {
        float _758 = fma(_704, _538, _724);
        _678 = _758;
    }
    float _760 = _678;
    if (!_622)
    {
        float _762 = fma(_704, _540, _730);
        _708 = _762;
    }
    float _764 = _708;
    float _766 = _550 * _570;
    float _768 = _766;
    if (_614)
    {
        float _770 = _748 * _754;
        _756 = _770;
    }
    float _772 = _756;
    float _774 = _550 * _572;
    float _776 = _550 * _574;
    float _778 = _736 + _630;
    float _780 = _760 + _636;
    float _782 = _764 + _638;
    float _784 = _766 * _772;
    float _786 = _774 * _772;
    float _788 = _776 * _772;
    bool _790 = !_186;
    float _792 = _774;
    float _794 = _772;
    float _796 = _776;
    float _798 = _784;
    float _800 = _788;
    float _802 = _786;
    float _924;
    if (!_790)
    {
        float _804 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _806 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _808 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _810 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _812 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _814 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _816 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _820 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _822 = _808 * _810;
        float _824 = _808 * _812;
        float _826 = _806 * _810;
        float _828 = -_822;
        float _830 = fma(_804, _814, _828);
        float _832 = -_824;
        float _834 = fma(_806, _814, _832);
        float _836 = -_826;
        float _838 = fma(_804, _812, _836);
        float _840 = _818 * _804;
        float _842 = _818 * _830;
        float _844 = _820 * _806;
        float _846 = _816 * _812;
        float _848 = -_840;
        float _850 = fma(_816, _806, _848);
        float _852 = -_842;
        float _854 = fma(_816, _834, _852);
        float _856 = _818 * _814;
        float _858 = _820 * _810;
        float _860 = _816 * _808;
        float _862 = fma(_820, _838, _854);
        float _864 = -_856;
        float _866 = fma(_820, _812, _864);
        float _868 = -_858;
        float _870 = fma(_816, _814, _868);
        float _872 = -_846;
        float _874 = fma(_818, _810, _872);
        float _876 = 1.0 / _862;
        float _878 = -_860;
        float _880 = fma(_820, _804, _878);
        float _882 = -_804;
        float _884 = fma(_882, _814, _822);
        float _886 = -_844;
        float _888 = fma(_818, _808, _886);
        float _890 = _866 * _876;
        float _892 = _870 * _876;
        float _894 = _874 * _876;
        float _896 = _784 * _876;
        float _898 = _786 * _890;
        float _900 = _786 * _892;
        float _902 = _884 * _876;
        float _904 = _786 * _894;
        float _906 = _888 * _876;
        float _908 = _880 * _876;
        float _910 = fma(_834, _896, _898);
        float _912 = fma(_784, _902, _900);
        float _914 = _850 * _876;
        float _916 = fma(_838, _896, _904);
        float _918 = fma(_788, _906, _910);
        float _920 = fma(_788, _908, _912);
        float _922 = fma(_788, _914, _916);
        _792 = _912;
        _732 = _906;
        _726 = _898;
        _794 = _910;
        _768 = _900;
        _652 = _896;
        _796 = _814;
        _654 = _822;
        _680 = _816;
        _656 = _818;
        _682 = _820;
        _658 = _862;
        _924 = _920;
        _798 = _918;
        _800 = _922;
        _660 = _916;
        _662 = _908;
        _926 = true;
    }
    else
    {
        int _928 = as_type<int>(_178) & 1024;
        bool _930 = _928 != 0;
        if (_930)
        {
            _692 = true;
        }
        bool _932 = _692;
        bool _934 = _932;
        if (!_930)
        {
            int _936 = as_type<int>(_178) & 2048;
            bool _938 = _936 != 0;
            _934 = _938;
        }
        bool _940 = _934;
        if (!_940)
        {
            _650 = _786;
        }
        float _942 = _650;
        bool _944 = !_940;
        _924 = _942;
        if (!_944)
        {
            uint _946 = uint(int(uint(_182) >> uint(2)));
            float _948 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_946)]);
            int _950 = _182 + 4;
            uint _952 = uint(int(uint(_950) >> uint(2)));
            float _954 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_952)]);
            int _956 = _182 + 8;
            uint _958 = uint(int(uint(_956) >> uint(2)));
            float _960 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_958)]);
            uint _962 = uint(int(uint(_182) >> uint(2)));
            float _964 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_962)]);
            int _966 = _182 + 4;
            uint _968 = uint(int(uint(_966) >> uint(2)));
            float _970 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_968)]);
            int _972 = _182 + 8;
            uint _974 = uint(int(uint(_972) >> uint(2)));
            float _976 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_974)]);
            uint _978 = uint(int(uint(_182) >> uint(2)));
            float _980 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_978)]);
            int _982 = _182 + 4;
            uint _984 = uint(int(uint(_982) >> uint(2)));
            float _986 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_984)]);
            int _988 = _182 + 8;
            uint _990 = uint(int(uint(_988) >> uint(2)));
            float _992 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_990)]);
            float _994 = _960 * _964;
            float _996 = _960 * _970;
            float _998 = _954 * _964;
            float _1000 = -_994;
            float _1002 = fma(_948, _976, _1000);
            float _1004 = -_996;
            float _1006 = fma(_954, _976, _1004);
            float _1008 = -_998;
            float _1010 = fma(_948, _970, _1008);
            float _1012 = _986 * _948;
            float _1014 = _986 * _1002;
            float _1016 = _992 * _954;
            float _1018 = _980 * _970;
            float _1020 = -_1012;
            float _1022 = fma(_980, _954, _1020);
            float _1024 = -_1014;
            float _1026 = fma(_980, _1006, _1024);
            float _1028 = _986 * _976;
            float _1030 = _992 * _964;
            float _1032 = _980 * _960;
            float _1034 = fma(_992, _1010, _1026);
            float _1036 = -_1028;
            float _1038 = fma(_992, _970, _1036);
            float _1040 = -_1030;
            float _1042 = fma(_980, _976, _1040);
            float _1044 = -_1018;
            float _1046 = fma(_986, _964, _1044);
            float _1048 = 1.0 / _1034;
            float _1050 = -_1032;
            float _1052 = fma(_992, _948, _1050);
            float _1054 = -_948;
            float _1056 = fma(_1054, _976, _994);
            float _1058 = -_1016;
            float _1060 = fma(_986, _960, _1058);
            float _1062 = _1038 * _1048;
            float _1064 = _1042 * _1048;
            float _1066 = _1046 * _1048;
            float _1068 = _784 * _1048;
            float _1070 = _786 * _1062;
            float _1072 = _786 * _1064;
            float _1074 = _1056 * _1048;
            float _1076 = _786 * _1066;
            float _1078 = _1060 * _1048;
            float _1080 = _1052 * _1048;
            float _1082 = fma(_1006, _1068, _1070);
            float _1084 = fma(_784, _1074, _1072);
            float _1086 = _1022 * _1048;
            float _1088 = fma(_1010, _1068, _1076);
            float _1090 = fma(_788, _1078, _1082);
            float _1092 = fma(_788, _1080, _1084);
            float _1094 = fma(_788, _1086, _1088);
            _792 = _1084;
            _732 = _1078;
            _726 = _1070;
            _794 = _1082;
            _768 = _1072;
            _652 = _1068;
            _796 = _976;
            _654 = _994;
            _680 = _980;
            _656 = _986;
            _682 = _992;
            _658 = _1034;
            _924 = _1092;
            _798 = _1090;
            _800 = _1094;
            _660 = _1088;
            _662 = _1080;
        }
    }
    _926 = false;
    float _1096 = _792;
    float _1098 = _732;
    float _1100 = _726;
    float _1102 = _794;
    float _1104 = _768;
    float _1106 = _652;
    float _1108 = _796;
    float _1110 = _654;
    float _1112 = _680;
    float _1114 = _656;
    float _1116 = _682;
    float _1118 = _658;
    float _1120 = _924;
    float _1122 = _798;
    float _1124 = _800;
    float _1126 = _660;
    float _1128 = _662;
    uint _1130 = uint(int(uint(_204) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1130)] = as_type<uint>(_584);
    float _1132 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1134 = as_type<int>(_1132) & 512;
    bool _1136 = _1134 != 0;
    int _1138 = as_type<int>(_1132) & 1024;
    bool _1140 = _1138 != 0;
    float _1142 = _1096;
    float _1144 = _1098;
    float _1146 = _1100;
    float _1148 = _1102;
    float _1150 = _1122;
    float _1152 = _1128;
    float _1154 = _1126;
    bool _1156 = false;
    if (_1136)
    {
        float _1158 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1160 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1162 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1142 = _1158;
        _1144 = _1160;
        _1146 = _1162;
        _1148 = _1164;
    }
    float _1166 = _1142;
    float _1168 = _1144;
    float _1170 = _1146;
    float _1172 = _1148;
    float _1174 = _1104;
    float _1176 = _1106;
    float _1178 = _1108;
    float _1180 = _1110;
    if (_1136)
    {
        float _1182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1184 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1186 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1174 = _1182;
        _1176 = _1184;
        _1178 = _1186;
        _1180 = _1188;
    }
    float _1190 = _1174;
    float _1192 = _1176;
    float _1194 = _1178;
    float _1196 = _1180;
    float _1198 = _1112;
    float _1200 = _1114;
    float _1202 = _1116;
    float _1204 = _1118;
    if (_1136)
    {
        float _1206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1208 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1210 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1212 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1198 = _1206;
        _1200 = _1208;
        _1202 = _1210;
        _1204 = _1212;
    }
    float _1214 = _1198;
    float _1216 = _1200;
    float _1218 = _1202;
    float _1220 = _1204;
    float _1222 = _780 + _1120;
    float _1224 = _778 + _1122;
    float _1226 = _782 + _1124;
    if (!_1136)
    {
        _1150 = 0.0;
    }
    float _1228 = _1150;
    float _1230 = _1228;
    if (!_1136)
    {
        _802 = 0.0;
    }
    float _1232 = _802;
    float _1234 = _1232;
    if (!_1136)
    {
        _1152 = 0.0;
    }
    float _1236 = _1152;
    int _1238 = as_type<int>(_1132) & 2048;
    bool _1240 = _1238 != 0;
    float _1242 = _1166;
    float _1244 = _1236;
    if (_1136)
    {
        float _1246 = _1222 * _1168;
        _1154 = _1246;
    }
    float _1248 = _1154;
    float _1250 = _1192;
    float _1252 = _1216;
    float _1254 = _1214;
    float _1256 = _1194;
    if (_1136)
    {
        float _1258 = _1222 * _1192;
        _1250 = _1258;
    }
    float _1260 = _1250;
    float _1262 = _1260;
    if (_1136)
    {
        float _1264 = fma(_1224, _1166, _1248);
        _1242 = _1264;
    }
    float _1266 = _1242;
    float _1268 = _1266;
    if (_1136)
    {
        float _1270 = _1222 * _1216;
        _1252 = _1270;
    }
    float _1272 = _1252;
    if (_1136)
    {
        float _1274 = fma(_1224, _1190, _1260);
        _1262 = _1274;
    }
    float _1276 = _1262;
    if (_1136)
    {
        float _1278 = fma(_1226, _1170, _1266);
        _1268 = _1278;
    }
    float _1280 = _1268;
    if (_1136)
    {
        float _1282 = fma(_1224, _1214, _1272);
        _1254 = _1282;
    }
    float _1284 = _1254;
    float _1286 = _1284;
    if (_1136)
    {
        float _1288 = fma(_1226, _1194, _1276);
        _1256 = _1288;
    }
    float _1290 = _1256;
    if (_1136)
    {
        float _1292 = _1172 + _1280;
        _1230 = _1292;
    }
    float _1294 = _1230;
    float _1296 = _1294;
    if (_1136)
    {
        float _1298 = fma(_1226, _1218, _1284);
        _1286 = _1298;
    }
    float _1300 = _1286;
    if (_1136)
    {
        float _1302 = _1196 + _1290;
        _1234 = _1302;
    }
    float _1304 = _1234;
    float _1306 = _1304;
    if (_1136)
    {
        float _1308 = _1220 + _1300;
        _1244 = _1308;
    }
    float _1310 = _1244;
    bool _1312 = !_1140;
    float _1314 = _1310;
    if (!_1312)
    {
        float _1316 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1318 = uint(int(uint(_182) >> uint(2)));
        float _1320 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1318)]);
        int _1322 = _182 + 4;
        uint _1324 = uint(int(uint(_1322) >> uint(2)));
        float _1326 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1324)]);
        int _1328 = _182 + 8;
        uint _1330 = uint(int(uint(_1328) >> uint(2)));
        float _1332 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1330)]);
        uint _1334 = uint(int(uint(_182) >> uint(2)));
        float _1336 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1334)]);
        int _1338 = _182 + 4;
        uint _1340 = uint(int(uint(_1338) >> uint(2)));
        float _1342 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1340)]);
        int _1344 = _182 + 8;
        uint _1346 = uint(int(uint(_1344) >> uint(2)));
        float _1348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1346)]);
        uint _1350 = uint(int(uint(_182) >> uint(2)));
        float _1352 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1350)]);
        int _1354 = _182 + 4;
        uint _1356 = uint(int(uint(_1354) >> uint(2)));
        float _1358 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1356)]);
        int _1360 = _182 + 8;
        uint _1362 = uint(int(uint(_1360) >> uint(2)));
        float _1364 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1362)]);
        float _1366 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1368 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1370 = _1222 * _1326;
        float _1372 = _1222 * _1342;
        float _1374 = _1222 * _1358;
        float _1376 = fma(_1224, _1320, _1370);
        float _1378 = fma(_1224, _1336, _1372);
        float _1380 = fma(_1224, _1352, _1374);
        float _1382 = fma(_1226, _1332, _1376);
        float _1384 = fma(_1226, _1348, _1378);
        float _1386 = fma(_1226, _1364, _1380);
        float _1388 = _1316 + _1382;
        float _1390 = _1366 + _1384;
        float _1392 = _1368 + _1386;
        _1306 = _1390;
        _1296 = _1388;
        _1314 = _1392;
    }
    float _1394 = _1306;
    float _1396 = _1296;
    float _1398 = _1314;
    bool _1400 = !_1240;
    float _1402 = _1394;
    float _1404 = _1396;
    float _1406 = _1398;
    if (!_1400)
    {
        uint _1408 = uint(int(uint(_182) >> uint(2)));
        float _1410 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1408)]);
        int _1412 = _182 + 4;
        uint _1414 = uint(int(uint(_1412) >> uint(2)));
        float _1416 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1414)]);
        int _1418 = _182 + 8;
        uint _1420 = uint(int(uint(_1418) >> uint(2)));
        float _1422 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1420)]);
        int _1424 = _182 + 12;
        uint _1426 = uint(int(uint(_1424) >> uint(2)));
        float _1428 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1426)]);
        uint _1430 = uint(int(uint(_182) >> uint(2)));
        float _1432 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1430)]);
        int _1434 = _182 + 4;
        uint _1436 = uint(int(uint(_1434) >> uint(2)));
        float _1438 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1436)]);
        int _1440 = _182 + 8;
        uint _1442 = uint(int(uint(_1440) >> uint(2)));
        float _1444 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1442)]);
        int _1446 = _182 + 12;
        uint _1448 = uint(int(uint(_1446) >> uint(2)));
        float _1450 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1448)]);
        uint _1452 = uint(int(uint(_182) >> uint(2)));
        float _1454 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1452)]);
        int _1456 = _182 + 4;
        uint _1458 = uint(int(uint(_1456) >> uint(2)));
        float _1460 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1458)]);
        int _1462 = _182 + 8;
        uint _1464 = uint(int(uint(_1462) >> uint(2)));
        float _1466 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1464)]);
        int _1468 = _182 + 12;
        uint _1470 = uint(int(uint(_1468) >> uint(2)));
        float _1472 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1470)]);
        float _1474 = _1222 * _1416;
        float _1476 = _1222 * _1438;
        float _1478 = _1222 * _1460;
        float _1480 = fma(_1224, _1410, _1474);
        float _1482 = fma(_1224, _1432, _1476);
        float _1484 = fma(_1224, _1454, _1478);
        float _1486 = fma(_1226, _1422, _1480);
        float _1488 = fma(_1226, _1444, _1482);
        float _1490 = fma(_1226, _1466, _1484);
        float _1492 = _1486 + _1428;
        float _1494 = _1488 + _1450;
        float _1496 = _1490 + _1472;
        _1402 = _1494;
        _1404 = _1492;
        _1406 = _1496;
    }
    float _1498 = _1402;
    float _1500 = _1404;
    float _1502 = _1406;
    float _1504 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1506 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1508 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1510 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1512 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1514 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1516 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1518 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1520 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1522 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1524 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1526 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1528 = _1506 * _1498;
    float _1530 = fma(_1504, _1500, _1528);
    float _1532 = fma(_1508, _1502, _1530);
    float _1534 = _1510 + _1532;
    float _1536 = -_1534;
    bool _1538 = _1512 >= _1536;
    bool _1540 = isnan(_1512);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(_1536);
    bool _1546 = _1542 || _1544;
    float _1548 = -_1534;
    bool _1550 = _1514 >= _1548;
    bool _1552 = isnan(_1514);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan(_1548);
    bool _1558 = _1554 || _1556;
    int _1560 = _1546 ? 0 : 1;
    int _1562 = 2;
    float _1564 = _1500;
    if (_1546)
    {
        _1562 = 1;
    }
    int _1566 = _1562;
    int _1568 = _1566;
    if (_1558)
    {
        _1568 = _1560;
    }
    int _1570 = _1568;
    int _1572 = _1570 << 6;
    int _1574 = _1572 + 96;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    float _1578 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1576)]);
    int _1580 = _1574 + 4;
    uint _1582 = uint(int(uint(_1580) >> uint(2)));
    float _1584 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1582)]);
    int _1586 = _1574 + 8;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    float _1590 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1588)]);
    int _1592 = _1574 + 12;
    uint _1594 = uint(int(uint(_1592) >> uint(2)));
    float _1596 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1594)]);
    int _1598 = _1572 + 48;
    int _1600 = _1572 + 64;
    uint _1602 = uint(int(uint(_1598) >> uint(2)));
    float _1604 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1602)]);
    int _1606 = _1598 + 4;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    float _1610 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1608)]);
    int _1612 = _1598 + 8;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    float _1616 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1614)]);
    int _1618 = _1598 + 12;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    float _1622 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1620)]);
    uint _1624 = uint(int(uint(_1600) >> uint(2)));
    float _1626 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1624)]);
    int _1628 = _1600 + 4;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    float _1632 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1630)]);
    int _1634 = _1600 + 8;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    float _1638 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1636)]);
    int _1640 = _1600 + 12;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    float _1644 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1642)]);
    int _1646 = _1572 + 80;
    float _1648 = _1516 + 1.0;
    float _1650 = _1648 + _1498;
    uint _1652 = uint(int(uint(_1646) >> uint(2)));
    float _1654 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1652)]);
    int _1656 = _1646 + 4;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    float _1660 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1658)]);
    int _1662 = _1646 + 8;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    float _1666 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1664)]);
    int _1668 = _1646 + 12;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    float _1672 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1670)]);
    float _1674 = _1650 * _1520;
    float _1676 = fma(_1518, _1500, _1674);
    float _1678 = fma(_1522, _1502, _1676);
    float _1680 = _1524 + _1678;
    float _1682 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1684 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1686 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1688 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1690 = trunc(_1680);
    int _1692 = int(_1690);
    int _1694 = ~as_type<int>(_1526);
    int _1696 = _1692 + _1694;
    int _1698 = _1696 + 1;
    float _1700 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1702 = _1698 >= 0;
    int _1704 = as_type<int>(_1498);
    float _1706 = as_type<float>(_1570);
    if (_1702)
    {
        float _1708 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1704 = as_type<int>(_1708);
    }
    int _1710 = _1704;
    float _1712 = _1650 * _1584;
    float _1714 = fma(_1578, _1500, _1712);
    float _1716 = fma(_1590, _1502, _1714);
    float _1718 = _1596 + _1716;
    float _1720 = _1650 * _1610;
    float _1722 = 1.0 / _1718;
    float _1724 = fma(_1604, _1500, _1720);
    float _1726 = _1650 * _1632;
    float _1728 = fma(_1616, _1502, _1724);
    float _1730 = fma(_1626, _1500, _1726);
    float _1732 = _1622 + _1728;
    float _1734 = fma(_1638, _1502, _1730);
    float _1736 = _1732 * _1722;
    float _1738 = _1644 + _1734;
    bool _1740 = _1736 >= 0.0;
    float _1742 = _1738 * _1722;
    bool _1744 = _1736 <= 1.0;
    bool _1746 = _1744 && _1740;
    bool _1748 = _1742 >= 0.0;
    bool _1750 = _1748 && _1746;
    bool _1752 = _1742 <= 1.0;
    bool _1754 = _1752 && _1750;
    float _1756 = _1650 * _1660;
    float _1758 = fma(_1654, _1500, _1756);
    int _1760 = _1754 ? (-1) : 0;
    if (_1754)
    {
        float _1762 = float(_1570);
        _1706 = _1762;
    }
    float _1764 = _1706;
    float _1766 = _1718;
    if (_1754)
    {
        float _1768 = rint(_1764);
        float _1770 = precise::max(_1768, 0.0);
        uint _1772 = uint(_1770);
        uint _1774 = clamp(_1772, 0u, 65535u);
        _1766 = as_type<float>(_1774);
    }
    float _1776 = _1766;
    float _1778 = fma(_1666, _1502, _1758);
    float _1780 = _1672 + _1778;
    float _1782 = _1780 * _1722;
    float _1784 = _1776;
    if (_1754)
    {
        float3 _12738 = float3(_1736, _1742, float(as_type<int>(_1776)));
        float3 _12742 = select(_12738, float3(0.0), isnan(_12738));
        float _1786 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _12742.xy, uint(rint(_12742.z)), _1782, level(0.0));
        _1784 = _1786;
    }
    float _1788 = _1784;
    float _1790 = _1650 * _1684;
    float _1792 = fma(_1682, _1500, _1790);
    float _1794 = fma(_1686, _1502, _1792);
    float _1796 = _1688 + _1794;
    float _1798 = trunc(_1796);
    int _1800 = int(_1798);
    bool _1802 = _1710 <= _1698;
    bool _1804 = !_1702;
    bool _1806 = _1802 || _1804;
    int _1808 = ~as_type<int>(_1700);
    int _1810 = _1800 + _1808;
    int _1812 = _1810 + 1;
    bool _1814 = _1812 < 0;
    bool _1816 = _1814 || _1806;
    int _1818 = as_type<int>(_1792);
    float _1820 = as_type<float>(_1800);
    if (!_1816)
    {
        float _1822 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1818 = as_type<int>(_1822);
    }
    int _1824 = _1818;
    bool _1826 = _1824 <= _1812;
    bool _1828 = _1826 || _1816;
    if (_1828)
    {
        _1820 = 1.0;
    }
    float _1830 = _1820;
    float _1832 = _1830;
    if (!_1828)
    {
        float _1834 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1836 = _1812 * as_type<int>(_1834);
        int _1838 = _1836 + _1698;
        int _1840 = _1838 << 2;
        uint _1842 = uint(int(uint(_1838) >> uint(2)));
        int _1844 = 12 & _1840;
        int _1846 = int(_1842) << 4;
        int _1848 = _1846 + _1844;
        int _1850 = _1848 + 400;
        uint _1852 = uint(int(uint(_1850) >> uint(2)));
        float _1854 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1852)]);
        float _1856 = floor(_1796);
        float _1858 = floor(_1680);
        float _1860 = -_1856;
        float _1862 = _1796 + _1860;
        float _1864 = -_1858;
        float _1866 = _1680 + _1864;
        float _1868 = rint(_1854);
        float _1870 = precise::max(_1868, 0.0);
        uint _1872 = uint(_1870);
        uint _1874 = clamp(_1872, 0u, 65535u);
        float3 _12877 = float3(_1866, _1862, float(int(_1874)));
        float3 _12879 = select(_12877, float3(0.0), isnan(_12877));
        float _1876 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _12879.xy, uint(rint(_12879.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _12879.xy, uint(rint(_12879.z)), level(0.0)).x;
        int _1878 = _1838 << 4;
        int _1880 = _1878 + 2048;
        uint _1882 = uint(int(uint(_1880) >> uint(2)));
        float _1884 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1882)]);
        int _1886 = _1880 + 4;
        uint _1888 = uint(int(uint(_1886) >> uint(2)));
        float _1890 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1888)]);
        int _1892 = _1880 + 8;
        uint _1894 = uint(int(uint(_1892) >> uint(2)));
        float _1896 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1894)]);
        int _1898 = _1880 + 12;
        uint _1900 = uint(int(uint(_1898) >> uint(2)));
        float _1902 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1900)]);
        float _1904 = _1650 * _1890;
        float _1906 = fma(_1884, _1500, _1904);
        float _1908 = fma(_1896, _1502, _1906);
        float _1910 = _1902 + _1908;
        float _1912 = precise::clamp(_1910, 0.0, 1.0);
        float _1914 = -_1912;
        float _1916 = _1914 + _1876;
        float _1918 = fma(_1916, 500.0, 1.5);
        float _1920 = exp2(_1918);
        float _1922 = 0.0 + _1920;
        float _1924 = precise::clamp(_1922, 0.0, 1.0);
        _1564 = 500.0;
        _1832 = _1924;
    }
    float _1926 = _1564;
    float _1928 = _1832;
    uint _1930 = uint(int(uint(_182) >> uint(2)));
    float _1932 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1930)]);
    float _1934 = _1926;
    if (!_1754)
    {
        _1934 = 1.0;
    }
    float _1936 = _1934;
    bool _1938 = _716 > 0.001000000047497451305389404296875;
    bool _1940 = isnan(_716);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan(0.001000000047497451305389404296875);
    bool _1946 = _1942 || _1944;
    float _1948 = _1936;
    if (_1754)
    {
        bool _1950 = _1788 >= _1782;
        bool _1952 = isnan(_1788);
        bool _1954 = _1950 || _1952;
        bool _1956 = isnan(_1782);
        bool _1958 = _1954 || _1956;
        float _1960 = float(_1958);
        _1948 = _1960;
    }
    float _1962 = _1948;
    float _1964 = -_1962;
    float _1966 = fma(_1964, _1928, 1.0);
    float _1968 = -_1932;
    float _1970 = _1966 + _1968;
    float _1972 = _1966;
    if (_1946)
    {
        float _1974 = fma(_1970, 0.0500000007450580596923828125, _1932);
        _1972 = _1974;
    }
    float _1976 = _1972;
    float _1978 = precise::max(0.0, _1976);
    float _1980 = precise::min(_1978, 0.999000012874603271484375);
    uint _1982 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1982)] = as_type<uint>(_1980);
    float _1984 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    uint _1986 = uint(int(uint(_182) >> uint(2)));
    float _1988 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1986)]);
    int _1990 = _182 + 4;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    float _1994 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1992)]);
    int _1996 = _182 + 8;
    uint _1998 = uint(int(uint(_1996) >> uint(2)));
    float _2000 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1998)]);
    int _2002 = _182 + 12;
    uint _2004 = uint(int(uint(_2002) >> uint(2)));
    float _2006 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_2004)]);
    float _2008 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
    int _2010 = _99 << 5;
    float _2012 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[82]);
    uint _2014 = uint(int(uint(_2010) >> uint(2)));
    float _2016 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2014)]);
    int _2018 = _2010 + 4;
    uint _2020 = uint(int(uint(_2018) >> uint(2)));
    float _2022 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2020)]);
    int _2024 = _2010 + 8;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    float _2028 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2026)]);
    int _2030 = _2010 + 12;
    uint _2032 = uint(int(uint(_2030) >> uint(2)));
    float _2034 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2032)]);
    float _2036 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[80]);
    float _2038 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[79]);
    float _2040 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[2607]);
    int _2042 = as_type<int>(_1984) & 512;
    bool _2044 = _2042 != 0;
    float _2046 = _1742;
    float _2048 = _1782;
    float _2050 = _1788;
    float _2052 = _1736;
    float _2054 = as_type<float>(_2010);
    if (_2044)
    {
        float _2056 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _2058 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _2060 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _2062 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _2046 = _2056;
        _2048 = _2058;
        _2050 = _2060;
        _2052 = _2062;
    }
    float _2064 = _2046;
    float _2066 = _2048;
    float _2068 = _2050;
    float _2070 = _2052;
    float _2072 = 0.0;
    float _2074 = 0.0;
    float _2076 = 0.0;
    float _2078 = 0.0;
    if (_2044)
    {
        float _2080 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _2082 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _2084 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _2086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _2072 = _2080;
        _2074 = _2082;
        _2076 = _2084;
        _2078 = _2086;
    }
    float _2088 = _2072;
    float _2090 = _2074;
    float _2092 = _2076;
    float _2094 = _2078;
    float _2096 = 0.0;
    float _2098 = 0.0;
    float _2100 = 0.0;
    float _2102 = 0.0;
    if (_2044)
    {
        float _2104 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _2106 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _2108 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _2110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _2096 = _2104;
        _2098 = _2106;
        _2100 = _2108;
        _2102 = _2110;
    }
    float _2112 = _2096;
    float _2114 = _2098;
    float _2116 = _2100;
    float _2118 = _2102;
    float _2120 = -_2008;
    float _2122 = _1994 + _2120;
    int _2124 = _2010 + 16;
    uint _2126 = uint(int(uint(_182) >> uint(2)));
    float _2128 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_2126)]);
    int _2130 = _182 + 4;
    uint _2132 = uint(int(uint(_2130) >> uint(2)));
    float _2134 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_2132)]);
    int _2136 = _182 + 8;
    uint _2138 = uint(int(uint(_2136) >> uint(2)));
    float _2140 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_2138)]);
    int _2142 = _182 + 12;
    uint _2144 = uint(int(uint(_2142) >> uint(2)));
    float _2146 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_2144)]);
    float _2148 = precise::max(0.0, _2012);
    uint _2150 = uint(int(uint(_2124) >> uint(2)));
    float _2152 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2150)]);
    int _2154 = _2124 + 4;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    float _2158 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2156)]);
    int _2160 = _2124 + 8;
    uint _2162 = uint(int(uint(_2160) >> uint(2)));
    float _2164 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2162)]);
    int _2166 = _2124 + 12;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    float _2170 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2168)]);
    float _2172 = 0.0;
    float _2174 = _2006;
    int _2176 = as_type<int>(_1994);
    float _2178 = _2016;
    float _2180 = _2022;
    float _2182 = _2028;
    float _2184 = _2034;
    float _2186 = as_type<float>(_2124);
    if (!_2044)
    {
        _2172 = 0.0;
    }
    float _2188 = _2172;
    uint _2190 = uint(int(uint(_182) >> uint(2)));
    float _2192 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2190)]);
    float _2194 = _2188;
    if (!_2044)
    {
        _2174 = 0.0;
    }
    float _2196 = _2174;
    int _2198 = _182 + 8;
    uint _2200 = uint(int(uint(_2198) >> uint(2)));
    float _2202 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2200)]);
    bool _2204 = _2148 != 0.0;
    bool _2206 = isnan(_2148);
    bool _2208 = _2204 || _2206;
    bool _2210 = isnan(0.0);
    bool _2212 = _2208 || _2210;
    uint _2214 = uint(int(uint(_182) >> uint(2)));
    float _2216 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_2214)]);
    int _2218 = _182 + 4;
    uint _2220 = uint(int(uint(_2218) >> uint(2)));
    float _2222 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_2220)]);
    int _2224 = _182 + 8;
    uint _2226 = uint(int(uint(_2224) >> uint(2)));
    float _2228 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_2226)]);
    int _2230 = _182 + 12;
    uint _2232 = uint(int(uint(_2230) >> uint(2)));
    float _2234 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_2232)]);
    float _2236 = _2066;
    float _2238 = _2090;
    float _2240 = _2114;
    float _2242 = _2068;
    float _2244 = _2092;
    float _2246 = _2116;
    float _2248 = _2112;
    float _2250 = _2196;
    float _2252 = _2118;
    float _2254 = _2088;
    float _2256 = _2094;
    float _2258 = _2070;
    if (_2044)
    {
        float _2260 = _2122 * _2066;
        _2236 = _2260;
    }
    float _2262 = _2236;
    float _2264 = _2262;
    if (_2044)
    {
        float _2266 = fma(_1988, _2064, _2262);
        _2264 = _2266;
    }
    float _2268 = _2264;
    int _2270 = as_type<int>(_1984) & 1024;
    bool _2272 = _2270 != 0;
    if (_2044)
    {
        float _2274 = _2122 * _2090;
        _2238 = _2274;
    }
    float _2276 = _2238;
    float _2278 = _2276;
    if (_2044)
    {
        float _2280 = _2122 * _2114;
        _2240 = _2280;
    }
    float _2282 = _2240;
    float _2284 = _2282;
    if (_2044)
    {
        float _2286 = fma(_1988, _2088, _2276);
        _2278 = _2286;
    }
    float _2288 = _2278;
    float _2290 = _2288;
    if (_2044)
    {
        float _2292 = fma(_1988, _2112, _2282);
        _2284 = _2292;
    }
    float _2294 = _2284;
    float _2296 = _2294;
    if (_2044)
    {
        float _2298 = fma(_2000, _2068, _2268);
        _2242 = _2298;
    }
    float _2300 = _2242;
    if (_2044)
    {
        float _2302 = fma(_2000, _2092, _2288);
        _2244 = _2302;
    }
    float _2304 = _2244;
    float _2306 = _2304;
    if (_2044)
    {
        float _2308 = fma(_2000, _2116, _2294);
        _2246 = _2308;
    }
    float _2310 = _2246;
    float _2312 = _2310;
    if (!_2044)
    {
        _2248 = 0.0;
    }
    float _2314 = _2248;
    float _2316 = _2314;
    if (_2044)
    {
        float _2318 = _2094 + _2304;
        _2194 = _2318;
    }
    float _2320 = _2194;
    int _2322 = as_type<int>(_1984) & 2048;
    bool _2324 = _2322 != 0;
    float _2326 = _2320;
    if (_2044)
    {
        float _2328 = _2070 + _2300;
        _2316 = _2328;
    }
    float _2330 = _2316;
    float _2332 = _2330;
    if (_2044)
    {
        float _2334 = _2118 + _2310;
        _2250 = _2334;
    }
    float _2336 = _2250;
    float _2338 = _2016 + _2022;
    bool _2340 = !_2272;
    int _2342 = 0;
    int _2344 = 0;
    float _2346 = _2336;
    int _2348 = as_type<int>(_2146);
    float _2350 = _2338;
    float _2352 = _2152;
    float _2354 = _2158;
    float _2356 = _2164;
    float _2358 = _2170;
    float _2360 = _2202;
    float _2362 = _2192;
    float _2364 = _2040;
    if (!_2340)
    {
        float _2366 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2368 = uint(int(uint(_182) >> uint(2)));
        float _2370 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2368)]);
        int _2372 = _182 + 4;
        uint _2374 = uint(int(uint(_2372) >> uint(2)));
        float _2376 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2374)]);
        int _2378 = _182 + 8;
        uint _2380 = uint(int(uint(_2378) >> uint(2)));
        float _2382 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2380)]);
        int _2384 = _182 + 12;
        uint _2386 = uint(int(uint(_2384) >> uint(2)));
        float _2388 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2386)]);
        uint _2390 = uint(int(uint(_182) >> uint(2)));
        float _2392 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2390)]);
        int _2394 = _182 + 4;
        uint _2396 = uint(int(uint(_2394) >> uint(2)));
        float _2398 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2396)]);
        int _2400 = _182 + 8;
        uint _2402 = uint(int(uint(_2400) >> uint(2)));
        float _2404 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2402)]);
        int _2406 = _182 + 12;
        uint _2408 = uint(int(uint(_2406) >> uint(2)));
        float _2410 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2408)]);
        uint _2412 = uint(int(uint(_182) >> uint(2)));
        float _2414 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2412)]);
        int _2416 = _182 + 4;
        uint _2418 = uint(int(uint(_2416) >> uint(2)));
        float _2420 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2418)]);
        int _2422 = _182 + 8;
        uint _2424 = uint(int(uint(_2422) >> uint(2)));
        float _2426 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2424)]);
        int _2428 = _182 + 12;
        uint _2430 = uint(int(uint(_2428) >> uint(2)));
        float _2432 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2430)]);
        float _2434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2438 = _2122 * _2376;
        float _2440 = _2122 * _2398;
        float _2442 = _2122 * _2420;
        float _2444 = fma(_1988, _2370, _2438);
        float _2446 = fma(_1988, _2392, _2440);
        float _2448 = fma(_1988, _2414, _2442);
        float _2450 = fma(_2000, _2382, _2444);
        float _2452 = fma(_2000, _2404, _2446);
        float _2454 = fma(_2000, _2426, _2448);
        float _2456 = _2366 + _2450;
        float _2458 = _2434 + _2452;
        float _2460 = _2436 + _2454;
        _2332 = _2458;
        _2296 = _2450;
        _2312 = _2382;
        _2252 = _2388;
        _2254 = _2392;
        _2290 = _2446;
        _2306 = _2452;
        _2256 = _2410;
        _2342 = as_type<int>(_2414);
        _2326 = _2456;
        _2344 = as_type<int>(_2432);
        _2258 = _2434;
        _2346 = _2460;
    }
    float _2462 = _2332;
    float _2464 = _2296;
    float _2466 = _2312;
    float _2468 = _2252;
    float _2470 = _2254;
    float _2472 = _2290;
    float _2474 = _2306;
    float _2476 = _2256;
    int _2478 = _2342;
    float _2480 = _2326;
    int _2482 = _2344;
    float _2484 = _2258;
    float _2486 = _2346;
    bool _2488 = !_2324;
    float _2490 = _2470;
    int _2492 = _2478;
    float _2494 = _2480;
    float _2496 = _2486;
    float _2498 = _2468;
    float _2500 = _2462;
    float _2502 = _2476;
    float _2504 = _2464;
    float _2506 = _2466;
    float _2508 = _2472;
    float _2510 = _2474;
    int _2512 = _2482;
    float _2514 = _2484;
    if (!_2488)
    {
        uint _2516 = uint(int(uint(_182) >> uint(2)));
        float _2518 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2516)]);
        int _2520 = _182 + 4;
        uint _2522 = uint(int(uint(_2520) >> uint(2)));
        float _2524 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2522)]);
        int _2526 = _182 + 8;
        uint _2528 = uint(int(uint(_2526) >> uint(2)));
        float _2530 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2528)]);
        int _2532 = _182 + 12;
        uint _2534 = uint(int(uint(_2532) >> uint(2)));
        float _2536 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2534)]);
        uint _2538 = uint(int(uint(_182) >> uint(2)));
        float _2540 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2538)]);
        int _2542 = _182 + 4;
        uint _2544 = uint(int(uint(_2542) >> uint(2)));
        float _2546 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2544)]);
        int _2548 = _182 + 8;
        uint _2550 = uint(int(uint(_2548) >> uint(2)));
        float _2552 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2550)]);
        int _2554 = _182 + 12;
        uint _2556 = uint(int(uint(_2554) >> uint(2)));
        float _2558 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2556)]);
        uint _2560 = uint(int(uint(_182) >> uint(2)));
        float _2562 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2560)]);
        int _2564 = _182 + 4;
        uint _2566 = uint(int(uint(_2564) >> uint(2)));
        float _2568 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2566)]);
        int _2570 = _182 + 8;
        uint _2572 = uint(int(uint(_2570) >> uint(2)));
        float _2574 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2572)]);
        int _2576 = _182 + 12;
        uint _2578 = uint(int(uint(_2576) >> uint(2)));
        float _2580 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2578)]);
        float _2582 = _2122 * _2524;
        float _2584 = _2122 * _2546;
        float _2586 = _2122 * _2568;
        float _2588 = fma(_1988, _2518, _2582);
        float _2590 = fma(_1988, _2540, _2584);
        float _2592 = fma(_1988, _2562, _2586);
        float _2594 = fma(_2000, _2530, _2588);
        float _2596 = fma(_2000, _2552, _2590);
        float _2598 = fma(_2000, _2574, _2592);
        float _2600 = _2594 + _2536;
        float _2602 = _2596 + _2558;
        float _2604 = _2598 + _2580;
        _2490 = _2540;
        _2492 = as_type<int>(_2562);
        _2494 = _2600;
        _2496 = _2604;
        _2498 = _2536;
        _2500 = _2602;
        _2502 = _2558;
        _2504 = _2588;
        _2506 = _2594;
        _2508 = _2590;
        _2510 = _2596;
        _2512 = as_type<int>(_2580);
    }
    float _2606 = _2490;
    int _2608 = _2492;
    float _2610 = _2494;
    float _2612 = _2496;
    float _2614 = _2498;
    float _2616 = _2500;
    float _2618 = _2502;
    float _2620 = _2504;
    float _2622 = _2506;
    float _2624 = _2508;
    float _2626 = _2510;
    int _2628 = _2512;
    float _2630 = _2028 + _2338;
    int _2632 = _2608;
    float _2634 = _2610;
    float _2636 = _2612;
    float _2638 = _2610;
    float _2640 = _2612;
    float _2642 = _2620;
    float _2644 = _2622;
    float _2646 = _2606;
    float _2648 = _2626;
    int _2650 = _2628;
    float _2652 = _2616;
    float _2654 = _2616;
    float _2656 = _2614;
    float _2658 = _2624;
    float _2660 = _2618;
    if (!_2212)
    {
        _1760 = 0;
    }
    int _2662 = _1760;
    int _2664 = _2662;
    if (!_2212)
    {
        _2176 = as_type<int>(_2128);
    }
    int _2666 = _2176;
    float _2668 = -_2034;
    bool _2670 = _2630 != _2668;
    bool _2672 = isnan(_2630);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan(_2668);
    bool _2678 = _2674 || _2676;
    bool _2680 = _2678;
    int _2682 = _2666;
    if (!_2212)
    {
        _2632 = as_type<int>(_2134);
    }
    int _2684 = _2632;
    int _2686 = _2678 ? 0 : 1;
    int _2688 = _2686;
    int _2690 = _2686;
    int _2692 = _2684;
    if (!_2212)
    {
        _2348 = as_type<int>(_2140);
    }
    int _2694 = _2348;
    bool _2696 = !_2212;
    int _2698 = _2694;
    if (!_2696)
    {
        uint _2700 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _2702 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2700)]);
        int _2704 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
        uint _2706 = uint(int(uint(_2704) >> uint(2)));
        float _2708 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2706)]);
        int _2710 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
        uint _2712 = uint(int(uint(_2710) >> uint(2)));
        float _2714 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2712)]);
        int _2716 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
        uint _2718 = uint(int(uint(_2716) >> uint(2)));
        float _2720 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2718)]);
        float _2722 = _2148 * 0.5;
        float _2724 = 1.0 / _2148;
        float _2726 = -_2708;
        float _2728 = fma(_2722, _2726, _2702);
        float _2730 = -_2722;
        float _2732 = _2730 + _2728;
        float _2734 = -_2720;
        float _2736 = fma(_2722, _2734, _2714);
        float _2738 = -_2732;
        float _2740 = _2738 + _2610;
        float _2742 = -_2722;
        float _2744 = _2742 + _2736;
        float _2746 = _2740 * _2724;
        float _2748 = -_2744;
        float _2750 = _2748 + _2612;
        float _2752 = floor(_2746);
        float _2754 = _2750 * _2724;
        float _2756 = floor(_2754);
        float _2758 = -_2752;
        float _2760 = fma(_2148, _2758, _2740);
        bool _2762 = _2760 != _2740;
        bool _2764 = isnan(_2760);
        bool _2766 = _2762 || _2764;
        bool _2768 = isnan(_2740);
        bool _2770 = _2766 || _2768;
        float _2772 = -_2756;
        float _2774 = fma(_2148, _2772, _2750);
        bool _2776 = _2774 == _2750;
        bool _2778 = !_2770;
        bool _2780 = _2776 && _2778;
        bool _2782 = !_2780;
        int _2784 = as_type<int>(_2754);
        int _2786 = as_type<int>(_2724);
        int _2788 = as_type<int>(_2752);
        _2664 = _2782 ? (-1) : 0;
        _2642 = _2760;
        _2644 = _2744;
        _2646 = _2774;
        _2648 = _2732;
        _2680 = _2780;
        _2514 = _2740;
        _2350 = _2750;
        if (_2780)
        {
            _2784 = as_type<int>(_2128);
        }
        int _2790 = _2784;
        int _2792 = _2790;
        if (!_2780)
        {
            float _2794 = _2732 + _2760;
            _2634 = _2794;
        }
        float _2796 = _2634;
        _2638 = _2796;
        if (_2780)
        {
            _2786 = as_type<int>(_2134);
        }
        int _2798 = _2786;
        int _2800 = _2798;
        if (!_2780)
        {
            float _2802 = _2744 + _2774;
            _2636 = _2802;
        }
        float _2804 = _2636;
        _2640 = _2804;
        if (_2780)
        {
            _2788 = as_type<int>(_2140);
        }
        int _2806 = _2788;
        _2698 = _2806;
        if (!_2780)
        {
            _2688 = 1;
        }
        int _2808 = _2688;
        _2690 = _2808;
        if (!_2780)
        {
            _2792 = 0;
        }
        int _2810 = _2792;
        _2682 = _2810;
        if (!_2780)
        {
            _2800 = 0;
        }
        int _2812 = _2800;
        _2692 = _2812;
        if (!_2780)
        {
            _2698 = 0;
        }
    }
    int _2814 = _2690;
    float _2816 = _2638;
    float _2818 = _2640;
    int _2820 = _2664;
    float _2822 = _2642;
    float _2824 = _2644;
    float _2826 = _2646;
    float _2828 = _2648;
    bool _2830 = _2680;
    float _2832 = _2514;
    int _2834 = _2682;
    int _2836 = _2692;
    int _2838 = _2698;
    float _2840 = _2350;
    int _2842 = _2814 & 1;
    bool _2844 = _2842 != 0;
    float _2846 = _2036 * 0.5;
    float _2848 = -_2008;
    float _2850 = _1222 + _2848;
    float _2852 = precise::max(_2846, 0.001000000047497451305389404296875);
    float _2854 = precise::min(_2852, 10000.0);
    float _2856 = _2832;
    bool _2858 = _2830;
    float _2860 = _2846;
    float _2862 = _2840;
    float _2864 = _2822;
    float _2866 = _2824;
    float _2868 = _2826;
    float _2870 = _2828;
    float _2872 = as_type<float>(_2838);
    float _2874 = as_type<float>(_2834);
    if (!_2844)
    {
        _2856 = _2016;
    }
    float _2876 = _2856;
    float _2878 = _2876;
    if (!_2844)
    {
        _2178 = _2022;
    }
    float _2880 = _2178;
    float _2882 = _2880;
    if (!_2844)
    {
        _2180 = _2028;
    }
    float _2884 = _2180;
    float _2886 = _2884;
    if (!_2844)
    {
        _2182 = _2034;
    }
    float _2888 = _2182;
    float _2890 = _2888;
    if (!_2844)
    {
        _2184 = _2152;
    }
    float _2892 = _2184;
    float _2894 = _2892;
    if (!_2844)
    {
        _2858 = false;
    }
    bool _2896 = _2858;
    bool _2898 = _2896;
    if (!_2844)
    {
        _2860 = _2158;
    }
    float _2900 = _2860;
    float _2902 = _2900;
    if (!_2844)
    {
        _2862 = _2164;
    }
    float _2904 = _2862;
    float _2906 = 0.0;
    float _2908 = _2904;
    if (!_2844)
    {
        _2906 = _2170;
    }
    float _2910 = _2906;
    int _2912 = 0;
    float _2914 = _2910;
    if (!_2844)
    {
        _2912 = as_type<int>(_1988);
    }
    int _2916 = _2912;
    int _2918 = _2916;
    int _2920 = _2916;
    if (!_2844)
    {
        _2650 = as_type<int>(_2122);
    }
    int _2922 = _2650;
    int _2924 = 0;
    int _2926 = _2922;
    if (!_2844)
    {
        _2924 = as_type<int>(_2000);
    }
    int _2928 = _2924;
    bool _2930 = !_2844;
    int _2932 = _2928;
    int _2934 = _2928;
    float _2936 = 0.0;
    float _2938 = 0.0;
    float _2940 = 0.0;
    if (!_2930)
    {
        float _2942 = fma(_2816, 6.2500002968590706586837768554688e-05, 0.5);
        float _2944 = fma(_2818, 6.2500002968590706586837768554688e-05, 0.5);
        float _2946 = fma(_2816, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2948 = fma(_2818, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2950 = fma(_2818, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _14376 = float2(_2942, _2944);
        float2 _2954 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14376, float2(0.0), isnan(_14376)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14376, float2(0.0), isnan(_14376)), level(0.0)).xy;
        float _2956 = _2954.x;
        float _2958 = _2954.y;
        float _2960 = fma(_2816, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float _2962 = fma(_2816, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _2964 = fma(_2818, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float2 _14397 = float2(_2946, _2948);
        float _2966 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14397, float2(0.0), isnan(_14397)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14397, float2(0.0), isnan(_14397)), level(0.0)).x;
        float2 _14405 = float2(_2946, _2950);
        float _2968 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14405, float2(0.0), isnan(_14405)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14405, float2(0.0), isnan(_14405)), level(0.0)).x;
        float2 _14413 = float2(_2960, _2948);
        float _2970 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14413, float2(0.0), isnan(_14413)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14413, float2(0.0), isnan(_14413)), level(0.0)).x;
        float2 _14421 = float2(_2962, _2944);
        float2 _2972 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14421, float2(0.0), isnan(_14421)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14421, float2(0.0), isnan(_14421)), level(0.0)).xy;
        float _2974 = _2972.x;
        float _2976 = _2972.y;
        float2 _14433 = float2(_2942, _2964);
        float2 _2978 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14433, float2(0.0), isnan(_14433)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14433, float2(0.0), isnan(_14433)), level(0.0)).xy;
        float _2980 = _2978.x;
        float _2982 = _2978.y;
        float2 _14445 = float2(_2960, _2950);
        float _2984 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14445, float2(0.0), isnan(_14445)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14445, float2(0.0), isnan(_14445)), level(0.0)).x;
        float _2986 = -_2958;
        float _2988 = _2956 + _2986;
        float _2990 = _2988 * 2000.0;
        float _2992 = abs(_2990);
        bool _2994 = _2992 >= 2.0;
        bool _2996 = isnan(_2992);
        bool _2998 = _2994 || _2996;
        bool _3000 = isnan(2.0);
        bool _3002 = _2998 || _3000;
        float _3004 = _2990;
        float _3006 = _2946;
        float _3008 = _2958;
        float _3010 = _2982;
        float _3012 = _2960;
        float _3014 = _2942;
        _2870 = _2944;
        if (_3002)
        {
            int _3016 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 4;
            uint _3018 = uint(int(uint(_3016) >> uint(2)));
            float _3020 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_3018)]);
            _3004 = _3020;
        }
        float _3022 = _3004;
        float _3024 = _2956 * 2000.0;
        float _3026 = -_2956;
        float _3028 = _3026 + _2974;
        float _3030 = -_2956;
        float _3032 = _3030 + _2980;
        float _3034 = -_2956;
        float _3036 = _3034 + _2966;
        float _3038 = _3024;
        if (_3002)
        {
            float _3040 = _3024 + (-2.0);
            _3006 = _3040;
        }
        float _3042 = _3006;
        float _3044 = _3028 * 1000.0;
        float _3046 = _3032 * 1000.0;
        float _3048 = -_2956;
        float _3050 = _3048 + _2968;
        float _3052 = _3036 * 2000.0;
        float _3054 = -_2956;
        float _3056 = _3054 + _2970;
        float _3058 = -_2956;
        float _3060 = _3058 + _2984;
        float _3062 = _3050 * 2000.0;
        float _3064 = _3060 * 2000.0;
        float _3066 = abs(_3052);
        float _3068 = abs(_3062);
        float _3070 = precise::max(_3066, _3068);
        float _3072 = _3056 * 2000.0;
        float _3074 = abs(_3072);
        float _3076 = precise::max(_3070, _3074);
        float _3078 = abs(_3064);
        float _3080 = precise::max(_3076, _3078);
        float _3082 = _3022;
        float _3084 = _3072;
        float _3086 = _3056;
        float _3088 = _3060;
        if (_3002)
        {
            float _3090 = _3022 + 10.0;
            _3082 = _3090;
        }
        float _3092 = _3082;
        bool _3094 = _3092 < _3042;
        bool _3096 = !_3002;
        bool _3098 = _3094 || _3096;
        float _3100 = fma(_3044, _3044, 0.0625);
        float _3102 = fma(_3046, _3046, _3100);
        float _3104 = rsqrt(_3102);
        float _3106 = _3104 * 0.25;
        float _3108 = _3044 * _3104;
        float _3110 = _3046 * _3104;
        bool _3112 = _3106 < 0.891006529331207275390625;
        bool _3114 = _3112 || _3098;
        bool _3116 = _3080 >= 2.0;
        bool _3118 = isnan(_3080);
        bool _3120 = _3116 || _3118;
        bool _3122 = isnan(2.0);
        bool _3124 = _3120 || _3122;
        bool _3126 = _3124 || _3114;
        bool _3128 = !_3126;
        float _3130 = _3092;
        float _3162;
        float _3164;
        float _3166;
        float _3168;
        if (!_3128)
        {
            float _3132 = -_2958;
            float _3134 = _3132 + _2976;
            float _3136 = -_2958;
            float _3138 = _3136 + _2982;
            float _3140 = _3134 * 1000.0;
            float _3142 = _3138 * 1000.0;
            float _3144 = fma(_3140, _3140, 0.0625);
            float _3146 = fma(_3142, _3142, _3144);
            float _3148 = _2958 * 2000.0;
            float _3150 = rsqrt(_3146);
            float _3152 = -_3140;
            float _3154 = fma(_3152, _3150, -0.0);
            float _3156 = -_3142;
            float _3158 = fma(_3156, _3150, -0.0);
            float _3160 = _3150 * 0.25;
            _3162 = _3148;
            _3164 = _3158;
            _3166 = _3154;
            _3168 = _3160;
            _3170 = true;
        }
        else
        {
            float _3172 = _3110 * _3110;
            float _3174 = 1.0 / _3106;
            float _3176 = fma(_3108, _3108, _3172);
            float _3178 = sqrt(_3176);
            bool _3180 = _3178 > 9.9999997473787516355514526367188e-05;
            float _3182 = _3178 * _3174;
            float _3184 = _3172;
            if (_3180)
            {
                float _3186 = abs(_3108);
                float _3188 = abs(_3110);
                float _3190 = precise::max(_3186, _3188);
                _3008 = _3190;
            }
            float _3192 = _3008;
            float _3194 = -_3108;
            float _3196 = (-0.0) + _3194;
            _3166 = _3196;
            if (!_3180)
            {
                _3184 = 0.0;
            }
            float _3198 = _3184;
            float _3200 = -_3110;
            float _3202 = (-0.0) + _3200;
            float _3204 = _3192;
            float _3206 = _3198;
            _3164 = _3202;
            if (_3180)
            {
                float _3208 = 1.0 / _3192;
                _3204 = _3208;
            }
            float _3210 = _3204;
            if (_3180)
            {
                float _3212 = _3178 * _3210;
                _3206 = _3212;
            }
            float _3214 = _3206;
            float _3216 = _3214 * 0.9649016857147216796875;
            float _3218 = -_3216;
            float _3220 = fma(_3218, _3182, _3024);
            _3162 = _3220;
            _3168 = _3106;
        }
        _3170 = false;
        float _3222 = _3162;
        float _3224 = _3164;
        float _3226 = _3166;
        float _3228 = _3168;
        float2 _14756 = float2(_2942, _2944);
        float _3230 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_14756, float2(0.0), isnan(_14756)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_14756, float2(0.0), isnan(_14756)), level(0.0)).y;
        float _3232 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[81]);
        bool _3234 = _2616 >= _3222;
        int _3236 = (_3234 ? (-1) : 0) | _2820;
        float _3238 = 0.0 + _3232;
        float _3240 = precise::clamp(_3238, 0.0, 1.0);
        bool _3242 = _2234 >= _3240;
        int _3244 = (_3242 ? (-1) : 0) & _3236;
        int _3246 = ~_3244;
        float _3248 = _3222;
        float _3250 = _3222;
        float _3312;
        float _3314;
        float _3316;
        float _3318;
        float _3320;
        float _3322;
        float _3324;
        float _3326;
        float _3328;
        float _3330;
        float _3332;
        bool _3334;
        float _3336;
        float _3338;
        if (!(_3246 != 0))
        {
            float _3252 = _2222 * 6.283185482025146484375;
            float _3254 = _2216 * 6.283185482025146484375;
            float _3256 = _2228 * 6.283185482025146484375;
            if (_2820 != 0)
            {
                float _3258 = fma(_2222, _2148, _3222);
                _2652 = _3258;
            }
            float _3260 = _2652;
            float _3262 = _3252 * _3252;
            float _3264 = fma(_3254, _3254, _3262);
            float _3266 = fma(_3256, _3256, _3264);
            float _3268 = sqrt(_3266);
            float _3270 = rsqrt(_3266);
            float _3272 = _3268 * 0.5;
            bool _3274 = _3268 != 0.0;
            bool _3276 = isnan(_3268);
            bool _3278 = _3274 || _3276;
            bool _3280 = isnan(0.0);
            bool _3282 = _3278 || _3280;
            float _3284 = _3272 * 0.15915493667125701904296875;
            float _3286 = _3254 * _3270;
            float _3288 = _3284 * 6.283185482025146484375;
            float _3290 = sin(_3288);
            float _3292 = _3252 * _3270;
            float _3294 = _3256 * _3270;
            float _3296 = _3282 ? _3286 : 0.0;
            float _3298 = _3282 ? _3292 : 0.0;
            float _3300 = _3284 * 6.283185482025146484375;
            float _3302 = cos(_3300);
            float _3304 = _3282 ? _3294 : 0.0;
            float _3306 = _3296 * _3290;
            float _3308 = _3298 * _3290;
            float _3310 = _3304 * _3290;
            _3312 = _3304;
            _3314 = _3266;
            _3316 = _3296;
            _3318 = _3270;
            _3320 = _3260;
            _3322 = _3260;
            _3324 = _3310;
            _3326 = _3308;
            _3328 = _3302;
            _3330 = _3284;
            _3332 = _3298;
            _3334 = _3282;
            _3336 = _3306;
            _3338 = 0.0;
            _3340 = true;
        }
        else
        {
            float _3342 = _3226 * _3226;
            float _3344 = fma(_3224, _3224, _3342);
            float _3346 = sqrt(_3344);
            float _3348 = precise::max(_3346, -1.0);
            float _3350 = precise::min(_3348, 1.0);
            float _3352 = abs(_3350);
            float _3354 = fma(_3352, -0.5, 0.5);
            int _3356 = as_type<int>(_3354) + (-218103808);
            bool _3358 = uint(_3356) >= 1920991232u;
            bool _3360 = !_3358;
            int _3380;
            if (!_3360)
            {
                int _3362 = 1056964608;
                int _3364 = as_type<int>(_3240);
                int _3366 = as_type<int>(_3354);
                int _3368 = 11888;
                int _3370;
                int _3372;
                int _3374;
                int _3376;
                int _3378;
                _87(_3362, _3364, _3366, _3368, _3370, _3372, _3374, _3376, _3378);
                _3380 = _3370;
                _3382 = true;
            }
            else
            {
                float _3384 = rsqrt(_3354);
                float _3386 = _3354 * _3384;
                float _3388 = _3384 * 0.5;
                float _3390 = -_3386;
                float _3392 = 0.0 + _3390;
                float _3394 = fma(_3388, _3392, 0.5);
                float _3396 = fma(_3386, _3394, _3386);
                float _3398 = -_3396;
                float _3400 = 0.0 + _3398;
                float _3402 = fma(_3396, _3400, _3354);
                float _3404 = fma(_3388, _3402, _3396);
                _3380 = as_type<int>(_3404);
            }
            _3382 = false;
            int _3406 = _3380;
            float _3408 = abs(_3350);
            bool _3410 = _3408 > 0.569999992847442626953125;
            float _3412 = _3346 + 9.9999997473787516355514526367188e-06;
            float _3414 = _2228 * 6.283185482025146484375;
            float _3416 = abs(_3350);
            float _3418 = _3410 ? as_type<float>(_3406) : _3416;
            float _3420 = 1.0 / _3412;
            float _3422 = _3414 * _3228;
            float _3424 = _3418 * _3418;
            float _3426 = fma(_3424, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
            float _3428 = fma(_3424, _3426, 0.0467568598687648773193359375);
            float _3430 = fma(_3424, _3428, 0.074846573173999786376953125);
            float _3432 = fma(_3424, _3430, 0.166670143604278564453125);
            float _3434 = _3424 * _3432;
            float _3436 = _3422 * _3422;
            float _3438 = fma(_3418, _3434, _3418);
            float _3440 = _3420 * _3226;
            float _3442 = _3438;
            _3338 = 1.0;
            if (_3410)
            {
                float _3444 = fma(_3438, -2.0, 1.57079637050628662109375);
                _3442 = _3444;
            }
            float _3446 = _3442;
            bool _3448 = _3350 >= 0.0;
            bool _3450 = isnan(_3350);
            bool _3452 = _3448 || _3450;
            bool _3454 = isnan(0.0);
            bool _3456 = _3452 || _3454;
            float _3458 = _3414 * _3226;
            float _3460 = _3414 * _3224;
            float _3462 = -_3224;
            float _3464 = _3420 * _3462;
            bool _3466 = !_3456;
            float _3468 = -_3446;
            float _3470 = _3466 ? _3468 : _3446;
            float _3472 = fma(_3458, _3458, _3436);
            float _3474 = -_3222;
            float _3476 = fma(_3230, 2000.0, _3474);
            float _3478 = _3470 * _3440;
            float _3480 = fma(_3460, _3460, _3472);
            float _3482 = _3470 * _3464;
            float _3484 = abs(_3476);
            bool _3486 = _3484 >= 2.0;
            bool _3488 = isnan(_3484);
            bool _3490 = _3486 || _3488;
            bool _3492 = isnan(2.0);
            bool _3494 = _3490 || _3492;
            float _3496 = _3478 * _3478;
            float _3498 = sqrt(_3480);
            bool _3500 = _3228 <= 0.891006529331207275390625;
            bool _3502 = !_3494;
            bool _3504 = _3500 || _3502;
            float _3506 = fma(_3482, _3482, _3496);
            float _3508 = sqrt(_3506);
            _3320 = _3476;
            _3334 = _3504;
            if (_3504)
            {
                float _3510 = _3222 + (-1000.0);
                _3248 = _3510;
            }
            float _3512 = _3248;
            float _3514 = rsqrt(_3480);
            float _3516 = _3498 * 0.5;
            bool _3518 = _3498 != 0.0;
            bool _3520 = isnan(_3498);
            bool _3522 = _3518 || _3520;
            bool _3524 = isnan(0.0);
            bool _3526 = _3522 || _3524;
            float _3528 = _3516 * 0.15915493667125701904296875;
            float _3530 = rsqrt(_3506);
            float _3532 = _3508 * 0.5;
            bool _3534 = _3508 != 0.0;
            bool _3536 = isnan(_3508);
            bool _3538 = _3534 || _3536;
            bool _3540 = isnan(0.0);
            bool _3542 = _3538 || _3540;
            float _3544 = _3532 * 0.15915493667125701904296875;
            float _3546 = _3528 * 6.283185482025146484375;
            float _3548 = sin(_3546);
            float _3550 = _3458 * _3514;
            float _3552 = _3460 * _3514;
            float _3554 = _3422 * _3514;
            float _3556 = _3526 ? _3550 : 0.0;
            float _3558 = _3544 * 6.283185482025146484375;
            float _3560 = sin(_3558);
            float _3562 = _3482 * _3530;
            float _3564 = _3478 * _3530;
            float _3566 = _3526 ? _3552 : 0.0;
            float _3568 = _3526 ? _3554 : 0.0;
            float _3570 = _3542 ? _3562 : 0.0;
            float _3572 = _3544 * 6.283185482025146484375;
            float _3574 = cos(_3572);
            float _3576 = _3556 * _3548;
            float _3578 = _3542 ? _3564 : 0.0;
            float _3580 = _3566 * _3548;
            float _3582 = _3568 * _3548;
            float _3584 = _3528 * 6.283185482025146484375;
            float _3586 = cos(_3584);
            float _3588 = _3570 * _3560;
            float _3590 = _3578 * _3560;
            float _3592 = _3590 * _3576;
            float _3594 = _3590 * _3580;
            float _3596 = _3574 * _3576;
            float _3598 = _3574 * _3580;
            float _3600 = fma(_3588, _3576, _3594);
            float _3602 = fma(_3588, _3586, _3596);
            float _3604 = fma(_3590, _3586, _3598);
            float _3606 = fma(_3590, _3582, _3602);
            float _3608 = -_3592;
            float _3610 = fma(_3588, _3580, _3608);
            float _3612 = -_3588;
            float _3614 = fma(_3612, _3582, _3604);
            float _3616 = fma(_3574, _3582, _3610);
            float _3618 = -_3600;
            float _3620 = fma(_3574, _3586, _3618);
            _3250 = _3512;
            _3312 = _3598;
            _3314 = _3588;
            _3316 = _3576;
            _3318 = _3602;
            _3010 = _3582;
            _3084 = _3600;
            _3012 = _3592;
            _3086 = _3530;
            _3038 = _3544;
            _3088 = _3514;
            _3130 = _3528;
            _3014 = _3498;
            _3322 = _3512;
            _3324 = _3614;
            _3326 = _3616;
            _3328 = _3620;
            _3330 = _3586;
            _3332 = _3574;
            _3336 = _3606;
        }
        _3340 = false;
        float _3622 = _3250;
        float _3624 = _3312;
        float _3626 = _3314;
        float _3628 = _3316;
        float _3630 = _3318;
        float _3632 = _3010;
        float _3634 = _3084;
        float _3636 = _3012;
        float _3638 = _3320;
        float _3640 = _3086;
        float _3642 = _3038;
        float _3644 = _3088;
        float _3646 = _3130;
        float _3648 = _3014;
        float _3650 = _3322;
        float _3652 = _3324;
        float _3654 = _3326;
        float _3656 = _3328;
        float _3658 = _3330;
        float _3660 = _3332;
        bool _3662 = _3334;
        float _3664 = _3336;
        float _3666 = _3338;
        bool _3668 = !_2044;
        bool _3670 = _3662;
        float _3672 = _3628;
        float _3674 = _3660;
        float _3676 = _3658;
        float _3678 = _3622;
        float _3680 = _3624;
        float _3682 = _3626;
        _2352 = _3630;
        _2354 = _3632;
        _2356 = _3634;
        _2358 = _3636;
        _2654 = _3638;
        _2864 = _3640;
        _2866 = _3642;
        _2656 = _3644;
        _2868 = _3646;
        _2658 = _3648;
        _2878 = _3664;
        _2926 = as_type<int>(_3650);
        _2914 = _3666;
        if (!_3668)
        {
            float _3684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
            float _3694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
            float _3696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
            float _3698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
            float _3700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _3716 = _3690 * _3692;
            float _3718 = _3690 * _3696;
            float _3720 = _3690 * _3694;
            float _3722 = _3686 * _3692;
            float _3724 = _3706 * _3696;
            float _3726 = _3706 * _3692;
            float _3728 = -_3716;
            float _3730 = fma(_3684, _3698, _3728);
            float _3732 = _3706 * _3694;
            float _3734 = -_3724;
            float _3736 = fma(_3704, _3698, _3734);
            float _3738 = _3706 * _3688;
            float _3740 = _3706 * _3686;
            float _3742 = -_3726;
            float _3744 = fma(_3700, _3698, _3742);
            float _3746 = _3706 * _3684;
            float _3748 = _3688 * _3692;
            float _3750 = -_3718;
            float _3752 = fma(_3688, _3698, _3750);
            float _3754 = -_3720;
            float _3756 = fma(_3686, _3698, _3754);
            float _3758 = -_3732;
            float _3760 = fma(_3702, _3698, _3758);
            float _3762 = -_3738;
            float _3764 = fma(_3704, _3690, _3762);
            float _3766 = -_3740;
            float _3768 = fma(_3702, _3690, _3766);
            float _3770 = -_3746;
            float _3772 = fma(_3700, _3690, _3770);
            float _3774 = -_3748;
            float _3776 = fma(_3684, _3696, _3774);
            float _3778 = _3704 * _3686;
            float _3780 = _3704 * _3684;
            float _3782 = -_3722;
            float _3784 = fma(_3684, _3694, _3782);
            float _3786 = _3702 * _3684;
            float _3788 = _3704 * _3730;
            float _3790 = _3702 * _3692;
            float _3792 = _3688 * _3694;
            float _3794 = _3704 * _3692;
            float _3796 = -_3778;
            float _3798 = fma(_3702, _3688, _3796);
            float _3800 = _3704 * _3756;
            float _3802 = -_3788;
            float _3804 = fma(_3700, _3752, _3802);
            float _3806 = -_3790;
            float _3808 = fma(_3700, _3694, _3806);
            float _3810 = _3704 * _3694;
            float _3812 = -_3792;
            float _3814 = fma(_3686, _3696, _3812);
            float _3816 = -_3786;
            float _3818 = fma(_3700, _3686, _3816);
            float _3820 = _3702 * _3730;
            float _3822 = _3702 * _3776;
            float _3824 = -_3800;
            float _3826 = fma(_3702, _3752, _3824);
            float _3828 = fma(_3706, _3776, _3804);
            float _3830 = -_3810;
            float _3832 = fma(_3702, _3696, _3830);
            float _3834 = -_3780;
            float _3836 = fma(_3700, _3688, _3834);
            float _3838 = -_3820;
            float _3840 = fma(_3700, _3756, _3838);
            float _3842 = -_3822;
            float _3844 = fma(_3700, _3814, _3842);
            float _3846 = fma(_3706, _3814, _3826);
            float _3848 = _3710 * _3828;
            float _3850 = -_3794;
            float _3852 = fma(_3700, _3696, _3850);
            float _3854 = _3712 * _3756;
            float _3856 = fma(_3706, _3784, _3840);
            float _3858 = -_3848;
            float _3860 = fma(_3708, _3846, _3858);
            float _3862 = fma(_3704, _3784, _3844);
            float _3864 = -_3854;
            float _3866 = fma(_3710, _3752, _3864);
            float _3868 = _3712 * _3730;
            float _3870 = fma(_3712, _3856, _3860);
            float _3872 = _3710 * _3730;
            float _3874 = _3712 * _3760;
            float _3876 = _3712 * _3744;
            float _3878 = -_3714;
            float _3880 = fma(_3878, _3862, _3870);
            float _3882 = -_3872;
            float _3884 = fma(_3708, _3756, _3882);
            float _3886 = -_3874;
            float _3888 = fma(_3710, _3736, _3886);
            float _3890 = _3712 * _3768;
            float _3892 = 1.0 / _3880;
            float _3894 = -_3876;
            float _3896 = fma(_3708, _3736, _3894);
            float _3898 = _3710 * _3744;
            float _3900 = _3712 * _3772;
            float _3902 = _3710 * _3772;
            float _3904 = fma(_3714, _3814, _3866);
            float _3906 = -_3868;
            float _3908 = fma(_3708, _3752, _3906);
            float _3910 = fma(_3714, _3784, _3884);
            float _3912 = -_3890;
            float _3914 = fma(_3710, _3764, _3912);
            float _3916 = -_3898;
            float _3918 = fma(_3708, _3760, _3916);
            float _3920 = -_3900;
            float _3922 = fma(_3708, _3764, _3920);
            float _3924 = -_3902;
            float _3926 = fma(_3708, _3768, _3924);
            float _3928 = fma(_3714, _3776, _3908);
            float _3930 = fma(_3714, _3798, _3914);
            float _3932 = fma(_3714, _3852, _3896);
            float _3934 = fma(_3714, _3832, _3888);
            float _3936 = _3904 * _3892;
            float _3938 = _3828 * _3892;
            float _3940 = _3910 * _3892;
            float _3942 = _3846 * _3892;
            float _3944 = _3936 * _3650;
            float _3946 = fma(_3714, _3808, _3918);
            float _3948 = _3928 * _3892;
            float _3950 = _3856 * _3892;
            float _3952 = _3938 * _2816;
            float _3954 = _3940 * _3650;
            float _3956 = fma(_3714, _3836, _3922);
            float _3958 = -_3944;
            float _3960 = fma(_3942, _2816, _3958);
            float _3962 = -_3952;
            float _3964 = fma(_3948, _3650, _3962);
            float _3966 = -_3954;
            float _3968 = fma(_3950, _2816, _3966);
            float _3970 = _3934 * _3892;
            float _3972 = _3932 * _3892;
            float _3974 = _3946 * _3892;
            float _3976 = fma(_3714, _3818, _3926);
            float _3978 = fma(_3970, _2818, _3960);
            float _3980 = -_3972;
            float _3982 = fma(_3980, _2818, _3964);
            float _3984 = fma(_3974, _2818, _3968);
            float _3986 = -_3930;
            float _3988 = fma(_3986, _3892, _3978);
            float _3990 = fma(_3956, _3892, _3982);
            float _3992 = -_3976;
            float _3994 = fma(_3992, _3892, _3984);
            _2352 = _3972;
            _2354 = _3932;
            _2356 = _3948;
            _2358 = _3768;
            _2654 = _3950;
            _2864 = _3856;
            _2866 = _3936;
            _2656 = _3928;
            _2868 = _3940;
            _2658 = _3930;
            _2870 = _3974;
            _2660 = _3714;
            _2898 = true;
            _2920 = as_type<int>(_3988);
            _2890 = _3656;
            _2934 = as_type<int>(_3994);
            _2886 = _3652;
            _2926 = as_type<int>(_3990);
            _2882 = _3654;
            _2936 = _3938;
            _2938 = _3862;
            _2940 = _3808;
            _2894 = 0.0;
            _2908 = 0.0;
            _2902 = 0.0;
            _3996 = true;
        }
        else
        {
            bool _3998 = !_2272;
            if (!_3998)
            {
                float _4000 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _4002 = uint(int(uint(_182) >> uint(2)));
                float _4004 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4002)]);
                int _4006 = _182 + 4;
                uint _4008 = uint(int(uint(_4006) >> uint(2)));
                float _4010 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4008)]);
                int _4012 = _182 + 8;
                uint _4014 = uint(int(uint(_4012) >> uint(2)));
                float _4016 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4014)]);
                uint _4018 = uint(int(uint(_182) >> uint(2)));
                float _4020 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4018)]);
                int _4022 = _182 + 4;
                uint _4024 = uint(int(uint(_4022) >> uint(2)));
                float _4026 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4024)]);
                int _4028 = _182 + 8;
                uint _4030 = uint(int(uint(_4028) >> uint(2)));
                float _4032 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4030)]);
                uint _4034 = uint(int(uint(_182) >> uint(2)));
                float _4036 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4034)]);
                int _4038 = _182 + 4;
                uint _4040 = uint(int(uint(_4038) >> uint(2)));
                float _4042 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4040)]);
                int _4044 = _182 + 8;
                uint _4046 = uint(int(uint(_4044) >> uint(2)));
                float _4048 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4046)]);
                float _4050 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _4052 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _4054 = _4016 * _4020;
                float _4056 = _4016 * _4026;
                float _4058 = -_4054;
                float _4060 = fma(_4004, _4032, _4058);
                float _4062 = _4010 * _4020;
                float _4064 = -_4056;
                float _4066 = fma(_4010, _4032, _4064);
                float _4068 = _4042 * _4060;
                float _4070 = -_4062;
                float _4072 = fma(_4004, _4026, _4070);
                float _4074 = -_4068;
                float _4076 = fma(_4036, _4066, _4074);
                float _4078 = fma(_4048, _4072, _4076);
                float _4080 = _4000 * _4032;
                float _4082 = 1.0 / _4078;
                float _4084 = _4000 * _4026;
                float _4086 = _4000 * _4020;
                float _4088 = _4048 * _4020;
                float _4090 = _4042 * _4032;
                float _4092 = -_4080;
                float _4094 = fma(_4016, _4050, _4092);
                float _4096 = -_4084;
                float _4098 = fma(_4010, _4050, _4096);
                float _4100 = -_4086;
                float _4102 = fma(_4004, _4050, _4100);
                float _4104 = -_4004;
                float _4106 = fma(_4104, _4032, _4054);
                float _4108 = -_4088;
                float _4110 = fma(_4036, _4032, _4108);
                float _4112 = _4036 * _4026;
                float _4114 = -_4090;
                float _4116 = fma(_4048, _4026, _4114);
                float _4118 = _4048 * _4010;
                float _4120 = _4036 * _4016;
                float _4122 = _4042 * _4004;
                float _4124 = -_4112;
                float _4126 = fma(_4042, _4020, _4124);
                float _4128 = -_4118;
                float _4130 = fma(_4042, _4016, _4128);
                float _4132 = -_4120;
                float _4134 = fma(_4048, _4004, _4132);
                float _4136 = _4048 * _4098;
                float _4138 = _4116 * _4082;
                float _4140 = _4110 * _4082;
                float _4142 = -_4122;
                float _4144 = fma(_4036, _4010, _4142);
                float _4146 = _4126 * _4082;
                float _4148 = _4048 * _4102;
                float _4150 = _4042 * _4102;
                float _4152 = -_4136;
                float _4154 = fma(_4042, _4094, _4152);
                float _4156 = _4138 * _3650;
                float _4158 = _4140 * _3650;
                float _4160 = _4146 * _3650;
                float _4162 = _4106 * _4082;
                float _4164 = _4066 * _4082;
                float _4166 = _4072 * _4082;
                float _4168 = -_4148;
                float _4170 = fma(_4036, _4094, _4168);
                float _4172 = fma(_4162, _2816, _4158);
                float _4174 = fma(_4164, _2816, _4156);
                float _4176 = fma(_4166, _2816, _4160);
                float _4178 = _4134 * _4082;
                float _4180 = _4130 * _4082;
                float _4182 = _4144 * _4082;
                float _4184 = -_4150;
                float _4186 = fma(_4036, _4098, _4184);
                float _4188 = fma(_4178, _2818, _4172);
                float _4190 = fma(_4180, _2818, _4174);
                float _4192 = fma(_4052, _4060, _4170);
                float _4194 = fma(_4052, _4066, _4154);
                float _4196 = fma(_4182, _2818, _4176);
                float _4198 = fma(_4052, _4072, _4186);
                float _4200 = fma(_4192, _4082, _4188);
                float _4202 = -_4194;
                float _4204 = fma(_4202, _4082, _4190);
                float _4206 = -_4198;
                float _4208 = fma(_4206, _4082, _4196);
                _2352 = _4192;
                _2354 = _4134;
                _2356 = _4196;
                _2358 = _4188;
                _2654 = _4036;
                _2864 = _4194;
                _2866 = _4048;
                _2656 = _4094;
                _2868 = _4066;
                _2658 = _4106;
                _2870 = _4060;
                _2660 = _4098;
                _2898 = true;
                _2920 = as_type<int>(_4204);
                _2890 = _3656;
                _2934 = as_type<int>(_4208);
                _2886 = _3652;
                _2926 = as_type<int>(_4200);
                _2882 = _3654;
                _2936 = 0.0;
                _2938 = 0.0;
                _2940 = 0.0;
                _2894 = 0.0;
                _2908 = 0.0;
                _2902 = 0.0;
                _3996 = true;
            }
            else
            {
                if (!_2324)
                {
                    _3670 = true;
                }
                bool _4210 = _3670;
                _2898 = _4210;
                if (!_2324)
                {
                    _3672 = 0.0;
                }
                float _4212 = _3672;
                _2894 = _4212;
                if (!_2324)
                {
                    _3674 = 0.0;
                }
                float _4214 = _3674;
                _2902 = _4214;
                if (!_2324)
                {
                    _3676 = 0.0;
                }
                float _4216 = _3676;
                _2908 = _4216;
                if (!_2324)
                {
                    _3678 = _3654;
                }
                float _4218 = _3678;
                _2882 = _4218;
                if (!_2324)
                {
                    _3680 = _3652;
                }
                float _4220 = _3680;
                _2886 = _4220;
                if (!_2324)
                {
                    _3682 = _3656;
                }
                float _4222 = _3682;
                _2890 = _4222;
                if (!_2324)
                {
                    _2918 = as_type<int>(_2816);
                }
                int _4224 = _2918;
                _2920 = _4224;
                if (!_2324)
                {
                    _2932 = as_type<int>(_2818);
                }
                int _4226 = _2932;
                bool _4228 = !_2324;
                _2934 = _4226;
                _2936 = 0.0;
                _2938 = 0.0;
                _2940 = 0.0;
                if (!_4228)
                {
                    uint _4230 = uint(int(uint(_182) >> uint(2)));
                    float _4232 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4230)]);
                    int _4234 = _182 + 4;
                    uint _4236 = uint(int(uint(_4234) >> uint(2)));
                    float _4238 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4236)]);
                    int _4240 = _182 + 8;
                    uint _4242 = uint(int(uint(_4240) >> uint(2)));
                    float _4244 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4242)]);
                    int _4246 = _182 + 12;
                    uint _4248 = uint(int(uint(_4246) >> uint(2)));
                    float _4250 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4248)]);
                    uint _4252 = uint(int(uint(_182) >> uint(2)));
                    float _4254 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4252)]);
                    int _4256 = _182 + 4;
                    uint _4258 = uint(int(uint(_4256) >> uint(2)));
                    float _4260 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4258)]);
                    int _4262 = _182 + 8;
                    uint _4264 = uint(int(uint(_4262) >> uint(2)));
                    float _4266 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4264)]);
                    int _4268 = _182 + 12;
                    uint _4270 = uint(int(uint(_4268) >> uint(2)));
                    float _4272 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4270)]);
                    uint _4274 = uint(int(uint(_182) >> uint(2)));
                    float _4276 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4274)]);
                    int _4278 = _182 + 4;
                    uint _4280 = uint(int(uint(_4278) >> uint(2)));
                    float _4282 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4280)]);
                    int _4284 = _182 + 8;
                    uint _4286 = uint(int(uint(_4284) >> uint(2)));
                    float _4288 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4286)]);
                    int _4290 = _182 + 12;
                    uint _4292 = uint(int(uint(_4290) >> uint(2)));
                    float _4294 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4292)]);
                    float _4296 = _4244 * _4254;
                    float _4298 = _4244 * _4260;
                    float _4300 = _4238 * _4254;
                    float _4302 = _4266 * _4250;
                    float _4304 = -_4296;
                    float _4306 = fma(_4232, _4266, _4304);
                    float _4308 = -_4298;
                    float _4310 = fma(_4238, _4266, _4308);
                    float _4312 = -_4300;
                    float _4314 = fma(_4232, _4260, _4312);
                    float _4316 = _4260 * _4250;
                    float _4318 = _4282 * _4306;
                    float _4320 = _4254 * _4250;
                    float _4322 = _4282 * _4266;
                    float _4324 = -_4302;
                    float _4326 = fma(_4244, _4272, _4324);
                    float _4328 = -_4318;
                    float _4330 = fma(_4276, _4310, _4328);
                    float _4332 = -_4316;
                    float _4334 = fma(_4238, _4272, _4332);
                    float _4336 = -_4320;
                    float _4338 = fma(_4232, _4272, _4336);
                    float _4340 = _4288 * _4254;
                    float _4342 = fma(_4288, _4314, _4330);
                    float _4344 = -_4322;
                    float _4346 = fma(_4288, _4260, _4344);
                    float _4348 = _4276 * _4260;
                    float _4350 = _4288 * _4238;
                    float _4352 = _4276 * _4244;
                    float _4354 = -_4340;
                    float _4356 = fma(_4276, _4266, _4354);
                    float _4358 = 1.0 / _4342;
                    float _4360 = -_4232;
                    float _4362 = fma(_4360, _4266, _4296);
                    float _4364 = -_4348;
                    float _4366 = fma(_4282, _4254, _4364);
                    float _4368 = -_4350;
                    float _4370 = fma(_4282, _4244, _4368);
                    float _4372 = _4282 * _4232;
                    float _4374 = _4282 * _4338;
                    float _4376 = -_4352;
                    float _4378 = fma(_4288, _4232, _4376);
                    float _4380 = _4288 * _4334;
                    float _4382 = _4288 * _4338;
                    float _4384 = -_4372;
                    float _4386 = fma(_4276, _4238, _4384);
                    float _4388 = -_4374;
                    float _4390 = fma(_4276, _4334, _4388);
                    float _4392 = -_4380;
                    float _4394 = fma(_4282, _4326, _4392);
                    float _4396 = -_4382;
                    float _4398 = fma(_4276, _4326, _4396);
                    float _4400 = fma(_4314, _4294, _4390);
                    float _4402 = fma(_4310, _4294, _4394);
                    float _4404 = _4346 * _4358;
                    float _4406 = _4356 * _4358;
                    float _4408 = _4366 * _4358;
                    float _4410 = _4362 * _4358;
                    float _4412 = _4404 * _3650;
                    float _4414 = _4406 * _3650;
                    float _4416 = _4408 * _3650;
                    float _4418 = _4310 * _4358;
                    float _4420 = _4314 * _4358;
                    float _4422 = fma(_4410, _2816, _4414);
                    float _4424 = _4378 * _4358;
                    float _4426 = fma(_4418, _2816, _4412);
                    float _4428 = _4370 * _4358;
                    float _4430 = fma(_4420, _2816, _4416);
                    float _4432 = _4386 * _4358;
                    float _4434 = fma(_4424, _2818, _4422);
                    float _4436 = fma(_4428, _2818, _4426);
                    float _4438 = fma(_4306, _4294, _4398);
                    float _4440 = fma(_4432, _2818, _4430);
                    float _4442 = -_4402;
                    float _4444 = fma(_4442, _4358, _4436);
                    float _4446 = fma(_4438, _4358, _4434);
                    float _4448 = -_4400;
                    float _4450 = fma(_4448, _4358, _4440);
                    _2352 = _4418;
                    _2354 = _4372;
                    _2356 = _4428;
                    _2358 = _4340;
                    _2654 = _4420;
                    _2864 = _4282;
                    _2866 = _4438;
                    _2656 = _4294;
                    _2868 = _4410;
                    _2658 = _4310;
                    _2870 = _4404;
                    _2660 = _4296;
                    _2898 = true;
                    _2920 = as_type<int>(_4444);
                    _2890 = _3656;
                    _2934 = as_type<int>(_4450);
                    _2886 = _3652;
                    _2926 = as_type<int>(_4446);
                    _2882 = _3654;
                    _2936 = 0.0;
                    _2938 = 0.0;
                    _2940 = 0.0;
                    _2894 = 0.0;
                    _2908 = 0.0;
                    _2902 = 0.0;
                }
            }
        }
    }
    _3996 = false;
    float _4452 = _2352;
    float _4454 = _2354;
    float _4456 = _2356;
    float _4458 = _2358;
    float _4460 = _2654;
    float _4462 = _2864;
    float _4464 = _2866;
    float _4466 = _2656;
    float _4468 = _2868;
    float _4470 = _2658;
    float _4472 = _2870;
    float _4474 = _2660;
    bool _4476 = _2898;
    int _4478 = _2920;
    float _4480 = _2890;
    int _4482 = _2934;
    float _4484 = _2878;
    float _4486 = _2886;
    int _4488 = _2926;
    float _4490 = _2882;
    float _4492 = _2936;
    float _4494 = _2938;
    float _4496 = _2940;
    float _4498 = _2894;
    float _4500 = _2908;
    float _4502 = _2902;
    float _4504 = _2914;
    float _4506 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4508 = _4452;
    float _4510 = _4454;
    float _4512 = _4456;
    float _4514 = _4458;
    float _4516 = _4494;
    float _4518 = _4492;
    float _4520 = _4496;
    float _4522 = as_type<float>(_4488);
    float _4524 = _4502;
    if (_2044)
    {
        float _4526 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4528 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4530 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4532 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4508 = _4526;
        _4510 = _4528;
        _4512 = _4530;
        _4514 = _4532;
    }
    float _4534 = _4508;
    float _4536 = _4510;
    float _4538 = _4512;
    float _4540 = _4514;
    float _4542 = _4460;
    float _4544 = _4462;
    float _4546 = _4464;
    float _4548 = _4466;
    if (_2044)
    {
        float _4550 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4552 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4554 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4556 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4542 = _4550;
        _4544 = _4552;
        _4546 = _4554;
        _4548 = _4556;
    }
    float _4558 = _4542;
    float _4560 = _4544;
    float _4562 = _4546;
    float _4564 = _4548;
    float _4566 = _4468;
    float _4568 = _4470;
    float _4570 = _4472;
    float _4572 = _4474;
    if (_2044)
    {
        float _4574 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4576 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4578 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4580 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4566 = _4574;
        _4568 = _4576;
        _4570 = _4578;
        _4572 = _4580;
    }
    float _4582 = _4566;
    float _4584 = _4568;
    float _4586 = _4570;
    float _4588 = _4572;
    float _4590 = _4476 ? as_type<float>(_4478) : _1988;
    float _4592 = _4480 * 2.0;
    float _4594 = _4476 ? as_type<float>(_4482) : _2000;
    float _4596 = _4484 * 2.0;
    float _4598 = _4476 ? as_type<float>(_2834) : _2128;
    float _4600 = _4592 * _4486;
    float _4602 = _4476 ? as_type<float>(_4478) : _1224;
    float _4604 = _4484 * _4484;
    float _4606 = _4604 * 2.0;
    float _4608 = _4476 ? as_type<float>(_2834) : _632;
    float _4610 = _4476 ? as_type<float>(_4488) : _2122;
    float _4612 = _4490 * 2.0;
    float _4614 = _4476 ? as_type<float>(_2836) : _2134;
    float _4616 = _4592 * _4484;
    float _4618 = _4476 ? as_type<float>(_4482) : _1226;
    float _4620 = fma(_4596, _4490, _4600);
    float _4622 = _4476 ? as_type<float>(_2838) : _640;
    float _4624 = -_4600;
    float _4626 = fma(_4596, _4490, _4624);
    float _4628 = _4476 ? as_type<float>(_2836) : _634;
    float _4630 = _4486 * 2.0;
    float _4632 = _4476 ? as_type<float>(_2838) : _2140;
    float _4634 = _4592 * _4490;
    float _4636 = fma(_4612, _4486, _4616);
    float _4638 = -_4616;
    float _4640 = fma(_4612, _4486, _4638);
    float _4642 = -_4606;
    float _4644 = _4642 + 1.0;
    float _4646 = _4476 ? as_type<float>(_4488) : _2850;
    float _4648 = fma(_4614, _4506, _4610);
    float _4650 = -_4634;
    float _4652 = fma(_4630, _4484, _4650);
    float _4654 = fma(_4630, _4484, _4634);
    float _4656 = fma(_4632, _4506, _4594);
    float _4658 = fma(_4598, _4506, _4590);
    float _4660 = _4630;
    float _4662 = _4632;
    float _4664 = _4534;
    float _4666 = _4644;
    float _4668 = _4592;
    float _4670 = _4598;
    float _4672 = _4590;
    float _4674 = _4536;
    float _4676 = _4538;
    float _4678 = _4540;
    float _4680 = _4628;
    float _4682 = _4622;
    if (_2044)
    {
        float _4684 = _4648 * _4536;
        _4660 = _4684;
    }
    float _4686 = _4660;
    float _4688 = _4584;
    float _4690 = _4562;
    float _4692 = _4586;
    float _4694 = _4560;
    float _4696 = _4564;
    if (_2044)
    {
        float _4698 = _4648 * _4560;
        _4662 = _4698;
    }
    float _4700 = _4662;
    if (_2044)
    {
        float _4702 = fma(_4658, _4534, _4686);
        _4664 = _4702;
    }
    float _4704 = _4664;
    float _4706 = _4490 * _4490;
    float _4708 = _4704;
    float _4710 = _4706;
    if (_2044)
    {
        float _4712 = _4648 * _4584;
        _4688 = _4712;
    }
    float _4714 = _4688;
    float _4716 = _4714;
    if (_2044)
    {
        float _4718 = fma(_4658, _4558, _4700);
        _2872 = _4718;
    }
    float _4720 = _2872;
    float _4722 = _4486 * _4486;
    float _4724 = fma(_4706, -2.0, 1.0);
    float _4726 = _4722;
    float _4728 = _4720;
    if (_2044)
    {
        float _4730 = fma(_4658, _4582, _4714);
        _4716 = _4730;
    }
    float _4732 = _4716;
    float _4734 = _4732;
    if (_2044)
    {
        float _4736 = fma(_4656, _4538, _4704);
        _4708 = _4736;
    }
    float _4738 = _4708;
    float _4740 = _4738;
    if (_2044)
    {
        float _4742 = fma(_4656, _4562, _4720);
        _4690 = _4742;
    }
    float _4744 = _4690;
    float _4746 = fma(_4722, -2.0, 1.0);
    if (_2044)
    {
        float _4748 = fma(_4656, _4586, _4732);
        _4692 = _4748;
    }
    float _4750 = _4692;
    float _4752 = fma(_4706, -2.0, _4644);
    float _4754 = fma(_4722, -2.0, _4724);
    if (_2044)
    {
        float _4756 = _4738 + _4540;
        _4516 = _4756;
    }
    float _4758 = _4516;
    float _4760 = _4758;
    float _4762 = _4758;
    if (_2044)
    {
        float _4764 = _4744 + _4564;
        _4518 = _4764;
    }
    float _4766 = _4518;
    float _4768 = _4766;
    float _4770 = _4766;
    if (_2044)
    {
        float _4772 = _4750 + _4588;
        _4520 = _4772;
    }
    float _4774 = _4520;
    float _4776 = -_4606;
    float _4778 = _4776 + _4746;
    float _4780 = _4774;
    float _4782 = _4774;
    if (!_2044)
    {
        bool _4784 = !_2272;
        if (!_4784)
        {
            float _4786 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _4788 = uint(int(uint(_182) >> uint(2)));
            float _4790 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4788)]);
            int _4792 = _182 + 4;
            uint _4794 = uint(int(uint(_4792) >> uint(2)));
            float _4796 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4794)]);
            int _4798 = _182 + 8;
            uint _4800 = uint(int(uint(_4798) >> uint(2)));
            float _4802 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4800)]);
            int _4804 = _182 + 12;
            uint _4806 = uint(int(uint(_4804) >> uint(2)));
            float _4808 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4806)]);
            uint _4810 = uint(int(uint(_182) >> uint(2)));
            float _4812 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4810)]);
            int _4814 = _182 + 4;
            uint _4816 = uint(int(uint(_4814) >> uint(2)));
            float _4818 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4816)]);
            int _4820 = _182 + 8;
            uint _4822 = uint(int(uint(_4820) >> uint(2)));
            float _4824 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4822)]);
            int _4826 = _182 + 12;
            uint _4828 = uint(int(uint(_4826) >> uint(2)));
            float _4830 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4828)]);
            uint _4832 = uint(int(uint(_182) >> uint(2)));
            float _4834 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4832)]);
            int _4836 = _182 + 4;
            uint _4838 = uint(int(uint(_4836) >> uint(2)));
            float _4840 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4838)]);
            int _4842 = _182 + 8;
            uint _4844 = uint(int(uint(_4842) >> uint(2)));
            float _4846 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4844)]);
            int _4848 = _182 + 12;
            uint _4850 = uint(int(uint(_4848) >> uint(2)));
            float _4852 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4850)]);
            float _4854 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _4856 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _4858 = _4796 * _4648;
            float _4860 = _4818 * _4648;
            float _4862 = _4840 * _4648;
            float _4864 = fma(_4790, _4658, _4858);
            float _4866 = fma(_4812, _4658, _4860);
            float _4868 = fma(_4834, _4658, _4862);
            float _4870 = fma(_4802, _4656, _4864);
            float _4872 = fma(_4824, _4656, _4866);
            float _4874 = fma(_4846, _4656, _4868);
            float _4876 = _4786 + _4870;
            float _4878 = _4854 + _4872;
            float _4880 = _4856 + _4874;
            _4710 = _4790;
            _4666 = _4870;
            _4726 = _4802;
            _4728 = _4808;
            _4668 = _4812;
            _2874 = _4872;
            _4670 = _4824;
            _4672 = _4830;
            _4740 = _4834;
            _4674 = _4874;
            _4676 = _4846;
            _4678 = _4852;
            _4762 = _4876;
            _4782 = _4880;
            _4770 = _4878;
            _4882 = true;
        }
        else
        {
            if (!_2324)
            {
                _4760 = _4658;
            }
            float _4884 = _4760;
            _4762 = _4884;
            if (!_2324)
            {
                _4768 = _4648;
            }
            float _4886 = _4768;
            _4770 = _4886;
            if (!_2324)
            {
                _4780 = _4656;
            }
            float _4888 = _4780;
            bool _4890 = !_2324;
            _4782 = _4888;
            if (!_4890)
            {
                uint _4892 = uint(int(uint(_182) >> uint(2)));
                float _4894 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4892)]);
                int _4896 = _182 + 4;
                uint _4898 = uint(int(uint(_4896) >> uint(2)));
                float _4900 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4898)]);
                int _4902 = _182 + 8;
                uint _4904 = uint(int(uint(_4902) >> uint(2)));
                float _4906 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4904)]);
                int _4908 = _182 + 12;
                uint _4910 = uint(int(uint(_4908) >> uint(2)));
                float _4912 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4910)]);
                uint _4914 = uint(int(uint(_182) >> uint(2)));
                float _4916 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4914)]);
                int _4918 = _182 + 4;
                uint _4920 = uint(int(uint(_4918) >> uint(2)));
                float _4922 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4920)]);
                int _4924 = _182 + 8;
                uint _4926 = uint(int(uint(_4924) >> uint(2)));
                float _4928 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4926)]);
                int _4930 = _182 + 12;
                uint _4932 = uint(int(uint(_4930) >> uint(2)));
                float _4934 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4932)]);
                uint _4936 = uint(int(uint(_182) >> uint(2)));
                float _4938 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4936)]);
                int _4940 = _182 + 4;
                uint _4942 = uint(int(uint(_4940) >> uint(2)));
                float _4944 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4942)]);
                int _4946 = _182 + 8;
                uint _4948 = uint(int(uint(_4946) >> uint(2)));
                float _4950 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4948)]);
                int _4952 = _182 + 12;
                uint _4954 = uint(int(uint(_4952) >> uint(2)));
                float _4956 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4954)]);
                float _4958 = _4900 * _4648;
                float _4960 = _4922 * _4648;
                float _4962 = _4944 * _4648;
                float _4964 = fma(_4894, _4658, _4958);
                float _4966 = fma(_4916, _4658, _4960);
                float _4968 = fma(_4938, _4658, _4962);
                float _4970 = fma(_4906, _4656, _4964);
                float _4972 = fma(_4928, _4656, _4966);
                float _4974 = fma(_4950, _4656, _4968);
                float _4976 = _4970 + _4912;
                float _4978 = _4972 + _4934;
                float _4980 = _4974 + _4956;
                _4710 = _4894;
                _4666 = _4964;
                _4726 = _4970;
                _4728 = _4912;
                _4668 = _4916;
                _2874 = _4966;
                _4670 = _4972;
                _4672 = _4934;
                _4740 = _4938;
                _4674 = _4968;
                _4676 = _4974;
                _4678 = _4956;
                _4762 = _4976;
                _4782 = _4980;
                _4770 = _4978;
            }
        }
    }
    _4882 = false;
    float _4982 = _4710;
    float _4984 = _4666;
    float _4986 = _4726;
    float _4988 = _4728;
    float _4990 = _4668;
    float _4992 = _2874;
    float _4994 = _4670;
    float _4996 = _4672;
    float _4998 = _4740;
    float _5000 = _4674;
    float _5002 = _4676;
    float _5004 = _4678;
    float _5006 = _4762;
    float _5008 = _4782;
    float _5010 = _4770;
    float _5012 = _4982;
    float _5014 = _4984;
    float _5016 = _4986;
    float _5018 = _4988;
    if (_2044)
    {
        float _5020 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _5022 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _5024 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _5026 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _5012 = _5020;
        _5014 = _5022;
        _5016 = _5024;
        _5018 = _5026;
    }
    float _5028 = _5012;
    float _5030 = _5014;
    float _5032 = _5016;
    float _5034 = _5018;
    float _5036 = _4990;
    float _5038 = _4992;
    float _5040 = _4994;
    float _5042 = _4996;
    if (_2044)
    {
        float _5044 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _5046 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _5048 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _5050 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _5036 = _5044;
        _5038 = _5046;
        _5040 = _5048;
        _5042 = _5050;
    }
    float _5052 = _5036;
    float _5054 = _5038;
    float _5056 = _5040;
    float _5058 = _5042;
    float _5060 = _4998;
    float _5062 = _5000;
    float _5064 = _5002;
    float _5066 = _5004;
    if (_2044)
    {
        float _5068 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _5070 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _5072 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _5074 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _5060 = _5068;
        _5062 = _5070;
        _5064 = _5072;
        _5066 = _5074;
    }
    float _5076 = _5060;
    float _5078 = _5062;
    float _5080 = _5064;
    float _5082 = _5066;
    float _5084 = _4628 * 59.999996185302734375;
    float _5086 = _4608 * 59.999996185302734375;
    float _5088 = _4622 * 59.999996185302734375;
    float _5090 = _5034;
    float _5092 = _5030;
    float _5094 = _5032;
    float _5096 = _5028;
    float _5098 = _5030;
    float _5100 = _5032;
    if (_2044)
    {
        float _5102 = _5084 * _5030;
        _5090 = _5102;
    }
    float _5104 = _5090;
    float _5106 = _5058;
    float _5108 = _5104;
    float _5110 = _5054;
    float _5112 = _5056;
    float _5114 = _5052;
    float _5116 = _5054;
    float _5118 = _5056;
    if (_2044)
    {
        float _5120 = _5084 * _5054;
        _5106 = _5120;
    }
    float _5122 = _5106;
    float _5124 = _5122;
    if (_2044)
    {
        float _5126 = fma(_5086, _5028, _5104);
        _5108 = _5126;
    }
    float _5128 = _5108;
    float _5130 = _5082;
    float _5132 = _5128;
    float _5134 = _5078;
    float _5136 = _5080;
    if (_2044)
    {
        float _5138 = _5084 * _5078;
        _5130 = _5138;
    }
    float _5140 = _5130;
    float _5142 = _5140;
    if (_2044)
    {
        float _5144 = fma(_5086, _5052, _5122);
        _5124 = _5144;
    }
    float _5146 = _5124;
    float _5148 = _5146;
    if (_2044)
    {
        float _5150 = fma(_5088, _5032, _5128);
        _5132 = _5150;
    }
    float _5152 = _5132;
    float _5154 = _5152;
    float _5156 = _5152;
    if (_2044)
    {
        float _5158 = fma(_5086, _5076, _5140);
        _5142 = _5158;
    }
    float _5160 = _5142;
    float _5162 = _5160;
    if (_2044)
    {
        float _5164 = fma(_5088, _5056, _5146);
        _5148 = _5164;
    }
    float _5166 = _5148;
    float _5168 = _5166;
    float _5170 = _5166;
    if (_2044)
    {
        float _5172 = fma(_5088, _5080, _5160);
        _5162 = _5172;
    }
    float _5174 = _5162;
    float _5176 = _5174;
    float _5178 = _5174;
    if (!_2044)
    {
        bool _5180 = !_2272;
        if (!_5180)
        {
            uint _5182 = uint(int(uint(_182) >> uint(2)));
            float _5184 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5182)]);
            int _5186 = _182 + 4;
            uint _5188 = uint(int(uint(_5186) >> uint(2)));
            float _5190 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5188)]);
            int _5192 = _182 + 8;
            uint _5194 = uint(int(uint(_5192) >> uint(2)));
            float _5196 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5194)]);
            int _5198 = _182 + 12;
            uint _5200 = uint(int(uint(_5198) >> uint(2)));
            float _5202 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5200)]);
            uint _5204 = uint(int(uint(_182) >> uint(2)));
            float _5206 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5204)]);
            int _5208 = _182 + 4;
            uint _5210 = uint(int(uint(_5208) >> uint(2)));
            float _5212 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5210)]);
            int _5214 = _182 + 8;
            uint _5216 = uint(int(uint(_5214) >> uint(2)));
            float _5218 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5216)]);
            uint _5220 = uint(int(uint(_182) >> uint(2)));
            float _5222 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5220)]);
            int _5224 = _182 + 4;
            uint _5226 = uint(int(uint(_5224) >> uint(2)));
            float _5228 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5226)]);
            int _5230 = _182 + 8;
            uint _5232 = uint(int(uint(_5230) >> uint(2)));
            float _5234 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5232)]);
            int _5236 = _182 + 12;
            uint _5238 = uint(int(uint(_5236) >> uint(2)));
            float _5240 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5238)]);
            float _5242 = _5190 * _5084;
            float _5244 = _5212 * _5084;
            float _5246 = _5228 * _5084;
            float _5248 = fma(_5184, _5086, _5242);
            float _5250 = fma(_5206, _5086, _5244);
            float _5252 = fma(_5222, _5086, _5246);
            float _5254 = fma(_5196, _5088, _5248);
            float _5256 = fma(_5218, _5088, _5250);
            float _5258 = fma(_5234, _5088, _5252);
            _4694 = _5248;
            _4696 = _5202;
            _4734 = _5250;
            _4680 = _5222;
            _4682 = _5234;
            _4522 = _5240;
            _5170 = _5256;
            _5156 = _5254;
            _5178 = _5258;
            _5260 = true;
        }
        else
        {
            if (!_2324)
            {
                _5154 = _5086;
            }
            float _5262 = _5154;
            _5156 = _5262;
            if (!_2324)
            {
                _5168 = _5084;
            }
            float _5264 = _5168;
            _5170 = _5264;
            if (!_2324)
            {
                _5176 = _5088;
            }
            float _5266 = _5176;
            bool _5268 = !_2324;
            _5178 = _5266;
            if (!_5268)
            {
                uint _5270 = uint(int(uint(_182) >> uint(2)));
                float _5272 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5270)]);
                int _5274 = _182 + 4;
                uint _5276 = uint(int(uint(_5274) >> uint(2)));
                float _5278 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5276)]);
                int _5280 = _182 + 8;
                uint _5282 = uint(int(uint(_5280) >> uint(2)));
                float _5284 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5282)]);
                int _5286 = _182 + 12;
                uint _5288 = uint(int(uint(_5286) >> uint(2)));
                float _5290 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5288)]);
                uint _5292 = uint(int(uint(_182) >> uint(2)));
                float _5294 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5292)]);
                int _5296 = _182 + 4;
                uint _5298 = uint(int(uint(_5296) >> uint(2)));
                float _5300 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5298)]);
                int _5302 = _182 + 8;
                uint _5304 = uint(int(uint(_5302) >> uint(2)));
                float _5306 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5304)]);
                uint _5308 = uint(int(uint(_182) >> uint(2)));
                float _5310 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5308)]);
                int _5312 = _182 + 4;
                uint _5314 = uint(int(uint(_5312) >> uint(2)));
                float _5316 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5314)]);
                int _5318 = _182 + 8;
                uint _5320 = uint(int(uint(_5318) >> uint(2)));
                float _5322 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5320)]);
                int _5324 = _182 + 12;
                uint _5326 = uint(int(uint(_5324) >> uint(2)));
                float _5328 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5326)]);
                float _5330 = _5278 * _5084;
                float _5332 = _5300 * _5084;
                float _5334 = _5316 * _5084;
                float _5336 = fma(_5272, _5086, _5330);
                float _5338 = fma(_5294, _5086, _5332);
                float _5340 = fma(_5310, _5086, _5334);
                float _5342 = fma(_5284, _5088, _5336);
                float _5344 = fma(_5306, _5088, _5338);
                float _5346 = fma(_5322, _5088, _5340);
                _4694 = _5336;
                _4696 = _5290;
                _4734 = _5338;
                _4680 = _5310;
                _4682 = _5322;
                _4522 = _5328;
                _5170 = _5344;
                _5156 = _5342;
                _5178 = _5346;
            }
        }
    }
    _5260 = false;
    float _5348 = _4694;
    float _5350 = _4696;
    float _5352 = _4734;
    float _5354 = _4680;
    float _5356 = _4682;
    float _5358 = _4522;
    float _5360 = _5170;
    float _5362 = _5156;
    float _5364 = _5178;
    float _5366 = -_4648;
    float _5368 = _5366 + _4646;
    float _5370 = -_4658;
    float _5372 = _5370 + _4602;
    float _5374 = -_4656;
    float _5376 = _5374 + _4618;
    float _5378 = _5348;
    float _5380 = _5350;
    float _5382 = _5352;
    float _5384 = _5354;
    float _5386 = _5358;
    float _5388 = _5356;
    float _5390 = _5362;
    float _5392 = _5360;
    float _5394 = _5364;
    if (_2044)
    {
        float _5396 = _5368 * _5030;
        _5378 = _5396;
    }
    float _5398 = _5378;
    float _5400 = _5398;
    if (_2044)
    {
        float _5402 = _5368 * _5054;
        _5380 = _5402;
    }
    float _5404 = _5380;
    float _5406 = _5404;
    if (_2044)
    {
        float _5408 = _5368 * _5078;
        _5382 = _5408;
    }
    float _5410 = _5382;
    float _5412 = _5410;
    if (_2044)
    {
        float _5414 = fma(_5372, _5028, _5398);
        _5400 = _5414;
    }
    float _5416 = _5400;
    if (_2044)
    {
        float _5418 = fma(_5372, _5052, _5404);
        _5406 = _5418;
    }
    float _5420 = _5406;
    if (_2044)
    {
        float _5422 = fma(_5372, _5076, _5410);
        _5412 = _5422;
    }
    float _5424 = _5412;
    if (_2044)
    {
        float _5426 = fma(_5376, _5032, _5416);
        _5384 = _5426;
    }
    float _5428 = _5384;
    float _5430 = _5428;
    float _5432 = _5428;
    if (_2044)
    {
        float _5434 = fma(_5376, _5056, _5420);
        _5386 = _5434;
    }
    float _5436 = _5386;
    float _5438 = _5436;
    float _5440 = _5436;
    if (_2044)
    {
        float _5442 = fma(_5376, _5080, _5424);
        _5388 = _5442;
    }
    float _5444 = _5388;
    float _5446 = _5444;
    float _5448 = _5444;
    if (!_2044)
    {
        bool _5450 = !_2272;
        if (!_5450)
        {
            uint _5452 = uint(int(uint(_182) >> uint(2)));
            float _5454 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5452)]);
            int _5456 = _182 + 4;
            uint _5458 = uint(int(uint(_5456) >> uint(2)));
            float _5460 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5458)]);
            int _5462 = _182 + 8;
            uint _5464 = uint(int(uint(_5462) >> uint(2)));
            float _5466 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5464)]);
            uint _5468 = uint(int(uint(_182) >> uint(2)));
            float _5470 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5468)]);
            int _5472 = _182 + 4;
            uint _5474 = uint(int(uint(_5472) >> uint(2)));
            float _5476 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5474)]);
            int _5478 = _182 + 8;
            uint _5480 = uint(int(uint(_5478) >> uint(2)));
            float _5482 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5480)]);
            uint _5484 = uint(int(uint(_182) >> uint(2)));
            float _5486 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5484)]);
            int _5488 = _182 + 4;
            uint _5490 = uint(int(uint(_5488) >> uint(2)));
            float _5492 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5490)]);
            int _5494 = _182 + 8;
            uint _5496 = uint(int(uint(_5494) >> uint(2)));
            float _5498 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5496)]);
            float _5500 = _5460 * _5368;
            float _5502 = _5476 * _5368;
            float _5504 = _5492 * _5368;
            float _5506 = fma(_5454, _5372, _5500);
            float _5508 = fma(_5470, _5372, _5502);
            float _5510 = fma(_5486, _5372, _5504);
            float _5512 = fma(_5466, _5376, _5506);
            float _5514 = fma(_5482, _5376, _5508);
            float _5516 = fma(_5498, _5376, _5510);
            _5432 = _5512;
            _5440 = _5514;
            _5448 = _5516;
            _5518 = true;
        }
        else
        {
            if (!_2324)
            {
                _5430 = _5372;
            }
            float _5520 = _5430;
            _5432 = _5520;
            if (!_2324)
            {
                _5438 = _5368;
            }
            float _5522 = _5438;
            _5440 = _5522;
            if (!_2324)
            {
                _5446 = _5376;
            }
            float _5524 = _5446;
            bool _5526 = !_2324;
            _5448 = _5524;
            if (!_5526)
            {
                uint _5528 = uint(int(uint(_182) >> uint(2)));
                float _5530 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5528)]);
                int _5532 = _182 + 4;
                uint _5534 = uint(int(uint(_5532) >> uint(2)));
                float _5536 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5534)]);
                int _5538 = _182 + 8;
                uint _5540 = uint(int(uint(_5538) >> uint(2)));
                float _5542 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5540)]);
                uint _5544 = uint(int(uint(_182) >> uint(2)));
                float _5546 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5544)]);
                int _5548 = _182 + 4;
                uint _5550 = uint(int(uint(_5548) >> uint(2)));
                float _5552 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5550)]);
                int _5554 = _182 + 8;
                uint _5556 = uint(int(uint(_5554) >> uint(2)));
                float _5558 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5556)]);
                uint _5560 = uint(int(uint(_182) >> uint(2)));
                float _5562 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5560)]);
                int _5564 = _182 + 4;
                uint _5566 = uint(int(uint(_5564) >> uint(2)));
                float _5568 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5566)]);
                int _5570 = _182 + 8;
                uint _5572 = uint(int(uint(_5570) >> uint(2)));
                float _5574 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5572)]);
                float _5576 = _5536 * _5368;
                float _5578 = _5552 * _5368;
                float _5580 = _5568 * _5368;
                float _5582 = fma(_5530, _5372, _5576);
                float _5584 = fma(_5546, _5372, _5578);
                float _5586 = fma(_5562, _5372, _5580);
                float _5588 = fma(_5542, _5376, _5582);
                float _5590 = fma(_5558, _5376, _5584);
                float _5592 = fma(_5574, _5376, _5586);
                _5432 = _5588;
                _5440 = _5590;
                _5448 = _5592;
            }
        }
    }
    _5518 = false;
    float _5594 = _5432;
    float _5596 = _5440;
    float _5598 = _5448;
    int _5600 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
    uint _5602 = uint(int(uint(_5600) >> uint(2)));
    float _5604 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5602)]);
    int _5606 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
    uint _5608 = uint(int(uint(_5606) >> uint(2)));
    float _5610 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5608)]);
    int _5612 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
    uint _5614 = uint(int(uint(_5612) >> uint(2)));
    float _5616 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5614)]);
    uint _5618 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
    float _5620 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5618)]);
    float _5622 = fma(_5006, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5624 = fma(_5008, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5626 = fma(_5006, 6.2500002968590706586837768554688e-05, 0.5);
    float _5628 = fma(_5008, 6.2500002968590706586837768554688e-05, 0.5);
    float _5630 = fma(_5008, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5632 = fma(_5006, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5634 = fma(_5006, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5636 = fma(_5008, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5638 = _5604 * _5604;
    float _5640 = fma(_5610, _5610, _5638);
    float _5642 = rsqrt(_5640);
    float _5644 = _5642 * (-20.0);
    float _5646 = fma(_5604, _5644, _5616);
    float _5648 = fma(_5610, _5644, _5620);
    float _5650 = _5646 * 0.5;
    float _5652 = _5648 * 0.5;
    float _5654 = floor(_5652);
    float _5656 = floor(_5650);
    float _5658 = fma(_5654, 2.0, -32.0);
    float _5660 = -_5658;
    float _5662 = _5660 + _5006;
    float _5664 = fma(_5656, 2.0, -32.0);
    float _5666 = -_5664;
    float _5668 = _5666 + _5008;
    float _5670 = _5662 * 0.015625;
    float _5672 = _5668 * 0.015625;
    float2 _18495 = float2(_5670, _5672);
    float2 _5674 = dm_bs(spvDescriptorSet0.cp_t_tcb_26.sample(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_18495, float2(0.0), isnan(_18495)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_26, spvDescriptorSet0.cp_t_tcb_26Smplr_w, select(_18495, float2(0.0), isnan(_18495)), level(0.0)).xy;
    float _5676 = _5674.x;
    float _5678 = _5674.y;
    float2 _18507 = float2(_5622, _5624);
    float _5680 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18507, float2(0.0), isnan(_18507)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18507, float2(0.0), isnan(_18507)), level(0.0)).x;
    float2 _18515 = float2(_5626, _5628);
    float2 _5682 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18515, float2(0.0), isnan(_18515)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18515, float2(0.0), isnan(_18515)), level(0.0)).xy;
    float _5684 = _5682.x;
    float _5686 = _5682.y;
    float2 _18527 = float2(_5622, _5630);
    float _5688 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18527, float2(0.0), isnan(_18527)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18527, float2(0.0), isnan(_18527)), level(0.0)).x;
    float2 _18535 = float2(_5632, _5624);
    float _5690 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18535, float2(0.0), isnan(_18535)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18535, float2(0.0), isnan(_18535)), level(0.0)).x;
    float2 _18543 = float2(_5632, _5630);
    float _5692 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18543, float2(0.0), isnan(_18543)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18543, float2(0.0), isnan(_18543)), level(0.0)).x;
    float2 _18551 = float2(_5634, _5628);
    float _5694 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18551, float2(0.0), isnan(_18551)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18551, float2(0.0), isnan(_18551)), level(0.0)).x;
    float2 _18559 = float2(_5626, _5636);
    float _5696 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18559, float2(0.0), isnan(_18559)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18559, float2(0.0), isnan(_18559)), level(0.0)).x;
    float2 _18567 = float2(_5626, _5628);
    float _5698 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_18567, float2(0.0), isnan(_18567)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_18567, float2(0.0), isnan(_18567)), level(0.0)).y;
    float2 _18575 = float2(_5634, _5628);
    float2 _5700 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18575, float2(0.0), isnan(_18575)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18575, float2(0.0), isnan(_18575)), level(0.0)).xy;
    float _5702 = _5700.x;
    float _5704 = _5700.y;
    float2 _18587 = float2(_5626, _5636);
    float2 _5706 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18587, float2(0.0), isnan(_18587)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18587, float2(0.0), isnan(_18587)), level(0.0)).xy;
    float _5708 = _5706.x;
    float _5710 = _5706.y;
    float _5712 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[73]);
    float _5714 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[72]);
    float _5716 = _2234 * 19.23889923095703125;
    float _5718 = _5716 * 0.15915493667125701904296875;
    float _5720 = _2228 * 19.23889923095703125;
    float _5722 = _5718 * 6.283185482025146484375;
    float _5724 = sin(_5722);
    float _5726 = fma(_294, 3.1415927410125732421875, -1.57079637050628662109375);
    float _5728 = _5720 * 0.15915493667125701904296875;
    float _5730 = _5726 * 0.15915493667125701904296875;
    float _5732 = _5730 * 6.283185482025146484375;
    float _5734 = cos(_5732);
    float _5736 = _5724 * 34873.41015625;
    float _5738 = _5730 * 6.283185482025146484375;
    float _5740 = sin(_5738);
    float _5742 = _5728 * 6.283185482025146484375;
    float _5744 = sin(_5742);
    float _5746 = floor(_5736);
    float _5748 = 1.0 / _4506;
    float _5750 = _5744 * 34873.41015625;
    float _5752 = -_5746;
    float _5754 = _5752 + _5736;
    float _5756 = floor(_5750);
    float _5758 = _5678 * 14.99999904632568359375;
    float _5760 = _5676 * 14.99999904632568359375;
    float _5762 = _5758 * _5740;
    float _5764 = _5758 * _5734;
    float _5766 = _5758 * _5758;
    float _5768 = -_5684;
    float _5770 = _5768 + _5680;
    float _5772 = -_5684;
    float _5774 = _5772 + _5688;
    float _5776 = -_5762;
    float _5778 = fma(_5760, _5734, _5776);
    float _5780 = fma(_5760, _5760, _5766);
    float _5782 = _5748 * 59.999996185302734375;
    float _5784 = _5770 * 2000.0;
    float _5786 = _5774 * 2000.0;
    float _5788 = -_5684;
    float _5790 = _5788 + _5690;
    float _5792 = fma(_5760, _5740, _5764);
    float _5794 = fma(_5754, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _5796 = _5684 * 2000.0;
    float _5798 = -_5686;
    float _5800 = _5684 + _5798;
    float _5802 = _5790 * 2000.0;
    float _5804 = abs(_5784);
    float _5806 = abs(_5786);
    float _5808 = precise::max(_5804, _5806);
    float _5810 = -_5684;
    float _5812 = _5810 + _5694;
    float _5814 = _5594 * _5782;
    float _5816 = _5596 * _5782;
    float _5818 = _5598 * _5782;
    float _5820 = _5796 + (-2.0);
    float _5822 = _5800 * 2000.0;
    float _5824 = -_5712;
    float _5826 = _5824 + 1.0;
    float _5828 = abs(_5802);
    float _5830 = precise::max(_5808, _5828);
    float _5832 = -_5684;
    float _5834 = _5832 + _5696;
    float _5836 = _5812 * 1000.0;
    bool _5838 = _5010 >= _5820;
    bool _5840 = isnan(_5010);
    bool _5842 = _5838 || _5840;
    bool _5844 = isnan(_5820);
    bool _5846 = _5842 || _5844;
    float _5848 = fma(_300, _5712, _5826);
    float _5850 = _5834 * 1000.0;
    float _5852 = fma(_5836, _5836, 0.0625);
    float _5854 = -_5684;
    float _5856 = _5854 + _5692;
    float _5858 = -_5756;
    float _5860 = _5750 + _5858;
    float _5862 = fma(_5850, _5850, _5852);
    float _5864 = _5856 * 2000.0;
    float _5866 = fma(_5860, _5860, 0.0400000028312206268310546875);
    float _5868 = rsqrt(_5862);
    float _5870 = fma(_5794, _5794, _5866);
    float _5872 = sqrt(_5870);
    float _5874 = abs(_5864);
    float _5876 = precise::max(_5830, _5874);
    float _5878 = abs(_5822);
    bool _5880 = _5878 < 2.0;
    bool _5882 = !_5846;
    bool _5884 = _5880 || _5882;
    float _5886 = sqrt(_5780);
    float _5888 = _5868 * 0.25;
    bool _5890 = _5888 < 0.891006529331207275390625;
    bool _5892 = _5890 || _5884;
    float _5894 = _5872 + 9.9999997473787516355514526367188e-06;
    bool _5896 = _5876 >= 2.0;
    bool _5898 = isnan(_5876);
    bool _5900 = _5896 || _5898;
    bool _5902 = isnan(2.0);
    bool _5904 = _5900 || _5902;
    bool _5906 = _5904 || _5892;
    float _5908 = 1.0 / _5894;
    float _5910 = sqrt(_5886);
    float _5912 = _5686 * 2000.0;
    float _5914 = _5912;
    float _5916 = _5778;
    float _5918 = _5816;
    float _5920 = _5704;
    if (!_5906)
    {
        float _5922 = _5850 * _5868;
        float _5924 = _5836 * _5868;
        float _5926 = 1.0 / _5888;
        float _5928 = _5922 * _5922;
        float _5930 = fma(_5924, _5924, _5928);
        float _5932 = sqrt(_5930);
        bool _5934 = _5932 > 9.9999997473787516355514526367188e-05;
        float _5936 = _5932 * _5926;
        float _5938 = _5922;
        float _5940 = _5928;
        if (_5934)
        {
            float _5942 = abs(_5924);
            float _5944 = abs(_5922);
            float _5946 = precise::max(_5942, _5944);
            _5938 = _5946;
        }
        float _5948 = _5938;
        if (!_5934)
        {
            _5940 = 0.0;
        }
        float _5950 = _5940;
        float _5952 = _5948;
        float _5954 = _5950;
        if (_5934)
        {
            float _5956 = 1.0 / _5948;
            _5952 = _5956;
        }
        float _5958 = _5952;
        if (_5934)
        {
            float _5960 = _5932 * _5958;
            _5954 = _5960;
        }
        float _5962 = _5954;
        float _5964 = _5962 * 0.9649016857147216796875;
        float _5966 = -_5964;
        float _5968 = fma(_5966, _5936, _5796);
        _5914 = _5968;
    }
    float _5970 = _5914;
    float _5972 = -_5970;
    float _5974 = _5010 + _5972;
    float _5976 = _5908 * _5860;
    bool _5978 = _5910 >= 0.5;
    float _5980 = _5908 * 0.20000000298023223876953125;
    float _5982 = abs(_5974);
    float _5984 = _5982 * 0.20000000298023223876953125;
    float _5986 = precise::clamp(_5984, 0.0, 1.0);
    float _5988 = _4778 * _5976;
    bool _5990 = _5910 >= 1.0;
    float _5992 = -_5908;
    float _5994 = _5794 * _5992;
    float _5996 = -_5986;
    float _5998 = _5996 + 1.0;
    float _6000 = _4636 * _5976;
    float _6002 = _4626 * _5976;
    float _6004 = -_5684;
    float _6006 = _6004 + _5702;
    float _6008 = _5998 * _5998;
    float _6010 = fma(_4652, _5980, _6000);
    float _6012 = fma(_4754, _5980, _6002);
    float _6014 = -_5684;
    float _6016 = _6014 + _5708;
    float _6018 = _6008 * _6008;
    float _6020 = fma(_4620, _5980, _5988);
    float _6022 = fma(_4654, _5994, _6012);
    float _6024 = _5848 * _6018;
    float _6026 = _5714 * 300.0;
    float _6028 = _5714 * 500.0;
    float _6030 = fma(_4640, _5994, _6020);
    float _6032 = fma(_4752, _5994, _6010);
    float _6034 = _6026;
    float _6036 = _6012;
    float _6038 = _6010;
    if (_5978)
    {
        float _6040 = _6026 * _6024;
        _6034 = _6040;
    }
    float _6042 = _6034;
    if (_5990)
    {
        float _6044 = _6028 * _6024;
        _6036 = _6044;
    }
    float _6046 = _6036;
    float _6048 = _4640 * 0.100000001490116119384765625;
    float _6050 = _6046;
    float _6052 = _5814;
    if (_5978)
    {
        float _6054 = _5792 * _6042;
        _6038 = _6054;
    }
    float _6056 = _6038;
    float _6058 = _4752 * 0.100000001490116119384765625;
    if (_5978)
    {
        float _6060 = _5778 * _6042;
        _5916 = _6060;
    }
    float _6062 = _5916;
    if (_5990)
    {
        float _6064 = _5910 * _6046;
        _6050 = _6064;
    }
    float _6066 = _6050;
    float _6068 = _4654 * 0.100000001490116119384765625;
    float _6070 = fma(_4652, 0.20000000298023223876953125, _6058);
    float _6072 = fma(_4620, 0.20000000298023223876953125, _6048);
    float _6074 = _5818;
    if (_5978)
    {
        float _6076 = fma(_4506, _6062, _5814);
        _6052 = _6076;
    }
    float _6078 = _6052;
    if (_5990)
    {
        float _6080 = fma(_4506, _6066, _5816);
        _5918 = _6080;
    }
    float _6082 = _5918;
    float _6084 = fma(_4754, 0.20000000298023223876953125, _6068);
    float _6086 = _6070 * _4498;
    float _6088 = _6072 * _4500;
    if (_5978)
    {
        float _6090 = fma(_4506, _6056, _5818);
        _6074 = _6090;
    }
    float _6092 = _6074;
    float _6094 = -_6082;
    float _6096 = _5360 + _6094;
    float _6098 = -_6086;
    float _6100 = fma(_6084, _4500, _6098);
    float _6102 = -_6088;
    float _6104 = fma(_6070, _4502, _6102);
    float _6106 = -_6078;
    float _6108 = _5362 + _6106;
    float _6110 = _4652 * (-0.20000000298023223876953125);
    float _6112 = _6096 + _6100;
    float _6114 = _4620 * (-0.20000000298023223876953125);
    float _6116 = _6108 + _6104;
    float _6118 = _4754 * (-0.20000000298023223876953125);
    float _6120 = _6110 * _4498;
    float _6122 = _6112 * _6112;
    float _6124 = _6114 * _4500;
    float _6126 = _6084 * _4502;
    float _6128 = -_6120;
    float _6130 = fma(_6118, _4500, _6128);
    float _6132 = fma(_6116, _6116, _6122);
    float _6134 = -_6124;
    float _6136 = fma(_6110, _4502, _6134);
    float _6138 = _6118 * _4502;
    float _6140 = _6096 + _6130;
    float _6142 = -_6126;
    float _6144 = fma(_6072, _4498, _6142);
    float _6146 = -_6092;
    float _6148 = _5364 + _6146;
    float _6150 = _6108 + _6136;
    float _6152 = -_6138;
    float _6154 = fma(_6114, _4498, _6152);
    float _6156 = _6140 * _6140;
    float _6158 = _6148 + _6144;
    float _6160 = _5796 + (-2.0);
    float _6162 = _6148 + _6154;
    float _6164 = fma(_6150, _6150, _6156);
    float _6166 = fma(_6158, _6158, _6132);
    float _6168 = -_5686;
    float _6170 = _5684 + _6168;
    bool _6172 = _5010 >= _6160;
    bool _6174 = isnan(_5010);
    bool _6176 = _6172 || _6174;
    bool _6178 = isnan(_6160);
    bool _6180 = _6176 || _6178;
    float _6182 = fma(_6162, _6162, _6164);
    float _6184 = rsqrt(_6166);
    float _6186 = _6170 * 2000.0;
    float _6188 = _6006 * 1000.0;
    float _6190 = _6016 * 1000.0;
    float _6192 = _4654 * 0.980571091175079345703125;
    float _6194 = abs(_6186);
    bool _6196 = _6194 < 2.0;
    bool _6198 = !_6180;
    bool _6200 = _6196 || _6198;
    float _6202 = sqrt(_6166);
    float _6204 = fma(_4626, 0.19611422717571258544921875, _6192);
    float _6206 = sqrt(_6182);
    float _6208 = _6112 * _6184;
    float _6210 = _6116 * _6184;
    float _6212 = _6158 * _6184;
    float _6214 = rsqrt(_6182);
    bool _6216 = _6202 != 0.0;
    bool _6218 = isnan(_6202);
    bool _6220 = _6216 || _6218;
    bool _6222 = isnan(0.0);
    bool _6224 = _6220 || _6222;
    float _6226 = _4640 * 0.980571091175079345703125;
    float _6228 = _6224 ? _6208 : 0.0;
    float _6230 = fma(_4778, 0.19611422717571258544921875, _6226);
    float _6232 = _6224 ? _6210 : 0.0;
    bool _6234 = _6206 != 0.0;
    bool _6236 = isnan(_6206);
    bool _6238 = _6234 || _6236;
    bool _6240 = isnan(0.0);
    bool _6242 = _6238 || _6240;
    float _6244 = fma(_6188, _6188, 0.0625);
    float _6246 = _6228 * _6230;
    float _6248 = _6224 ? _6212 : 0.0;
    float _6250 = fma(_6190, _6190, _6244);
    float _6252 = fma(_6232, _6204, _6246);
    float _6254 = _6140 * _6214;
    float _6256 = _6162 * _6214;
    float _6258 = _4752 * 0.980571091175079345703125;
    float _6260 = _6150 * _6214;
    float _6262 = rsqrt(_6250);
    float _6264 = _6242 ? _6254 : 0.0;
    float _6266 = fma(_4636, 0.19611422717571258544921875, _6258);
    float _6268 = _6242 ? _6256 : 0.0;
    float _6270 = _6242 ? _6260 : 0.0;
    float _6272 = _6264 * _6030;
    float _6274 = fma(_6248, _6266, _6252);
    float _6276 = fma(_6270, _6022, _6272);
    float _6278 = _6166 * _6274;
    float _6280 = fma(_6268, _6032, _6276);
    float _6282 = _6266 * _6278;
    float _6284 = _6204 * _6278;
    float _6286 = _6230 * _6278;
    float _6288 = _6262 * 0.25;
    float _6290 = _6182 * _6280;
    float _6292 = -_6282;
    float _6294 = _6084 * _6292;
    bool _6296 = _6288 < 0.891006529331207275390625;
    bool _6298 = _6296 || _6200;
    float _6300 = _6030 * _6290;
    float _6302 = -_6286;
    float _6304 = _6070 * _6302;
    float _6306 = _6032 * _6290;
    bool _6308 = _5876 >= 2.0;
    bool _6310 = isnan(_5876);
    bool _6312 = _6308 || _6310;
    bool _6314 = isnan(2.0);
    bool _6316 = _6312 || _6314;
    bool _6318 = _6316 || _6298;
    float _6320 = -_6284;
    float _6322 = -_6294;
    float _6324 = fma(_6070, _6320, _6322);
    float _6326 = -_6300;
    float _6328 = _6110 * _6326;
    float _6330 = _6022 * _6290;
    float _6332 = -_6282;
    float _6334 = -_6304;
    float _6336 = fma(_6072, _6332, _6334);
    float _6338 = -_6282;
    float _6340 = -_6306;
    float _6342 = _6338 + _6340;
    float _6344 = -_6306;
    float _6346 = _6118 * _6344;
    float _6348 = -_6306;
    float _6350 = -_6328;
    float _6352 = fma(_6114, _6348, _6350);
    float _6354 = -_6284;
    float _6356 = _6072 * _6354;
    float _6358 = -_6284;
    float _6360 = -_6330;
    float _6362 = _6358 + _6360;
    float _6364 = -_6330;
    float _6366 = _6114 * _6364;
    float _6368 = -_6330;
    float _6370 = -_6346;
    float _6372 = fma(_6110, _6368, _6370);
    float _6374 = -_6286;
    float _6376 = -_6356;
    float _6378 = fma(_6084, _6374, _6376);
    float _6380 = -_6286;
    float _6382 = -_6300;
    float _6384 = _6380 + _6382;
    float _6386 = -_6300;
    float _6388 = -_6366;
    float _6390 = fma(_6118, _6386, _6388);
    float _6392 = _6324 + _6372;
    float _6394 = _6188 * _6262;
    float _6396 = _6190 * _6262;
    float _6398 = _6336 + _6352;
    float _6400 = _6378 + _6390;
    float _6402 = _2854 * 0.5;
    float _6404 = _2854 * 0.300000011920928955078125;
    bool _6406 = !_6318;
    float _6408 = _6384;
    float _6410 = _6362;
    float _6412 = _6342;
    float _6444;
    float _6446;
    float _6448;
    float _6450;
    float _6452;
    if (!_6406)
    {
        float _6414 = -_5686;
        float _6416 = _6414 + _5704;
        float _6418 = -_5686;
        float _6420 = _6418 + _5710;
        float _6422 = _5686 * 2000.0;
        float _6424 = _6416 * 1000.0;
        float _6426 = _6420 * 1000.0;
        float _6428 = fma(_6424, _6424, 0.0625);
        float _6430 = fma(_6426, _6426, _6428);
        float _6432 = rsqrt(_6430);
        float _6434 = -_6424;
        float _6436 = fma(_6434, _6432, -0.0);
        float _6438 = -_6426;
        float _6440 = fma(_6438, _6432, -0.0);
        float _6442 = _6432 * 0.25;
        _6444 = _6422;
        _6446 = _6442;
        _6448 = _6436;
        _6450 = _6440;
        _6452 = _6432;
        _6454 = true;
    }
    else
    {
        float _6456 = _6396 * _6396;
        float _6458 = 1.0 / _6288;
        float _6460 = -_6396;
        float _6462 = (-0.0) + _6460;
        float _6464 = fma(_6394, _6394, _6456);
        float _6466 = sqrt(_6464);
        bool _6468 = _6466 > 9.9999997473787516355514526367188e-05;
        float _6470 = _6466 * _6458;
        float _6472 = _6456;
        _6446 = _6288;
        _6450 = _6462;
        _6452 = _6470;
        if (_6468)
        {
            float _6474 = abs(_6394);
            float _6476 = abs(_6396);
            float _6478 = precise::max(_6474, _6476);
            _5920 = _6478;
        }
        float _6480 = _5920;
        float _6482 = -_6394;
        float _6484 = (-0.0) + _6482;
        _6448 = _6484;
        if (!_6468)
        {
            _6472 = 0.0;
        }
        float _6486 = _6472;
        float _6488 = _6480;
        float _6490 = _6486;
        if (_6468)
        {
            float _6492 = 1.0 / _6480;
            _6488 = _6492;
        }
        float _6494 = _6488;
        if (_6468)
        {
            float _6496 = _6466 * _6494;
            _6490 = _6496;
        }
        float _6498 = _6490;
        float _6500 = _6498 * 0.9649016857147216796875;
        float _6502 = -_6500;
        float _6504 = fma(_6502, _6470, _5796);
        _6444 = _6504;
    }
    _6454 = false;
    float _6506 = _6444;
    float _6508 = _6446;
    float _6510 = _6448;
    float _6512 = _6450;
    float _6514 = _6452;
    float _6516 = -_5010;
    float _6518 = _6516 + _6506;
    bool _6520 = _6506 >= _5010;
    bool _6522 = isnan(_6506);
    bool _6524 = _6520 || _6522;
    bool _6526 = isnan(_5010);
    bool _6528 = _6524 || _6526;
    float _6530 = -_6506;
    float _6532 = fma(_5698, 2000.0, _6530);
    bool _6534 = _6506 > _5010;
    float _6536 = _6518 * _6518;
    float _6538 = precise::max(_2038, 0.001000000047497451305389404296875);
    bool _6540 = !_6534;
    float _6542 = _6540 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _6544 = _4504 >= 0.5;
    float _6546 = sqrt(_6536);
    int _6548 = ~as_type<int>(_6542);
    int _6550 = _6548 + 1;
    int _6552 = _6550 + 1;
    float _6554 = abs(_6532);
    bool _6556 = _6554 >= 2.0;
    bool _6558 = isnan(_6554);
    bool _6560 = _6556 || _6558;
    bool _6562 = isnan(2.0);
    bool _6564 = _6560 || _6562;
    int _6566 = _6552;
    float _6568 = _6514;
    float _6570 = _6542;
    float _6572 = _6518;
    float _6574 = _6538;
    if (_6528)
    {
        int _6576 = ~as_type<int>(_6542);
        int _6578 = _6576 + 1;
        _6566 = _6578;
    }
    int _6580 = _6566;
    bool _6582 = _6508 >= 0.891006529331207275390625;
    bool _6584 = _6582 && _6564;
    float _6586 = float(_6580);
    float _6588 = _6546 * _6586;
    float _6590 = precise::min(_6538, 10000.0);
    bool _6592 = !_6544;
    float _6594 = _6588;
    float _6596 = _6546;
    float _6690;
    float _6692;
    float _6694;
    float _6928;
    float _6930;
    float _6932;
    float _6968;
    float _6970;
    float _6972;
    float _6974;
    float _6976;
    if (!_6592)
    {
        bool _6598 = _4746 > _4606;
        float _6600 = _5360 * _6508;
        bool _6602 = _4746 >= _4606;
        bool _6604 = isnan(_4746);
        bool _6606 = _6602 || _6604;
        bool _6608 = isnan(_4606);
        bool _6610 = _6606 || _6608;
        float _6612 = fma(_5362, _6510, _6600);
        int _6614 = _6610 ? 0 : 1;
        float _6616 = fma(_5364, _6512, _6612);
        int _6618 = ~_6614;
        int _6620 = _6618 + 1;
        int _6622 = _6620 + 1;
        int _6624 = _6622;
        int _6626 = _6610 ? (-1) : 0;
        if (!_6598)
        {
            int _6628 = ~_6614;
            int _6630 = _6628 + 1;
            _6624 = _6630;
        }
        int _6632 = _6624;
        bool _6634 = _4504 != 1.0;
        bool _6636 = isnan(_4504);
        bool _6638 = _6634 || _6636;
        bool _6640 = isnan(1.0);
        bool _6642 = _6638 || _6640;
        float _6644 = float(_6632);
        float _6646 = _4778 * _6644;
        float _6648 = _4626 * _6644;
        float _6650 = _4636 * _6644;
        bool _6652 = _6616 <= 0.0;
        float _6654 = float(_6652);
        float _6656 = _6646 * _6508;
        float _6658 = fma(_6648, _6510, _6656);
        float _6660 = _6616 * _6654;
        float _6662 = fma(_6650, _6512, _6658);
        float _6664 = -_6660;
        float _6666 = fma(_6510, _6664, _5362);
        float _6668 = -_6660;
        float _6670 = fma(_6508, _6668, _5360);
        float _6672 = -_6660;
        float _6674 = fma(_6512, _6672, _5364);
        float _6676 = abs(_6662);
        float _6678 = -_6676;
        float _6680 = _6678 + 1.0;
        float _6682 = abs(_6680);
        float _6684 = log2(_6682);
        float _6686 = _6684 * 0.20000000298023223876953125;
        float _6688 = exp2(_6686);
        _6690 = _6666;
        _6692 = _6670;
        _6694 = _6674;
        float _6714;
        int _6742;
        int _6804;
        float _6806;
        float _6808;
        if (!_6642)
        {
            float _6696 = _6670 * _6670;
            float _6698 = _4498 * 0.89999997615814208984375;
            float _6700 = _4502 * 0.89999997615814208984375;
            float _6702 = _4500 * 0.89999997615814208984375;
            float _6704 = fma(_6666, _6666, _6696);
            float _6706 = fma(_6674, _6674, _6704);
            float _6708 = sqrt(_6706);
            bool _6710 = _6708 > 0.5;
            bool _6712 = !_6710;
            _6714 = _6698;
            if (!_6712)
            {
                bool _6716 = _6662 > 0.0;
                bool _6718 = _6662 >= 0.0;
                bool _6720 = isnan(_6662);
                bool _6722 = _6718 || _6720;
                bool _6724 = isnan(0.0);
                bool _6726 = _6722 || _6724;
                float _6728 = precise::max(_2202, 0.100000001490116119384765625);
                int _6730 = _6726 ? 0 : 1;
                float _6732 = precise::max(_2192, 0.100000001490116119384765625);
                int _6734 = ~_6730;
                int _6736 = _6734 + 1;
                int _6738 = _6736 + 1;
                int _6740 = _6738;
                _6626 = _6726 ? (-1) : 0;
                _6742 = _6716 ? (-1) : 0;
                if (!_6716)
                {
                    int _6744 = ~_6730;
                    int _6746 = _6744 + 1;
                    _6740 = _6746;
                }
                int _6748 = _6740;
                float _6750 = _6728 + _6732;
                float _6752 = float(_6748);
                float _6754 = 1.0 / _6750;
                float _6756 = _6648 * _6752;
                float _6758 = _6650 * _6752;
                float _6760 = _6646 * _6752;
                float _6762 = _6674 * _6756;
                float _6764 = _6670 * _6758;
                float _6766 = -_6762;
                float _6768 = fma(_6666, _6758, _6766);
                float _6770 = _6666 * _6760;
                float _6772 = -_6764;
                float _6774 = fma(_6674, _6760, _6772);
                float _6776 = _6768 * _6768;
                float _6778 = -_6770;
                float _6780 = fma(_6670, _6756, _6778);
                float _6782 = _6754 * 0.4000000059604644775390625;
                float _6784 = fma(_6774, _6774, _6776);
                float _6786 = _6708 * _6782;
                float _6788 = fma(_6780, _6780, _6784);
                float _6790 = sqrt(_6788);
                float _6792 = _6790 + 9.9999997473787516355514526367188e-06;
                float _6794 = 1.0 / _6792;
                float _6796 = _6786 * _6794;
                float _6798 = fma(_6774, _6796, _6698);
                float _6800 = fma(_6768, _6796, _6700);
                float _6802 = fma(_6780, _6796, _6702);
                _6714 = _6798;
                _6804 = 1065353216;
                _6806 = _6800;
                _6808 = _6802;
                _6810 = true;
            }
            else
            {
                bool _6812 = _6688 > 0.5;
                bool _6814 = _6588 > (-0.800000011920928955078125);
                bool _6816 = _6814 && _6812;
                bool _6818 = !_6816;
                int _6820 = _6818 ? 1065353216 : 1056964608;
                _6742 = _6816 ? (-1) : 0;
                _6804 = _6820;
                _6806 = _6700;
                _6808 = _6702;
                _6810 = true;
            }
        }
        else
        {
            bool _6822 = _6662 > 0.0;
            bool _6824 = _6662 >= 0.0;
            bool _6826 = isnan(_6662);
            bool _6828 = _6824 || _6826;
            bool _6830 = isnan(0.0);
            bool _6832 = _6828 || _6830;
            int _6834 = _6832 ? 0 : 1;
            int _6836 = ~_6834;
            int _6838 = _6836 + 1;
            int _6840 = _6838 + 1;
            int _6842 = _6840;
            _6626 = _6832 ? (-1) : 0;
            if (!_6822)
            {
                int _6844 = ~_6834;
                int _6846 = _6844 + 1;
                _6842 = _6846;
            }
            int _6848 = _6842;
            bool _6850 = _6688 >= 0.300000011920928955078125;
            bool _6852 = isnan(_6688);
            bool _6854 = _6850 || _6852;
            bool _6856 = isnan(0.300000011920928955078125);
            bool _6858 = _6854 || _6856;
            float _6860 = float(_6848);
            float _6862 = _6650 * _6860;
            float _6864 = _6648 * _6860;
            float _6866 = _6646 * _6860;
            float _6868 = _6862 * _6508;
            float _6870 = _6864 * _6512;
            float _6872 = _6866 * _6510;
            float _6874 = -_6868;
            float _6876 = fma(_6866, _6512, _6874);
            float _6878 = _6688 * 10.0;
            float _6880 = -_6870;
            float _6882 = fma(_6862, _6510, _6880);
            float _6884 = -_6872;
            float _6886 = fma(_6864, _6508, _6884);
            float _6888 = _6878 * _6876;
            float _6890 = _6878 * _6882;
            float _6892 = _6878 * _6886;
            int _6894 = _6858 ? as_type<int>(_4504) : 1065353216;
            _6714 = _6888;
            _6742 = _6858 ? (-1) : 0;
            _6804 = _6894;
            _6806 = _6890;
            _6808 = _6892;
        }
        _6810 = false;
        int _6896 = _6626;
        float _6898 = _6714;
        int _6900 = _6742;
        int _6902 = _6804;
        float _6904 = _6806;
        float _6906 = _6808;
        bool _6908 = _6518 >= (-0.20000000298023223876953125);
        bool _6910 = isnan(_6518);
        bool _6912 = _6908 || _6910;
        bool _6914 = isnan(-0.20000000298023223876953125);
        bool _6916 = _6912 || _6914;
        float _6918 = _6078 * 0.20000000298023223876953125;
        float _6920 = _6082 * 0.20000000298023223876953125;
        float _6922 = _6092 * 0.20000000298023223876953125;
        int _6924 = _6896;
        int _6926 = _6900;
        _6408 = _6920;
        _6410 = _6918;
        _6412 = _6922;
        _6928 = 0.0;
        _6930 = _6904;
        _6932 = _6906;
        _1156 = _6916;
        if (_6916)
        {
            bool _6934 = _6588 > 2.0;
            _6924 = _6934 ? (-1) : 0;
        }
        int _6936 = _6924;
        if (!_6916)
        {
            _6926 = -1;
        }
        int _6938 = _6926;
        int _6940 = _6938;
        if (_6916)
        {
            bool _6942 = _6518 >= (-0.20000000298023223876953125);
            int _6944 = (_6942 ? (-1) : 0) & _6936;
            _6940 = _6944;
        }
        int _6946 = _6940;
        int _6948 = ~_6946;
        bool _6950 = !_6584;
        int _6952 = _6948 & (_6950 ? (-1) : 0);
        bool _6954 = !_6584;
        int _6956 = _6946 & (_6954 ? (-1) : 0);
        int _6958 = _6952 | _6956;
        int _6960 = _6946 & (_6584 ? (-1) : 0);
        int _6962 = _6958 | _6960;
        int _6964 = ~_6962;
        float _6966 = (_6964 != 0) ? as_type<float>(_6902) : 0.0;
        _6968 = _6966;
        _6970 = 0.0;
        _6972 = 0.0;
        _6974 = 0.0;
        _6976 = _6898;
        _6978 = true;
    }
    else
    {
        bool _6980 = _6588 < 0.0;
        bool _6982 = _6980 && _6584;
        bool _6984 = _6588 > (-0.800000011920928955078125);
        bool _6986 = _6984 && _6982;
        if (_6986)
        {
            float _6988 = _5360 * _6508;
            _2360 = _6988;
        }
        float _6990 = _2360;
        float _6992 = _6990;
        if (!_6986)
        {
            _6568 = 0.0;
        }
        float _6994 = _6568;
        float _6996 = _6994;
        if (_6986)
        {
            _6996 = _6518;
        }
        float _6998 = _6996;
        _6974 = _6998;
        if (_6986)
        {
            float _7000 = fma(_5362, _6510, _6990);
            _6992 = _7000;
        }
        float _7002 = _6992;
        float _7004 = _7002;
        if (!_6986)
        {
            _6570 = _6398;
        }
        float _7006 = _6570;
        float _7008 = _7006;
        if (!_6986)
        {
            _6572 = _6392;
        }
        float _7010 = _6572;
        float _7012 = _7010;
        if (_6986)
        {
            float _7014 = fma(_5364, _6512, _7002);
            _7004 = _7014;
        }
        float _7016 = _7004;
        float _7018 = _7016;
        if (!_6986)
        {
            _6574 = _6400;
        }
        float _7020 = _6574;
        float _7022 = _7020;
        if (!_6986)
        {
            _6594 = _4498;
        }
        float _7024 = _6594;
        float _7026 = _7024;
        if (_6986)
        {
            float _7028 = -_6510;
            float _7030 = fma(_7028, _7016, _5362);
            _5390 = _7030;
        }
        float _7032 = _5390;
        _6690 = _7032;
        if (_6986)
        {
            float _7034 = -_6508;
            float _7036 = fma(_7034, _7016, _5360);
            _5392 = _7036;
        }
        float _7038 = _5392;
        _6692 = _7038;
        if (_6986)
        {
            float _7040 = -_6512;
            float _7042 = fma(_7040, _7016, _5364);
            _5394 = _7042;
        }
        float _7044 = _5394;
        _6694 = _7044;
        if (!_6986)
        {
            _2362 = _4502;
        }
        float _7046 = _2362;
        float _7048 = _7046;
        if (!_6986)
        {
            _7018 = _4500;
        }
        float _7050 = _7018;
        float _7052 = _7050;
        if (!_6986)
        {
            _6596 = _4504;
        }
        float _7054 = _6596;
        _6968 = _7054;
        if (_6986)
        {
            _7008 = _6398;
        }
        float _7056 = _7008;
        _6928 = _7056;
        if (_6986)
        {
            _7012 = _6392;
        }
        float _7058 = _7012;
        _6970 = _7058;
        if (_6986)
        {
            _7022 = _6400;
        }
        float _7060 = _7022;
        _6972 = _7060;
        if (_6986)
        {
            _7026 = _4498;
        }
        float _7062 = _7026;
        _6976 = _7062;
        if (_6986)
        {
            _7048 = _4502;
        }
        float _7064 = _7048;
        _6930 = _7064;
        if (_6986)
        {
            _7052 = _4500;
        }
        float _7066 = _7052;
        _6932 = _7066;
        if (_6986)
        {
            _6968 = 0.5;
        }
    }
    _6978 = false;
    float _7068 = _6968;
    float _7070 = _6408;
    float _7072 = _6410;
    float _7074 = _6412;
    float _7076 = _6690;
    float _7078 = _6692;
    float _7080 = _6928;
    float _7082 = _6970;
    float _7084 = _6972;
    float _7086 = _6694;
    float _7088 = _6974;
    float _7090 = _6930;
    float _7092 = _6976;
    float _7094 = _6932;
    bool _7096 = _1156;
    float _7098 = 1.0 / _6590;
    float _7100 = _2854 * _2854;
    bool _7102 = _7068 >= 0.5;
    float _7104 = fma(_6402, _6402, _7100);
    float _7106 = _7098 * _7070;
    float _7108 = _7098 * _7072;
    float _7110 = _7098 * _7074;
    float _7112 = _7106 * _7106;
    float _7114 = fma(_7108, _7108, _7112);
    float _7116 = fma(_7110, _7110, _7114);
    float _7118 = _6404 * _6404;
    float _7120 = fma(_6404, _6404, _7100);
    float _7122 = _7104 * 0.083333335816860198974609375;
    float _7124 = sqrt(_7116);
    float _7126 = fma(_6402, _6402, _7118);
    float _7128 = _7120 * 0.083333335816860198974609375;
    float _7130 = _4778 * _7122;
    float _7132 = _7126 * 0.083333335816860198974609375;
    float _7134 = _4754 * _7128;
    float _7136 = _4620 * _7128;
    float _7138 = _4626 * _7130;
    float _7140 = _4652 * _7128;
    bool _7142 = _7124 > 80.0;
    float _7144 = _4626 * _7122;
    float _7146 = _4636 * _7122;
    float _7148 = _4626 * _7144;
    float _7150 = _4778 * _7144;
    float _7152 = _4636 * _7144;
    float _7154 = _4778 * _7130;
    float _7156 = _4778 * _7146;
    float _7158 = _4626 * _7146;
    float _7160 = _4636 * _7130;
    float _7162 = _4636 * _7146;
    float _7164 = fma(_4754, _7134, _7148);
    float _7166 = fma(_4620, _7134, _7150);
    float _7168 = fma(_4652, _7134, _7152);
    float _7170 = fma(_4754, _7136, _7138);
    float _7172 = _7134;
    float _7174 = _7108;
    float _7176 = _7106;
    float _7178 = _7078;
    float _7180 = _7088;
    float _7182 = _7068;
    if (_7142)
    {
        float _7184 = rsqrt(_7116);
        _7172 = _7184;
    }
    float _7186 = _7172;
    float _7188 = fma(_4754, _7140, _7158);
    float _7190 = fma(_4652, _7136, _7160);
    float _7192 = _4654 * _7132;
    float _7194 = fma(_4652, _7140, _7162);
    float _7196 = fma(_4620, _7136, _7154);
    float _7198 = fma(_4620, _7140, _7156);
    float _7200 = _4640 * _7132;
    float _7202 = _4752 * _7132;
    float _7204 = fma(_4654, _7192, _7164);
    float _7206 = fma(_4640, _7192, _7166);
    float _7208 = fma(_4752, _7192, _7168);
    float _7210 = fma(_4640, _7200, _7196);
    float _7212 = fma(_4752, _7200, _7190);
    float _7214 = fma(_4640, _7202, _7198);
    float _7216 = fma(_4752, _7202, _7194);
    float _7218 = fma(_4654, _7202, _7188);
    float _7220 = fma(_4654, _7200, _7170);
    float _7222 = _7214 * _7208;
    float _7224 = _7206 * _7216;
    float _7226 = _7188;
    float _7228 = _7200;
    float _7230 = _7206;
    float _7232 = _7210;
    float _7234 = _7214;
    float _7236 = _7204;
    float _7238 = _7220;
    float _7240 = _7218;
    float _7242 = _7208;
    float _7244 = _7216;
    if (_7142)
    {
        float _7246 = _7186 * 80.0;
        _7226 = _7246;
    }
    float _7248 = _7226;
    float _7250 = _7214 * _7212;
    float _7252 = _7210 * _7208;
    float _7254 = -_7222;
    float _7256 = _7224 + _7254;
    if (!_7142)
    {
        _7228 = _7110;
    }
    float _7258 = _7228;
    float _7260 = -_7250;
    float _7262 = fma(_7210, _7216, _7260);
    float _7264 = -_7252;
    float _7266 = fma(_7206, _7212, _7264);
    float _7268 = _7220 * _7256;
    float _7270 = _7258;
    if (_7142)
    {
        float _7272 = _7108 * _7248;
        _7174 = _7272;
    }
    float _7274 = _7174;
    if (_7142)
    {
        float _7276 = _7106 * _7248;
        _7176 = _7276;
    }
    float _7278 = _7176;
    if (_7142)
    {
        float _7280 = _7110 * _7248;
        _7270 = _7280;
    }
    float _7282 = _7270;
    float _7284 = -_7268;
    float _7286 = fma(_7204, _7262, _7284);
    float _7288 = _7206 * _4502;
    float _7290 = _7214 * _4502;
    float _7292 = _7210 * _4502;
    float _7294 = fma(_7218, _7266, _7286);
    float _7296 = fma(_7204, _4498, _7288);
    float _7298 = fma(_7218, _4498, _7290);
    float _7300 = fma(_7220, _4498, _7292);
    float _7302 = _4506 * 0.01666666753590106964111328125;
    bool _7304 = _7294 != 0.0;
    bool _7306 = isnan(_7294);
    bool _7308 = _7304 || _7306;
    bool _7310 = isnan(0.0);
    bool _7312 = _7308 || _7310;
    float _7314 = fma(_7216, _4500, _7298);
    float _7316 = fma(_7208, _4500, _7296);
    float _7318 = fma(_7212, _4500, _7300);
    float _7320 = fma(_7302, _7274, _7076);
    float _7322 = _7314 * _4502;
    float _7324 = _7316 * _4500;
    float _7326 = _7318 * _4498;
    float _7328 = -_7322;
    float _7330 = fma(_7318, _4500, _7328);
    float _7332 = -_7324;
    float _7334 = fma(_7314, _4498, _7332);
    float _7336 = -_7326;
    float _7338 = fma(_7316, _4502, _7336);
    float _7340 = fma(_7302, _7278, _7078);
    float _7342 = _7330 + _7080;
    float _7344 = _7334 + _7082;
    float _7346 = _7326;
    float _7348 = _7320;
    float _7350 = _7320;
    float _7352 = _7340;
    if (!_7312)
    {
        _4524 = _7212;
    }
    float _7354 = _4524;
    bool _7356 = !_7312;
    float _7358 = _7354;
    if (!_7356)
    {
        float _7360 = 1.0 / _7294;
        float _7362 = _7220 * _7216;
        float _7364 = _7204 * _7214;
        float _7366 = _7218 * _7210;
        float _7368 = _7204 * _7212;
        float _7370 = -_7362;
        float _7372 = fma(_7218, _7212, _7370);
        float _7374 = -_7364;
        float _7376 = fma(_7218, _7206, _7374);
        float _7378 = _7218 * _7208;
        float _7380 = _7220 * _7206;
        float _7382 = -_7224;
        float _7384 = _7382 + _7222;
        float _7386 = -_7366;
        float _7388 = fma(_7220, _7214, _7386);
        float _7390 = -_7378;
        float _7392 = fma(_7204, _7216, _7390);
        float _7394 = -_7368;
        float _7396 = fma(_7220, _7208, _7394);
        float _7398 = -_7380;
        float _7400 = fma(_7204, _7210, _7398);
        float _7402 = _7392 * _7360;
        float _7404 = _7376 * _7360;
        float _7406 = _7262 * _7360;
        float _7408 = _7384 * _7360;
        float _7410 = _7266 * _7360;
        float _7412 = _7372 * _7360;
        float _7414 = _7388 * _7360;
        float _7416 = _7396 * _7360;
        float _7418 = _7400 * _7360;
        _7230 = _7408;
        _7232 = _7402;
        _7234 = _7404;
        _7236 = _7406;
        _7238 = _7412;
        _7240 = _7414;
        _7242 = _7410;
        _7358 = _7416;
        _7244 = _7418;
        _7178 = _7400;
        _7346 = _7396;
    }
    float _7420 = _7230;
    float _7422 = _7232;
    float _7424 = _7234;
    float _7426 = _7236;
    float _7428 = _7238;
    float _7430 = _7240;
    float _7432 = _7242;
    float _7434 = _7358;
    float _7436 = _7244;
    float _7438 = _7178;
    float _7440 = _7346;
    float _7442 = _7344 * _7420;
    float _7444 = _7344 * _7422;
    float _7446 = _7344 * _7424;
    float _7448 = _7338 + _7084;
    float _7450 = fma(_7342, _7426, _7442);
    float _7452 = fma(_7342, _7428, _7444);
    float _7454 = fma(_7342, _7430, _7446);
    float _7456 = fma(_7448, _7432, _7450);
    float _7458 = fma(_7448, _7434, _7452);
    float _7460 = fma(_7302, _7282, _7086);
    float _7462 = fma(_7448, _7436, _7454);
    bool _7464 = !_7102;
    float _7466 = _7460;
    float _7468 = _7440;
    float _7470 = _7438;
    float _7472 = _7460;
    float _7474 = _7458;
    float _7476 = _7456;
    float _7478 = _7462;
    if (!_7464)
    {
        float _7480 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
        float _7482 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
        float _7484 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
        float _7486 = _7340 * _7340;
        float _7488 = fma(_7320, _7320, _7486);
        float _7490 = fma(_7460, _7460, _7488);
        float _7492 = sqrt(_7490);
        float _7494 = _7492 + 9.9999997473787516355514526367188e-06;
        float _7496 = 1.0 / _7494;
        float _7498 = _7320 * _7496;
        float _7500 = _7340 * _7496;
        if (_2044)
        {
            float _7502 = _7482 * _5030;
            _5092 = _7502;
        }
        float _7504 = _5092;
        float _7506 = _7504;
        if (_2044)
        {
            float _7508 = _7482 * _5054;
            _5110 = _7508;
        }
        float _7510 = _5110;
        float _7512 = _7510;
        if (_2044)
        {
            float _7514 = _7482 * _5078;
            _5134 = _7514;
        }
        float _7516 = _5134;
        float _7518 = _7460 * _7496;
        float _7520 = _7516;
        if (_2044)
        {
            float _7522 = fma(_7480, _5028, _7504);
            _7506 = _7522;
        }
        float _7524 = _7506;
        if (_2044)
        {
            float _7526 = fma(_7480, _5052, _7510);
            _7512 = _7526;
        }
        float _7528 = _7512;
        if (_2044)
        {
            float _7530 = fma(_7480, _5076, _7516);
            _7520 = _7530;
        }
        float _7532 = _7520;
        if (_2044)
        {
            float _7534 = fma(_7484, _5032, _7524);
            _5094 = _7534;
        }
        float _7536 = _5094;
        float _7538 = _7536;
        float _7540 = _7536;
        if (_2044)
        {
            float _7542 = fma(_7484, _5056, _7528);
            _5112 = _7542;
        }
        float _7544 = _5112;
        float _7546 = _7544;
        float _7548 = _7544;
        if (_2044)
        {
            float _7550 = fma(_7484, _5080, _7532);
            _5136 = _7550;
        }
        float _7552 = _5136;
        float _7554 = _7552;
        float _7556 = _7552;
        if (!_2044)
        {
            bool _7558 = !_2272;
            if (!_7558)
            {
                uint _7560 = uint(int(uint(_182) >> uint(2)));
                float _7562 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7560)]);
                int _7564 = _182 + 4;
                uint _7566 = uint(int(uint(_7564) >> uint(2)));
                float _7568 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7566)]);
                int _7570 = _182 + 8;
                uint _7572 = uint(int(uint(_7570) >> uint(2)));
                float _7574 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7572)]);
                uint _7576 = uint(int(uint(_182) >> uint(2)));
                float _7578 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7576)]);
                int _7580 = _182 + 4;
                uint _7582 = uint(int(uint(_7580) >> uint(2)));
                float _7584 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7582)]);
                int _7586 = _182 + 8;
                uint _7588 = uint(int(uint(_7586) >> uint(2)));
                float _7590 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7588)]);
                uint _7592 = uint(int(uint(_182) >> uint(2)));
                float _7594 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7592)]);
                int _7596 = _182 + 4;
                uint _7598 = uint(int(uint(_7596) >> uint(2)));
                float _7600 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7598)]);
                int _7602 = _182 + 8;
                uint _7604 = uint(int(uint(_7602) >> uint(2)));
                float _7606 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7604)]);
                float _7608 = _7568 * _7482;
                float _7610 = _7584 * _7482;
                float _7612 = _7600 * _7482;
                float _7614 = fma(_7562, _7480, _7608);
                float _7616 = fma(_7578, _7480, _7610);
                float _7618 = fma(_7594, _7480, _7612);
                float _7620 = fma(_7574, _7484, _7614);
                float _7622 = fma(_7590, _7484, _7616);
                float _7624 = fma(_7606, _7484, _7618);
                _7548 = _7622;
                _7540 = _7620;
                _7556 = _7624;
                _7626 = true;
            }
            else
            {
                if (!_2324)
                {
                    _7538 = _7480;
                }
                float _7628 = _7538;
                _7540 = _7628;
                if (!_2324)
                {
                    _7546 = _7482;
                }
                float _7630 = _7546;
                _7548 = _7630;
                if (!_2324)
                {
                    _7554 = _7484;
                }
                float _7632 = _7554;
                bool _7634 = !_2324;
                _7556 = _7632;
                if (!_7634)
                {
                    uint _7636 = uint(int(uint(_182) >> uint(2)));
                    float _7638 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7636)]);
                    int _7640 = _182 + 4;
                    uint _7642 = uint(int(uint(_7640) >> uint(2)));
                    float _7644 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7642)]);
                    int _7646 = _182 + 8;
                    uint _7648 = uint(int(uint(_7646) >> uint(2)));
                    float _7650 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7648)]);
                    uint _7652 = uint(int(uint(_182) >> uint(2)));
                    float _7654 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7652)]);
                    int _7656 = _182 + 4;
                    uint _7658 = uint(int(uint(_7656) >> uint(2)));
                    float _7660 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7658)]);
                    int _7662 = _182 + 8;
                    uint _7664 = uint(int(uint(_7662) >> uint(2)));
                    float _7666 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7664)]);
                    uint _7668 = uint(int(uint(_182) >> uint(2)));
                    float _7670 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7668)]);
                    int _7672 = _182 + 4;
                    uint _7674 = uint(int(uint(_7672) >> uint(2)));
                    float _7676 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7674)]);
                    int _7678 = _182 + 8;
                    uint _7680 = uint(int(uint(_7678) >> uint(2)));
                    float _7682 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7680)]);
                    float _7684 = _7644 * _7482;
                    float _7686 = _7660 * _7482;
                    float _7688 = _7676 * _7482;
                    float _7690 = fma(_7638, _7480, _7684);
                    float _7692 = fma(_7654, _7480, _7686);
                    float _7694 = fma(_7670, _7480, _7688);
                    float _7696 = fma(_7650, _7484, _7690);
                    float _7698 = fma(_7666, _7484, _7692);
                    float _7700 = fma(_7682, _7484, _7694);
                    _7548 = _7698;
                    _7540 = _7696;
                    _7556 = _7700;
                }
            }
        }
        _7626 = false;
        float _7702 = _7548;
        float _7704 = _7540;
        float _7706 = _7556;
        float _7708 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
        float _7710 = _7708 * 59.999996185302734375;
        float _7712 = _7702 * _7710;
        float _7714 = _7704 * _7710;
        float _7716 = _4506 * _7712;
        float _7718 = _7706 * _7710;
        float _7720 = _4506 * _7714;
        float _7722 = _7716 * _6508;
        float _7724 = _4506 * _7718;
        float _7726 = fma(_7720, _6510, _7722);
        float _7728 = fma(_7724, _6512, _7726);
        float _7730 = -_6508;
        float _7732 = fma(_7728, _7730, _7716);
        float _7734 = -_6510;
        float _7736 = fma(_7728, _7734, _7720);
        float _7738 = -_6512;
        float _7740 = fma(_7728, _7738, _7724);
        float _7742 = _7732 * _7732;
        float _7744 = fma(_7736, _7736, _7742);
        float _7746 = fma(_7740, _7740, _7744);
        float _7748 = sqrt(_7746);
        float _7750 = _7748 + 9.9999997473787516355514526367188e-06;
        float _7752 = 1.0 / _7750;
        float _7754 = _7732 * _7752;
        float _7756 = _7736 * _7752;
        float _7758 = _7740 * _7752;
        float _7760 = _7340 * _7754;
        float _7762 = fma(_7320, _7756, _7760);
        float _7764 = fma(_7460, _7758, _7762);
        float _7766 = _7764 * 0.5;
        bool _7768 = _7764 >= 0.0;
        float _7770 = float(_7768);
        float _7772 = precise::min(_7748, _7766);
        float _7774 = _7772 * _7770;
        float _7776 = -_7774;
        float _7778 = fma(_7754, _7776, _7340);
        float _7780 = -_7774;
        float _7782 = fma(_7756, _7780, _7320);
        float _7784 = -_7774;
        float _7786 = fma(_7758, _7784, _7460);
        float _7788 = _7778 * _7778;
        float _7790 = fma(_7782, _7782, _7788);
        float _7792 = fma(_7786, _7786, _7790);
        float _7794 = sqrt(_7792);
        bool _7796 = _7794 > 0.5;
        bool _7798 = isnan(_7794);
        bool _7800 = _7796 || _7798;
        bool _7802 = isnan(0.5);
        bool _7804 = _7800 || _7802;
        float _7806 = _7758;
        float _7808 = _7794;
        float _7810 = _7792;
        _5098 = _7774;
        _7468 = _7748;
        _5114 = _7782;
        _5116 = _7732;
        _5118 = _7778;
        _7470 = _7710;
        if (!_7804)
        {
            float _7812 = _2040 * 20.0;
            _7348 = _7812;
        }
        float _7814 = _7348;
        float _7816 = _7814;
        if (_7804)
        {
            float _7818 = _2040 * 10.0;
            _2364 = _7818;
        }
        float _7820 = _2364;
        float _7822 = _7820;
        if (!_7804)
        {
            float _7824 = _4506 * _7814;
            _7816 = _7824;
        }
        float _7826 = _7816;
        float _7828 = _7826;
        if (_7804)
        {
            float _7830 = _4506 * _7820;
            _7822 = _7830;
        }
        float _7832 = _7822;
        float _7834 = _7832;
        if (!_7804)
        {
            float _7836 = _7826 * 0.01666666753590106964111328125;
            _7828 = _7836;
        }
        float _7838 = _7828;
        float _7840 = _7838;
        if (_7804)
        {
            float _7842 = _7832 * 0.01666666753590106964111328125;
            _7834 = _7842;
        }
        float _7844 = _7834;
        if (!_7804)
        {
            float _7846 = precise::min(_7794, _7838);
            _7806 = _7846;
        }
        float _7848 = _7806;
        _5096 = _7848;
        if (_7804)
        {
            float _7850 = precise::min(_7794, _7844);
            _7808 = _7850;
        }
        float _7852 = _7808;
        _5100 = _7852;
        if (!_7804)
        {
            float _7854 = -_7498;
            float _7856 = fma(_7854, _7848, _7782);
            _7840 = _7856;
        }
        float _7858 = _7840;
        float _7860 = _7858;
        if (!_7804)
        {
            float _7862 = -_7500;
            float _7864 = fma(_7862, _7848, _7778);
            _7810 = _7864;
        }
        float _7866 = _7810;
        float _7868 = _7866;
        if (!_7804)
        {
            float _7870 = -_7518;
            float _7872 = fma(_7870, _7848, _7786);
            _7466 = _7872;
        }
        float _7874 = _7466;
        _7472 = _7874;
        if (_7804)
        {
            float _7876 = -_7498;
            float _7878 = fma(_7876, _7852, _7782);
            _7860 = _7878;
        }
        float _7880 = _7860;
        _7350 = _7880;
        if (_7804)
        {
            float _7882 = -_7500;
            float _7884 = fma(_7882, _7852, _7778);
            _7868 = _7884;
        }
        float _7886 = _7868;
        _7352 = _7886;
        if (_7804)
        {
            float _7888 = -_7518;
            float _7890 = fma(_7888, _7852, _7786);
            _7472 = _7890;
        }
    }
    float _7892 = _5096;
    float _7894 = _5098;
    float _7896 = _5100;
    float _7898 = _7468;
    float _7900 = _5114;
    float _7902 = _5116;
    float _7904 = _5118;
    float _7906 = _7470;
    float _7908 = _7350;
    float _7910 = _7352;
    float _7912 = _7472;
    bool _7914 = !_2044;
    float _7916 = _7896;
    float _7918 = _7892;
    float _7920 = _7894;
    float _7922 = _7898;
    float _7924 = _7900;
    float _7926 = _7902;
    float _7928 = _7904;
    float _7930 = _7906;
    float _7932 = _7910;
    float _8010;
    float _8012;
    if (!_7914)
    {
        float _7934 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7936 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7938 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7940 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _7942 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7944 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _7946 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _7948 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _7950 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _7952 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _7954 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _7956 = _7938 * _7942;
        float _7958 = _7938 * _7944;
        float _7960 = -_7956;
        float _7962 = fma(_7934, _7946, _7960);
        float _7964 = -_7958;
        float _7966 = fma(_7936, _7946, _7964);
        float _7968 = _7936 * _7942;
        float _7970 = _7952 * _7946;
        float _7972 = _7952 * _7962;
        float _7974 = -_7968;
        float _7976 = fma(_7934, _7944, _7974);
        float _7978 = _7950 * _7944;
        float _7980 = -_7972;
        float _7982 = fma(_7950, _7966, _7980);
        float _7984 = -_7970;
        float _7986 = fma(_7954, _7944, _7984);
        float _7988 = -_7978;
        float _7990 = fma(_7952, _7942, _7988);
        float _7992 = fma(_7954, _7976, _7982);
        float _7994 = _7954 * _7942;
        float _7996 = -_7994;
        float _7998 = fma(_7950, _7946, _7996);
        float _8000 = 1.0 / _7992;
        float _8002 = _8000 * _7088;
        float _8004 = _7986 * _8002;
        float _8006 = _7998 * _8002;
        float _8008 = _7990 * _8002;
        _8010 = _8004;
        _8012 = _8008;
        _7920 = _7998;
        _7922 = _7940;
        _7924 = _7942;
        _7926 = _7944;
        _7928 = _7946;
        _7930 = _7948;
        _7180 = _8006;
        _8014 = true;
    }
    else
    {
        bool _8016 = _2270 != 0;
        bool _8018 = _2322 != 0;
        bool _8020 = _8018 || _8016;
        if (!_8020)
        {
            _7916 = 0.0;
        }
        float _8022 = _7916;
        _8010 = _8022;
        if (!_8020)
        {
            _7918 = 0.0;
        }
        float _8024 = _7918;
        bool _8026 = !_8020;
        _8012 = _8024;
        if (!_8026)
        {
            uint _8028 = uint(int(uint(_182) >> uint(2)));
            float _8030 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8028)]);
            int _8032 = _182 + 4;
            uint _8034 = uint(int(uint(_8032) >> uint(2)));
            float _8036 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8034)]);
            int _8038 = _182 + 8;
            uint _8040 = uint(int(uint(_8038) >> uint(2)));
            float _8042 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8040)]);
            int _8044 = _182 + 12;
            uint _8046 = uint(int(uint(_8044) >> uint(2)));
            float _8048 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8046)]);
            uint _8050 = uint(int(uint(_182) >> uint(2)));
            float _8052 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8050)]);
            int _8054 = _182 + 4;
            uint _8056 = uint(int(uint(_8054) >> uint(2)));
            float _8058 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8056)]);
            int _8060 = _182 + 8;
            uint _8062 = uint(int(uint(_8060) >> uint(2)));
            float _8064 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8062)]);
            int _8066 = _182 + 12;
            uint _8068 = uint(int(uint(_8066) >> uint(2)));
            float _8070 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8068)]);
            uint _8072 = uint(int(uint(_182) >> uint(2)));
            float _8074 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8072)]);
            int _8076 = _182 + 4;
            uint _8078 = uint(int(uint(_8076) >> uint(2)));
            float _8080 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8078)]);
            int _8082 = _182 + 8;
            uint _8084 = uint(int(uint(_8082) >> uint(2)));
            float _8086 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8084)]);
            float _8088 = _8042 * _8052;
            float _8090 = _8042 * _8058;
            float _8092 = -_8088;
            float _8094 = fma(_8030, _8064, _8092);
            float _8096 = -_8090;
            float _8098 = fma(_8036, _8064, _8096);
            float _8100 = _8036 * _8052;
            float _8102 = _8074 * _8058;
            float _8104 = _8080 * _8094;
            float _8106 = -_8100;
            float _8108 = fma(_8030, _8058, _8106);
            float _8110 = -_8104;
            float _8112 = fma(_8074, _8098, _8110);
            float _8114 = _8080 * _8064;
            float _8116 = -_8102;
            float _8118 = fma(_8080, _8052, _8116);
            float _8120 = fma(_8086, _8108, _8112);
            float _8122 = _8086 * _8052;
            float _8124 = -_8114;
            float _8126 = fma(_8086, _8058, _8124);
            float _8128 = -_8122;
            float _8130 = fma(_8074, _8064, _8128);
            float _8132 = 1.0 / _8120;
            float _8134 = _8132 * _7088;
            float _8136 = _8126 * _8134;
            float _8138 = _8130 * _8134;
            float _8140 = _8118 * _8134;
            _8010 = _8136;
            _8012 = _8140;
            _7920 = _8130;
            _7922 = _8048;
            _7924 = _8052;
            _7926 = _8058;
            _7928 = _8064;
            _7930 = _8070;
            _7180 = _8138;
        }
    }
    _8014 = false;
    float _8142 = _8010;
    float _8144 = _8012;
    float _8146 = _7920;
    float _8148 = _7922;
    float _8150 = _7924;
    float _8152 = _7926;
    float _8154 = _7928;
    float _8156 = _7930;
    float _8158 = _7180;
    float _8160 = _4658 + _8142;
    float _8162 = _7908 * 0.01666666753590106964111328125;
    float _8164 = _4656 + _8144;
    float _8166 = _7910 * 0.01666666753590106964111328125;
    float _8168 = _7912 * 0.01666666753590106964111328125;
    bool _8170 = !_2044;
    float _8172 = _8146;
    float _8174 = _8148;
    float _8176 = _8150;
    float _8178 = _8152;
    float _8180 = _8154;
    float _8182 = _8156;
    float _8184 = _8166;
    float _8186 = _8168;
    float _8308;
    if (!_8170)
    {
        float _8188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _8190 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _8192 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _8194 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _8196 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _8198 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _8200 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _8202 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _8204 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _8206 = _8192 * _8194;
        float _8208 = _8192 * _8196;
        float _8210 = _8190 * _8194;
        float _8212 = -_8206;
        float _8214 = fma(_8188, _8198, _8212);
        float _8216 = -_8208;
        float _8218 = fma(_8190, _8198, _8216);
        float _8220 = _8204 * _8190;
        float _8222 = _8202 * _8198;
        float _8224 = _8202 * _8214;
        float _8226 = -_8210;
        float _8228 = fma(_8188, _8196, _8226);
        float _8230 = _8204 * _8194;
        float _8232 = _8200 * _8196;
        float _8234 = -_8224;
        float _8236 = fma(_8200, _8218, _8234);
        float _8238 = -_8220;
        float _8240 = fma(_8202, _8192, _8238);
        float _8242 = -_8222;
        float _8244 = fma(_8204, _8196, _8242);
        float _8246 = -_8230;
        float _8248 = fma(_8200, _8198, _8246);
        float _8250 = fma(_8204, _8228, _8236);
        float _8252 = _8202 * _8188;
        float _8254 = -_8232;
        float _8256 = fma(_8202, _8194, _8254);
        float _8258 = 1.0 / _8250;
        float _8260 = -_8252;
        float _8262 = fma(_8200, _8190, _8260);
        float _8264 = _8200 * _8192;
        float _8266 = -_8264;
        float _8268 = fma(_8204, _8188, _8266);
        float _8270 = -_8188;
        float _8272 = fma(_8270, _8198, _8206);
        float _8274 = _8244 * _8258;
        float _8276 = _8248 * _8258;
        float _8278 = _8256 * _8258;
        float _8280 = _8162 * _8258;
        float _8282 = _8166 * _8274;
        float _8284 = _8166 * _8276;
        float _8286 = _8272 * _8258;
        float _8288 = _8166 * _8278;
        float _8290 = _8240 * _8258;
        float _8292 = _8268 * _8258;
        float _8294 = fma(_8218, _8280, _8282);
        float _8296 = fma(_8162, _8286, _8284);
        float _8298 = _8262 * _8258;
        float _8300 = fma(_8228, _8280, _8288);
        float _8302 = fma(_8168, _8290, _8294);
        float _8304 = fma(_8168, _8292, _8296);
        float _8306 = fma(_8168, _8298, _8300);
        _8172 = _8262;
        _8174 = _8244;
        _8176 = _8298;
        _8178 = _8196;
        _8180 = _8294;
        _8182 = _8248;
        _8308 = _8302;
        _8184 = _8304;
        _8186 = _8306;
        _8310 = true;
    }
    else
    {
        bool _8312 = _2270 != 0;
        bool _8314 = _2322 != 0;
        bool _8316 = _8314 || _8312;
        if (!_8316)
        {
            _7932 = _8162;
        }
        float _8318 = _7932;
        bool _8320 = !_8316;
        _8308 = _8318;
        if (!_8320)
        {
            uint _8322 = uint(int(uint(_182) >> uint(2)));
            float _8324 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8322)]);
            int _8326 = _182 + 4;
            uint _8328 = uint(int(uint(_8326) >> uint(2)));
            float _8330 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8328)]);
            int _8332 = _182 + 8;
            uint _8334 = uint(int(uint(_8332) >> uint(2)));
            float _8336 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8334)]);
            uint _8338 = uint(int(uint(_182) >> uint(2)));
            float _8340 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8338)]);
            int _8342 = _182 + 4;
            uint _8344 = uint(int(uint(_8342) >> uint(2)));
            float _8346 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8344)]);
            int _8348 = _182 + 8;
            uint _8350 = uint(int(uint(_8348) >> uint(2)));
            float _8352 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8350)]);
            uint _8354 = uint(int(uint(_182) >> uint(2)));
            float _8356 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8354)]);
            int _8358 = _182 + 4;
            uint _8360 = uint(int(uint(_8358) >> uint(2)));
            float _8362 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8360)]);
            int _8364 = _182 + 8;
            uint _8366 = uint(int(uint(_8364) >> uint(2)));
            float _8368 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8366)]);
            float _8370 = _8336 * _8340;
            float _8372 = _8336 * _8346;
            float _8374 = _8330 * _8340;
            float _8376 = -_8370;
            float _8378 = fma(_8324, _8352, _8376);
            float _8380 = -_8372;
            float _8382 = fma(_8330, _8352, _8380);
            float _8384 = _8368 * _8330;
            float _8386 = _8368 * _8340;
            float _8388 = _8362 * _8378;
            float _8390 = -_8374;
            float _8392 = fma(_8324, _8346, _8390);
            float _8394 = _8362 * _8324;
            float _8396 = _8356 * _8346;
            float _8398 = -_8388;
            float _8400 = fma(_8356, _8382, _8398);
            float _8402 = -_8386;
            float _8404 = fma(_8356, _8352, _8402);
            float _8406 = -_8394;
            float _8408 = fma(_8356, _8330, _8406);
            float _8410 = _8362 * _8352;
            float _8412 = fma(_8368, _8392, _8400);
            float _8414 = -_8384;
            float _8416 = fma(_8362, _8336, _8414);
            float _8418 = -_8396;
            float _8420 = fma(_8362, _8340, _8418);
            float _8422 = -_8410;
            float _8424 = fma(_8368, _8346, _8422);
            float _8426 = 1.0 / _8412;
            float _8428 = _8356 * _8336;
            float _8430 = -_8324;
            float _8432 = fma(_8430, _8352, _8370);
            float _8434 = -_8428;
            float _8436 = fma(_8368, _8324, _8434);
            float _8438 = _8404 * _8426;
            float _8440 = _8424 * _8426;
            float _8442 = _8420 * _8426;
            float _8444 = _8432 * _8426;
            float _8446 = _8438 * _8166;
            float _8448 = _8440 * _8166;
            float _8450 = _8162 * _8426;
            float _8452 = _8442 * _8166;
            float _8454 = _8416 * _8426;
            float _8456 = _8436 * _8426;
            float _8458 = fma(_8382, _8450, _8448);
            float _8460 = fma(_8444, _8162, _8446);
            float _8462 = _8408 * _8426;
            float _8464 = fma(_8392, _8450, _8452);
            float _8466 = fma(_8454, _8168, _8458);
            float _8468 = fma(_8456, _8168, _8460);
            float _8470 = fma(_8462, _8168, _8464);
            _8172 = _8424;
            _8174 = _8454;
            _8176 = _8442;
            _8178 = _8346;
            _8180 = _8352;
            _8182 = _8404;
            _8308 = _8466;
            _8184 = _8468;
            _8186 = _8470;
        }
    }
    _8310 = false;
    float _8472 = _8172;
    float _8474 = _8174;
    float _8476 = _8176;
    float _8478 = _8178;
    float _8480 = _8180;
    float _8482 = _8182;
    float _8484 = _8308;
    float _8486 = _8184;
    float _8488 = _8186;
    float _8490 = _7458 * _7458;
    float _8492 = _4506 * (-0.0291463173925876617431640625);
    float _8494 = fma(_7456, _7456, _8490);
    float _8496 = exp2(_8492);
    float _8498 = fma(_7462, _7462, _8494);
    float _8500 = sqrt(_8498);
    float _8502 = _8500 * 0.01666666753590106964111328125;
    bool _8504 = _8502 > 1.57079637050628662109375;
    float _8506 = _8502;
    float _8508 = _8496;
    if (_8504)
    {
        float _8510 = rsqrt(_8498);
        _8506 = _8510;
    }
    float _8512 = _8506;
    float _8514 = _8512;
    if (_8504)
    {
        float _8516 = _8512 * 94.24777984619140625;
        _8514 = _8516;
    }
    float _8518 = _8514;
    if (_8504)
    {
        float _8520 = _7458 * _8518;
        _7474 = _8520;
    }
    float _8522 = _7474;
    if (_8504)
    {
        float _8524 = _7456 * _8518;
        _7476 = _8524;
    }
    float _8526 = _7476;
    if (_8504)
    {
        float _8528 = _7462 * _8518;
        _7478 = _8528;
    }
    float _8530 = _7478;
    float _8532 = fma(_7302, _8522, _7090);
    float _8534 = fma(_7302, _8526, _7092);
    float _8536 = fma(_7302, _8530, _7094);
    float _8538 = _8532 * _8496;
    float _8540 = _8534 * _8496;
    float _8542 = _8536 * _8496;
    float _8544 = _8538 * _8538;
    float _8546 = fma(_8540, _8540, _8544);
    float _8548 = fma(_8542, _8542, _8546);
    float _8550 = sqrt(_8548);
    bool _8552 = _8550 > 31.4159259796142578125;
    float _8554 = _8550;
    float _8556 = _8538;
    float _8558 = _8542;
    if (_8552)
    {
        float _8560 = rsqrt(_8548);
        _8554 = _8560;
    }
    float _8562 = _8554;
    if (!_8552)
    {
        _8508 = _8540;
    }
    float _8564 = _8508;
    float _8566 = _8562;
    float _8568 = _8564;
    if (_8552)
    {
        float _8570 = _8562 * 31.4159259796142578125;
        _8566 = _8570;
    }
    float _8572 = _8566;
    if (_8552)
    {
        float _8574 = _8538 * _8572;
        _8556 = _8574;
    }
    float _8576 = _8556;
    float _8578 = _8576;
    if (_8552)
    {
        float _8580 = _8540 * _8572;
        _8568 = _8580;
    }
    float _8582 = _8568;
    if (_8552)
    {
        float _8584 = _8542 * _8572;
        _8558 = _8584;
    }
    float _8586 = _8558;
    float _8588 = _7302 * _8576;
    float _8590 = _7302 * _8582;
    float _8592 = _7302 * _8586;
    float _8594 = _8588 * _8588;
    float _8596 = fma(_8590, _8590, _8594);
    float _8598 = fma(_8592, _8592, _8596);
    float _8600 = sqrt(_8598);
    float _8602 = rsqrt(_8598);
    float _8604 = _8600 * 0.5;
    bool _8606 = _8600 != 0.0;
    bool _8608 = isnan(_8600);
    bool _8610 = _8606 || _8608;
    bool _8612 = isnan(0.0);
    bool _8614 = _8610 || _8612;
    float _8616 = _8604 * 0.15915493667125701904296875;
    float _8618 = _8616 * 6.283185482025146484375;
    float _8620 = sin(_8618);
    float _8622 = _8592 * _8602;
    float _8624 = _8588 * _8602;
    float _8626 = _8590 * _8602;
    float _8628 = _8614 ? _8622 : 0.0;
    float _8630 = _8614 ? _8624 : 0.0;
    float _8632 = _8616 * 6.283185482025146484375;
    float _8634 = cos(_8632);
    float _8636 = _8614 ? _8626 : 0.0;
    float _8638 = _8628 * _8620;
    float _8640 = _8630 * _8620;
    float _8642 = _8636 * _8620;
    float _8644 = _8638 * _4490;
    float _8646 = _8640 * _4484;
    float _8648 = _8640 * _4490;
    float _8650 = _8640 * _4480;
    float _8652 = -_8644;
    float _8654 = fma(_8640, _4486, _8652);
    float _8656 = -_8646;
    float _8658 = fma(_8642, _4490, _8656);
    float _8660 = _8642 * _4480;
    float _8662 = _8642 * _4486;
    float _8664 = _8638 * _4480;
    float _8666 = fma(_8642, _4484, _8648);
    float _8668 = fma(_8634, _4490, _8650);
    float _8670 = fma(_8634, _4484, _8660);
    float _8672 = -_8662;
    float _8674 = fma(_8638, _4484, _8672);
    float _8676 = fma(_8634, _4486, _8664);
    float _8678 = fma(_8638, _4486, _8666);
    float _8680 = _8670 + _8654;
    float _8682 = _8668 + _8674;
    float _8684 = _8676 + _8658;
    float _8686 = -_8678;
    float _8688 = fma(_8634, _4480, _8686);
    uint _8690 = uint(int(uint(_2010) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8690)] = as_type<uint>(_8680);
    int _8692 = _2010 + 4;
    uint _8694 = uint(int(uint(_8692) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8694)] = as_type<uint>(_8682);
    int _8696 = _2010 + 8;
    uint _8698 = uint(int(uint(_8696) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8698)] = as_type<uint>(_8684);
    int _8700 = _2010 + 12;
    uint _8702 = uint(int(uint(_8700) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8702)] = as_type<uint>(_8688);
    uint _8704 = uint(int(uint(_2124) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8704)] = as_type<uint>(_8582);
    int _8706 = _2124 + 4;
    uint _8708 = uint(int(uint(_8706) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8708)] = as_type<uint>(_8576);
    int _8710 = _2124 + 8;
    uint _8712 = uint(int(uint(_8710) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8712)] = as_type<uint>(_8586);
    int _8714 = _2124 + 12;
    uint _8716 = uint(int(uint(_8714) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8716)] = as_type<uint>(_7068);
    float _8718 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _8720 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
    int _8722 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 48;
    uint _8724 = uint(int(uint(_8722) >> uint(2)));
    float _8726 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8724)]);
    int _8728 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 52;
    uint _8730 = uint(int(uint(_8728) >> uint(2)));
    float _8732 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8730)]);
    int _8734 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 56;
    uint _8736 = uint(int(uint(_8734) >> uint(2)));
    float _8738 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8736)]);
    int _8740 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 36;
    uint _8742 = uint(int(uint(_8740) >> uint(2)));
    float _8744 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8742)]);
    int _8746 = as_type<int>(_8718) & 512;
    bool _8748 = _8746 != 0;
    int _8750 = as_type<int>(_8718) & 1024;
    bool _8752 = _8750 != 0;
    float _8754 = _8654;
    float _8756 = _8472;
    float _8758 = _8666;
    float _8760 = _8474;
    float _8762 = _8658;
    float _8764 = _8676;
    bool _8766 = _8752;
    bool _8768 = _7096;
    if (_8748)
    {
        float _8770 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _8772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _8774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _8776 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _8754 = _8770;
        _8756 = _8772;
        _8758 = _8774;
        _8760 = _8776;
    }
    float _8778 = _8754;
    float _8780 = _8756;
    float _8782 = _8758;
    float _8784 = _8760;
    float _8786 = _8476;
    float _8788 = _8478;
    float _8790 = _8480;
    float _8792 = _8482;
    if (_8748)
    {
        float _8794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _8796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _8798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _8800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _8786 = _8794;
        _8788 = _8796;
        _8790 = _8798;
        _8792 = _8800;
    }
    float _8802 = _8786;
    float _8804 = _8788;
    float _8806 = _8790;
    float _8808 = _8792;
    float _8810 = _8674;
    float _8812 = _4486;
    float _8814 = _4480;
    float _8816 = _8662;
    if (_8748)
    {
        float _8818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _8820 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _8822 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _8824 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _8810 = _8818;
        _8812 = _8820;
        _8814 = _8822;
        _8816 = _8824;
    }
    float _8826 = _8810;
    float _8828 = _8812;
    float _8830 = _8814;
    float _8832 = _8816;
    float _8834 = _4648 + _8720;
    float _8836 = _8834 + _8158;
    float _8838 = _8834;
    if (!_8748)
    {
        _8762 = 0.0;
    }
    float _8840 = _8762;
    float _8842 = _8840;
    if (!_8748)
    {
        _8764 = 0.0;
    }
    float _8844 = _8764;
    float _8846 = _8844;
    if (!_8748)
    {
        _8578 = 0.0;
    }
    float _8848 = _8578;
    int _8850 = as_type<int>(_8718) & 2048;
    bool _8852 = _8850 != 0;
    float _8854 = _8804;
    float _8856 = _8806;
    float _8858 = _8848;
    if (_8748)
    {
        float _8860 = _8836 * _8780;
        _2054 = _8860;
    }
    float _8862 = _2054;
    float _8864 = _8862;
    if (_8748)
    {
        float _8866 = _8836 * _8804;
        _8854 = _8866;
    }
    float _8868 = _8854;
    float _8870 = _8868;
    if (_8748)
    {
        float _8872 = _8836 * _8828;
        _2186 = _8872;
    }
    float _8874 = _2186;
    float _8876 = _8874;
    if (_8748)
    {
        float _8878 = fma(_8160, _8778, _8862);
        _8864 = _8878;
    }
    float _8880 = _8864;
    float _8882 = _8880;
    if (_8748)
    {
        float _8884 = fma(_8160, _8802, _8868);
        _8870 = _8884;
    }
    float _8886 = _8870;
    if (_8748)
    {
        float _8888 = fma(_8160, _8826, _8874);
        _8876 = _8888;
    }
    float _8890 = _8876;
    float _8892 = _8890;
    if (_8748)
    {
        float _8894 = fma(_8164, _8782, _8880);
        _8882 = _8894;
    }
    float _8896 = _8882;
    float _8898 = _8896;
    if (_8748)
    {
        float _8900 = fma(_8164, _8806, _8886);
        _8856 = _8900;
    }
    float _8902 = _8856;
    if (_8748)
    {
        float _8904 = fma(_8164, _8830, _8890);
        _8892 = _8904;
    }
    float _8906 = _8892;
    float _8908 = _8906;
    if (_8748)
    {
        float _8910 = _8784 + _8896;
        _8842 = _8910;
    }
    float _8912 = _8842;
    float _8914 = _8912;
    if (_8748)
    {
        float _8916 = _8808 + _8902;
        _8846 = _8916;
    }
    float _8918 = _8846;
    float _8920 = _8918;
    if (_8748)
    {
        float _8922 = _8832 + _8906;
        _8858 = _8922;
    }
    float _8924 = _8858;
    bool _8926 = !_8752;
    float _8928 = _8924;
    if (!_8926)
    {
        float _8930 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        uint _8932 = uint(int(uint(_182) >> uint(2)));
        float _8934 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8932)]);
        int _8936 = _182 + 4;
        uint _8938 = uint(int(uint(_8936) >> uint(2)));
        float _8940 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8938)]);
        int _8942 = _182 + 8;
        uint _8944 = uint(int(uint(_8942) >> uint(2)));
        float _8946 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8944)]);
        int _8948 = _182 + 12;
        uint _8950 = uint(int(uint(_8948) >> uint(2)));
        float _8952 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8950)]);
        uint _8954 = uint(int(uint(_182) >> uint(2)));
        float _8956 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8954)]);
        int _8958 = _182 + 4;
        uint _8960 = uint(int(uint(_8958) >> uint(2)));
        float _8962 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8960)]);
        int _8964 = _182 + 8;
        uint _8966 = uint(int(uint(_8964) >> uint(2)));
        float _8968 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8966)]);
        uint _8970 = uint(int(uint(_182) >> uint(2)));
        float _8972 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8970)]);
        int _8974 = _182 + 4;
        uint _8976 = uint(int(uint(_8974) >> uint(2)));
        float _8978 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8976)]);
        int _8980 = _182 + 8;
        uint _8982 = uint(int(uint(_8980) >> uint(2)));
        float _8984 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8982)]);
        float _8986 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _8988 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _8990 = _8836 * _8940;
        float _8992 = _8836 * _8962;
        float _8994 = fma(_8160, _8934, _8990);
        float _8996 = _8836 * _8978;
        float _8998 = fma(_8160, _8956, _8992);
        float _9000 = fma(_8160, _8972, _8996);
        float _9002 = fma(_8164, _8946, _8994);
        float _9004 = fma(_8164, _8968, _8998);
        float _9006 = fma(_8164, _8984, _9000);
        float _9008 = _8930 + _9002;
        float _9010 = _8986 + _9004;
        float _9012 = _8988 + _9006;
        _8928 = _9012;
        _7182 = _8952;
        _8920 = _9008;
        _8914 = _9010;
        _8908 = _9004;
        _8898 = _8988;
    }
    float _9014 = _8928;
    float _9016 = _7182;
    float _9018 = _8920;
    float _9020 = _8914;
    float _9022 = _8908;
    float _9024 = _8898;
    bool _9026 = !_8852;
    float _9028 = _9018;
    float _9030 = _9020;
    float _9032 = _9014;
    float _9034 = _9016;
    float _9036 = _9024;
    float _9038 = _9022;
    if (!_9026)
    {
        uint _9040 = uint(int(uint(_182) >> uint(2)));
        float _9042 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_9040)]);
        int _9044 = _182 + 4;
        uint _9046 = uint(int(uint(_9044) >> uint(2)));
        float _9048 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_9046)]);
        int _9050 = _182 + 8;
        uint _9052 = uint(int(uint(_9050) >> uint(2)));
        float _9054 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_9052)]);
        int _9056 = _182 + 12;
        uint _9058 = uint(int(uint(_9056) >> uint(2)));
        float _9060 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_9058)]);
        uint _9062 = uint(int(uint(_182) >> uint(2)));
        float _9064 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_9062)]);
        int _9066 = _182 + 4;
        uint _9068 = uint(int(uint(_9066) >> uint(2)));
        float _9070 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_9068)]);
        int _9072 = _182 + 8;
        uint _9074 = uint(int(uint(_9072) >> uint(2)));
        float _9076 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_9074)]);
        int _9078 = _182 + 12;
        uint _9080 = uint(int(uint(_9078) >> uint(2)));
        float _9082 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_9080)]);
        uint _9084 = uint(int(uint(_182) >> uint(2)));
        float _9086 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_9084)]);
        int _9088 = _182 + 4;
        uint _9090 = uint(int(uint(_9088) >> uint(2)));
        float _9092 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_9090)]);
        int _9094 = _182 + 8;
        uint _9096 = uint(int(uint(_9094) >> uint(2)));
        float _9098 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_9096)]);
        int _9100 = _182 + 12;
        uint _9102 = uint(int(uint(_9100) >> uint(2)));
        float _9104 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_9102)]);
        float _9106 = _8836 * _9048;
        float _9108 = _8836 * _9070;
        float _9110 = _8836 * _9092;
        float _9112 = fma(_8160, _9042, _9106);
        float _9114 = fma(_8160, _9064, _9108);
        float _9116 = fma(_8160, _9086, _9110);
        float _9118 = fma(_8164, _9054, _9112);
        float _9120 = fma(_8164, _9076, _9114);
        float _9122 = fma(_8164, _9098, _9116);
        float _9124 = _9118 + _9060;
        float _9126 = _9120 + _9082;
        float _9128 = _9122 + _9104;
        _9028 = _9126;
        _9030 = _9124;
        _9032 = _9128;
        _9034 = _9082;
        _9036 = _9118;
    }
    float _9130 = _9028;
    float _9132 = _9030;
    float _9134 = _9032;
    float _9136 = _9034;
    float _9138 = _9036;
    float _9140 = -_9130;
    float _9142 = _8732 + _9140;
    float _9144 = -_9132;
    float _9146 = _8726 + _9144;
    float _9148 = -_9134;
    float _9150 = _8738 + _9148;
    bool _9152 = _716 > 0.001000000047497451305389404296875;
    bool _9154 = isnan(_716);
    bool _9156 = _9152 || _9154;
    bool _9158 = isnan(0.001000000047497451305389404296875);
    bool _9160 = _9156 || _9158;
    float _9162 = _9142 * _9142;
    float _9164 = fma(_9146, _9146, _9162);
    float _9166 = fma(_9150, _9150, _9164);
    float _9168 = sqrt(_9166);
    float _9170 = _9138;
    if (!_9160)
    {
        _8838 = 0.0;
    }
    float _9172 = _8838;
    float _9174 = _9172;
    if (!_9160)
    {
        _9170 = 0.0;
    }
    float _9176 = _9170;
    float _9178 = _9176;
    if (!_9160)
    {
        _720 = 0.0;
    }
    float _9180 = _720;
    int _9182 = as_type<int>(_9168);
    float _9184 = _9180;
    if (!_9160)
    {
        bool _9186 = _9168 > _8744;
        float _9188 = float(_9186);
        _9038 = _9188;
    }
    float _9190 = _9038;
    bool _9192 = !_9160;
    float _9194 = _9190;
    if (!_9192)
    {
        int _9196 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 64;
        uint _9198 = uint(int(uint(_9196) >> uint(2)));
        float _9200 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9198)]);
        int _9202 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 68;
        uint _9204 = uint(int(uint(_9202) >> uint(2)));
        float _9206 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9204)]);
        int _9208 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 72;
        uint _9210 = uint(int(uint(_9208) >> uint(2)));
        float _9212 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9210)]);
        int _9214 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 80;
        uint _9216 = uint(int(uint(_9214) >> uint(2)));
        float _9218 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9216)]);
        int _9220 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 84;
        uint _9222 = uint(int(uint(_9220) >> uint(2)));
        float _9224 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9222)]);
        int _9226 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 88;
        uint _9228 = uint(int(uint(_9226) >> uint(2)));
        float _9230 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9228)]);
        int _9232 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 96;
        uint _9234 = uint(int(uint(_9232) >> uint(2)));
        float _9236 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9234)]);
        int _9238 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 100;
        uint _9240 = uint(int(uint(_9238) >> uint(2)));
        float _9242 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9240)]);
        int _9244 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 104;
        uint _9246 = uint(int(uint(_9244) >> uint(2)));
        float _9248 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9246)]);
        uint _9250 = uint(int(uint(_204) >> uint(2)));
        float _9252 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_9250)]);
        bool _9254 = _9168 > _8744;
        float _9256 = _9190;
        if (!_9254)
        {
            int _9258 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9260 = uint(int(uint(_9258) >> uint(2)));
            float _9262 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9260)]);
            _9256 = _9262;
        }
        float _9264 = _9256;
        float _9266 = -_9130;
        float _9268 = _9206 + _9266;
        float _9270 = -_9132;
        float _9272 = _9200 + _9270;
        float _9274 = -_9134;
        float _9276 = _9212 + _9274;
        float _9278 = -_9130;
        float _9280 = _9224 + _9278;
        float _9282 = _9268 * _9268;
        float _9284 = -_9132;
        float _9286 = _9218 + _9284;
        float _9288 = -_9134;
        float _9290 = _9230 + _9288;
        float _9292 = -_9130;
        float _9294 = _9242 + _9292;
        float _9296 = _9280 * _9280;
        float _9298 = -_9132;
        float _9300 = _9236 + _9298;
        float _9302 = fma(_9272, _9272, _9282);
        float _9304 = _9294 * _9294;
        float _9306 = fma(_9286, _9286, _9296);
        float _9308 = -_9134;
        float _9310 = _9248 + _9308;
        float _9312 = fma(_9276, _9276, _9302);
        float _9314 = fma(_9300, _9300, _9304);
        float _9316 = fma(_9290, _9290, _9306);
        float _9318 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        float _9320 = sqrt(_9312);
        float _9322 = fma(_9310, _9310, _9314);
        float _9324 = sqrt(_9316);
        float _9326 = sqrt(_9322);
        bool _9328 = _9320 > _8744;
        bool _9330 = _9324 > _8744;
        float _9332 = _9134;
        int _9334 = as_type<int>(_9290);
        int _9336 = as_type<int>(_9252);
        float _9338 = _9264;
        int _9340 = as_type<int>(_9322);
        if (!_9328)
        {
            int _9342 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9344 = uint(int(uint(_9342) >> uint(2)));
            float _9346 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9344)]);
            _9332 = _9346;
        }
        float _9348 = _9332;
        bool _9350 = _9326 > _8744;
        int _9352 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 40;
        uint _9354 = uint(int(uint(_9352) >> uint(2)));
        float _9356 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9354)]);
        float _9358 = _9136;
        if (!_9330)
        {
            int _9360 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9362 = uint(int(uint(_9360) >> uint(2)));
            float _9364 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9362)]);
            _9358 = _9364;
        }
        float _9366 = _9358;
        float _9368 = _9132;
        if (!_9350)
        {
            int _9370 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9372 = uint(int(uint(_9370) >> uint(2)));
            float _9374 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9372)]);
            _9368 = _9374;
        }
        float _9376 = _9368;
        int _9378 = as_type<int>(_9252) << 24;
        int _9380 = _9378 >> 24;
        float _9382 = float(_9380);
        float _9384 = _9382 * 0.0078740157186985015869140625;
        float _9386 = precise::min(_9384, 1.0);
        float _9388 = precise::max(_9386, -1.0);
        int _9390 = as_type<int>(_9252) << 16;
        int _9392 = as_type<int>(_9252) << 8;
        bool _9394 = _9388 > 0.0;
        bool _9396 = _9394 || _9254;
        int _9398 = _9390 >> 24;
        int _9400 = _9392 >> 24;
        if (!_9254)
        {
            bool _9402 = _9388 >= 0.0;
            bool _9404 = isnan(_9388);
            bool _9406 = _9402 || _9404;
            bool _9408 = isnan(0.0);
            bool _9410 = _9406 || _9408;
            _8766 = _9410;
        }
        bool _9412 = _8766;
        float _9414 = float(_9398);
        int _9416 = as_type<int>(_9252) >> 24;
        float _9418 = float(_9400);
        float _9420 = _9414 * 0.0078740157186985015869140625;
        bool _9422 = _9412;
        if (!_9254)
        {
            int _9424 = _9412 ? 0 : 1;
            _9334 = _9424;
        }
        int _9426 = _9334;
        float _9428 = float(_9416);
        float _9430 = _9418 * 0.0078740157186985015869140625;
        if (!_9254)
        {
            int _9432 = ~_9426;
            int _9434 = _9432 + 1;
            int _9436 = _9434 + 1;
            _9336 = _9436;
        }
        int _9438 = _9336;
        int _9440 = _9438;
        if (!_9396)
        {
            int _9442 = ~_9426;
            int _9444 = _9442 + 1;
            _9440 = _9444;
        }
        int _9446 = _9440;
        float _9448 = _9428 * 0.0078740157186985015869140625;
        float _9450 = precise::min(_9420, 1.0);
        int _9452 = _9446;
        int _9454 = as_type<int>(_9450);
        if (!_9254)
        {
            bool _9456 = _9168 >= _9264;
            bool _9458 = isnan(_9168);
            bool _9460 = _9456 || _9458;
            bool _9462 = isnan(_9264);
            bool _9464 = _9460 || _9462;
            _9422 = _9464;
        }
        bool _9466 = _9422;
        bool _9468 = _9466;
        if (!_9254)
        {
            float _9470 = float(_9446);
            _9452 = as_type<int>(_9470);
        }
        int _9472 = _9452;
        float _9474 = precise::min(_9430, 1.0);
        float _9476 = precise::max(_9450, -1.0);
        float _9478 = precise::min(_9448, 1.0);
        int _9480 = _9472;
        int _9482 = as_type<int>(_9474);
        int _9484 = as_type<int>(_9478);
        if (_9254)
        {
            _9338 = 1.0;
        }
        float _9486 = _9338;
        float _9488 = _9486;
        if (!_9254)
        {
            float _9490 = _9466 ? as_type<float>(_9472) : (-1.0);
            _9488 = _9490;
        }
        float _9492 = _9488;
        float _9494 = precise::max(_9474, -1.0);
        if (!_9328)
        {
            bool _9496 = _9476 >= 0.0;
            bool _9498 = isnan(_9476);
            bool _9500 = _9496 || _9498;
            bool _9502 = isnan(0.0);
            bool _9504 = _9500 || _9502;
            _9468 = _9504;
        }
        bool _9506 = _9468;
        float _9508 = precise::max(_9478, -1.0);
        bool _9510 = _9476 > 0.0;
        bool _9512 = _9510 || _9328;
        bool _9514 = _9512;
        if (!_9330)
        {
            bool _9516 = _9494 >= 0.0;
            bool _9518 = isnan(_9494);
            bool _9520 = _9516 || _9518;
            bool _9522 = isnan(0.0);
            bool _9524 = _9520 || _9522;
            _8768 = _9524;
        }
        bool _9526 = _8768;
        bool _9528 = _9494 > 0.0;
        bool _9530 = _9528 || _9330;
        bool _9532 = _9526;
        bool _9534 = _9530;
        if (!_9328)
        {
            int _9536 = _9506 ? 0 : 1;
            _9454 = _9536;
        }
        int _9538 = _9454;
        bool _9540 = _9508 > 0.0;
        bool _9542 = _9540 || _9350;
        float _9544 = as_type<float>(_9538);
        bool _9546 = _9542;
        if (!_9330)
        {
            int _9548 = _9526 ? 0 : 1;
            _9182 = _9548;
        }
        int _9550 = _9182;
        if (!_9350)
        {
            bool _9552 = _9508 >= 0.0;
            bool _9554 = isnan(_9508);
            bool _9556 = _9552 || _9554;
            bool _9558 = isnan(0.0);
            bool _9560 = _9556 || _9558;
            _9532 = _9560;
        }
        bool _9562 = _9532;
        if (!_9350)
        {
            int _9564 = _9562 ? 0 : 1;
            _9480 = _9564;
        }
        int _9566 = _9480;
        float _9568 = as_type<float>(_9566);
        if (!_9328)
        {
            int _9570 = ~_9538;
            int _9572 = _9570 + 1;
            int _9574 = _9572 + 1;
            _9482 = _9574;
        }
        int _9576 = _9482;
        int _9578 = _9576;
        if (!_9330)
        {
            int _9580 = ~_9550;
            int _9582 = _9580 + 1;
            int _9584 = _9582 + 1;
            _9484 = _9584;
        }
        int _9586 = _9484;
        int _9588 = _9586;
        if (!_9512)
        {
            int _9590 = ~_9538;
            int _9592 = _9590 + 1;
            _9578 = _9592;
        }
        int _9594 = _9578;
        int _9596 = _9594;
        if (!_9350)
        {
            int _9598 = ~_9566;
            int _9600 = _9598 + 1;
            int _9602 = _9600 + 1;
            _9340 = _9602;
        }
        int _9604 = _9340;
        int _9606 = _9604;
        if (!_9530)
        {
            int _9608 = ~_9550;
            int _9610 = _9608 + 1;
            _9588 = _9610;
        }
        int _9612 = _9588;
        int _9614 = _9612;
        if (!_9542)
        {
            int _9616 = ~_9566;
            int _9618 = _9616 + 1;
            _9606 = _9618;
        }
        int _9620 = _9606;
        int _9622 = _9620;
        if (!_9328)
        {
            float _9624 = float(_9594);
            _9596 = as_type<int>(_9624);
        }
        int _9626 = _9596;
        if (!_9330)
        {
            float _9628 = float(_9612);
            _9614 = as_type<int>(_9628);
        }
        int _9630 = _9614;
        if (!_9350)
        {
            float _9632 = float(_9620);
            _9622 = as_type<int>(_9632);
        }
        int _9634 = _9622;
        if (_9330)
        {
            _9544 = 1.0;
        }
        float _9636 = _9544;
        float _9638 = _9636;
        if (_9350)
        {
            _9568 = 1.0;
        }
        float _9640 = _9568;
        float _9642 = 1.0 / _9356;
        float _9644 = _9356;
        float _9646 = _9640;
        if (!_9328)
        {
            bool _9648 = _9320 >= _9348;
            bool _9650 = isnan(_9320);
            bool _9652 = _9648 || _9650;
            bool _9654 = isnan(_9348);
            bool _9656 = _9652 || _9654;
            _9514 = _9656;
        }
        bool _9658 = _9514;
        if (!_9330)
        {
            bool _9660 = _9324 >= _9366;
            bool _9662 = isnan(_9324);
            bool _9664 = _9660 || _9662;
            bool _9666 = isnan(_9366);
            bool _9668 = _9664 || _9666;
            _9534 = _9668;
        }
        bool _9670 = _9534;
        if (!_9330)
        {
            float _9672 = _9670 ? as_type<float>(_9630) : (-1.0);
            _9638 = _9672;
        }
        float _9674 = _9638;
        if (!_9350)
        {
            bool _9676 = _9326 >= _9376;
            bool _9678 = isnan(_9326);
            bool _9680 = _9676 || _9678;
            bool _9682 = isnan(_9376);
            bool _9684 = _9680 || _9682;
            _9546 = _9684;
        }
        bool _9686 = _9546;
        if (_9328)
        {
            _9644 = 1.0;
        }
        float _9688 = _9644;
        float _9690 = _9688;
        if (!_9328)
        {
            float _9692 = _9658 ? as_type<float>(_9626) : (-1.0);
            _9690 = _9692;
        }
        float _9694 = _9690;
        float _9696 = _9318 * _9642;
        if (!_9350)
        {
            float _9698 = _9686 ? as_type<float>(_9634) : (-1.0);
            _9646 = _9698;
        }
        float _9700 = _9646;
        float _9702 = abs(_9388);
        float _9704 = fma(_9696, _9492, _9702);
        float _9706 = precise::clamp(_9704, 0.0, 1.0);
        float _9708 = abs(_9476);
        float _9710 = fma(_9696, _9694, _9708);
        float _9712 = precise::clamp(_9710, 0.0, 1.0);
        float _9714 = abs(_9494);
        float _9716 = fma(_9696, _9674, _9714);
        float _9718 = precise::clamp(_9716, 0.0, 1.0);
        float _9720 = abs(_9508);
        float _9722 = fma(_9696, _9700, _9720);
        float _9724 = precise::clamp(_9722, 0.0, 1.0);
        float _9726 = _9706 * _9492;
        float _9728 = _9712 * _9694;
        float _9730 = _9718 * _9674;
        float _9732 = _9724 * _9700;
        _9194 = _9726;
        _9174 = _9728;
        _9178 = _9730;
        _9184 = _9732;
    }
    float _9734 = _9194;
    float _9736 = _9174;
    float _9738 = _9178;
    float _9740 = _9184;
    float _9742 = precise::min(_9734, 1.0);
    float _9744 = precise::min(_9736, 1.0);
    float _9746 = -_190;
    float _9748 = _9746 + _8160;
    float _9750 = precise::max(_9742, -1.0);
    float _9752 = precise::max(_9744, -1.0);
    float _9754 = -_196;
    float _9756 = _9754 + _8836;
    float _9758 = precise::min(_9738, 1.0);
    float _9760 = _9750 * 127.0;
    float _9762 = precise::min(_9740, 1.0);
    float _9764 = _9752 * 127.0;
    float _9766 = precise::max(_9758, -1.0);
    float _9768 = -_202;
    float _9770 = _9768 + _8164;
    float _9772 = precise::max(_9762, -1.0);
    float _9774 = rint(_9760);
    int _9776 = int(_9774);
    int _9778 = _182 + 4;
    float _9780 = _9766 * 127.0;
    float _9782 = _9772 * 127.0;
    float _9784 = rint(_9764);
    int _9786 = int(_9784);
    float _9788 = rint(_9780);
    int _9790 = int(_9788);
    uint _9792 = extract_bits(uint(_9776), 0u, 8u);
    int _9794 = int(_9792) & 255;
    float _9796 = rint(_9782);
    int _9798 = int(_9796);
    uint _9800 = extract_bits(uint(_9794), 0u, 8u);
    int _9802 = int(_9800) & 255;
    uint _9804 = extract_bits(uint(_9786), 0u, 8u);
    int _9806 = int(_9804) & 255;
    int _9808 = _9806 << 8;
    int _9810 = _9802 | _9808;
    uint _9812 = extract_bits(uint(_9794), 16u, 8u);
    int _9814 = int(_9812) & 255;
    int _9816 = _9814 << 16;
    int _9818 = _9810 | _9816;
    uint _9820 = extract_bits(uint(_9794), 24u, 8u);
    int _9822 = int(_9820) & 255;
    int _9824 = _9822 << 24;
    int _9826 = _9818 | _9824;
    int _9828 = _182 + 8;
    uint _9830 = extract_bits(uint(_9826), 0u, 8u);
    int _9832 = int(_9830) & 255;
    uint _9834 = extract_bits(uint(_9826), 8u, 8u);
    int _9836 = int(_9834) & 255;
    int _9838 = _9836 << 8;
    int _9840 = _9832 | _9838;
    uint _9842 = extract_bits(uint(_9790), 0u, 8u);
    int _9844 = int(_9842) & 255;
    int _9846 = _9844 << 16;
    int _9848 = _9840 | _9846;
    uint _9850 = extract_bits(uint(_9826), 24u, 8u);
    int _9852 = int(_9850) & 255;
    int _9854 = _9852 << 24;
    int _9856 = _9848 | _9854;
    uint _9858 = extract_bits(uint(_9856), 0u, 8u);
    int _9860 = int(_9858) & 255;
    uint _9862 = extract_bits(uint(_9856), 8u, 8u);
    int _9864 = int(_9862) & 255;
    int _9866 = _9864 << 8;
    int _9868 = _9860 | _9866;
    uint _9870 = extract_bits(uint(_9856), 16u, 8u);
    int _9872 = int(_9870) & 255;
    int _9874 = _9872 << 16;
    int _9876 = _9868 | _9874;
    uint _9878 = extract_bits(uint(_9798), 0u, 8u);
    int _9880 = int(_9878) & 255;
    int _9882 = _9880 << 24;
    int _9884 = _9876 | _9882;
    uint _9886 = uint(int(uint(_204) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_9886)] = uint(_9884);
    uint _9888 = uint(int(uint(_204) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9888)] = as_type<uint>(_584);
    uint _9890 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9890)] = as_type<uint>(_8160);
    uint _9892 = uint(int(uint(_9778) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9892)] = as_type<uint>(_8836);
    uint _9894 = uint(int(uint(_9828) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9894)] = as_type<uint>(_8164);
    uint _9896 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9896)] = as_type<uint>(_8484);
    uint _9898 = uint(int(uint(_9778) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9898)] = as_type<uint>(_8486);
    uint _9900 = uint(int(uint(_9828) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9900)] = as_type<uint>(_8488);
    uint _9902 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_9902)] = as_type<uint>(_9748);
    uint _9904 = uint(int(uint(_9778) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_9904)] = as_type<uint>(_9756);
    uint _9906 = uint(int(uint(_9828) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_9906)] = as_type<uint>(_9770);
    float _9908 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _9910 = _9756 * _9756;
    float _9912 = _8486 * _8486;
    float _9914 = fma(_9748, _9748, _9910);
    float _9916 = fma(_8484, _8484, _9912);
    float _9918 = fma(_9770, _9770, _9914);
    float _9920 = fma(_8488, _8488, _9916);
    float _9922 = sqrt(_9918);
    float _9924 = sqrt(_9920);
    bool _9926 = _9922 >= 9.9999999747524270787835121154785e-07;
    bool _9928 = isnan(_9922);
    bool _9930 = _9926 || _9928;
    bool _9932 = isnan(9.9999999747524270787835121154785e-07);
    bool _9934 = _9930 || _9932;
    float _9936 = _9920;
    if (!_9934)
    {
        bool _9938 = _566 != _304;
        bool _9940 = isnan(_566);
        bool _9942 = _9938 || _9940;
        bool _9944 = isnan(_304);
        bool _9946 = _9942 || _9944;
        _9948 = _9946;
        if (!_9948)
        {
            float _9950 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _9952 = _9950 > 0.0;
            bool _9954 = !_9952;
            if (!_9954)
            {
                float _9956 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _9958 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _9960 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _9962 = _9958 * _526;
                float _9964 = _9958 * _524;
                float _9966 = _9958 * _530;
                float _9968 = fma(_9956, _532, _9962);
                float _9970 = fma(_9956, _528, _9964);
                float _9972 = fma(_9956, _536, _9966);
                float _9974 = fma(_9960, _538, _9968);
                float _9976 = fma(_9960, _534, _9970);
                float _9978 = fma(_9960, _540, _9972);
                float _9980 = _9974 * _9974;
                float _9982 = fma(_9976, _9976, _9980);
                float _9984 = fma(_9978, _9978, _9982);
                float _9986 = rsqrt(_9984);
                float _9988 = _9986 * 9.9999999747524270787835121154785e-07;
                float _9990 = _9976 * _9988;
                float _9992 = _9974 * _9988;
                float _9994 = _9978 * _9988;
                _362 = as_type<int>(_9990);
                _364 = as_type<int>(_9992);
                _366 = as_type<int>(_9994);
                _9948 = true;
            }
            else
            {
                bool _9996 = _9924 >= 9.9999999747524270787835121154785e-07;
                bool _9998 = isnan(_9924);
                bool _10000 = _9996 || _9998;
                bool _10002 = isnan(9.9999999747524270787835121154785e-07);
                bool _10004 = _10000 || _10002;
                if (!_10004)
                {
                    float _10006 = _8836 * _8836;
                    float _10008 = fma(_8160, _8160, _10006);
                    float _10010 = fma(_8164, _8164, _10008);
                    float _10012 = sqrt(_10010);
                    bool _10014 = _10012 >= 9.9999999747524270787835121154785e-07;
                    bool _10016 = isnan(_10012);
                    bool _10018 = _10014 || _10016;
                    bool _10020 = isnan(9.9999999747524270787835121154785e-07);
                    bool _10022 = _10018 || _10020;
                    float _10024 = _10012;
                    if (_10022)
                    {
                        float _10026 = rsqrt(_10010);
                        _10024 = _10026;
                    }
                    float _10028 = _10024;
                    if (!_10022)
                    {
                        _350 = 0;
                    }
                    int _10030 = _350;
                    int _10032 = _10030;
                    if (!_10022)
                    {
                        _352 = 897988541;
                    }
                    int _10034 = _352;
                    int _10036 = _10034;
                    if (!_10022)
                    {
                        _354 = 0;
                    }
                    int _10038 = _354;
                    int _10040 = _10038;
                    if (_10022)
                    {
                        float _10042 = _10028 * 9.9999999747524270787835121154785e-07;
                        _9936 = _10042;
                    }
                    float _10044 = _9936;
                    if (_10022)
                    {
                        float _10046 = _8160 * _10044;
                        _10032 = as_type<int>(_10046);
                    }
                    int _10048 = _10032;
                    _362 = _10048;
                    if (_10022)
                    {
                        float _10050 = _8836 * _10044;
                        _10036 = as_type<int>(_10050);
                    }
                    int _10052 = _10036;
                    _364 = _10052;
                    if (_10022)
                    {
                        float _10054 = _8164 * _10044;
                        _10040 = as_type<int>(_10054);
                    }
                    int _10056 = _10040;
                    _366 = _10056;
                    _9948 = true;
                }
                else
                {
                    float _10058 = rsqrt(_9920);
                    float _10060 = _10058 * 9.9999999747524270787835121154785e-07;
                    float _10062 = _8484 * _10060;
                    float _10064 = _8486 * _10060;
                    float _10066 = _8488 * _10060;
                    _362 = as_type<int>(_10062);
                    _364 = as_type<int>(_10064);
                    _366 = as_type<int>(_10066);
                    _9948 = true;
                }
            }
        }
    }
    else
    {
        float _10068 = _9924 * _9908;
        bool _10070 = _10068 >= 0.001000000047497451305389404296875;
        bool _10072 = isnan(_10068);
        bool _10074 = _10070 || _10072;
        bool _10076 = isnan(0.001000000047497451305389404296875);
        bool _10078 = _10074 || _10076;
        bool _10080 = _10068 > 0.0;
        bool _10082 = !_10078;
        bool _10084 = _10080 && _10082;
        bool _10086 = _9922 < 0.001000000047497451305389404296875;
        bool _10088 = _10086 && _10084;
        if (!_10088)
        {
            _356 = as_type<int>(_9748);
        }
        int _10090 = _356;
        int _10092 = _10090;
        if (_10088)
        {
            float _10094 = _9908 * _8484;
            _10092 = as_type<int>(_10094);
        }
        int _10096 = _10092;
        _362 = _10096;
        if (!_10088)
        {
            _358 = as_type<int>(_9756);
        }
        int _10098 = _358;
        int _10100 = _10098;
        if (_10088)
        {
            float _10102 = _9908 * _8486;
            _10100 = as_type<int>(_10102);
        }
        int _10104 = _10100;
        _364 = _10104;
        if (!_10088)
        {
            _360 = as_type<int>(_9770);
        }
        int _10106 = _360;
        _366 = _10106;
        if (_10088)
        {
            float _10108 = _9908 * _8488;
            _366 = as_type<int>(_10108);
        }
    }
    _9948 = false;
    int _10110 = _362;
    int _10112 = _364;
    int _10114 = _366;
    uint _10116 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_10116)] = uint(_10110);
    uint _10118 = uint(int(uint(_9778) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_10118)] = uint(_10112);
    uint _10120 = uint(int(uint(_9828) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_10120)] = uint(_10114);
}

