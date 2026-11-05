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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
};

static inline __attribute__((always_inline))
void _80(thread const int& _5012, thread const int& _5013, thread const int& _5014, thread const int& _5015, thread int& _5016, thread int& _5017, thread int& _5018, thread int& _5019, thread int& _5020, thread int& _5021, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _5024 = _5012;
    int _5026 = _5013;
    int _5028 = _5014;
    float _5030 = as_type<float>(_5014) + 0.0;
    bool _5032 = _5030 != 0.0;
    bool _5034 = isnan(_5030);
    bool _5036 = _5032 || _5034;
    bool _5038 = isnan(0.0);
    bool _5040 = _5036 || _5038;
    int _5042 = _5040 ? (-1) : 0;
    if (!_5040)
    {
        float _5044 = as_type<float>(_5014) * 1.0;
        _5024 = as_type<int>(_5044);
    }
    int _5046 = _5024;
    bool _5048 = !_5040;
    int _5050 = _5046;
    int _5052 = _5046;
    if (!_5048)
    {
        float _5054 = as_type<float>(_5014) + 0.0;
        bool _5056 = _5054 >= 0.0;
        bool _5058 = isnan(_5054);
        bool _5060 = _5056 || _5058;
        bool _5062 = isnan(0.0);
        bool _5064 = _5060 || _5062;
        _5042 = _5064 ? (-1) : 0;
        if (!_5064)
        {
            _5050 = 2147483647;
        }
        int _5066 = _5050;
        bool _5068 = !_5064;
        int _5070 = _5066;
        _5052 = _5066;
        if (!_5068)
        {
            float _5072 = abs(as_type<float>(_5014));
            float _5074 = _5072 + 0.0;
            bool _5076 = _5074 > as_type<float>(0x7f800000u /* inf */);
            bool _5078 = isnan(_5074);
            bool _5080 = _5076 || _5078;
            bool _5082 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5084 = _5080 || _5082;
            _5042 = _5084 ? (-1) : 0;
            if (_5084)
            {
                float _5086 = as_type<float>(_5014) + 1.0;
                _5070 = as_type<int>(_5086);
            }
            int _5088 = _5070;
            int _5090 = _5088;
            _5052 = _5088;
            if (!_5084)
            {
                float _5092 = abs(as_type<float>(_5014));
                float _5094 = _5092 + (-0.0);
                float _5096 = 0.0 + _5094;
                bool _5098 = _5096 != as_type<float>(0x7f800000u /* inf */);
                bool _5100 = isnan(_5096);
                bool _5102 = _5098 || _5100;
                bool _5104 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5106 = _5102 || _5104;
                _5042 = _5106 ? (-1) : 0;
                if (!_5106)
                {
                    _5090 = _5014;
                }
                int _5108 = _5090;
                bool _5110 = !_5106;
                _5052 = _5108;
                if (!_5110)
                {
                    float _5112 = as_type<float>(_5014) * 18446744073709551616.0;
                    float _5114 = rsqrt(_5112);
                    float _5116 = _5112 * _5114;
                    float _5118 = _5114 * 0.5;
                    float _5120 = -_5116;
                    float _5122 = 0.0 + _5120;
                    float _5124 = fma(_5118, _5122, 0.5);
                    float _5126 = fma(_5116, _5124, _5116);
                    float _5128 = -_5126;
                    float _5130 = 0.0 + _5128;
                    float _5132 = fma(_5126, _5130, _5112);
                    float _5134 = fma(_5118, _5132, _5126);
                    float _5136 = _5134 * 2.3283064365386962890625e-10;
                    _5052 = as_type<int>(_5136);
                    _5026 = as_type<int>(_5126);
                    _5028 = as_type<int>(_5122);
                }
            }
        }
    }
    int _5138 = _5052;
    int _5140 = _5026;
    int _5142 = _5028;
    int _5144 = _5042;
    _5016 = _5015;
    _5017 = 0;
    _5018 = _5138;
    _5019 = _5140;
    _5020 = _5142;
    _5021 = _5144;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1120 = false;
    bool _478 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _88 = int(_86);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1994 = as_type<float>(_104);
        out.gl_Position.z = _1994;
    }
    if (!_92)
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
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2062 = as_type<float>(_140);
        out.gl_Position.z = _2062;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _292 + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_308;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _332;
    float _352 = _344 * _348;
    float _354 = -_344;
    float _356 = _354 + 1.0;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _364 = 1.0 / _328;
    float _366 = _324 * _356;
    float _368 = -_324;
    float _370 = _368 + 1.0;
    float _372 = in.m_49.x;
    float _374 = in.m_49.y;
    float _376 = in.m_49.z;
    float _378 = _312 * _350;
    float _380 = _296 * _364;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _386;
    float _390 = fma(_360, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _392 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = _390 * _366;
    float _398 = _392 * _366;
    float _400 = _394 * _366;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _416 = fma(_404, _378, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_408, _378, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _422 = fma(_412, _378, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = fma(_416, _352, _414);
    float _428 = fma(_418, _352, _420);
    float _430 = fma(_422, _352, _424);
    float _432 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _426);
    float _434 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _428);
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _430);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _442 = _432 * _372;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = _434 * _374;
    float _448 = _436 * _376;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _452 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _458 = !_362;
    float _476;
    if (!_458)
    {
        float _460 = in.m_51.x;
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _464 = _460 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_88);
        float _482 = 1.0 / _480;
        float _484 = _122 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = in.m_51.x;
    float _490 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _492 = in.m_51.w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _496 = _494 != 0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _498;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _504 = _502 != 0;
    float _506 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _508 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _510 = 1.0 / _500;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _514 = _512 != 0;
    float _516 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _506);
    float _518 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _490);
    float _520 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _508);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _524 = _486 + _522;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _528 = _526 != 0;
    float _530 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _518);
    float _532 = _428;
    bool _534 = _528;
    if (_496)
    {
        float _536 = in.m_51.z;
        _532 = _536;
    }
    float _538 = _532;
    float _540 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _542 = in.m_53.x;
    float _544 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _546 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _544;
    bool _548 = false;
    if (_514)
    {
        bool _550 = _488 > 0.5;
        _548 = _550;
    }
    bool _552 = _548;
    float _554 = _524 * _510;
    float _556 = _488 * 6.283185482025146484375;
    float _558 = in.m_53.y;
    bool _560 = _492 > 0.5;
    bool _562 = _560 && _528;
    float _564 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _516);
    float _566 = _516;
    float _568 = _564;
    if (!_504)
    {
        float _570 = in.m_51.y;
        _566 = _570;
    }
    float _572 = _566;
    float _574 = _556 * 0.15915493667125701904296875;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _578 = _576 != 0;
    float _580 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _520);
    out.m_55.x = 1.0;
    out.m_55.y = 1.0;
    out.m_55.z = 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _582;
    float _586 = _574 * 6.283185482025146484375;
    float _588 = sin(_586);
    float _590 = in.m_57.x;
    float _592 = in.m_57.y;
    float _594 = in.m_57.z;
    float _596 = _580;
    if (_496)
    {
        bool _598 = _538 > 0.5;
        _534 = _598;
    }
    bool _600 = _534;
    float _602 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _604 = 0.0;
    if (!_504)
    {
        float _606 = in.m_51.z;
        _604 = _606;
    }
    float _608 = _604;
    float _610 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _612 = _546 * _546;
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _616;
    float _620 = fma(_584, _584, _612);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _622;
    float _626 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _628 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _630;
    float _634 = -_558;
    float _636 = _634 + 1.0;
    float _638 = _574 * 6.283185482025146484375;
    float _640 = cos(_638);
    float _642 = fma(_618, _554, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _644 = fma(_632, _554, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _646 = _618;
    float _648 = _624;
    int _650 = as_type<int>(_642);
    if (!_504)
    {
        _646 = _572;
    }
    float _652 = _646;
    float _654 = fma(_628, _628, _620);
    float _656 = _562 ? _636 : _558;
    float _658 = fma(_624, _554, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _660 = _588 * _590;
    float _662 = _614 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _664 = _652;
    float _666 = _572;
    int _668 = as_type<int>(_658);
    if (_504)
    {
        float _670 = in.m_51.x;
        float _672 = in.m_51.y;
        _664 = _670;
        _666 = _672;
    }
    float _674 = _664;
    float _676 = _666;
    bool _678 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _680 = isnan(_486);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _692 = fma(_662, _656, -0.5);
    bool _694 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _696 = isnan(_486);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _564 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _708 = _608;
    if (!_504)
    {
        _568 = _608;
    }
    float _710 = _568;
    float _712 = _640 * _590;
    float _714 = _530 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = -_660;
    float _718 = fma(_640, _594, _716);
    float _720 = -_706;
    float _722 = _720 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _724 = fma(_588, _594, _712);
    float _726 = -_714;
    float _728 = _726 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _730 = _580 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _732 = -_704;
    float _734 = _732 + 1.0;
    float _736 = _710;
    if (!_496)
    {
        _596 = _542;
    }
    float _738 = _596;
    float _740 = _728 * _728;
    float _742 = -_730;
    float _744 = _742 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _688 * _734;
    float _748 = _738;
    if (!_514)
    {
        _648 = _542;
    }
    float _750 = _648;
    float _752 = fma(_722, _722, _740);
    float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _756 = _658 * _746;
    float _758 = _750;
    if (_496)
    {
        float _760 = -_542;
        float _762 = _760 + 1.0;
        _668 = as_type<int>(_762);
    }
    int _764 = _668;
    float _766 = fma(_744, _744, _752);
    float _768 = _642 * _746;
    if (_514)
    {
        float _770 = -_542;
        float _772 = _770 + 1.0;
        _650 = as_type<int>(_772);
    }
    int _774 = _650;
    if (_504)
    {
        _736 = _676;
    }
    float _776 = _736;
    float _778 = _644 * _746;
    if (_504)
    {
        _708 = _676;
    }
    float _780 = _708;
    float _782 = rsqrt(_766);
    bool _784 = _676 > 0.5;
    bool _786 = _784 && _578;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _790 = _714 + _788;
    if (_496)
    {
        float _792 = _600 ? as_type<float>(_764) : _542;
        _748 = _792;
    }
    float _794 = _748;
    float _796 = -_688;
    float _798 = _796 + 1.0;
    float _800 = _790 * _790;
    if (_514)
    {
        float _802 = _552 ? as_type<float>(_774) : _542;
        _758 = _802;
    }
    float _804 = _758;
    float _806 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].x, _768);
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].y, _756);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].z, _778);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _816 = _706 + _814;
    float _818 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[83].z, _690);
    float _820 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[83].w, _810);
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _824 = _730 + _822;
    float _826 = fma(_816, _816, _800);
    float _828 = _722 * _782;
    float _830 = _728 * _782;
    float _832 = _744 * _782;
    float _834 = fma(_824, _824, _826);
    float _836 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _838 = _832 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _840 = sqrt(_654);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = _830 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _846 = -_838;
    float _848 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[10].y, _846);
    float _850 = -_842;
    float _852 = fma(_836, 2.0, _850);
    float _854 = _828 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _856 = -_844;
    float _858 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[9].y, _856);
    float _860 = _848 * _848;
    float _862 = rsqrt(_834);
    float _864 = -_854;
    float _866 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].y, _864);
    float _868 = _776 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _870 = fma(_858, _858, _860);
    float _872 = _786 ? _636 : _558;
    float _874 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _818);
    float _876 = fma(_866, _866, _870);
    float _878 = precise::max(_840, 5.0);
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _882 = _754 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _884 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _820);
    float _886 = precise::min(_878, 50.0);
    float _888 = rsqrt(_876);
    float _890 = fma(_868, -2.0, _880);
    float _892 = fma(_882, _794, -0.5);
    float _894 = _790 * _862;
    float _896 = -_122;
    float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[81].x, _852);
    float _900 = _816 * _862;
    float _902 = fma(_886, 0.01745335571467876434326171875, 0.174532234668731689453125);
    float _904 = -_894;
    float _906 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    float _908 = fma(_874, _892, _898);
    float _910 = -_900;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _816);
    float _914 = _902 * 0.15915493667125701904296875;
    float _916 = _906 * _906;
    float _918 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _890);
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _922 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _924 = fma(_912, _912, _916);
    float _926 = _858 * _888;
    float _928 = _824 * _862;
    float _930 = _848 * _888;
    float _932 = _866 * _888;
    float _934 = _926 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _936 = -_928;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _824);
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _942 = _932 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _944 = -_934;
    float _946 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[8].y, _944);
    float _948 = fma(_938, _938, _924);
    float _950 = _930 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _952 = -_942;
    float _954 = fma(_930, (*spvDescriptorSet0.vp_c10)._m0[10].y, _952);
    float _956 = _946 * _946;
    float _958 = -_918;
    float _960 = fma(_884, _692, _958);
    float _962 = -_950;
    float _964 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[9].y, _962);
    float _966 = _914 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = fma(_954, _954, _956);
    float _972 = _922 * _920;
    float _974 = _804 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _976 = _908 + 0.5;
    float _978 = fma(_964, _964, _970);
    float _980 = _974 * _940;
    float _982 = _914 * 6.283185482025146484375;
    float _984 = cos(_982);
    float _986 = _960 + 0.5;
    float _988 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[124].x, _806);
    float _990 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[124].y, _808);
    float _992 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[124].z, _812);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    out.m_59.x = _980;
    out.m_59.y = _972;
    out.m_59.z = _976;
    out.m_59.w = _986;
    float _996 = rsqrt(_978);
    float _998 = _718 * _968;
    float _1000 = sqrt(_948);
    float _1002 = _718 * _984;
    float _1004 = -_998;
    float _1006 = fma(_984, _592, _1004);
    float _1008 = fma(_968, _592, _1002);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1006);
    float _1012 = _946 * _996;
    float _1014 = _954 * _996;
    float _1016 = _964 * _996;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1022 = _862 * _1000;
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1020);
    float _1026 = _540 * _1022;
    float _1028 = _602 * _1022;
    float _1030 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1024);
    float _1032 = _610 * _1022;
    float _1034 = _1026 * _1010;
    float _1036 = _1028 * _994;
    float _1038 = abs(_1030);
    float _1040 = -_1038;
    float _1042 = _1040 + 1.0;
    float _1044 = _1032 * _1018;
    float _1046 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1048 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1050 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1052 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1046);
    int _1054 = as_type<int>(_1042) + (-218103808);
    float _1056 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1048);
    float _1058 = abs(_1030);
    float _1060 = fma(_1058, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1062 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1050);
    bool _1064 = uint(_1054) >= 1920991232u;
    float _1066 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1056);
    float _1068 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1070 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1072 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1074 = abs(_1030);
    float _1076 = fma(_1074, _1060, -0.212114393711090087890625);
    float _1078 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1052);
    float _1080 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1062);
    float _1082 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = abs(_1030);
    float _1090 = fma(_1088, _1076, 1.570728778839111328125);
    bool _1092 = _1030 < 0.0;
    float _1094 = float(_1092);
    bool _1096 = !_1064;
    float _1118;
    if (!_1096)
    {
        int _1098 = as_type<int>(_994);
        int _1100 = as_type<int>(_1010);
        int _1102 = as_type<int>(_1042);
        int _1104 = 6112;
        int _1106;
        int _1108;
        int _1110;
        int _1112;
        int _1114;
        int _1116;
        _80(_1098, _1100, _1102, _1104, _1106, _1108, _1110, _1112, _1114, _1116, out.gl_Position, out.gl_PointSize);
        _1118 = as_type<float>(_1110);
        _1120 = true;
    }
    else
    {
        float _1122 = rsqrt(_1042);
        float _1124 = _1042 * _1122;
        float _1126 = _1122 * 0.5;
        float _1128 = -_1124;
        float _1130 = 0.0 + _1128;
        float _1132 = fma(_1126, _1130, 0.5);
        float _1134 = fma(_1124, _1132, _1124);
        float _1136 = -_1134;
        float _1138 = 0.0 + _1136;
        float _1140 = fma(_1134, _1138, _1042);
        float _1142 = fma(_1126, _1140, _1134);
        _1118 = _1142;
    }
    _1120 = false;
    float _1144 = _1118;
    float _1146 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1148 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1150 = _1090 * _1144;
    float _1152 = -_1146;
    float _1154 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1152);
    float _1156 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1158 = -_1148;
    float _1160 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1162 = _1154 * _1154;
    float _1164 = -_1156;
    float _1166 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1164);
    float _1168 = _1094 * 2.0;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1172 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1170;
    float _1174 = fma(_1160, _1160, _1162);
    float _1176 = -_1168;
    float _1178 = fma(_1150, _1176, _1150);
    float _1180 = fma(_1166, _1166, _1174);
    float _1182 = fma(_1094, 3.1415927410125732421875, _1178);
    float _1184 = rsqrt(_1180);
    float _1186 = _1182 * 0.15915493667125701904296875;
    float _1188 = _1186 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    float _1192 = _1154 * _1184;
    float _1194 = _1160 * _1184;
    float _1196 = _1166 * _1184;
    float _1198 = _1192 * _1192;
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1204 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1202;
    float _1206 = fma(_1196, _1196, _1200);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1210 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1208;
    float _1212 = -_1204;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = rsqrt(_1206);
    float _1218 = -_1210;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1222 = _1220 * _1220;
    float _1224 = _1186 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = fma(_1214, _1214, _1222);
    float _1230 = -_1172;
    float _1232 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1234 = fma(_1232, _1232, _1228);
    float _1236 = _1194 * _1216;
    float _1238 = _1192 * _1216;
    float _1240 = -_1190;
    float _1242 = _1240 + 1.0;
    float _1244 = sqrt(_1234);
    float _1246 = _1196 * _1216;
    float _1248 = _1238 * _1242;
    float _1250 = _1236 * _1242;
    float _1252 = _1236 * _1226;
    float _1254 = _1246 * _1226;
    float _1256 = _1238 * _1226;
    float _1258 = _1246 * _1246;
    float _1260 = fma(_1246, _1248, _1252);
    float _1262 = -_1254;
    float _1264 = fma(_1238, _1250, _1262);
    float _1266 = -_1256;
    float _1268 = fma(_1246, _1250, _1266);
    float _1270 = _1066 * _1260;
    float _1272 = fma(_1236, _1250, _1190);
    float _1274 = _1066 * _1264;
    float _1276 = fma(_1242, _1258, _1190);
    float _1278 = fma(_1078, _1268, _1270);
    float _1280 = fma(_1244, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1282 = fma(_1078, _1272, _1274);
    float _1284 = fma(_1246, _1250, _1256);
    float _1286 = fma(_1080, _1276, _1278);
    float _1288 = fma(_1238, _1248, _1190);
    float _1290 = precise::max(_1280, 0.3499999940395355224609375);
    float _1292 = fma(_1080, _1284, _1282);
    float _1294 = _730 + _1286;
    float _1296 = fma(_1238, _1250, _1254);
    float _1298 = precise::min(_1290, 1.0);
    float _1300 = _706 + _1292;
    float _1302 = -_1172;
    float _1304 = _1294 + _1302;
    float _1306 = _1066 * _1288;
    float _1308 = -_1252;
    float _1310 = fma(_1246, _1248, _1308);
    float _1312 = -_1204;
    float _1314 = _1300 + _1312;
    float _1316 = fma(_1304, _1298, _1172);
    float _1318 = fma(_1078, _1296, _1306);
    float _1320 = fma(_1314, _1298, _1204);
    float _1322 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1324 = _1316 + _1322;
    float _1326 = fma(_1080, _1310, _1318);
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1330 = _1320 + _1328;
    float _1332 = _1324 * _1324;
    float _1334 = _714 + _1326;
    float _1336 = fma(_1330, _1330, _1332);
    float _1338 = -_1210;
    float _1340 = _1334 + _1338;
    float _1342 = sqrt(_1336);
    float _1344 = fma(_1340, _1298, _1210);
    bool _1346 = _1342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1348 = _1332;
    float _1350 = _1210;
    float _1352 = _1318;
    float _1354 = _1296;
    float _1356 = _1330;
    if (!_1346)
    {
        _1348 = _1320;
    }
    float _1358 = _1348;
    float _1360 = _1358;
    if (!_1346)
    {
        _1350 = _1316;
    }
    float _1362 = _1350;
    float _1364 = _1362;
    if (!_1346)
    {
        _1352 = _1344;
    }
    float _1366 = _1352;
    bool _1368 = !_1346;
    float _1370 = _1366;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1342 + _1374;
        float _1378 = rsqrt(_1336);
        float _1380 = _1376 * _1372;
        float _1382 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = _1380 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = cos(_1390);
        float _1394 = fma(_1388, _1382, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1396 = _1378 * _1394;
        float _1398 = _1392 + (-1.0);
        float _1400 = fma(_1330, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = fma(_1324, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1404 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1406 = fma(_1344, _1392, _1404);
        _1370 = _1406;
        _1360 = _1400;
        _1364 = _1402;
    }
    float _1408 = _1370;
    float _1410 = _1360;
    float _1412 = _1364;
    float _1414 = -_894;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1418 = -_900;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1422 = -_928;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1412);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1428 = _1416 + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1432 = _1420 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1436 = _1424 + _1434;
    float _1438 = _1428 * _1428;
    float _1440 = fma(_1432, _1432, _1438);
    float _1442 = fma(_1436, _1436, _1440);
    float _1444 = rsqrt(_1442);
    float _1446 = sqrt(_1442);
    float _1448 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1450 = _1432 * _1448;
    float _1452 = _1436 * _1448;
    float _1454 = _1450 * _1450;
    float _1456 = _1452 * _1452;
    float _1458 = _1454 + _1456;
    float _1460 = sqrt(_1458);
    bool _1462 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1466 = _1460 + _1464;
    float _1468 = _1436;
    float _1470 = _1444;
    float _1472 = _1466;
    float _1474 = _1428;
    float _1476 = _1450;
    if (_1462)
    {
        float _1478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1468 = _1478;
    }
    float _1480 = _1468;
    if (_1462)
    {
        float _1482 = rsqrt(_1458);
        _1470 = _1482;
    }
    float _1484 = _1470;
    float _1486 = _1484;
    if (_1462)
    {
        float _1488 = _1466 * _1480;
        _1472 = _1488;
    }
    float _1490 = _1472;
    if (_1462)
    {
        float _1492 = _1490 * 0.15915493667125701904296875;
        _1354 = _1492;
    }
    float _1494 = _1354;
    float _1496 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1498 = _1480;
    float _1500 = _1494;
    if (_1462)
    {
        float _1502 = _1494 * 6.283185482025146484375;
        float _1504 = sin(_1502);
        _1498 = _1504;
    }
    float _1506 = _1498;
    float _1508 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1510 = precise::max(0.0, _1508);
    float _1512 = _1342;
    float _1514 = _1510;
    if (_1462)
    {
        float _1516 = _1494 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        _1512 = _1518;
    }
    float _1520 = _1512;
    float _1522 = -_1448;
    float _1524 = -_1510;
    float _1526 = fma(_1428, _1522, _1524);
    if (!_1462)
    {
        _1474 = _1452;
    }
    float _1528 = _1474;
    float _1530 = _1528;
    if (_1462)
    {
        float _1532 = _1526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1532;
    }
    float _1534 = _1514;
    float _1536 = _1506;
    float _1538 = _1534;
    if (_1462)
    {
        float _1540 = fma(_1506, _1534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1536 = _1540;
    }
    float _1542 = _1536;
    float _1544 = _1542;
    if (_1462)
    {
        float _1546 = _1520 + (-1.0);
        _1538 = _1546;
    }
    float _1548 = _1538;
    float _1550 = _1548;
    if (_1462)
    {
        float _1552 = _1484 * _1542;
        _1356 = _1552;
    }
    float _1554 = _1356;
    if (!_1462)
    {
        _1486 = _1526;
    }
    float _1556 = _1486;
    float _1558 = _1556;
    if (_1462)
    {
        float _1560 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1560;
    }
    float _1562 = _1500;
    if (_1462)
    {
        float _1564 = _1450 * _1554;
        _1476 = _1564;
    }
    float _1566 = _1476;
    if (!_1462)
    {
        _1544 = _1454;
    }
    float _1568 = _1544;
    float _1570 = _1568;
    if (_1462)
    {
        float _1572 = _1452 * _1554;
        _1530 = _1572;
    }
    float _1574 = _1530;
    if (_1462)
    {
        float _1576 = fma(_1526, _1520, _1562);
        _1558 = _1576;
    }
    float _1578 = _1558;
    if (_1462)
    {
        float _1580 = _1566 * _1566;
        _1570 = _1580;
    }
    float _1582 = _1570;
    if (!_1462)
    {
        _1550 = _1456;
    }
    float _1584 = _1550;
    float _1586 = _1584;
    if (_1462)
    {
        float _1588 = _1574 * _1574;
        _1586 = _1588;
    }
    float _1590 = _1586;
    float _1592 = fma(_1578, _1578, _1582);
    float _1594 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1596 = _1592 + _1590;
    float _1598 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1602 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1600);
    float _1604 = precise::clamp(_1602, 0.0, 1.0);
    float _1606 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1594);
    float _1608 = rsqrt(_1596);
    float _1610 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1598);
    float _1612 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1614 = -_1604;
    float _1616 = _1614 + 1.0;
    float _1618 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1606);
    float _1620 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1610);
    float _1622 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1624 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1612);
    float _1626 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1628 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1622);
    float _1630 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1624);
    float _1632 = abs(_1616);
    float _1634 = log2(_1632);
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1638 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1640 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1642 = _1608 * _1566;
    float _1644 = -_1636;
    float _1646 = fma(_1644, _1496, 1.0);
    float _1648 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1652 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1654 = _1608 * _1578;
    float _1656 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1658 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1650);
    float _1660 = _1608 * _1574;
    float _1662 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1664 = -_1656;
    float _1666 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1664);
    float _1668 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1658);
    float _1670 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1672 = log2(_1646);
    float _1674 = -_1660;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1666);
    float _1678 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1668);
    float _1680 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1682 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1662);
    float _1684 = fma(_1676, -0.5, 0.5);
    float _1686 = fma(_1676, 0.5, 0.5);
    float _1688 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1680);
    float _1690 = exp2(_1670);
    float _1692 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1682);
    float _1694 = fma(_1686, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1696 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1688);
    float _1698 = _1654 + 1.0;
    float _1700 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1692);
    float _1702 = fma(_1686, _1694, -0.212114393711090087890625);
    float _1704 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1696);
    float _1706 = 1.0 / _1678;
    float _1708 = _1672 * 0.693147182464599609375;
    float _1710 = fma(_1686, _1702, 1.570728778839111328125);
    float _1712 = sqrt(_1684);
    float _1714 = -_1654;
    float _1716 = fma(_1690, _1698, _1714);
    float _1718 = _1700 * _1706;
    float _1720 = _1704 * _1706;
    float _1722 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1724 = fma(_1718, -0.5, 0.5);
    float _1726 = fma(_1720, 0.5, 0.5);
    float _1728 = fma(_1716, 0.5, 0.5);
    float _1730 = _1712 * 0.636619746685028076171875;
    float _1732 = -_1710;
    float _1734 = fma(_1730, _1732, 1.0);
    float3 _4649 = float3(_1726, _1724, _1722);
    float _1736 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4649, float3(0.0), isnan(_4649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4649, float3(0.0), isnan(_4649)), level(0.0)).x;
    float3 _4660 = float3(_1726, _1724, _1722);
    float4 _1739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4660, float3(0.0), isnan(_4660)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4660, float3(0.0), isnan(_4660)), level(0.0)).xyzw;
    float _1741 = _1739.x;
    float _1743 = _1739.y;
    float _1745 = _1739.z;
    float _1747 = _1739.w;
    float2 _4677 = float2(_1734, _1728);
    float3 _1751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4677, float2(0.0), isnan(_4677)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4677, float2(0.0), isnan(_4677)), level(0.0)).xyz;
    float _1753 = _1751.x;
    float _1755 = _1751.y;
    float _1757 = _1751.z;
    float _1759 = -_894;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _1763 = -_900;
    float _1765 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _706);
    float _1767 = -_928;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _730);
    out.m_61.x = _452;
    out.m_61.y = _454;
    out.m_61.z = _456;
    out.m_61.w = _450;
    float _1771 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1773 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1775 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1771);
    float _1777 = exp2(_1773);
    float _1779 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1775);
    float _1781 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1785 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    bool _1787 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1789 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan(0.5);
    bool _1795 = _1791 || _1793;
    float _1797 = 1.0 / _1783;
    float _1799 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1785);
    float _1801 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1803 = _1799 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1805 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1801);
    float _1807 = _1803 + _1783;
    float _1809 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1805);
    float _1811 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1795)
    {
        _1811 = 1.0;
    }
    float _1813 = _1811;
    float _1815 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1809);
    float _1817 = _1807 * _1797;
    float _1819 = _1817 * 0.5;
    float _1821 = _1813;
    if (!_1795)
    {
        float _1823 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1827 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1825);
        float _1829 = _1823 * 0.15915493667125701904296875;
        float _1831 = _1829 * 6.283185482025146484375;
        float _1833 = cos(_1831);
        float _1835 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1837 = _1835 * 0.15915493667125701904296875;
        float _1839 = _1829 * 6.283185482025146484375;
        float _1841 = sin(_1839);
        float _1843 = 1.0 / _1833;
        float _1845 = _1837 * 6.283185482025146484375;
        float _1847 = cos(_1845);
        float _1849 = _1841 * _1843;
        float _1851 = 1.0 / _1827;
        float _1853 = _1847 * _1849;
        float _1855 = _1837 * 6.283185482025146484375;
        float _1857 = sin(_1855);
        float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1861 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1859;
        float _1863 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1865 = _1851 * _1863;
        float _1867 = 1.0 / _1853;
        float _1869 = 1.0 / _1861;
        float _1871 = _1857 * _1867;
        float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1875 = fma(_1871, _1865, _1873);
        float _1877 = _1875 * _1869;
        float _1879 = precise::clamp(_1877, 0.0, 1.0);
        float _1881 = -_1879;
        float _1883 = _1881 + 1.0;
        _1821 = _1883;
    }
    float _1885 = _1821;
    float _1887 = -_1777;
    float _1889 = _1887 + 1.0;
    float _1891 = _1678 * 0.5;
    bool _1893 = _1885 > 0.0;
    bool _1895 = isnan(_1885);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan(0.0);
    bool _1901 = _1897 || _1899;
    float _1903 = _1885 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1905 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1907 = fma(_1700, -0.5, _1891);
    float _1909 = _1815 + _1678;
    float _1911 = _1704 + _1678;
    float _1913 = _1905 * _1736;
    float _1915 = -_1905;
    float _1917 = _1915 + 1.0;
    out.m_63.x = _1082;
    out.m_63.y = _1084;
    out.m_63.z = _1086;
    float _1919 = _1747 * _1913;
    float _1921 = _1757 * _1913;
    float _1923 = _1909 * 0.5;
    float _1925 = _1911 * 0.5;
    float _1927 = fma(_1753, _1919, _1741);
    float _1929 = _1903 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1931 = fma(_1755, _1919, _1743);
    float _1933 = _1747 * _1917;
    float _1935 = fma(_1747, _1921, _1745);
    out.gl_Position.x = _1704;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1815;
    out.gl_Position.w = _1678;
    out.m_65.x = _1925;
    out.m_65.y = _1907;
    out.m_65.z = _1923;
    out.m_65.w = _1678;
    out.m_45.x = _1929;
    out.m_67.x = _1927;
    out.m_67.y = _1931;
    out.m_67.z = _1935;
    out.m_67.w = _1933;
    if (_1901)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1937 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1937;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1120 = false;
    bool _478 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _88 = int(_86);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1994 = as_type<float>(_104);
        out.gl_Position.z = _1994;
    }
    if (!_92)
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
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2062 = as_type<float>(_140);
        out.gl_Position.z = _2062;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _292 + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_308;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _332;
    float _352 = _344 * _348;
    float _354 = -_344;
    float _356 = _354 + 1.0;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _364 = 1.0 / _328;
    float _366 = _324 * _356;
    float _368 = -_324;
    float _370 = _368 + 1.0;
    float _372 = in.m_49.x;
    float _374 = in.m_49.y;
    float _376 = in.m_49.z;
    float _378 = _312 * _350;
    float _380 = _296 * _364;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _386;
    float _390 = fma(_360, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _392 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = _390 * _366;
    float _398 = _392 * _366;
    float _400 = _394 * _366;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _416 = fma(_404, _378, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_408, _378, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _422 = fma(_412, _378, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = fma(_416, _352, _414);
    float _428 = fma(_418, _352, _420);
    float _430 = fma(_422, _352, _424);
    float _432 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _426);
    float _434 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _428);
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _430);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _442 = _432 * _372;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = _434 * _374;
    float _448 = _436 * _376;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _452 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _458 = !_362;
    float _476;
    if (!_458)
    {
        float _460 = in.m_51.x;
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _464 = _460 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_88);
        float _482 = 1.0 / _480;
        float _484 = _122 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = in.m_51.x;
    float _490 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _492 = in.m_51.w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _496 = _494 != 0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _498;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _504 = _502 != 0;
    float _506 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _508 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _510 = 1.0 / _500;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _514 = _512 != 0;
    float _516 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _506);
    float _518 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _490);
    float _520 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _508);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _524 = _486 + _522;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _528 = _526 != 0;
    float _530 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _518);
    float _532 = _428;
    bool _534 = _528;
    if (_496)
    {
        float _536 = in.m_51.z;
        _532 = _536;
    }
    float _538 = _532;
    float _540 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _542 = in.m_53.x;
    float _544 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _546 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _544;
    bool _548 = false;
    if (_514)
    {
        bool _550 = _488 > 0.5;
        _548 = _550;
    }
    bool _552 = _548;
    float _554 = _524 * _510;
    float _556 = _488 * 6.283185482025146484375;
    float _558 = in.m_53.y;
    bool _560 = _492 > 0.5;
    bool _562 = _560 && _528;
    float _564 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _516);
    float _566 = _516;
    float _568 = _564;
    if (!_504)
    {
        float _570 = in.m_51.y;
        _566 = _570;
    }
    float _572 = _566;
    float _574 = _556 * 0.15915493667125701904296875;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _578 = _576 != 0;
    float _580 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _520);
    out.m_55.x = 1.0;
    out.m_55.y = 1.0;
    out.m_55.z = 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _582;
    float _586 = _574 * 6.283185482025146484375;
    float _588 = sin(_586);
    float _590 = in.m_57.x;
    float _592 = in.m_57.y;
    float _594 = in.m_57.z;
    float _596 = _580;
    if (_496)
    {
        bool _598 = _538 > 0.5;
        _534 = _598;
    }
    bool _600 = _534;
    float _602 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _604 = 0.0;
    if (!_504)
    {
        float _606 = in.m_51.z;
        _604 = _606;
    }
    float _608 = _604;
    float _610 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _612 = _546 * _546;
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _616;
    float _620 = fma(_584, _584, _612);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _622;
    float _626 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _628 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _630;
    float _634 = -_558;
    float _636 = _634 + 1.0;
    float _638 = _574 * 6.283185482025146484375;
    float _640 = cos(_638);
    float _642 = fma(_618, _554, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _644 = fma(_632, _554, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _646 = _618;
    float _648 = _624;
    int _650 = as_type<int>(_642);
    if (!_504)
    {
        _646 = _572;
    }
    float _652 = _646;
    float _654 = fma(_628, _628, _620);
    float _656 = _562 ? _636 : _558;
    float _658 = fma(_624, _554, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _660 = _588 * _590;
    float _662 = _614 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _664 = _652;
    float _666 = _572;
    int _668 = as_type<int>(_658);
    if (_504)
    {
        float _670 = in.m_51.x;
        float _672 = in.m_51.y;
        _664 = _670;
        _666 = _672;
    }
    float _674 = _664;
    float _676 = _666;
    bool _678 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _680 = isnan(_486);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _692 = fma(_662, _656, -0.5);
    bool _694 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _696 = isnan(_486);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _564 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _708 = _608;
    if (!_504)
    {
        _568 = _608;
    }
    float _710 = _568;
    float _712 = _640 * _590;
    float _714 = _530 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = -_660;
    float _718 = fma(_640, _594, _716);
    float _720 = -_706;
    float _722 = _720 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _724 = fma(_588, _594, _712);
    float _726 = -_714;
    float _728 = _726 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _730 = _580 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _732 = -_704;
    float _734 = _732 + 1.0;
    float _736 = _710;
    if (!_496)
    {
        _596 = _542;
    }
    float _738 = _596;
    float _740 = _728 * _728;
    float _742 = -_730;
    float _744 = _742 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _688 * _734;
    float _748 = _738;
    if (!_514)
    {
        _648 = _542;
    }
    float _750 = _648;
    float _752 = fma(_722, _722, _740);
    float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _756 = _658 * _746;
    float _758 = _750;
    if (_496)
    {
        float _760 = -_542;
        float _762 = _760 + 1.0;
        _668 = as_type<int>(_762);
    }
    int _764 = _668;
    float _766 = fma(_744, _744, _752);
    float _768 = _642 * _746;
    if (_514)
    {
        float _770 = -_542;
        float _772 = _770 + 1.0;
        _650 = as_type<int>(_772);
    }
    int _774 = _650;
    if (_504)
    {
        _736 = _676;
    }
    float _776 = _736;
    float _778 = _644 * _746;
    if (_504)
    {
        _708 = _676;
    }
    float _780 = _708;
    float _782 = rsqrt(_766);
    bool _784 = _676 > 0.5;
    bool _786 = _784 && _578;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _790 = _714 + _788;
    if (_496)
    {
        float _792 = _600 ? as_type<float>(_764) : _542;
        _748 = _792;
    }
    float _794 = _748;
    float _796 = -_688;
    float _798 = _796 + 1.0;
    float _800 = _790 * _790;
    if (_514)
    {
        float _802 = _552 ? as_type<float>(_774) : _542;
        _758 = _802;
    }
    float _804 = _758;
    float _806 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].x, _768);
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].y, _756);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].z, _778);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _816 = _706 + _814;
    float _818 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[83].z, _690);
    float _820 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[83].w, _810);
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _824 = _730 + _822;
    float _826 = fma(_816, _816, _800);
    float _828 = _722 * _782;
    float _830 = _728 * _782;
    float _832 = _744 * _782;
    float _834 = fma(_824, _824, _826);
    float _836 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _838 = _832 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _840 = sqrt(_654);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = _830 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _846 = -_838;
    float _848 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[10].y, _846);
    float _850 = -_842;
    float _852 = fma(_836, 2.0, _850);
    float _854 = _828 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _856 = -_844;
    float _858 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[9].y, _856);
    float _860 = _848 * _848;
    float _862 = rsqrt(_834);
    float _864 = -_854;
    float _866 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].y, _864);
    float _868 = _776 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _870 = fma(_858, _858, _860);
    float _872 = _786 ? _636 : _558;
    float _874 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _818);
    float _876 = fma(_866, _866, _870);
    float _878 = precise::max(_840, 5.0);
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _882 = _754 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _884 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _820);
    float _886 = precise::min(_878, 50.0);
    float _888 = rsqrt(_876);
    float _890 = fma(_868, -2.0, _880);
    float _892 = fma(_882, _794, -0.5);
    float _894 = _790 * _862;
    float _896 = -_122;
    float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[81].x, _852);
    float _900 = _816 * _862;
    float _902 = fma(_886, 0.01745335571467876434326171875, 0.174532234668731689453125);
    float _904 = -_894;
    float _906 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    float _908 = fma(_874, _892, _898);
    float _910 = -_900;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _816);
    float _914 = _902 * 0.15915493667125701904296875;
    float _916 = _906 * _906;
    float _918 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _890);
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _922 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _924 = fma(_912, _912, _916);
    float _926 = _858 * _888;
    float _928 = _824 * _862;
    float _930 = _848 * _888;
    float _932 = _866 * _888;
    float _934 = _926 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _936 = -_928;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _824);
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _942 = _932 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _944 = -_934;
    float _946 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[8].y, _944);
    float _948 = fma(_938, _938, _924);
    float _950 = _930 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _952 = -_942;
    float _954 = fma(_930, (*spvDescriptorSet0.vp_c10)._m0[10].y, _952);
    float _956 = _946 * _946;
    float _958 = -_918;
    float _960 = fma(_884, _692, _958);
    float _962 = -_950;
    float _964 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[9].y, _962);
    float _966 = _914 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = fma(_954, _954, _956);
    float _972 = _922 * _920;
    float _974 = _804 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _976 = _908 + 0.5;
    float _978 = fma(_964, _964, _970);
    float _980 = _974 * _940;
    float _982 = _914 * 6.283185482025146484375;
    float _984 = cos(_982);
    float _986 = _960 + 0.5;
    float _988 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[124].x, _806);
    float _990 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[124].y, _808);
    float _992 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[124].z, _812);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    out.m_59.x = _980;
    out.m_59.y = _972;
    out.m_59.z = _976;
    out.m_59.w = _986;
    float _996 = rsqrt(_978);
    float _998 = _718 * _968;
    float _1000 = sqrt(_948);
    float _1002 = _718 * _984;
    float _1004 = -_998;
    float _1006 = fma(_984, _592, _1004);
    float _1008 = fma(_968, _592, _1002);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1006);
    float _1012 = _946 * _996;
    float _1014 = _954 * _996;
    float _1016 = _964 * _996;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1022 = _862 * _1000;
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1020);
    float _1026 = _540 * _1022;
    float _1028 = _602 * _1022;
    float _1030 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1024);
    float _1032 = _610 * _1022;
    float _1034 = _1026 * _1010;
    float _1036 = _1028 * _994;
    float _1038 = abs(_1030);
    float _1040 = -_1038;
    float _1042 = _1040 + 1.0;
    float _1044 = _1032 * _1018;
    float _1046 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1048 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1050 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1052 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1046);
    int _1054 = as_type<int>(_1042) + (-218103808);
    float _1056 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1048);
    float _1058 = abs(_1030);
    float _1060 = fma(_1058, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1062 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1050);
    bool _1064 = uint(_1054) >= 1920991232u;
    float _1066 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1056);
    float _1068 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1070 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1072 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1074 = abs(_1030);
    float _1076 = fma(_1074, _1060, -0.212114393711090087890625);
    float _1078 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1052);
    float _1080 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1062);
    float _1082 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = abs(_1030);
    float _1090 = fma(_1088, _1076, 1.570728778839111328125);
    bool _1092 = _1030 < 0.0;
    float _1094 = float(_1092);
    bool _1096 = !_1064;
    float _1118;
    if (!_1096)
    {
        int _1098 = as_type<int>(_994);
        int _1100 = as_type<int>(_1010);
        int _1102 = as_type<int>(_1042);
        int _1104 = 6112;
        int _1106;
        int _1108;
        int _1110;
        int _1112;
        int _1114;
        int _1116;
        _80(_1098, _1100, _1102, _1104, _1106, _1108, _1110, _1112, _1114, _1116, out.gl_Position, out.gl_PointSize);
        _1118 = as_type<float>(_1110);
        _1120 = true;
    }
    else
    {
        float _1122 = rsqrt(_1042);
        float _1124 = _1042 * _1122;
        float _1126 = _1122 * 0.5;
        float _1128 = -_1124;
        float _1130 = 0.0 + _1128;
        float _1132 = fma(_1126, _1130, 0.5);
        float _1134 = fma(_1124, _1132, _1124);
        float _1136 = -_1134;
        float _1138 = 0.0 + _1136;
        float _1140 = fma(_1134, _1138, _1042);
        float _1142 = fma(_1126, _1140, _1134);
        _1118 = _1142;
    }
    _1120 = false;
    float _1144 = _1118;
    float _1146 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1148 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1150 = _1090 * _1144;
    float _1152 = -_1146;
    float _1154 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1152);
    float _1156 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1158 = -_1148;
    float _1160 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1162 = _1154 * _1154;
    float _1164 = -_1156;
    float _1166 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1164);
    float _1168 = _1094 * 2.0;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1172 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1170;
    float _1174 = fma(_1160, _1160, _1162);
    float _1176 = -_1168;
    float _1178 = fma(_1150, _1176, _1150);
    float _1180 = fma(_1166, _1166, _1174);
    float _1182 = fma(_1094, 3.1415927410125732421875, _1178);
    float _1184 = rsqrt(_1180);
    float _1186 = _1182 * 0.15915493667125701904296875;
    float _1188 = _1186 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    float _1192 = _1154 * _1184;
    float _1194 = _1160 * _1184;
    float _1196 = _1166 * _1184;
    float _1198 = _1192 * _1192;
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1204 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1202;
    float _1206 = fma(_1196, _1196, _1200);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1210 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1208;
    float _1212 = -_1204;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = rsqrt(_1206);
    float _1218 = -_1210;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1222 = _1220 * _1220;
    float _1224 = _1186 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = fma(_1214, _1214, _1222);
    float _1230 = -_1172;
    float _1232 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1234 = fma(_1232, _1232, _1228);
    float _1236 = _1194 * _1216;
    float _1238 = _1192 * _1216;
    float _1240 = -_1190;
    float _1242 = _1240 + 1.0;
    float _1244 = sqrt(_1234);
    float _1246 = _1196 * _1216;
    float _1248 = _1238 * _1242;
    float _1250 = _1236 * _1242;
    float _1252 = _1236 * _1226;
    float _1254 = _1246 * _1226;
    float _1256 = _1238 * _1226;
    float _1258 = _1246 * _1246;
    float _1260 = fma(_1246, _1248, _1252);
    float _1262 = -_1254;
    float _1264 = fma(_1238, _1250, _1262);
    float _1266 = -_1256;
    float _1268 = fma(_1246, _1250, _1266);
    float _1270 = _1066 * _1260;
    float _1272 = fma(_1236, _1250, _1190);
    float _1274 = _1066 * _1264;
    float _1276 = fma(_1242, _1258, _1190);
    float _1278 = fma(_1078, _1268, _1270);
    float _1280 = fma(_1244, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1282 = fma(_1078, _1272, _1274);
    float _1284 = fma(_1246, _1250, _1256);
    float _1286 = fma(_1080, _1276, _1278);
    float _1288 = fma(_1238, _1248, _1190);
    float _1290 = precise::max(_1280, 0.3499999940395355224609375);
    float _1292 = fma(_1080, _1284, _1282);
    float _1294 = _730 + _1286;
    float _1296 = fma(_1238, _1250, _1254);
    float _1298 = precise::min(_1290, 1.0);
    float _1300 = _706 + _1292;
    float _1302 = -_1172;
    float _1304 = _1294 + _1302;
    float _1306 = _1066 * _1288;
    float _1308 = -_1252;
    float _1310 = fma(_1246, _1248, _1308);
    float _1312 = -_1204;
    float _1314 = _1300 + _1312;
    float _1316 = fma(_1304, _1298, _1172);
    float _1318 = fma(_1078, _1296, _1306);
    float _1320 = fma(_1314, _1298, _1204);
    float _1322 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1324 = _1316 + _1322;
    float _1326 = fma(_1080, _1310, _1318);
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1330 = _1320 + _1328;
    float _1332 = _1324 * _1324;
    float _1334 = _714 + _1326;
    float _1336 = fma(_1330, _1330, _1332);
    float _1338 = -_1210;
    float _1340 = _1334 + _1338;
    float _1342 = sqrt(_1336);
    float _1344 = fma(_1340, _1298, _1210);
    bool _1346 = _1342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1348 = _1332;
    float _1350 = _1210;
    float _1352 = _1318;
    float _1354 = _1296;
    float _1356 = _1330;
    if (!_1346)
    {
        _1348 = _1320;
    }
    float _1358 = _1348;
    float _1360 = _1358;
    if (!_1346)
    {
        _1350 = _1316;
    }
    float _1362 = _1350;
    float _1364 = _1362;
    if (!_1346)
    {
        _1352 = _1344;
    }
    float _1366 = _1352;
    bool _1368 = !_1346;
    float _1370 = _1366;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1342 + _1374;
        float _1378 = rsqrt(_1336);
        float _1380 = _1376 * _1372;
        float _1382 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = _1380 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = cos(_1390);
        float _1394 = fma(_1388, _1382, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1396 = _1378 * _1394;
        float _1398 = _1392 + (-1.0);
        float _1400 = fma(_1330, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = fma(_1324, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1404 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1406 = fma(_1344, _1392, _1404);
        _1370 = _1406;
        _1360 = _1400;
        _1364 = _1402;
    }
    float _1408 = _1370;
    float _1410 = _1360;
    float _1412 = _1364;
    float _1414 = -_894;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1418 = -_900;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1422 = -_928;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1412);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1428 = _1416 + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1432 = _1420 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1436 = _1424 + _1434;
    float _1438 = _1428 * _1428;
    float _1440 = fma(_1432, _1432, _1438);
    float _1442 = fma(_1436, _1436, _1440);
    float _1444 = rsqrt(_1442);
    float _1446 = sqrt(_1442);
    float _1448 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1450 = _1432 * _1448;
    float _1452 = _1436 * _1448;
    float _1454 = _1450 * _1450;
    float _1456 = _1452 * _1452;
    float _1458 = _1454 + _1456;
    float _1460 = sqrt(_1458);
    bool _1462 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1466 = _1460 + _1464;
    float _1468 = _1436;
    float _1470 = _1444;
    float _1472 = _1466;
    float _1474 = _1428;
    float _1476 = _1450;
    if (_1462)
    {
        float _1478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1468 = _1478;
    }
    float _1480 = _1468;
    if (_1462)
    {
        float _1482 = rsqrt(_1458);
        _1470 = _1482;
    }
    float _1484 = _1470;
    float _1486 = _1484;
    if (_1462)
    {
        float _1488 = _1466 * _1480;
        _1472 = _1488;
    }
    float _1490 = _1472;
    if (_1462)
    {
        float _1492 = _1490 * 0.15915493667125701904296875;
        _1354 = _1492;
    }
    float _1494 = _1354;
    float _1496 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1498 = _1480;
    float _1500 = _1494;
    if (_1462)
    {
        float _1502 = _1494 * 6.283185482025146484375;
        float _1504 = sin(_1502);
        _1498 = _1504;
    }
    float _1506 = _1498;
    float _1508 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1510 = precise::max(0.0, _1508);
    float _1512 = _1342;
    float _1514 = _1510;
    if (_1462)
    {
        float _1516 = _1494 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        _1512 = _1518;
    }
    float _1520 = _1512;
    float _1522 = -_1448;
    float _1524 = -_1510;
    float _1526 = fma(_1428, _1522, _1524);
    if (!_1462)
    {
        _1474 = _1452;
    }
    float _1528 = _1474;
    float _1530 = _1528;
    if (_1462)
    {
        float _1532 = _1526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1532;
    }
    float _1534 = _1514;
    float _1536 = _1506;
    float _1538 = _1534;
    if (_1462)
    {
        float _1540 = fma(_1506, _1534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1536 = _1540;
    }
    float _1542 = _1536;
    float _1544 = _1542;
    if (_1462)
    {
        float _1546 = _1520 + (-1.0);
        _1538 = _1546;
    }
    float _1548 = _1538;
    float _1550 = _1548;
    if (_1462)
    {
        float _1552 = _1484 * _1542;
        _1356 = _1552;
    }
    float _1554 = _1356;
    if (!_1462)
    {
        _1486 = _1526;
    }
    float _1556 = _1486;
    float _1558 = _1556;
    if (_1462)
    {
        float _1560 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1560;
    }
    float _1562 = _1500;
    if (_1462)
    {
        float _1564 = _1450 * _1554;
        _1476 = _1564;
    }
    float _1566 = _1476;
    if (!_1462)
    {
        _1544 = _1454;
    }
    float _1568 = _1544;
    float _1570 = _1568;
    if (_1462)
    {
        float _1572 = _1452 * _1554;
        _1530 = _1572;
    }
    float _1574 = _1530;
    if (_1462)
    {
        float _1576 = fma(_1526, _1520, _1562);
        _1558 = _1576;
    }
    float _1578 = _1558;
    if (_1462)
    {
        float _1580 = _1566 * _1566;
        _1570 = _1580;
    }
    float _1582 = _1570;
    if (!_1462)
    {
        _1550 = _1456;
    }
    float _1584 = _1550;
    float _1586 = _1584;
    if (_1462)
    {
        float _1588 = _1574 * _1574;
        _1586 = _1588;
    }
    float _1590 = _1586;
    float _1592 = fma(_1578, _1578, _1582);
    float _1594 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1596 = _1592 + _1590;
    float _1598 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1602 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1600);
    float _1604 = precise::clamp(_1602, 0.0, 1.0);
    float _1606 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1594);
    float _1608 = rsqrt(_1596);
    float _1610 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1598);
    float _1612 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1614 = -_1604;
    float _1616 = _1614 + 1.0;
    float _1618 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1606);
    float _1620 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1610);
    float _1622 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1624 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1612);
    float _1626 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1628 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1622);
    float _1630 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1624);
    float _1632 = abs(_1616);
    float _1634 = log2(_1632);
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1638 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1640 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1642 = _1608 * _1566;
    float _1644 = -_1636;
    float _1646 = fma(_1644, _1496, 1.0);
    float _1648 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1652 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1654 = _1608 * _1578;
    float _1656 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1658 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1650);
    float _1660 = _1608 * _1574;
    float _1662 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1664 = -_1656;
    float _1666 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1664);
    float _1668 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1658);
    float _1670 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1672 = log2(_1646);
    float _1674 = -_1660;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1666);
    float _1678 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1668);
    float _1680 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1682 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1662);
    float _1684 = fma(_1676, -0.5, 0.5);
    float _1686 = fma(_1676, 0.5, 0.5);
    float _1688 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1680);
    float _1690 = exp2(_1670);
    float _1692 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1682);
    float _1694 = fma(_1686, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1696 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1688);
    float _1698 = _1654 + 1.0;
    float _1700 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1692);
    float _1702 = fma(_1686, _1694, -0.212114393711090087890625);
    float _1704 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1696);
    float _1706 = 1.0 / _1678;
    float _1708 = _1672 * 0.693147182464599609375;
    float _1710 = fma(_1686, _1702, 1.570728778839111328125);
    float _1712 = sqrt(_1684);
    float _1714 = -_1654;
    float _1716 = fma(_1690, _1698, _1714);
    float _1718 = _1700 * _1706;
    float _1720 = _1704 * _1706;
    float _1722 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1724 = fma(_1718, -0.5, 0.5);
    float _1726 = fma(_1720, 0.5, 0.5);
    float _1728 = fma(_1716, 0.5, 0.5);
    float _1730 = _1712 * 0.636619746685028076171875;
    float _1732 = -_1710;
    float _1734 = fma(_1730, _1732, 1.0);
    float3 _4649 = float3(_1726, _1724, _1722);
    float _1736 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4649, float3(0.0), isnan(_4649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4649, float3(0.0), isnan(_4649)), level(0.0)).x;
    float3 _4660 = float3(_1726, _1724, _1722);
    float4 _1739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4660, float3(0.0), isnan(_4660)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4660, float3(0.0), isnan(_4660)), level(0.0)).xyzw;
    float _1741 = _1739.x;
    float _1743 = _1739.y;
    float _1745 = _1739.z;
    float _1747 = _1739.w;
    float2 _4677 = float2(_1734, _1728);
    float3 _1751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4677, float2(0.0), isnan(_4677)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4677, float2(0.0), isnan(_4677)), level(0.0)).xyz;
    float _1753 = _1751.x;
    float _1755 = _1751.y;
    float _1757 = _1751.z;
    float _1759 = -_894;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _1763 = -_900;
    float _1765 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _706);
    float _1767 = -_928;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _730);
    out.m_61.x = _452;
    out.m_61.y = _454;
    out.m_61.z = _456;
    out.m_61.w = _450;
    float _1771 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1773 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1775 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1771);
    float _1777 = exp2(_1773);
    float _1779 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1775);
    float _1781 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1785 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    bool _1787 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1789 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan(0.5);
    bool _1795 = _1791 || _1793;
    float _1797 = 1.0 / _1783;
    float _1799 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1785);
    float _1801 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1803 = _1799 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1805 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1801);
    float _1807 = _1803 + _1783;
    float _1809 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1805);
    float _1811 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1795)
    {
        _1811 = 1.0;
    }
    float _1813 = _1811;
    float _1815 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1809);
    float _1817 = _1807 * _1797;
    float _1819 = _1817 * 0.5;
    float _1821 = _1813;
    if (!_1795)
    {
        float _1823 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1827 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1825);
        float _1829 = _1823 * 0.15915493667125701904296875;
        float _1831 = _1829 * 6.283185482025146484375;
        float _1833 = cos(_1831);
        float _1835 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1837 = _1835 * 0.15915493667125701904296875;
        float _1839 = _1829 * 6.283185482025146484375;
        float _1841 = sin(_1839);
        float _1843 = 1.0 / _1833;
        float _1845 = _1837 * 6.283185482025146484375;
        float _1847 = cos(_1845);
        float _1849 = _1841 * _1843;
        float _1851 = 1.0 / _1827;
        float _1853 = _1847 * _1849;
        float _1855 = _1837 * 6.283185482025146484375;
        float _1857 = sin(_1855);
        float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1861 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1859;
        float _1863 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1865 = _1851 * _1863;
        float _1867 = 1.0 / _1853;
        float _1869 = 1.0 / _1861;
        float _1871 = _1857 * _1867;
        float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1875 = fma(_1871, _1865, _1873);
        float _1877 = _1875 * _1869;
        float _1879 = precise::clamp(_1877, 0.0, 1.0);
        float _1881 = -_1879;
        float _1883 = _1881 + 1.0;
        _1821 = _1883;
    }
    float _1885 = _1821;
    float _1887 = -_1777;
    float _1889 = _1887 + 1.0;
    float _1891 = _1678 * 0.5;
    bool _1893 = _1885 > 0.0;
    bool _1895 = isnan(_1885);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan(0.0);
    bool _1901 = _1897 || _1899;
    float _1903 = _1885 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1905 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1907 = fma(_1700, -0.5, _1891);
    float _1909 = _1815 + _1678;
    float _1911 = _1704 + _1678;
    float _1913 = _1905 * _1736;
    float _1915 = -_1905;
    float _1917 = _1915 + 1.0;
    out.m_63.x = _1082;
    out.m_63.y = _1084;
    out.m_63.z = _1086;
    float _1919 = _1747 * _1913;
    float _1921 = _1757 * _1913;
    float _1923 = _1909 * 0.5;
    float _1925 = _1911 * 0.5;
    float _1927 = fma(_1753, _1919, _1741);
    float _1929 = _1903 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1931 = fma(_1755, _1919, _1743);
    float _1933 = _1747 * _1917;
    float _1935 = fma(_1747, _1921, _1745);
    out.gl_Position.x = _1704;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1815;
    out.gl_Position.w = _1678;
    out.m_65.x = _1925;
    out.m_65.y = _1907;
    out.m_65.z = _1923;
    out.m_65.w = _1678;
    out.m_45.x = _1929;
    out.m_67.x = _1927;
    out.m_67.y = _1931;
    out.m_67.z = _1935;
    out.m_67.w = _1933;
    if (_1901)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1937 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1937;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1120 = false;
    bool _478 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _88 = int(_86);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1994 = as_type<float>(_104);
        out.gl_Position.z = _1994;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2062 = as_type<float>(_140);
        out.gl_Position.z = _2062;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _292 + _310;
    bool _314 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_292);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _336 = isnan(_292);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_308;
    float _348 = _346 + 1.0;
    float _350 = 1.0 / _332;
    float _352 = _344 * _348;
    float _354 = -_344;
    float _356 = _354 + 1.0;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _364 = 1.0 / _328;
    float _366 = _324 * _356;
    float _368 = -_324;
    float _370 = _368 + 1.0;
    float _372 = in.m_49.x;
    float _374 = in.m_49.y;
    float _376 = in.m_49.z;
    float _378 = _312 * _350;
    float _380 = _296 * _364;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _386;
    float _390 = fma(_360, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _392 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = _390 * _366;
    float _398 = _392 * _366;
    float _400 = _394 * _366;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _416 = fma(_404, _378, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_408, _378, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _422 = fma(_412, _378, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = fma(_416, _352, _414);
    float _428 = fma(_418, _352, _420);
    float _430 = fma(_422, _352, _424);
    float _432 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].x, _426);
    float _434 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].y, _428);
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[145].z, _430);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _442 = _432 * _372;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = _434 * _374;
    float _448 = _436 * _376;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _452 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _458 = !_362;
    float _476;
    if (!_458)
    {
        float _460 = in.m_51.x;
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _464 = _460 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_88);
        float _482 = 1.0 / _480;
        float _484 = _122 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = in.m_51.x;
    float _490 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _492 = in.m_51.w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _496 = _494 != 0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _498;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _504 = _502 != 0;
    float _506 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _508 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _510 = 1.0 / _500;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _514 = _512 != 0;
    float _516 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _506);
    float _518 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _490);
    float _520 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _508);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _524 = _486 + _522;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _528 = _526 != 0;
    float _530 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _518);
    float _532 = _428;
    bool _534 = _528;
    if (_496)
    {
        float _536 = in.m_51.z;
        _532 = _536;
    }
    float _538 = _532;
    float _540 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _542 = in.m_53.x;
    float _544 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _546 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _544;
    bool _548 = false;
    if (_514)
    {
        bool _550 = _488 > 0.5;
        _548 = _550;
    }
    bool _552 = _548;
    float _554 = _524 * _510;
    float _556 = _488 * 6.283185482025146484375;
    float _558 = in.m_53.y;
    bool _560 = _492 > 0.5;
    bool _562 = _560 && _528;
    float _564 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _516);
    float _566 = _516;
    float _568 = _564;
    if (!_504)
    {
        float _570 = in.m_51.y;
        _566 = _570;
    }
    float _572 = _566;
    float _574 = _556 * 0.15915493667125701904296875;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _578 = _576 != 0;
    float _580 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _520);
    out.m_55.x = 1.0;
    out.m_55.y = 1.0;
    out.m_55.z = 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _582;
    float _586 = _574 * 6.283185482025146484375;
    float _588 = sin(_586);
    float _590 = in.m_57.x;
    float _592 = in.m_57.y;
    float _594 = in.m_57.z;
    float _596 = _580;
    if (_496)
    {
        bool _598 = _538 > 0.5;
        _534 = _598;
    }
    bool _600 = _534;
    float _602 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _604 = 0.0;
    if (!_504)
    {
        float _606 = in.m_51.z;
        _604 = _606;
    }
    float _608 = _604;
    float _610 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _612 = _546 * _546;
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _616;
    float _620 = fma(_584, _584, _612);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _622;
    float _626 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _628 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _630;
    float _634 = -_558;
    float _636 = _634 + 1.0;
    float _638 = _574 * 6.283185482025146484375;
    float _640 = cos(_638);
    float _642 = fma(_618, _554, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _644 = fma(_632, _554, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _646 = _618;
    float _648 = _624;
    int _650 = as_type<int>(_642);
    if (!_504)
    {
        _646 = _572;
    }
    float _652 = _646;
    float _654 = fma(_628, _628, _620);
    float _656 = _562 ? _636 : _558;
    float _658 = fma(_624, _554, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _660 = _588 * _590;
    float _662 = _614 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _664 = _652;
    float _666 = _572;
    int _668 = as_type<int>(_658);
    if (_504)
    {
        float _670 = in.m_51.x;
        float _672 = in.m_51.y;
        _664 = _670;
        _666 = _672;
    }
    float _674 = _664;
    float _676 = _666;
    bool _678 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _680 = isnan(_486);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _692 = fma(_662, _656, -0.5);
    bool _694 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _696 = isnan(_486);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _564 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _708 = _608;
    if (!_504)
    {
        _568 = _608;
    }
    float _710 = _568;
    float _712 = _640 * _590;
    float _714 = _530 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = -_660;
    float _718 = fma(_640, _594, _716);
    float _720 = -_706;
    float _722 = _720 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _724 = fma(_588, _594, _712);
    float _726 = -_714;
    float _728 = _726 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _730 = _580 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _732 = -_704;
    float _734 = _732 + 1.0;
    float _736 = _710;
    if (!_496)
    {
        _596 = _542;
    }
    float _738 = _596;
    float _740 = _728 * _728;
    float _742 = -_730;
    float _744 = _742 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _688 * _734;
    float _748 = _738;
    if (!_514)
    {
        _648 = _542;
    }
    float _750 = _648;
    float _752 = fma(_722, _722, _740);
    float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _756 = _658 * _746;
    float _758 = _750;
    if (_496)
    {
        float _760 = -_542;
        float _762 = _760 + 1.0;
        _668 = as_type<int>(_762);
    }
    int _764 = _668;
    float _766 = fma(_744, _744, _752);
    float _768 = _642 * _746;
    if (_514)
    {
        float _770 = -_542;
        float _772 = _770 + 1.0;
        _650 = as_type<int>(_772);
    }
    int _774 = _650;
    if (_504)
    {
        _736 = _676;
    }
    float _776 = _736;
    float _778 = _644 * _746;
    if (_504)
    {
        _708 = _676;
    }
    float _780 = _708;
    float _782 = rsqrt(_766);
    bool _784 = _676 > 0.5;
    bool _786 = _784 && _578;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _790 = _714 + _788;
    if (_496)
    {
        float _792 = _600 ? as_type<float>(_764) : _542;
        _748 = _792;
    }
    float _794 = _748;
    float _796 = -_688;
    float _798 = _796 + 1.0;
    float _800 = _790 * _790;
    if (_514)
    {
        float _802 = _552 ? as_type<float>(_774) : _542;
        _758 = _802;
    }
    float _804 = _758;
    float _806 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].x, _768);
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].y, _756);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].z, _778);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _816 = _706 + _814;
    float _818 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[83].z, _690);
    float _820 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[83].w, _810);
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _824 = _730 + _822;
    float _826 = fma(_816, _816, _800);
    float _828 = _722 * _782;
    float _830 = _728 * _782;
    float _832 = _744 * _782;
    float _834 = fma(_824, _824, _826);
    float _836 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _838 = _832 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _840 = sqrt(_654);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = _830 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _846 = -_838;
    float _848 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[10].y, _846);
    float _850 = -_842;
    float _852 = fma(_836, 2.0, _850);
    float _854 = _828 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _856 = -_844;
    float _858 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[9].y, _856);
    float _860 = _848 * _848;
    float _862 = rsqrt(_834);
    float _864 = -_854;
    float _866 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[8].y, _864);
    float _868 = _776 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _870 = fma(_858, _858, _860);
    float _872 = _786 ? _636 : _558;
    float _874 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _818);
    float _876 = fma(_866, _866, _870);
    float _878 = precise::max(_840, 5.0);
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _882 = _754 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _884 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _820);
    float _886 = precise::min(_878, 50.0);
    float _888 = rsqrt(_876);
    float _890 = fma(_868, -2.0, _880);
    float _892 = fma(_882, _794, -0.5);
    float _894 = _790 * _862;
    float _896 = -_122;
    float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[81].x, _852);
    float _900 = _816 * _862;
    float _902 = fma(_886, 0.01745335571467876434326171875, 0.174532234668731689453125);
    float _904 = -_894;
    float _906 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    float _908 = fma(_874, _892, _898);
    float _910 = -_900;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _816);
    float _914 = _902 * 0.15915493667125701904296875;
    float _916 = _906 * _906;
    float _918 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _890);
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _922 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _924 = fma(_912, _912, _916);
    float _926 = _858 * _888;
    float _928 = _824 * _862;
    float _930 = _848 * _888;
    float _932 = _866 * _888;
    float _934 = _926 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _936 = -_928;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _824);
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _942 = _932 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _944 = -_934;
    float _946 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[8].y, _944);
    float _948 = fma(_938, _938, _924);
    float _950 = _930 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _952 = -_942;
    float _954 = fma(_930, (*spvDescriptorSet0.vp_c10)._m0[10].y, _952);
    float _956 = _946 * _946;
    float _958 = -_918;
    float _960 = fma(_884, _692, _958);
    float _962 = -_950;
    float _964 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[9].y, _962);
    float _966 = _914 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = fma(_954, _954, _956);
    float _972 = _922 * _920;
    float _974 = _804 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _976 = _908 + 0.5;
    float _978 = fma(_964, _964, _970);
    float _980 = _974 * _940;
    float _982 = _914 * 6.283185482025146484375;
    float _984 = cos(_982);
    float _986 = _960 + 0.5;
    float _988 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[124].x, _806);
    float _990 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[124].y, _808);
    float _992 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[124].z, _812);
    float _994 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    out.m_59.x = _980;
    out.m_59.y = _972;
    out.m_59.z = _976;
    out.m_59.w = _986;
    float _996 = rsqrt(_978);
    float _998 = _718 * _968;
    float _1000 = sqrt(_948);
    float _1002 = _718 * _984;
    float _1004 = -_998;
    float _1006 = fma(_984, _592, _1004);
    float _1008 = fma(_968, _592, _1002);
    float _1010 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1006);
    float _1012 = _946 * _996;
    float _1014 = _954 * _996;
    float _1016 = _964 * _996;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1022 = _862 * _1000;
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1020);
    float _1026 = _540 * _1022;
    float _1028 = _602 * _1022;
    float _1030 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1024);
    float _1032 = _610 * _1022;
    float _1034 = _1026 * _1010;
    float _1036 = _1028 * _994;
    float _1038 = abs(_1030);
    float _1040 = -_1038;
    float _1042 = _1040 + 1.0;
    float _1044 = _1032 * _1018;
    float _1046 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1048 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1050 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1052 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1046);
    int _1054 = as_type<int>(_1042) + (-218103808);
    float _1056 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1048);
    float _1058 = abs(_1030);
    float _1060 = fma(_1058, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1062 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1050);
    bool _1064 = uint(_1054) >= 1920991232u;
    float _1066 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1056);
    float _1068 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1070 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1072 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1074 = abs(_1030);
    float _1076 = fma(_1074, _1060, -0.212114393711090087890625);
    float _1078 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1052);
    float _1080 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1062);
    float _1082 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = abs(_1030);
    float _1090 = fma(_1088, _1076, 1.570728778839111328125);
    bool _1092 = _1030 < 0.0;
    float _1094 = float(_1092);
    bool _1096 = !_1064;
    float _1118;
    if (!_1096)
    {
        int _1098 = as_type<int>(_994);
        int _1100 = as_type<int>(_1010);
        int _1102 = as_type<int>(_1042);
        int _1104 = 6112;
        int _1106;
        int _1108;
        int _1110;
        int _1112;
        int _1114;
        int _1116;
        _80(_1098, _1100, _1102, _1104, _1106, _1108, _1110, _1112, _1114, _1116, out.gl_Position, out.gl_PointSize);
        _1118 = as_type<float>(_1110);
        _1120 = true;
    }
    else
    {
        float _1122 = rsqrt(_1042);
        float _1124 = _1042 * _1122;
        float _1126 = _1122 * 0.5;
        float _1128 = -_1124;
        float _1130 = 0.0 + _1128;
        float _1132 = fma(_1126, _1130, 0.5);
        float _1134 = fma(_1124, _1132, _1124);
        float _1136 = -_1134;
        float _1138 = 0.0 + _1136;
        float _1140 = fma(_1134, _1138, _1042);
        float _1142 = fma(_1126, _1140, _1134);
        _1118 = _1142;
    }
    _1120 = false;
    float _1144 = _1118;
    float _1146 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1148 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1150 = _1090 * _1144;
    float _1152 = -_1146;
    float _1154 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1152);
    float _1156 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1158 = -_1148;
    float _1160 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1162 = _1154 * _1154;
    float _1164 = -_1156;
    float _1166 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1164);
    float _1168 = _1094 * 2.0;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1172 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1170;
    float _1174 = fma(_1160, _1160, _1162);
    float _1176 = -_1168;
    float _1178 = fma(_1150, _1176, _1150);
    float _1180 = fma(_1166, _1166, _1174);
    float _1182 = fma(_1094, 3.1415927410125732421875, _1178);
    float _1184 = rsqrt(_1180);
    float _1186 = _1182 * 0.15915493667125701904296875;
    float _1188 = _1186 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    float _1192 = _1154 * _1184;
    float _1194 = _1160 * _1184;
    float _1196 = _1166 * _1184;
    float _1198 = _1192 * _1192;
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1204 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1202;
    float _1206 = fma(_1196, _1196, _1200);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1210 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1208;
    float _1212 = -_1204;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = rsqrt(_1206);
    float _1218 = -_1210;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1222 = _1220 * _1220;
    float _1224 = _1186 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = fma(_1214, _1214, _1222);
    float _1230 = -_1172;
    float _1232 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1234 = fma(_1232, _1232, _1228);
    float _1236 = _1194 * _1216;
    float _1238 = _1192 * _1216;
    float _1240 = -_1190;
    float _1242 = _1240 + 1.0;
    float _1244 = sqrt(_1234);
    float _1246 = _1196 * _1216;
    float _1248 = _1238 * _1242;
    float _1250 = _1236 * _1242;
    float _1252 = _1236 * _1226;
    float _1254 = _1246 * _1226;
    float _1256 = _1238 * _1226;
    float _1258 = _1246 * _1246;
    float _1260 = fma(_1246, _1248, _1252);
    float _1262 = -_1254;
    float _1264 = fma(_1238, _1250, _1262);
    float _1266 = -_1256;
    float _1268 = fma(_1246, _1250, _1266);
    float _1270 = _1066 * _1260;
    float _1272 = fma(_1236, _1250, _1190);
    float _1274 = _1066 * _1264;
    float _1276 = fma(_1242, _1258, _1190);
    float _1278 = fma(_1078, _1268, _1270);
    float _1280 = fma(_1244, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1282 = fma(_1078, _1272, _1274);
    float _1284 = fma(_1246, _1250, _1256);
    float _1286 = fma(_1080, _1276, _1278);
    float _1288 = fma(_1238, _1248, _1190);
    float _1290 = precise::max(_1280, 0.3499999940395355224609375);
    float _1292 = fma(_1080, _1284, _1282);
    float _1294 = _730 + _1286;
    float _1296 = fma(_1238, _1250, _1254);
    float _1298 = precise::min(_1290, 1.0);
    float _1300 = _706 + _1292;
    float _1302 = -_1172;
    float _1304 = _1294 + _1302;
    float _1306 = _1066 * _1288;
    float _1308 = -_1252;
    float _1310 = fma(_1246, _1248, _1308);
    float _1312 = -_1204;
    float _1314 = _1300 + _1312;
    float _1316 = fma(_1304, _1298, _1172);
    float _1318 = fma(_1078, _1296, _1306);
    float _1320 = fma(_1314, _1298, _1204);
    float _1322 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1324 = _1316 + _1322;
    float _1326 = fma(_1080, _1310, _1318);
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1330 = _1320 + _1328;
    float _1332 = _1324 * _1324;
    float _1334 = _714 + _1326;
    float _1336 = fma(_1330, _1330, _1332);
    float _1338 = -_1210;
    float _1340 = _1334 + _1338;
    float _1342 = sqrt(_1336);
    float _1344 = fma(_1340, _1298, _1210);
    bool _1346 = _1342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1348 = _1332;
    float _1350 = _1210;
    float _1352 = _1318;
    float _1354 = _1296;
    float _1356 = _1330;
    if (!_1346)
    {
        _1348 = _1320;
    }
    float _1358 = _1348;
    float _1360 = _1358;
    if (!_1346)
    {
        _1350 = _1316;
    }
    float _1362 = _1350;
    float _1364 = _1362;
    if (!_1346)
    {
        _1352 = _1344;
    }
    float _1366 = _1352;
    bool _1368 = !_1346;
    float _1370 = _1366;
    if (!_1368)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1376 = _1342 + _1374;
        float _1378 = rsqrt(_1336);
        float _1380 = _1376 * _1372;
        float _1382 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1384 = _1380 * 0.15915493667125701904296875;
        float _1386 = _1384 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1384 * 6.283185482025146484375;
        float _1392 = cos(_1390);
        float _1394 = fma(_1388, _1382, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1396 = _1378 * _1394;
        float _1398 = _1392 + (-1.0);
        float _1400 = fma(_1330, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = fma(_1324, _1396, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1404 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1406 = fma(_1344, _1392, _1404);
        _1370 = _1406;
        _1360 = _1400;
        _1364 = _1402;
    }
    float _1408 = _1370;
    float _1410 = _1360;
    float _1412 = _1364;
    float _1414 = -_894;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1418 = -_900;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1422 = -_928;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1412);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1428 = _1416 + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1432 = _1420 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1436 = _1424 + _1434;
    float _1438 = _1428 * _1428;
    float _1440 = fma(_1432, _1432, _1438);
    float _1442 = fma(_1436, _1436, _1440);
    float _1444 = rsqrt(_1442);
    float _1446 = sqrt(_1442);
    float _1448 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1450 = _1432 * _1448;
    float _1452 = _1436 * _1448;
    float _1454 = _1450 * _1450;
    float _1456 = _1452 * _1452;
    float _1458 = _1454 + _1456;
    float _1460 = sqrt(_1458);
    bool _1462 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1466 = _1460 + _1464;
    float _1468 = _1436;
    float _1470 = _1444;
    float _1472 = _1466;
    float _1474 = _1428;
    float _1476 = _1450;
    if (_1462)
    {
        float _1478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1468 = _1478;
    }
    float _1480 = _1468;
    if (_1462)
    {
        float _1482 = rsqrt(_1458);
        _1470 = _1482;
    }
    float _1484 = _1470;
    float _1486 = _1484;
    if (_1462)
    {
        float _1488 = _1466 * _1480;
        _1472 = _1488;
    }
    float _1490 = _1472;
    if (_1462)
    {
        float _1492 = _1490 * 0.15915493667125701904296875;
        _1354 = _1492;
    }
    float _1494 = _1354;
    float _1496 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1498 = _1480;
    float _1500 = _1494;
    if (_1462)
    {
        float _1502 = _1494 * 6.283185482025146484375;
        float _1504 = sin(_1502);
        _1498 = _1504;
    }
    float _1506 = _1498;
    float _1508 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1510 = precise::max(0.0, _1508);
    float _1512 = _1342;
    float _1514 = _1510;
    if (_1462)
    {
        float _1516 = _1494 * 6.283185482025146484375;
        float _1518 = cos(_1516);
        _1512 = _1518;
    }
    float _1520 = _1512;
    float _1522 = -_1448;
    float _1524 = -_1510;
    float _1526 = fma(_1428, _1522, _1524);
    if (!_1462)
    {
        _1474 = _1452;
    }
    float _1528 = _1474;
    float _1530 = _1528;
    if (_1462)
    {
        float _1532 = _1526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1532;
    }
    float _1534 = _1514;
    float _1536 = _1506;
    float _1538 = _1534;
    if (_1462)
    {
        float _1540 = fma(_1506, _1534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1536 = _1540;
    }
    float _1542 = _1536;
    float _1544 = _1542;
    if (_1462)
    {
        float _1546 = _1520 + (-1.0);
        _1538 = _1546;
    }
    float _1548 = _1538;
    float _1550 = _1548;
    if (_1462)
    {
        float _1552 = _1484 * _1542;
        _1356 = _1552;
    }
    float _1554 = _1356;
    if (!_1462)
    {
        _1486 = _1526;
    }
    float _1556 = _1486;
    float _1558 = _1556;
    if (_1462)
    {
        float _1560 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1560;
    }
    float _1562 = _1500;
    if (_1462)
    {
        float _1564 = _1450 * _1554;
        _1476 = _1564;
    }
    float _1566 = _1476;
    if (!_1462)
    {
        _1544 = _1454;
    }
    float _1568 = _1544;
    float _1570 = _1568;
    if (_1462)
    {
        float _1572 = _1452 * _1554;
        _1530 = _1572;
    }
    float _1574 = _1530;
    if (_1462)
    {
        float _1576 = fma(_1526, _1520, _1562);
        _1558 = _1576;
    }
    float _1578 = _1558;
    if (_1462)
    {
        float _1580 = _1566 * _1566;
        _1570 = _1580;
    }
    float _1582 = _1570;
    if (!_1462)
    {
        _1550 = _1456;
    }
    float _1584 = _1550;
    float _1586 = _1584;
    if (_1462)
    {
        float _1588 = _1574 * _1574;
        _1586 = _1588;
    }
    float _1590 = _1586;
    float _1592 = fma(_1578, _1578, _1582);
    float _1594 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1596 = _1592 + _1590;
    float _1598 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1602 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1600);
    float _1604 = precise::clamp(_1602, 0.0, 1.0);
    float _1606 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1594);
    float _1608 = rsqrt(_1596);
    float _1610 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1598);
    float _1612 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1614 = -_1604;
    float _1616 = _1614 + 1.0;
    float _1618 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1606);
    float _1620 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1610);
    float _1622 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1624 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1612);
    float _1626 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1628 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1622);
    float _1630 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1624);
    float _1632 = abs(_1616);
    float _1634 = log2(_1632);
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1638 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1640 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1642 = _1608 * _1566;
    float _1644 = -_1636;
    float _1646 = fma(_1644, _1496, 1.0);
    float _1648 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1652 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1654 = _1608 * _1578;
    float _1656 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1658 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1650);
    float _1660 = _1608 * _1574;
    float _1662 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1664 = -_1656;
    float _1666 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1664);
    float _1668 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1658);
    float _1670 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1672 = log2(_1646);
    float _1674 = -_1660;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1666);
    float _1678 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1668);
    float _1680 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1682 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1662);
    float _1684 = fma(_1676, -0.5, 0.5);
    float _1686 = fma(_1676, 0.5, 0.5);
    float _1688 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1680);
    float _1690 = exp2(_1670);
    float _1692 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1682);
    float _1694 = fma(_1686, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1696 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1688);
    float _1698 = _1654 + 1.0;
    float _1700 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1692);
    float _1702 = fma(_1686, _1694, -0.212114393711090087890625);
    float _1704 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1696);
    float _1706 = 1.0 / _1678;
    float _1708 = _1672 * 0.693147182464599609375;
    float _1710 = fma(_1686, _1702, 1.570728778839111328125);
    float _1712 = sqrt(_1684);
    float _1714 = -_1654;
    float _1716 = fma(_1690, _1698, _1714);
    float _1718 = _1700 * _1706;
    float _1720 = _1704 * _1706;
    float _1722 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1724 = fma(_1718, -0.5, 0.5);
    float _1726 = fma(_1720, 0.5, 0.5);
    float _1728 = fma(_1716, 0.5, 0.5);
    float _1730 = _1712 * 0.636619746685028076171875;
    float _1732 = -_1710;
    float _1734 = fma(_1730, _1732, 1.0);
    float3 _4649 = float3(_1726, _1724, _1722);
    float _1736 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4649, float3(0.0), isnan(_4649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4649, float3(0.0), isnan(_4649)), level(0.0)).x;
    float3 _4660 = float3(_1726, _1724, _1722);
    float4 _1739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4660, float3(0.0), isnan(_4660)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4660, float3(0.0), isnan(_4660)), level(0.0)).xyzw;
    float _1741 = _1739.x;
    float _1743 = _1739.y;
    float _1745 = _1739.z;
    float _1747 = _1739.w;
    float2 _4677 = float2(_1734, _1728);
    float3 _1751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4677, float2(0.0), isnan(_4677)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4677, float2(0.0), isnan(_4677)), level(0.0)).xyz;
    float _1753 = _1751.x;
    float _1755 = _1751.y;
    float _1757 = _1751.z;
    float _1759 = -_894;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _1763 = -_900;
    float _1765 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _706);
    float _1767 = -_928;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _730);
    out.m_61.x = _452;
    out.m_61.y = _454;
    out.m_61.z = _456;
    out.m_61.w = _450;
    float _1771 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1773 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1775 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1771);
    float _1777 = exp2(_1773);
    float _1779 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1775);
    float _1781 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1785 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    bool _1787 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1789 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan(0.5);
    bool _1795 = _1791 || _1793;
    float _1797 = 1.0 / _1783;
    float _1799 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1785);
    float _1801 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1803 = _1799 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1805 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1801);
    float _1807 = _1803 + _1783;
    float _1809 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1805);
    float _1811 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1795)
    {
        _1811 = 1.0;
    }
    float _1813 = _1811;
    float _1815 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1809);
    float _1817 = _1807 * _1797;
    float _1819 = _1817 * 0.5;
    float _1821 = _1813;
    if (!_1795)
    {
        float _1823 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1827 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1825);
        float _1829 = _1823 * 0.15915493667125701904296875;
        float _1831 = _1829 * 6.283185482025146484375;
        float _1833 = cos(_1831);
        float _1835 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1837 = _1835 * 0.15915493667125701904296875;
        float _1839 = _1829 * 6.283185482025146484375;
        float _1841 = sin(_1839);
        float _1843 = 1.0 / _1833;
        float _1845 = _1837 * 6.283185482025146484375;
        float _1847 = cos(_1845);
        float _1849 = _1841 * _1843;
        float _1851 = 1.0 / _1827;
        float _1853 = _1847 * _1849;
        float _1855 = _1837 * 6.283185482025146484375;
        float _1857 = sin(_1855);
        float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1861 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1859;
        float _1863 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1865 = _1851 * _1863;
        float _1867 = 1.0 / _1853;
        float _1869 = 1.0 / _1861;
        float _1871 = _1857 * _1867;
        float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1875 = fma(_1871, _1865, _1873);
        float _1877 = _1875 * _1869;
        float _1879 = precise::clamp(_1877, 0.0, 1.0);
        float _1881 = -_1879;
        float _1883 = _1881 + 1.0;
        _1821 = _1883;
    }
    float _1885 = _1821;
    float _1887 = -_1777;
    float _1889 = _1887 + 1.0;
    float _1891 = _1678 * 0.5;
    bool _1893 = _1885 > 0.0;
    bool _1895 = isnan(_1885);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan(0.0);
    bool _1901 = _1897 || _1899;
    float _1903 = _1885 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1905 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1907 = fma(_1700, -0.5, _1891);
    float _1909 = _1815 + _1678;
    float _1911 = _1704 + _1678;
    float _1913 = _1905 * _1736;
    float _1915 = -_1905;
    float _1917 = _1915 + 1.0;
    out.m_63.x = _1082;
    out.m_63.y = _1084;
    out.m_63.z = _1086;
    float _1919 = _1747 * _1913;
    float _1921 = _1757 * _1913;
    float _1923 = _1909 * 0.5;
    float _1925 = _1911 * 0.5;
    float _1927 = fma(_1753, _1919, _1741);
    float _1929 = _1903 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1931 = fma(_1755, _1919, _1743);
    float _1933 = _1747 * _1917;
    float _1935 = fma(_1747, _1921, _1745);
    out.gl_Position.x = _1704;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1815;
    out.gl_Position.w = _1678;
    out.m_65.x = _1925;
    out.m_65.y = _1907;
    out.m_65.z = _1923;
    out.m_65.w = _1678;
    out.m_45.x = _1929;
    out.m_67.x = _1927;
    out.m_67.y = _1931;
    out.m_67.z = _1935;
    out.m_67.w = _1933;
    if (_1901)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1937 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1937;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

