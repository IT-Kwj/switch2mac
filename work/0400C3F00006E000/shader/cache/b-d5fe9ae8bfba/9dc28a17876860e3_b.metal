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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

static inline __attribute__((always_inline))
void _104(thread const int& _6098, thread const int& _6099, thread const int& _6100, thread const int& _6101, thread int& _6102, thread int& _6103, thread int& _6104, thread int& _6105, thread int& _6106, thread int& _6107, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _6110 = _6099;
    int _6112 = _6100;
    float _6114 = as_type<float>(_6098) + 0.0;
    bool _6116 = _6114 != 0.0;
    bool _6118 = isnan(_6114);
    bool _6120 = _6116 || _6118;
    bool _6122 = isnan(0.0);
    bool _6124 = _6120 || _6122;
    int _6126 = 0;
    int _6128 = _6124 ? (-1) : 0;
    if (!_6124)
    {
        float _6130 = as_type<float>(_6098) * 1.0;
        _6110 = as_type<int>(_6130);
    }
    int _6132 = _6110;
    bool _6134 = !_6124;
    int _6136 = _6132;
    int _6138 = _6132;
    if (!_6134)
    {
        float _6140 = as_type<float>(_6098) + 0.0;
        bool _6142 = _6140 >= 0.0;
        bool _6144 = isnan(_6140);
        bool _6146 = _6142 || _6144;
        bool _6148 = isnan(0.0);
        bool _6150 = _6146 || _6148;
        _6128 = _6150 ? (-1) : 0;
        if (!_6150)
        {
            _6136 = 2147483647;
        }
        int _6152 = _6136;
        bool _6154 = !_6150;
        int _6156 = _6152;
        _6138 = _6152;
        if (!_6154)
        {
            float _6158 = abs(as_type<float>(_6098));
            float _6160 = _6158 + 0.0;
            bool _6162 = _6160 > as_type<float>(0x7f800000u /* inf */);
            bool _6164 = isnan(_6160);
            bool _6166 = _6162 || _6164;
            bool _6168 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _6170 = _6166 || _6168;
            _6126 = 2139095040;
            _6128 = _6170 ? (-1) : 0;
            if (_6170)
            {
                float _6172 = as_type<float>(_6098) + 1.0;
                _6156 = as_type<int>(_6172);
            }
            int _6174 = _6156;
            int _6176 = _6174;
            _6138 = _6174;
            if (!_6170)
            {
                float _6178 = abs(as_type<float>(_6098));
                float _6180 = _6178 + (-0.0);
                float _6182 = 0.0 + _6180;
                bool _6184 = _6182 != as_type<float>(0x7f800000u /* inf */);
                bool _6186 = isnan(_6182);
                bool _6188 = _6184 || _6186;
                bool _6190 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _6192 = _6188 || _6190;
                _6128 = _6192 ? (-1) : 0;
                if (!_6192)
                {
                    _6176 = _6098;
                }
                int _6194 = _6176;
                bool _6196 = !_6192;
                _6138 = _6194;
                if (!_6196)
                {
                    float _6198 = as_type<float>(_6098) * 18446744073709551616.0;
                    float _6200 = rsqrt(_6198);
                    float _6202 = _6198 * _6200;
                    float _6204 = _6200 * 0.5;
                    float _6206 = -_6202;
                    float _6208 = 0.0 + _6206;
                    float _6210 = fma(_6204, _6208, 0.5);
                    float _6212 = fma(_6202, _6210, _6202);
                    float _6214 = -_6212;
                    float _6216 = 0.0 + _6214;
                    float _6218 = fma(_6212, _6216, _6198);
                    float _6220 = fma(_6204, _6218, _6212);
                    float _6222 = _6220 * 2.3283064365386962890625e-10;
                    _6138 = as_type<int>(_6222);
                    _6112 = as_type<int>(_6212);
                    _6126 = as_type<int>(_6208);
                }
            }
        }
    }
    int _6224 = _6138;
    int _6226 = _6112;
    int _6228 = _6126;
    int _6230 = _6128;
    _6102 = _6101;
    _6103 = 0;
    _6104 = _6224;
    _6105 = _6226;
    _6106 = _6228;
    _6107 = _6230;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2049 = false;
    bool _1088 = false;
    bool _774 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _112 = int(_110);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2407 = as_type<float>(_126);
        out.gl_Position.z = _2407;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_53.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2471 = as_type<float>(_160);
        out.gl_Position.z = _2471;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = 1.0 / _132;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _136 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _200 = in.m_48.x;
    float _202 = in.m_48.y;
    float _204 = in.m_48.z;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _208 = fma(_206, 10.0, 10.0);
    float _210 = precise::max(_166, 0.949999988079071044921875);
    float _212 = fma(_166, 0.2000000476837158203125, 1.0);
    float _214 = in.m_55.y;
    float _216 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _218 = in.m_59.x;
    float _220 = in.m_59.y;
    float _222 = in.m_59.z;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _226 = _224 != 0;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _230 = _228 != 0;
    float _232 = _216 * _208;
    float _234 = in.m_61.x;
    float _236 = fma(_192, 2.0, -1.0);
    float _238 = fma(_194, 2.0, -1.0);
    float _240 = fma(_196, 2.0, -1.0);
    float _242 = in.m_61.y;
    float _244 = precise::min(_210, 1.0);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = _202 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _252 = 0.0;
    float _254 = _234;
    float _256 = _242;
    if (_226)
    {
        float _258 = in.m_55.x;
        _252 = _258;
    }
    float _260 = _252;
    float _262 = fma(_244, -19.999996185302734375, 19.999996185302734375);
    float _264 = 1.0 / _248;
    float _266 = _202 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _268 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[5].x, _250);
    float _270 = _202 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _272 = _214 > 0.5;
    bool _274 = _272 && _230;
    float _276 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[4].x, _266);
    float _278 = _236 * _212;
    float _280 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[6].x, _270);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = _190 + _282;
    float _286 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].z, _268);
    float _288 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].z, _276);
    float _290 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].z, _280);
    float _292 = -_236;
    float _294 = _292 + _218;
    float _296 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _298 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _300 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _302 = _284 * _264;
    float _304 = -_296;
    float _306 = _304 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _308 = -_298;
    float _310 = _308 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _312 = -_300;
    float _314 = _312 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _316 = _306 * _306;
    bool _318 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_190);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_240;
    float _332 = _330 + _222;
    float _334 = fma(_310, _310, _316);
    bool _336 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_190);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_328;
    float _350 = _348 + 1.0;
    float _352 = fma(_314, _314, _334);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _346 * _350;
    float _364 = rsqrt(_352);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _366;
    float _370 = fma(_360, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _372 = _260 > 0.5;
    bool _374 = _372 && _226;
    float _376 = _232 * 0.15915493667125701904296875;
    float _378 = fma(_356, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _380 = fma(_368, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = _370 * _362;
    float _384 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _386 = _296 + _384;
    float _388 = _378 * _362;
    float _390 = _380 * _362;
    float _392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _394 = _298 + _392;
    float _396 = _386 * _386;
    float _398 = _376 * 6.283185482025146484375;
    float _400 = sin(_398);
    float _402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _404 = _300 + _402;
    float _406 = _314 * _364;
    float _408 = _306 * _364;
    float _410 = _310 * _364;
    float _412 = fma(_394, _394, _396);
    float _414 = _406 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _416 = _408 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _418 = -_346;
    float _420 = _418 + 1.0;
    float _422 = fma(_404, _404, _412);
    float _424 = -_414;
    float _426 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[10].y, _424);
    float _428 = -_416;
    float _430 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[9].y, _428);
    float _432 = _410 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _434 = _412;
    if (!_226)
    {
        _434 = _234;
    }
    float _436 = _434;
    float _438 = _426 * _426;
    float _440 = rsqrt(_422);
    float _442 = -_432;
    float _444 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[8].y, _442);
    float _446 = fma(_400, 0.150000035762786865234375, 1.0499999523162841796875);
    float _448 = fma(_430, _430, _438);
    float _450 = _436;
    if (_374)
    {
        float _452 = -_234;
        float _454 = _452 + 1.0;
        _254 = _454;
    }
    float _456 = _254;
    float _458 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _388);
    float _460 = _446 * _262;
    float _462 = fma(_444, _444, _448);
    float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_226)
    {
        _450 = _456;
    }
    float _466 = _450;
    float _468 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    if (_274)
    {
        float _470 = -_242;
        float _472 = _470 + 1.0;
        _256 = _472;
    }
    float _474 = _256;
    float _476 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _478 = -_238;
    float _480 = _478 + _220;
    float _482 = _466 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _484 = _474 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _486 = rsqrt(_462);
    float _488 = _386 * _440;
    float _490 = _394 * _440;
    float _492 = _484 * _198;
    float _494 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].y, _468);
    float _496 = -_488;
    float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _386);
    float _500 = -_490;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _394);
    float _504 = _482 * _464;
    float _506 = _498 * _498;
    float _508 = in.m_63.x;
    float _510 = in.m_63.y;
    float _512 = in.m_63.z;
    float _514 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].x, _458);
    float _516 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].z, _476);
    float _518 = fma(_480, _460, _238);
    float _520 = fma(_502, _502, _506);
    float _522 = fma(_294, _460, _278);
    float _524 = _430 * _486;
    float _526 = _444 * _486;
    float _528 = in.m_65.x;
    float _530 = in.m_65.y;
    float _532 = in.m_65.z;
    float _534 = _426 * _486;
    float _536 = _524 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _538 = _518 != 0.0;
    bool _540 = isnan(_518);
    bool _542 = _538 || _540;
    bool _544 = isnan(0.0);
    bool _546 = _542 || _544;
    float _548 = fma(_332, _460, _240);
    out.m_67.x = _504;
    out.m_67.y = _492;
    float _550 = -_536;
    float _552 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[8].y, _550);
    float _554 = _526 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _556 = _534 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _558 = _522 == 0.0;
    bool _560 = !_546;
    bool _562 = _558 && _560;
    float _564 = _404 * _440;
    float _566 = -_554;
    float _568 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[10].y, _566);
    float _570 = -_556;
    float _572 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[9].y, _570);
    bool _574 = _548 == 0.0;
    bool _576 = _574 && _562;
    float _578 = -_564;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _404);
    float _582 = _552 * _552;
    float _584 = _514 * _508;
    float _586 = _494 * _510;
    float _588 = fma(_580, _580, _520);
    float _590 = fma(_568, _568, _582);
    out.m_69.x = _522;
    out.m_69.y = _518;
    out.m_69.z = _548;
    float _592 = _516 * _512;
    float _594 = fma(_572, _572, _590);
    float _596 = sqrt(_588);
    float _598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _522);
    float _600 = _530;
    float _602 = _528;
    float _604 = _532;
    float _606 = _490;
    float _608 = _488;
    if (!_576)
    {
        float _610 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[17].y, _530);
        _600 = _610;
    }
    float _612 = _600;
    if (!_576)
    {
        float _614 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _602 = _614;
    }
    float _616 = _602;
    if (!_576)
    {
        float _618 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[17].y, _532);
        _604 = _618;
    }
    float _620 = _604;
    float _622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _518);
    float _624 = _612 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _626 = _612 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _628 = rsqrt(_594);
    float _630 = _612 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _632 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[8].x, _624);
    float _634 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[9].x, _626);
    float _636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _548);
    float _638 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[10].x, _630);
    float _640 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _642 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[8].z, _632);
    float _644 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[9].z, _634);
    float _646 = _440 * _596;
    float _648 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[10].z, _638);
    float _650 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _654 = _640 * _646;
    float _656 = _552 * _628;
    float _658 = _568 * _628;
    float _660 = _572 * _628;
    float _662 = _650 * _646;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _666 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _668 = _654 * _598;
    float _670 = _662 * _622;
    float _672 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[8].z, _664);
    float _674 = _666 * _646;
    float _676 = _670 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _678 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[10].z, _672);
    float _680 = _670 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _682 = _670 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _684 = _674 * _636;
    float _686 = abs(_678);
    float _688 = -_686;
    float _690 = _688 + 1.0;
    float _692 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[8].x, _676);
    float _694 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[9].x, _680);
    float _696 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].x, _682);
    float _698 = abs(_678);
    float _700 = fma(_698, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _702 = as_type<int>(_690) + (-218103808);
    float _704 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].z, _692);
    float _706 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[9].z, _694);
    float _708 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[10].z, _696);
    bool _710 = uint(_702) >= 1920991232u;
    float _712 = abs(_678);
    float _714 = fma(_712, _700, -0.212114393711090087890625);
    float _716 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = abs(_678);
    float _720 = fma(_718, _714, 1.570728778839111328125);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _728 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _732 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _736 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _740 = _678 < 0.0;
    float _742 = float(_740);
    float _744 = _734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _746 = !_710;
    float _748 = _704;
    float _750 = _646;
    float _772;
    if (!_746)
    {
        int _752 = as_type<int>(_690);
        int _754 = as_type<int>(_596);
        int _756 = as_type<int>(_584);
        int _758 = 4080;
        int _760;
        int _762;
        int _764;
        int _766;
        int _768;
        int _770;
        _104(_752, _754, _756, _758, _760, _762, _764, _766, _768, _770, out.gl_Position, out.gl_PointSize);
        _772 = as_type<float>(_764);
        _774 = true;
    }
    else
    {
        float _776 = rsqrt(_690);
        float _778 = _690 * _776;
        float _780 = _776 * 0.5;
        float _782 = -_778;
        float _784 = 0.0 + _782;
        float _786 = fma(_780, _784, 0.5);
        float _788 = fma(_778, _786, _778);
        float _790 = -_788;
        float _792 = 0.0 + _790;
        float _794 = fma(_788, _792, _690);
        float _796 = fma(_780, _794, _788);
        _772 = _796;
    }
    _774 = false;
    float _798 = _772;
    float _800 = _660 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _802 = _656 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _804 = _720 * _798;
    float _806 = -_800;
    float _808 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[10].z, _806);
    float _810 = _658 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _812 = -_802;
    float _814 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[9].z, _812);
    float _816 = _808 * _808;
    float _818 = -_810;
    float _820 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[8].z, _818);
    float _822 = fma(_814, _814, _816);
    float _824 = _742 * 2.0;
    float _826 = fma(_820, _820, _822);
    float _828 = -_824;
    float _830 = fma(_804, _828, _804);
    float _832 = rsqrt(_826);
    float _834 = fma(_742, 3.1415927410125732421875, _830);
    float _836 = _834 * 0.15915493667125701904296875;
    float _838 = _836 * 6.283185482025146484375;
    float _840 = cos(_838);
    float _842 = _808 * _832;
    float _844 = _814 * _832;
    float _846 = _820 * _832;
    float _848 = _836 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = _842 * _842;
    float _854 = fma(_844, _844, _852);
    float _856 = -_840;
    float _858 = _856 + 1.0;
    float _860 = fma(_846, _846, _854);
    float _862 = rsqrt(_860);
    float _864 = _846 * _862;
    float _866 = _844 * _862;
    float _868 = _842 * _862;
    float _870 = _864 * _850;
    float _872 = _866 * _858;
    float _874 = _866 * _850;
    float _876 = _868 * _858;
    float _878 = _868 * _850;
    float _880 = -_870;
    float _882 = fma(_868, _872, _880);
    float _884 = fma(_866, _872, _840);
    float _886 = fma(_864, _876, _874);
    float _888 = _864 * _864;
    float _890 = _706 * _882;
    float _892 = -_878;
    float _894 = fma(_864, _872, _892);
    float _896 = _706 * _886;
    float _898 = fma(_858, _888, _840);
    float _900 = fma(_704, _884, _890);
    float _902 = fma(_864, _872, _878);
    float _904 = fma(_704, _894, _896);
    float _906 = -_874;
    float _908 = fma(_864, _876, _906);
    float _910 = fma(_708, _902, _900);
    float _912 = fma(_708, _898, _904);
    float _914 = _298 + _910;
    float _916 = _300 + _912;
    float _918 = fma(_868, _876, _840);
    float _920 = fma(_868, _872, _870);
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _924 = _914 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _928 = _916 + _926;
    float _930 = _706 * _918;
    float _932 = _924 * _924;
    float _934 = _928 * _928;
    float _936 = fma(_704, _920, _930);
    float _938 = _932 + _934;
    float _940 = fma(_708, _908, _936);
    float _942 = sqrt(_938);
    float _944 = _296 + _940;
    bool _946 = _942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _948 = _930;
    float _950 = _918;
    float _952 = _940;
    float _954 = _914;
    float _956 = _872;
    if (!_946)
    {
        _948 = _934;
    }
    float _958 = _948;
    float _960 = _958;
    if (!_946)
    {
        _748 = _932;
    }
    float _962 = _748;
    float _964 = _962;
    if (!_946)
    {
        _950 = _916;
    }
    float _966 = _950;
    float _968 = _966;
    if (!_946)
    {
        _952 = _944;
    }
    float _970 = _952;
    bool _972 = !_946;
    float _974 = _970;
    if (!_972)
    {
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _980 = _942 + _978;
        float _982 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = rsqrt(_938);
        float _986 = _980 * _976;
        float _988 = _986 * 0.15915493667125701904296875;
        float _990 = _988 * 6.283185482025146484375;
        float _992 = sin(_990);
        float _994 = _988 * 6.283185482025146484375;
        float _996 = cos(_994);
        float _998 = fma(_992, _982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1000 = _984 * _998;
        float _1002 = _996 + (-1.0);
        float _1004 = _924 * _1000;
        float _1006 = _928 * _1000;
        float _1008 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = _1004 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1012 = _1004 * _1004;
        float _1014 = fma(_944, _996, _1008);
        float _1016 = _1006 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1018 = _1006 * _1006;
        _974 = _1014;
        _964 = _1012;
        _960 = _1018;
        _954 = _1010;
        _968 = _1016;
    }
    float _1020 = _974;
    float _1022 = _964;
    float _1024 = _960;
    float _1026 = _954;
    float _1028 = _968;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1032 = _1020 + _1030;
    out.m_71.x = _728;
    out.m_71.y = _732;
    out.m_71.z = _736;
    float _1034 = fma(_1032, _1032, _1022);
    out.m_73.x = _738;
    out.m_73.y = _744;
    out.m_73.z = _716;
    float _1036 = _1034 + _1024;
    out.m_75.x = _642;
    out.m_75.y = _644;
    out.m_75.z = _648;
    float _1038 = sqrt(_1036);
    bool _1040 = _1038 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1042 = isnan(_1038);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1048 = _1044 || _1046;
    float _1050 = _1034;
    float _1052 = _1032;
    if (!_1048)
    {
        _1050 = 1.0;
    }
    float _1054 = _1050;
    bool _1056 = !_1048;
    float _1058 = _1054;
    if (!_1056)
    {
        bool _1060 = _1038 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1062 = isnan(_1038);
        bool _1064 = _1060 || _1062;
        bool _1066 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1068 = _1064 || _1066;
        if (!_1068)
        {
            float _1070 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1072 = _1038 + _1070;
            float _1074 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1076 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1074;
            float _1078 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1080 = _1078 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1082 = 1.0 / _1076;
            float _1084 = _1072 * _1082;
            float _1086 = fma(_1084, _1080, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1058 = _1086;
            _1088 = true;
        }
        else
        {
            bool _1090 = _1038 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1092 = isnan(_1038);
            bool _1094 = _1090 || _1092;
            bool _1096 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1098 = _1094 || _1096;
            if (!_1098)
            {
                float _1100 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1102 = _1038 + _1100;
                float _1104 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1106 = _1104 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1110 = _1108 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1112 = 1.0 / _1106;
                float _1114 = _1102 * _1112;
                float _1116 = fma(_1114, _1110, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1058 = _1116;
                _1088 = true;
            }
            else
            {
                _1058 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1088 = false;
    float _1118 = _1058;
    float _1120 = -_488;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _1124 = -_490;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _1128 = -_564;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _1132 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1134 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1136 = _1020 + _1134;
    bool _1138 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan(0.5);
    bool _1146 = _1142 || _1144;
    float _1148 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1132);
    float _1150 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1148);
    bool _1154 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan(0.5);
    bool _1162 = _1158 || _1160;
    float _1164 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1166 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1150);
    float _1168 = 1.0 / _1164;
    float _1170 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1166);
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1174 = _1172 + _1164;
    float _1176 = fma(_1136, _1118, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1178 = _1174 * _1168;
    float _1180 = _1178 * 0.5;
    float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1184 = _1026 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1188 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1186);
    float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1192 = _1028 + _1190;
    float _1194 = fma(_1184, _1118, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1196 = -_488;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1176);
    float _1200 = fma(_1192, _1118, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1202 = 1.0 / _1188;
    float _1204 = -_490;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1194);
    float _1208 = _1198;
    float _1210 = _1206;
    float _1212 = _1136;
    float _1214 = _1126;
    if (_1162)
    {
        _606 = 1.0;
    }
    float _1216 = _606;
    float _1218 = -_564;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1222 = _1220;
    float _1224 = _1216;
    if (!_1146)
    {
        float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1228 = _1122 + _1226;
        float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1232 = _1126 + _1230;
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1236 = -_300;
        float _1238 = _1236 + _1200;
        float _1240 = _1228 * _1228;
        float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1244 = _1130 + _1242;
        float _1246 = fma(_1232, _1232, _1240);
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = fma(_1244, _1244, _1246);
        float _1252 = sqrt(_1250);
        float _1254 = 1.0 / _646;
        float _1256 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1258 = precise::min(_1252, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1260 = _1258 * _1234;
        float _1262 = _1260 * _1254;
        float _1264 = -_296;
        float _1266 = _1264 + _1176;
        float _1268 = -_298;
        float _1270 = _1268 + _1194;
        float _1272 = _1256 * _1262;
        float _1274 = _1238 * _1262;
        float _1276 = fma(_1266, _1272, _1122);
        float _1278 = fma(_1270, _1272, _1126);
        float _1280 = fma(_1256, _1274, _1130);
        _1208 = _1276;
        _1210 = _1278;
        _1222 = _1280;
        _608 = _1262;
    }
    float _1282 = _1208;
    float _1284 = _1210;
    float _1286 = _1222;
    float _1288 = _608;
    float _1290 = _1288;
    if (_1162)
    {
        _1212 = 1.0;
    }
    float _1292 = _1212;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1296 = _1202 * _1294;
    float _1298 = _1292;
    if (!_1162)
    {
        float _1300 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1302 = _1300 * 0.15915493667125701904296875;
        float _1304 = _1302 * 6.283185482025146484375;
        float _1306 = cos(_1304);
        float _1308 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1310 = _1308 * 0.15915493667125701904296875;
        float _1312 = _1302 * 6.283185482025146484375;
        float _1314 = sin(_1312);
        float _1316 = 1.0 / _1306;
        float _1318 = _1310 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = _1314 * _1316;
        float _1324 = _1310 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1330 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1328;
        float _1332 = _1320 * _1322;
        float _1334 = 1.0 / _1330;
        float _1336 = 1.0 / _1332;
        float _1338 = _1326 * _1336;
        float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1342 = fma(_1296, _1338, _1340);
        float _1344 = _1342 * _1334;
        float _1346 = precise::clamp(_1344, 0.0, 1.0);
        _750 = _1310;
        _1290 = _1336;
        _1224 = _1346;
    }
    float _1348 = _750;
    float _1350 = _1290;
    float _1352 = _1224;
    float _1354 = _1350;
    float _1356 = _1348;
    if (!_1162)
    {
        float _1358 = in.m_77.w;
        bool _1360 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 1;
        bool _1362 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 2;
        bool _1364 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 3;
        int _1366 = as_type<int>(_1358) << 16;
        int _1368 = as_type<int>(_1358) << 8;
        int _1370 = as_type<int>(_1358) << 24;
        int _1372 = _1366 >> 24;
        int _1374 = _1368 >> 24;
        int _1376 = as_type<int>(_1358) >> 24;
        int _1378 = _1370 >> 24;
        float _1380 = float(_1372);
        float _1382 = float(_1374);
        float _1384 = float(_1376);
        float _1386 = _1380 * 0.0078740157186985015869140625;
        float _1388 = float(_1378);
        float _1390 = _1382 * 0.0078740157186985015869140625;
        float _1392 = _1384 * 0.0078740157186985015869140625;
        float _1394 = precise::min(_1386, 1.0);
        float _1396 = _1388 * 0.0078740157186985015869140625;
        float _1398 = precise::min(_1390, 1.0);
        float _1400 = precise::min(_1392, 1.0);
        float _1402 = precise::min(_1396, 1.0);
        float _1404 = precise::max(_1394, -1.0);
        float _1406 = precise::max(_1398, -1.0);
        float _1408 = precise::max(_1400, -1.0);
        float _1410 = precise::max(_1402, -1.0);
        float _1412 = _1410;
        _1354 = (*spvDescriptorSet0.vp_c15)._m0[660].z;
        _1356 = _1408;
        if (_1360)
        {
            _1412 = _1404;
        }
        float _1414 = _1412;
        float _1416 = _1414;
        if (_1362)
        {
            _1416 = _1406;
        }
        float _1418 = _1416;
        float _1420 = _1418;
        if (_1364)
        {
            _1420 = _1408;
        }
        float _1422 = _1420;
        float _1424 = abs(_1422);
        float _1426 = (-0.0) + _1424;
        _1298 = _1426;
    }
    float _1428 = _1354;
    float _1430 = _1356;
    float _1432 = _1298;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1436 = _1282 + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1440 = _1284 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1444 = _1286 + _1442;
    float _1446 = _1436 * _1436;
    float _1448 = fma(_1440, _1440, _1446);
    float _1450 = fma(_1444, _1444, _1448);
    float _1452 = rsqrt(_1450);
    float _1454 = sqrt(_1450);
    float _1456 = _1440 * _1452;
    float _1458 = _1444 * _1452;
    float _1460 = _1436 * _1452;
    float _1462 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1464 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1466 = _1462 * _1462;
    float _1468 = _1464 * _1464;
    float _1470 = _1466 + _1468;
    float _1472 = sqrt(_1470);
    bool _1474 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = _1472 + _1476;
    float _1480 = _1428;
    float _1482 = _1470;
    float _1484 = _1478;
    float _1486 = _1452;
    float _1488 = _1462;
    if (_1474)
    {
        float _1490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1480 = _1490;
    }
    float _1492 = _1480;
    if (_1474)
    {
        float _1494 = rsqrt(_1470);
        _1482 = _1494;
    }
    float _1496 = _1482;
    if (_1474)
    {
        float _1498 = _1478 * _1492;
        _1484 = _1498;
    }
    float _1500 = _1484;
    if (_1474)
    {
        float _1502 = _1500 * 0.15915493667125701904296875;
        _1052 = _1502;
    }
    float _1504 = _1052;
    float _1506 = _1492;
    if (_1474)
    {
        float _1508 = _1504 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        _1506 = _1510;
    }
    float _1512 = _1506;
    float _1514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1516 = precise::max(0.0, _1514);
    float _1518 = _1430;
    float _1520 = _1516;
    if (_1474)
    {
        float _1522 = _1504 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = -_1460;
    float _1530 = -_1516;
    float _1532 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1530);
    float _1534 = _1532;
    if (_1474)
    {
        float _1536 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1536;
    }
    float _1538 = _1520;
    float _1540 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1542 = _1538;
    float _1544 = _1540;
    if (!_1474)
    {
        _1214 = _1466;
    }
    float _1546 = _1214;
    float _1548 = _1512;
    float _1550 = _1546;
    if (_1474)
    {
        float _1552 = fma(_1512, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1548 = _1552;
    }
    float _1554 = _1548;
    float _1556 = floor(_1540);
    float _1558 = _1556;
    if (_1474)
    {
        float _1560 = _1526 + (-1.0);
        _1542 = _1560;
    }
    float _1562 = _1542;
    float _1564 = _1562;
    if (_1474)
    {
        float _1566 = _1496 * _1554;
        _956 = _1566;
    }
    float _1568 = _956;
    if (_1474)
    {
        float _1570 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1486 = _1570;
    }
    float _1572 = _1486;
    float _1574 = _1572;
    if (_1474)
    {
        float _1576 = _1462 * _1568;
        _1488 = _1576;
    }
    float _1578 = _1488;
    if (!_1474)
    {
        _1564 = _1464;
    }
    float _1580 = _1564;
    float _1582 = _1580;
    if (_1474)
    {
        float _1584 = _1464 * _1568;
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (_1474)
    {
        float _1588 = fma(_1532, _1526, _1572);
        _1534 = _1588;
    }
    float _1590 = _1534;
    float _1592 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1474)
    {
        float _1594 = _1578 * _1578;
        _1550 = _1594;
    }
    float _1596 = _1550;
    if (!_1474)
    {
        _1574 = _1468;
    }
    float _1598 = _1574;
    float _1600 = _1598;
    if (_1474)
    {
        float _1602 = _1586 * _1586;
        _1600 = _1602;
    }
    float _1604 = _1600;
    float _1606 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1592);
    float _1608 = fma(_1590, _1590, _1596);
    float _1610 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1606);
    float _1612 = _1608 + _1604;
    float _1614 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1616 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1618 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1622 = rsqrt(_1612);
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1626 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1628 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1618);
    bool _1630 = _1432 != 0.0;
    bool _1632 = isnan(_1432);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan(0.0);
    bool _1638 = _1634 || _1636;
    float _1640 = -_1624;
    float _1642 = fma(_1640, _1620, 1.0);
    float _1644 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1646 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1626);
    float _1648 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1650 = floor(_1614);
    float _1652 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1644);
    float _1654 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1656 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1652);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1660 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1658);
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1666 = _1622 * _1578;
    float _1668 = _1622 * _1590;
    float _1670 = -_1662;
    float _1672 = _1670 + 1.0;
    float _1674 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1676 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1678 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1680 = abs(_1672);
    float _1682 = log2(_1680);
    float _1684 = _1622 * _1586;
    float _1686 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1676);
    float _1688 = -_1678;
    float _1690 = fma(_1668, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1688);
    float _1692 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1694 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1696 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1686);
    float _1698 = -_1684;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1690);
    float _1702 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1704 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1696);
    float _1706 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1694);
    float _1708 = log2(_1642);
    float _1710 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1702);
    float _1712 = fma(_1700, -0.5, 0.5);
    float _1714 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1706);
    float _1716 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1718 = fma(_1700, 0.5, 0.5);
    float _1720 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1710);
    float _1722 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1714);
    float _1724 = 1.0 / _1704;
    float _1726 = fma(_1718, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1728 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1720);
    float _1730 = -_1556;
    float _1732 = _1540 + _1730;
    float _1734 = _1728;
    float _1736 = _1704;
    if (_1638)
    {
        _1558 = _1722;
    }
    float _1738 = _1558;
    float _1740 = fma(_1718, _1726, -0.212114393711090087890625);
    float _1742 = -_1650;
    float _1744 = _1614 + _1742;
    float _1746 = _1738;
    if (_1638)
    {
        _1544 = _1728;
    }
    float _1748 = _1544;
    float _1750 = sqrt(_1712);
    float _1752 = _1748;
    if (!_1638)
    {
        _1746 = 0.0;
        _1752 = 0.0;
    }
    float _1754 = _1746;
    float _1756 = _1752;
    float _1758 = _1668 + 1.0;
    float _1760 = _1708 * 0.693147182464599609375;
    float _1762 = exp2(_1716);
    float _1764 = _1724 * _1754;
    float _1766 = _1724 * _1756;
    float2 _5037 = float2(_1732, _1744);
    float _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5037, float2(0.0), isnan(_5037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5037, float2(0.0), isnan(_5037)), level(0.0)).x;
    float _1770 = fma(_1718, _1740, 1.570728778839111328125);
    float _1772 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1774 = fma(_1764, 0.5, 0.5);
    float _1776 = fma(_1766, -0.5, 0.5);
    float _1778 = _1750 * 0.636619746685028076171875;
    float3 _5062 = float3(_1774, _1776, _1772);
    float _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5062, float3(0.0), isnan(_5062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5062, float3(0.0), isnan(_5062)), level(0.0)).x;
    float _1782 = -_1668;
    float _1784 = fma(_1762, _1758, _1782);
    float _1786 = -_1770;
    float _1788 = fma(_1778, _1786, 1.0);
    float _1790 = fma(_1784, 0.5, 0.5);
    float3 _5086 = float3(_1774, _1776, _1772);
    float4 _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5086, float3(0.0), isnan(_5086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5086, float3(0.0), isnan(_5086)), level(0.0)).xyzw;
    float _1795 = _1793.x;
    float _1797 = _1793.y;
    float _1799 = _1793.z;
    float _1801 = _1793.w;
    float2 _5102 = float2(_1788, _1790);
    float3 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5102, float2(0.0), isnan(_5102)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5102, float2(0.0), isnan(_5102)), level(0.0)).xyz;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = abs(_1296);
    float _1815 = log2(_1813);
    float _1817 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1819 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1821 = _1296 <= 8000.0;
    bool _1823 = isnan(_1296);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(8000.0);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1817);
    float _1835 = in.m_77.x;
    float _1837 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1839 = exp2(_1819);
    float _1841 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1833);
    float _1843 = _1837 * _1432;
    out.m_79.x = _1284;
    out.m_79.y = _1282;
    out.m_79.z = _1286;
    bool _1845 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1847 = isnan(_1454);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1853 = _1849 || _1851;
    float _1855 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1841);
    float _1857 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _1722;
    out.gl_Position.y = _1728;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1704;
    float _1859 = exp2(_1857);
    float _1861 = -_1839;
    float _1863 = _1861 + 1.0;
    float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1867 = _1855;
    float _1869 = 0.0;
    float _1871 = 0.0;
    if (!_1853)
    {
        _1734 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1873 = _1734;
    float _1875 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = _1855 + _1704;
    float _1881 = _1873;
    float _1883 = _1873;
    if (!_1853)
    {
        _1867 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1885 = _1867;
    float _1887 = fma(_1877, -2.0, 3.0);
    float _1889 = _1877 * _1877;
    float _1891 = _1879 * 0.5;
    float _1893 = _1889 * _1887;
    float _1895 = -_1893;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1893);
    float _1901 = _1897;
    float _1903 = _1885;
    float _1905 = _1885;
    if (!_1638)
    {
        _1901 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1907 = _1901;
    float _1909 = _1831 * _1899;
    out.m_81.z = _1891;
    out.m_81.w = _1704;
    int _1911 = as_type<int>(_1907);
    if (!_1853)
    {
        _1736 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1913 = _1736;
    float _1915 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1917 = _1913;
    float _1919 = _1913;
    if (!_1638)
    {
        float _1921 = _1907 * 5.0;
        _1911 = as_type<int>(_1921);
    }
    int _1923 = _1911;
    float _1925 = as_type<float>(_1923);
    if (!_1638)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5311 = as_type<float>(_1923);
        out.gl_Position.z = _5311;
    }
    if (_1638)
    {
        _1925 = _1843;
    }
    float _1927 = _1925;
    float _1929 = _1927;
    if (!_1638)
    {
        _1929 = 0.0;
    }
    float _1931 = _1929;
    if (!_1853)
    {
        _1869 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1933 = _1869;
    float _1935 = _1933;
    float _1937 = _1933;
    if (!_1853)
    {
        _1871 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1939 = _1871;
    float _1941 = -_1768;
    float _1943 = _1941 + 1.0;
    float _1945 = _1943 * _1915;
    float _1947 = precise::clamp(_1945, 0.0, 1.0);
    float _1949 = _1865 * _1780;
    float _1951 = -_1947;
    float _1953 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1955 = -_1865;
    float _1957 = _1955 + 1.0;
    float _1959 = _1953 * _1835;
    float _1961 = _1959 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1963 = _1801 * _1949;
    out.m_83.x = _1961;
    float _1965 = _1811 * _1949;
    float _1967 = fma(_1807, _1963, _1795);
    float _1969 = fma(_1809, _1963, _1797);
    float _1971 = _1801 * _1957;
    float _1973 = fma(_1801, _1965, _1799);
    float _1975 = _1963;
    float _1977 = _1939;
    float _1979 = _1939;
    if (!_1853)
    {
        _1975 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1981 = _1975;
    out.m_85.x = _1967;
    out.m_85.y = _1969;
    out.m_85.z = _1973;
    out.m_85.w = _1971;
    bool _1983 = !_1853;
    float _1985 = _1981;
    float _1987 = _1981;
    if (!_1983)
    {
        bool _1989 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1991 = isnan(_1454);
        bool _1993 = _1989 || _1991;
        bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1997 = _1993 || _1995;
        if (!_1997)
        {
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2001 = _1454 + _1999;
            float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2005 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2003;
            float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2011 = 1.0 / _2005;
            float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2017 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2019 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2027 = _2025 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2029 = _2001 * _2011;
            float _2031 = precise::clamp(_2029, 0.0, 1.0);
            float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2037 = fma(_2031, _2009, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2039 = fma(_2031, _2035, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2041 = fma(_2031, _2015, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2043 = fma(_2031, _2019, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2045 = fma(_2031, _2023, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2047 = fma(_2031, _2027, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1979 = _2041;
            _1883 = _2045;
            _1937 = _2037;
            _1905 = _2043;
            _1919 = _2039;
            _1987 = _2047;
            _2049 = true;
        }
        else
        {
            bool _2051 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2053 = isnan(_1454);
            bool _2055 = _2051 || _2053;
            bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2059 = _2055 || _2057;
            if (!_2059)
            {
                _1935 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2061 = _1935;
            _1937 = _2061;
            if (!_2059)
            {
                _1977 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2063 = _1977;
            _1979 = _2063;
            if (!_2059)
            {
                _1917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2065 = _1917;
            _1919 = _2065;
            if (!_2059)
            {
                _1903 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2067 = _1903;
            _1905 = _2067;
            if (!_2059)
            {
                _1881 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2069 = _1881;
            _1883 = _2069;
            if (!_2059)
            {
                _1985 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2071 = _1985;
            bool _2073 = !_2059;
            _1987 = _2071;
            if (!_2073)
            {
                bool _2075 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2077 = isnan(_1454);
                bool _2079 = _2075 || _2077;
                bool _2081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2083 = _2079 || _2081;
                if (!_2083)
                {
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2087 = _1454 + _2085;
                    float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2091 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2089;
                    float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2097 = 1.0 / _2091;
                    float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2115 = _2087 * _2097;
                    float _2117 = precise::clamp(_2115, 0.0, 1.0);
                    float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2121 = _2119 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2123 = fma(_2117, _2095, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2125 = fma(_2117, _2121, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2127 = fma(_2117, _2101, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2129 = fma(_2117, _2105, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2131 = fma(_2117, _2109, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2133 = fma(_2117, _2113, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1979 = _2127;
                    _1883 = _2131;
                    _1937 = _2123;
                    _1905 = _2129;
                    _1919 = _2125;
                    _1987 = _2133;
                    _2049 = true;
                }
                else
                {
                    _1979 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1883 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1937 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1905 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1987 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2049 = false;
    float _2135 = _1979;
    float _2137 = _1883;
    float _2139 = _1937;
    float _2141 = _1905;
    float _2143 = _1919;
    float _2145 = _1987;
    float _2147 = fma(_644, -0.5, 0.5);
    float _2149 = precise::clamp(_2147, 0.0, 1.0);
    float _2151 = -_2135;
    float _2153 = _2151 + _2137;
    float _2155 = -_2139;
    float _2157 = _2155 + _2141;
    float _2159 = fma(_2149, _2153, _2135);
    out.m_87.x = 0.0;
    float _2161 = fma(_2149, _2157, _2139);
    float _2163 = -_2143;
    float _2165 = _2163 + _2145;
    float _2167 = _2159 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    bool _2169 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2171 = fma(_2149, _2165, _2143);
    float _2173 = fma(_2161, 0.298911988735198974609375, _2167);
    float _2175 = _1931 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2177 = _1352 > 0.0;
    bool _2179 = isnan(_1352);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(0.0);
    bool _2185 = _2181 || _2183;
    float _2187 = fma(_2171, 0.114477999508380889892578125, _2173);
    out.m_89.x = 0.0;
    float _2189 = -_2187;
    float _2191 = _2161 + _2189;
    out.m_83.w = _2175;
    float _2193 = -_2187;
    float _2195 = _2159 + _2193;
    float _2197 = fma(_2195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2187);
    float _2199 = -_2187;
    float _2201 = _2171 + _2199;
    float _2203 = fma(_2191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2187);
    float _2205 = fma(_2201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2187);
    bool _2207 = !_2169;
    if (!_2207)
    {
        float _2209 = -_1282;
        float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2213 = -_1284;
        float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2217 = -_1286;
        float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2221 = _2211 * _2211;
        float _2223 = fma(_2215, _2215, _2221);
        float _2225 = fma(_2219, _2219, _2223);
        float _2227 = rsqrt(_2225);
        float _2229 = _2211 * _2227;
        float _2231 = _2215 * _2227;
        float _2233 = _2219 * _2227;
        float _2235 = sqrt(_2225);
        float _2237 = -_1460;
        float _2239 = _2237 + _2229;
        float _2241 = -_1456;
        float _2243 = _2241 + _2231;
        float _2245 = -_1458;
        float _2247 = _2245 + _2233;
        float _2249 = _2239 * _2239;
        float _2251 = fma(_2243, _2243, _2249);
        float _2253 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2255 = precise::clamp(_2253, 0.0, 1.0);
        float _2257 = fma(_2247, _2247, _2251);
        float _2259 = _2255 * _2255;
        float _2261 = -_2235;
        float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2265 = _2259 + (-1.0);
        float _2267 = rsqrt(_2257);
        float _2269 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2271 = precise::clamp(_2269, 0.0, 1.0);
        float _2273 = abs(_2271);
        float _2275 = log2(_2273);
        float _2277 = _2239 * _2267;
        float _2279 = _2243 * _2267;
        float _2281 = _2247 * _2267;
        float _2283 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2285 = _644 * _2277;
        float _2287 = _644 * _2229;
        float _2289 = fma(_642, _2279, _2285);
        float _2291 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2293 = fma(_642, _2231, _2287);
        float _2295 = fma(_648, _2281, _2289);
        float _2297 = precise::clamp(_2295, 0.0, 1.0);
        float _2299 = fma(_648, _2233, _2293);
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = exp2(_2291);
        float _2305 = _2297 * _2297;
        float _2307 = fma(_2305, _2265, 1.0);
        float _2309 = -_2229;
        float _2311 = -_2283;
        float _2313 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2311);
        float _2315 = _2307 * _2307;
        float _2317 = -_2233;
        float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2313);
        float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2323 = _2319 + _2321;
        float _2325 = 1.0 / _2315;
        float _2327 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2329 = precise::clamp(_2327, 0.0, 1.0);
        float _2331 = _2303 * _2329;
        float _2333 = _2301 * _2331;
        float _2335 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2337 = _2259 * _2325;
        float _2339 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2341 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2343 = _2333 * _2337;
        out.m_87.x = _2335;
        out.m_87.y = _2339;
        out.m_87.z = _2341;
        float _2345 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2347 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2349 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2345;
        out.m_89.y = _2347;
        out.m_89.z = _2349;
    }
    out.m_91.x = _2203;
    out.m_91.y = _2197;
    out.m_91.z = _2205;
    if (_2185)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2351 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2351;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2049 = false;
    bool _1088 = false;
    bool _774 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _112 = int(_110);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2407 = as_type<float>(_126);
        out.gl_Position.z = _2407;
    }
    if (!_116)
    {
        return out;
    }
    float _130 = in.m_53.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2471 = as_type<float>(_160);
        out.gl_Position.z = _2471;
    }
    if (_152)
    {
        return out;
    }
    float _162 = 1.0 / _132;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _136 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _200 = in.m_48.x;
    float _202 = in.m_48.y;
    float _204 = in.m_48.z;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _208 = fma(_206, 10.0, 10.0);
    float _210 = precise::max(_166, 0.949999988079071044921875);
    float _212 = fma(_166, 0.2000000476837158203125, 1.0);
    float _214 = in.m_55.y;
    float _216 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _218 = in.m_59.x;
    float _220 = in.m_59.y;
    float _222 = in.m_59.z;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _226 = _224 != 0;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _230 = _228 != 0;
    float _232 = _216 * _208;
    float _234 = in.m_61.x;
    float _236 = fma(_192, 2.0, -1.0);
    float _238 = fma(_194, 2.0, -1.0);
    float _240 = fma(_196, 2.0, -1.0);
    float _242 = in.m_61.y;
    float _244 = precise::min(_210, 1.0);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = _202 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _252 = 0.0;
    float _254 = _234;
    float _256 = _242;
    if (_226)
    {
        float _258 = in.m_55.x;
        _252 = _258;
    }
    float _260 = _252;
    float _262 = fma(_244, -19.999996185302734375, 19.999996185302734375);
    float _264 = 1.0 / _248;
    float _266 = _202 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _268 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[5].x, _250);
    float _270 = _202 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _272 = _214 > 0.5;
    bool _274 = _272 && _230;
    float _276 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[4].x, _266);
    float _278 = _236 * _212;
    float _280 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[6].x, _270);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = _190 + _282;
    float _286 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].z, _268);
    float _288 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].z, _276);
    float _290 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].z, _280);
    float _292 = -_236;
    float _294 = _292 + _218;
    float _296 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _298 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _300 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _302 = _284 * _264;
    float _304 = -_296;
    float _306 = _304 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _308 = -_298;
    float _310 = _308 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _312 = -_300;
    float _314 = _312 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _316 = _306 * _306;
    bool _318 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_190);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_240;
    float _332 = _330 + _222;
    float _334 = fma(_310, _310, _316);
    bool _336 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_190);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_328;
    float _350 = _348 + 1.0;
    float _352 = fma(_314, _314, _334);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _346 * _350;
    float _364 = rsqrt(_352);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _366;
    float _370 = fma(_360, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _372 = _260 > 0.5;
    bool _374 = _372 && _226;
    float _376 = _232 * 0.15915493667125701904296875;
    float _378 = fma(_356, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _380 = fma(_368, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = _370 * _362;
    float _384 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _386 = _296 + _384;
    float _388 = _378 * _362;
    float _390 = _380 * _362;
    float _392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _394 = _298 + _392;
    float _396 = _386 * _386;
    float _398 = _376 * 6.283185482025146484375;
    float _400 = sin(_398);
    float _402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _404 = _300 + _402;
    float _406 = _314 * _364;
    float _408 = _306 * _364;
    float _410 = _310 * _364;
    float _412 = fma(_394, _394, _396);
    float _414 = _406 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _416 = _408 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _418 = -_346;
    float _420 = _418 + 1.0;
    float _422 = fma(_404, _404, _412);
    float _424 = -_414;
    float _426 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[10].y, _424);
    float _428 = -_416;
    float _430 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[9].y, _428);
    float _432 = _410 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _434 = _412;
    if (!_226)
    {
        _434 = _234;
    }
    float _436 = _434;
    float _438 = _426 * _426;
    float _440 = rsqrt(_422);
    float _442 = -_432;
    float _444 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[8].y, _442);
    float _446 = fma(_400, 0.150000035762786865234375, 1.0499999523162841796875);
    float _448 = fma(_430, _430, _438);
    float _450 = _436;
    if (_374)
    {
        float _452 = -_234;
        float _454 = _452 + 1.0;
        _254 = _454;
    }
    float _456 = _254;
    float _458 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _388);
    float _460 = _446 * _262;
    float _462 = fma(_444, _444, _448);
    float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_226)
    {
        _450 = _456;
    }
    float _466 = _450;
    float _468 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    if (_274)
    {
        float _470 = -_242;
        float _472 = _470 + 1.0;
        _256 = _472;
    }
    float _474 = _256;
    float _476 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _478 = -_238;
    float _480 = _478 + _220;
    float _482 = _466 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _484 = _474 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _486 = rsqrt(_462);
    float _488 = _386 * _440;
    float _490 = _394 * _440;
    float _492 = _484 * _198;
    float _494 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].y, _468);
    float _496 = -_488;
    float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _386);
    float _500 = -_490;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _394);
    float _504 = _482 * _464;
    float _506 = _498 * _498;
    float _508 = in.m_63.x;
    float _510 = in.m_63.y;
    float _512 = in.m_63.z;
    float _514 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].x, _458);
    float _516 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].z, _476);
    float _518 = fma(_480, _460, _238);
    float _520 = fma(_502, _502, _506);
    float _522 = fma(_294, _460, _278);
    float _524 = _430 * _486;
    float _526 = _444 * _486;
    float _528 = in.m_65.x;
    float _530 = in.m_65.y;
    float _532 = in.m_65.z;
    float _534 = _426 * _486;
    float _536 = _524 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _538 = _518 != 0.0;
    bool _540 = isnan(_518);
    bool _542 = _538 || _540;
    bool _544 = isnan(0.0);
    bool _546 = _542 || _544;
    float _548 = fma(_332, _460, _240);
    out.m_67.x = _504;
    out.m_67.y = _492;
    float _550 = -_536;
    float _552 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[8].y, _550);
    float _554 = _526 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _556 = _534 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _558 = _522 == 0.0;
    bool _560 = !_546;
    bool _562 = _558 && _560;
    float _564 = _404 * _440;
    float _566 = -_554;
    float _568 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[10].y, _566);
    float _570 = -_556;
    float _572 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[9].y, _570);
    bool _574 = _548 == 0.0;
    bool _576 = _574 && _562;
    float _578 = -_564;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _404);
    float _582 = _552 * _552;
    float _584 = _514 * _508;
    float _586 = _494 * _510;
    float _588 = fma(_580, _580, _520);
    float _590 = fma(_568, _568, _582);
    out.m_69.x = _522;
    out.m_69.y = _518;
    out.m_69.z = _548;
    float _592 = _516 * _512;
    float _594 = fma(_572, _572, _590);
    float _596 = sqrt(_588);
    float _598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _522);
    float _600 = _530;
    float _602 = _528;
    float _604 = _532;
    float _606 = _490;
    float _608 = _488;
    if (!_576)
    {
        float _610 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[17].y, _530);
        _600 = _610;
    }
    float _612 = _600;
    if (!_576)
    {
        float _614 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _602 = _614;
    }
    float _616 = _602;
    if (!_576)
    {
        float _618 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[17].y, _532);
        _604 = _618;
    }
    float _620 = _604;
    float _622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _518);
    float _624 = _612 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _626 = _612 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _628 = rsqrt(_594);
    float _630 = _612 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _632 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[8].x, _624);
    float _634 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[9].x, _626);
    float _636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _548);
    float _638 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[10].x, _630);
    float _640 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _642 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[8].z, _632);
    float _644 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[9].z, _634);
    float _646 = _440 * _596;
    float _648 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[10].z, _638);
    float _650 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _654 = _640 * _646;
    float _656 = _552 * _628;
    float _658 = _568 * _628;
    float _660 = _572 * _628;
    float _662 = _650 * _646;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _666 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _668 = _654 * _598;
    float _670 = _662 * _622;
    float _672 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[8].z, _664);
    float _674 = _666 * _646;
    float _676 = _670 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _678 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[10].z, _672);
    float _680 = _670 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _682 = _670 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _684 = _674 * _636;
    float _686 = abs(_678);
    float _688 = -_686;
    float _690 = _688 + 1.0;
    float _692 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[8].x, _676);
    float _694 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[9].x, _680);
    float _696 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].x, _682);
    float _698 = abs(_678);
    float _700 = fma(_698, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _702 = as_type<int>(_690) + (-218103808);
    float _704 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].z, _692);
    float _706 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[9].z, _694);
    float _708 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[10].z, _696);
    bool _710 = uint(_702) >= 1920991232u;
    float _712 = abs(_678);
    float _714 = fma(_712, _700, -0.212114393711090087890625);
    float _716 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = abs(_678);
    float _720 = fma(_718, _714, 1.570728778839111328125);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _728 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _732 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _736 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _740 = _678 < 0.0;
    float _742 = float(_740);
    float _744 = _734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _746 = !_710;
    float _748 = _704;
    float _750 = _646;
    float _772;
    if (!_746)
    {
        int _752 = as_type<int>(_690);
        int _754 = as_type<int>(_596);
        int _756 = as_type<int>(_584);
        int _758 = 4080;
        int _760;
        int _762;
        int _764;
        int _766;
        int _768;
        int _770;
        _104(_752, _754, _756, _758, _760, _762, _764, _766, _768, _770, out.gl_Position, out.gl_PointSize);
        _772 = as_type<float>(_764);
        _774 = true;
    }
    else
    {
        float _776 = rsqrt(_690);
        float _778 = _690 * _776;
        float _780 = _776 * 0.5;
        float _782 = -_778;
        float _784 = 0.0 + _782;
        float _786 = fma(_780, _784, 0.5);
        float _788 = fma(_778, _786, _778);
        float _790 = -_788;
        float _792 = 0.0 + _790;
        float _794 = fma(_788, _792, _690);
        float _796 = fma(_780, _794, _788);
        _772 = _796;
    }
    _774 = false;
    float _798 = _772;
    float _800 = _660 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _802 = _656 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _804 = _720 * _798;
    float _806 = -_800;
    float _808 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[10].z, _806);
    float _810 = _658 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _812 = -_802;
    float _814 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[9].z, _812);
    float _816 = _808 * _808;
    float _818 = -_810;
    float _820 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[8].z, _818);
    float _822 = fma(_814, _814, _816);
    float _824 = _742 * 2.0;
    float _826 = fma(_820, _820, _822);
    float _828 = -_824;
    float _830 = fma(_804, _828, _804);
    float _832 = rsqrt(_826);
    float _834 = fma(_742, 3.1415927410125732421875, _830);
    float _836 = _834 * 0.15915493667125701904296875;
    float _838 = _836 * 6.283185482025146484375;
    float _840 = cos(_838);
    float _842 = _808 * _832;
    float _844 = _814 * _832;
    float _846 = _820 * _832;
    float _848 = _836 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = _842 * _842;
    float _854 = fma(_844, _844, _852);
    float _856 = -_840;
    float _858 = _856 + 1.0;
    float _860 = fma(_846, _846, _854);
    float _862 = rsqrt(_860);
    float _864 = _846 * _862;
    float _866 = _844 * _862;
    float _868 = _842 * _862;
    float _870 = _864 * _850;
    float _872 = _866 * _858;
    float _874 = _866 * _850;
    float _876 = _868 * _858;
    float _878 = _868 * _850;
    float _880 = -_870;
    float _882 = fma(_868, _872, _880);
    float _884 = fma(_866, _872, _840);
    float _886 = fma(_864, _876, _874);
    float _888 = _864 * _864;
    float _890 = _706 * _882;
    float _892 = -_878;
    float _894 = fma(_864, _872, _892);
    float _896 = _706 * _886;
    float _898 = fma(_858, _888, _840);
    float _900 = fma(_704, _884, _890);
    float _902 = fma(_864, _872, _878);
    float _904 = fma(_704, _894, _896);
    float _906 = -_874;
    float _908 = fma(_864, _876, _906);
    float _910 = fma(_708, _902, _900);
    float _912 = fma(_708, _898, _904);
    float _914 = _298 + _910;
    float _916 = _300 + _912;
    float _918 = fma(_868, _876, _840);
    float _920 = fma(_868, _872, _870);
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _924 = _914 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _928 = _916 + _926;
    float _930 = _706 * _918;
    float _932 = _924 * _924;
    float _934 = _928 * _928;
    float _936 = fma(_704, _920, _930);
    float _938 = _932 + _934;
    float _940 = fma(_708, _908, _936);
    float _942 = sqrt(_938);
    float _944 = _296 + _940;
    bool _946 = _942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _948 = _930;
    float _950 = _918;
    float _952 = _940;
    float _954 = _914;
    float _956 = _872;
    if (!_946)
    {
        _948 = _934;
    }
    float _958 = _948;
    float _960 = _958;
    if (!_946)
    {
        _748 = _932;
    }
    float _962 = _748;
    float _964 = _962;
    if (!_946)
    {
        _950 = _916;
    }
    float _966 = _950;
    float _968 = _966;
    if (!_946)
    {
        _952 = _944;
    }
    float _970 = _952;
    bool _972 = !_946;
    float _974 = _970;
    if (!_972)
    {
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _980 = _942 + _978;
        float _982 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = rsqrt(_938);
        float _986 = _980 * _976;
        float _988 = _986 * 0.15915493667125701904296875;
        float _990 = _988 * 6.283185482025146484375;
        float _992 = sin(_990);
        float _994 = _988 * 6.283185482025146484375;
        float _996 = cos(_994);
        float _998 = fma(_992, _982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1000 = _984 * _998;
        float _1002 = _996 + (-1.0);
        float _1004 = _924 * _1000;
        float _1006 = _928 * _1000;
        float _1008 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = _1004 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1012 = _1004 * _1004;
        float _1014 = fma(_944, _996, _1008);
        float _1016 = _1006 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1018 = _1006 * _1006;
        _974 = _1014;
        _964 = _1012;
        _960 = _1018;
        _954 = _1010;
        _968 = _1016;
    }
    float _1020 = _974;
    float _1022 = _964;
    float _1024 = _960;
    float _1026 = _954;
    float _1028 = _968;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1032 = _1020 + _1030;
    out.m_71.x = _728;
    out.m_71.y = _732;
    out.m_71.z = _736;
    float _1034 = fma(_1032, _1032, _1022);
    out.m_73.x = _738;
    out.m_73.y = _744;
    out.m_73.z = _716;
    float _1036 = _1034 + _1024;
    out.m_75.x = _642;
    out.m_75.y = _644;
    out.m_75.z = _648;
    float _1038 = sqrt(_1036);
    bool _1040 = _1038 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1042 = isnan(_1038);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1048 = _1044 || _1046;
    float _1050 = _1034;
    float _1052 = _1032;
    if (!_1048)
    {
        _1050 = 1.0;
    }
    float _1054 = _1050;
    bool _1056 = !_1048;
    float _1058 = _1054;
    if (!_1056)
    {
        bool _1060 = _1038 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1062 = isnan(_1038);
        bool _1064 = _1060 || _1062;
        bool _1066 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1068 = _1064 || _1066;
        if (!_1068)
        {
            float _1070 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1072 = _1038 + _1070;
            float _1074 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1076 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1074;
            float _1078 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1080 = _1078 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1082 = 1.0 / _1076;
            float _1084 = _1072 * _1082;
            float _1086 = fma(_1084, _1080, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1058 = _1086;
            _1088 = true;
        }
        else
        {
            bool _1090 = _1038 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1092 = isnan(_1038);
            bool _1094 = _1090 || _1092;
            bool _1096 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1098 = _1094 || _1096;
            if (!_1098)
            {
                float _1100 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1102 = _1038 + _1100;
                float _1104 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1106 = _1104 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1110 = _1108 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1112 = 1.0 / _1106;
                float _1114 = _1102 * _1112;
                float _1116 = fma(_1114, _1110, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1058 = _1116;
                _1088 = true;
            }
            else
            {
                _1058 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1088 = false;
    float _1118 = _1058;
    float _1120 = -_488;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _1124 = -_490;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _1128 = -_564;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _1132 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1134 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1136 = _1020 + _1134;
    bool _1138 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan(0.5);
    bool _1146 = _1142 || _1144;
    float _1148 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1132);
    float _1150 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1148);
    bool _1154 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan(0.5);
    bool _1162 = _1158 || _1160;
    float _1164 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1166 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1150);
    float _1168 = 1.0 / _1164;
    float _1170 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1166);
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1174 = _1172 + _1164;
    float _1176 = fma(_1136, _1118, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1178 = _1174 * _1168;
    float _1180 = _1178 * 0.5;
    float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1184 = _1026 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1188 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1186);
    float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1192 = _1028 + _1190;
    float _1194 = fma(_1184, _1118, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1196 = -_488;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1176);
    float _1200 = fma(_1192, _1118, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1202 = 1.0 / _1188;
    float _1204 = -_490;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1194);
    float _1208 = _1198;
    float _1210 = _1206;
    float _1212 = _1136;
    float _1214 = _1126;
    if (_1162)
    {
        _606 = 1.0;
    }
    float _1216 = _606;
    float _1218 = -_564;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1222 = _1220;
    float _1224 = _1216;
    if (!_1146)
    {
        float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1228 = _1122 + _1226;
        float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1232 = _1126 + _1230;
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1236 = -_300;
        float _1238 = _1236 + _1200;
        float _1240 = _1228 * _1228;
        float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1244 = _1130 + _1242;
        float _1246 = fma(_1232, _1232, _1240);
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = fma(_1244, _1244, _1246);
        float _1252 = sqrt(_1250);
        float _1254 = 1.0 / _646;
        float _1256 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1258 = precise::min(_1252, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1260 = _1258 * _1234;
        float _1262 = _1260 * _1254;
        float _1264 = -_296;
        float _1266 = _1264 + _1176;
        float _1268 = -_298;
        float _1270 = _1268 + _1194;
        float _1272 = _1256 * _1262;
        float _1274 = _1238 * _1262;
        float _1276 = fma(_1266, _1272, _1122);
        float _1278 = fma(_1270, _1272, _1126);
        float _1280 = fma(_1256, _1274, _1130);
        _1208 = _1276;
        _1210 = _1278;
        _1222 = _1280;
        _608 = _1262;
    }
    float _1282 = _1208;
    float _1284 = _1210;
    float _1286 = _1222;
    float _1288 = _608;
    float _1290 = _1288;
    if (_1162)
    {
        _1212 = 1.0;
    }
    float _1292 = _1212;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1296 = _1202 * _1294;
    float _1298 = _1292;
    if (!_1162)
    {
        float _1300 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1302 = _1300 * 0.15915493667125701904296875;
        float _1304 = _1302 * 6.283185482025146484375;
        float _1306 = cos(_1304);
        float _1308 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1310 = _1308 * 0.15915493667125701904296875;
        float _1312 = _1302 * 6.283185482025146484375;
        float _1314 = sin(_1312);
        float _1316 = 1.0 / _1306;
        float _1318 = _1310 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = _1314 * _1316;
        float _1324 = _1310 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1330 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1328;
        float _1332 = _1320 * _1322;
        float _1334 = 1.0 / _1330;
        float _1336 = 1.0 / _1332;
        float _1338 = _1326 * _1336;
        float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1342 = fma(_1296, _1338, _1340);
        float _1344 = _1342 * _1334;
        float _1346 = precise::clamp(_1344, 0.0, 1.0);
        _750 = _1310;
        _1290 = _1336;
        _1224 = _1346;
    }
    float _1348 = _750;
    float _1350 = _1290;
    float _1352 = _1224;
    float _1354 = _1350;
    float _1356 = _1348;
    if (!_1162)
    {
        float _1358 = in.m_77.w;
        bool _1360 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 1;
        bool _1362 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 2;
        bool _1364 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 3;
        int _1366 = as_type<int>(_1358) << 16;
        int _1368 = as_type<int>(_1358) << 8;
        int _1370 = as_type<int>(_1358) << 24;
        int _1372 = _1366 >> 24;
        int _1374 = _1368 >> 24;
        int _1376 = as_type<int>(_1358) >> 24;
        int _1378 = _1370 >> 24;
        float _1380 = float(_1372);
        float _1382 = float(_1374);
        float _1384 = float(_1376);
        float _1386 = _1380 * 0.0078740157186985015869140625;
        float _1388 = float(_1378);
        float _1390 = _1382 * 0.0078740157186985015869140625;
        float _1392 = _1384 * 0.0078740157186985015869140625;
        float _1394 = precise::min(_1386, 1.0);
        float _1396 = _1388 * 0.0078740157186985015869140625;
        float _1398 = precise::min(_1390, 1.0);
        float _1400 = precise::min(_1392, 1.0);
        float _1402 = precise::min(_1396, 1.0);
        float _1404 = precise::max(_1394, -1.0);
        float _1406 = precise::max(_1398, -1.0);
        float _1408 = precise::max(_1400, -1.0);
        float _1410 = precise::max(_1402, -1.0);
        float _1412 = _1410;
        _1354 = (*spvDescriptorSet0.vp_c15)._m0[660].z;
        _1356 = _1408;
        if (_1360)
        {
            _1412 = _1404;
        }
        float _1414 = _1412;
        float _1416 = _1414;
        if (_1362)
        {
            _1416 = _1406;
        }
        float _1418 = _1416;
        float _1420 = _1418;
        if (_1364)
        {
            _1420 = _1408;
        }
        float _1422 = _1420;
        float _1424 = abs(_1422);
        float _1426 = (-0.0) + _1424;
        _1298 = _1426;
    }
    float _1428 = _1354;
    float _1430 = _1356;
    float _1432 = _1298;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1436 = _1282 + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1440 = _1284 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1444 = _1286 + _1442;
    float _1446 = _1436 * _1436;
    float _1448 = fma(_1440, _1440, _1446);
    float _1450 = fma(_1444, _1444, _1448);
    float _1452 = rsqrt(_1450);
    float _1454 = sqrt(_1450);
    float _1456 = _1440 * _1452;
    float _1458 = _1444 * _1452;
    float _1460 = _1436 * _1452;
    float _1462 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1464 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1466 = _1462 * _1462;
    float _1468 = _1464 * _1464;
    float _1470 = _1466 + _1468;
    float _1472 = sqrt(_1470);
    bool _1474 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = _1472 + _1476;
    float _1480 = _1428;
    float _1482 = _1470;
    float _1484 = _1478;
    float _1486 = _1452;
    float _1488 = _1462;
    if (_1474)
    {
        float _1490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1480 = _1490;
    }
    float _1492 = _1480;
    if (_1474)
    {
        float _1494 = rsqrt(_1470);
        _1482 = _1494;
    }
    float _1496 = _1482;
    if (_1474)
    {
        float _1498 = _1478 * _1492;
        _1484 = _1498;
    }
    float _1500 = _1484;
    if (_1474)
    {
        float _1502 = _1500 * 0.15915493667125701904296875;
        _1052 = _1502;
    }
    float _1504 = _1052;
    float _1506 = _1492;
    if (_1474)
    {
        float _1508 = _1504 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        _1506 = _1510;
    }
    float _1512 = _1506;
    float _1514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1516 = precise::max(0.0, _1514);
    float _1518 = _1430;
    float _1520 = _1516;
    if (_1474)
    {
        float _1522 = _1504 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = -_1460;
    float _1530 = -_1516;
    float _1532 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1530);
    float _1534 = _1532;
    if (_1474)
    {
        float _1536 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1536;
    }
    float _1538 = _1520;
    float _1540 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1542 = _1538;
    float _1544 = _1540;
    if (!_1474)
    {
        _1214 = _1466;
    }
    float _1546 = _1214;
    float _1548 = _1512;
    float _1550 = _1546;
    if (_1474)
    {
        float _1552 = fma(_1512, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1548 = _1552;
    }
    float _1554 = _1548;
    float _1556 = floor(_1540);
    float _1558 = _1556;
    if (_1474)
    {
        float _1560 = _1526 + (-1.0);
        _1542 = _1560;
    }
    float _1562 = _1542;
    float _1564 = _1562;
    if (_1474)
    {
        float _1566 = _1496 * _1554;
        _956 = _1566;
    }
    float _1568 = _956;
    if (_1474)
    {
        float _1570 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1486 = _1570;
    }
    float _1572 = _1486;
    float _1574 = _1572;
    if (_1474)
    {
        float _1576 = _1462 * _1568;
        _1488 = _1576;
    }
    float _1578 = _1488;
    if (!_1474)
    {
        _1564 = _1464;
    }
    float _1580 = _1564;
    float _1582 = _1580;
    if (_1474)
    {
        float _1584 = _1464 * _1568;
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (_1474)
    {
        float _1588 = fma(_1532, _1526, _1572);
        _1534 = _1588;
    }
    float _1590 = _1534;
    float _1592 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1474)
    {
        float _1594 = _1578 * _1578;
        _1550 = _1594;
    }
    float _1596 = _1550;
    if (!_1474)
    {
        _1574 = _1468;
    }
    float _1598 = _1574;
    float _1600 = _1598;
    if (_1474)
    {
        float _1602 = _1586 * _1586;
        _1600 = _1602;
    }
    float _1604 = _1600;
    float _1606 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1592);
    float _1608 = fma(_1590, _1590, _1596);
    float _1610 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1606);
    float _1612 = _1608 + _1604;
    float _1614 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1616 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1618 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1622 = rsqrt(_1612);
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1626 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1628 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1618);
    bool _1630 = _1432 != 0.0;
    bool _1632 = isnan(_1432);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan(0.0);
    bool _1638 = _1634 || _1636;
    float _1640 = -_1624;
    float _1642 = fma(_1640, _1620, 1.0);
    float _1644 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1646 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1626);
    float _1648 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1650 = floor(_1614);
    float _1652 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1644);
    float _1654 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1656 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1652);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1660 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1658);
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1666 = _1622 * _1578;
    float _1668 = _1622 * _1590;
    float _1670 = -_1662;
    float _1672 = _1670 + 1.0;
    float _1674 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1676 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1678 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1680 = abs(_1672);
    float _1682 = log2(_1680);
    float _1684 = _1622 * _1586;
    float _1686 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1676);
    float _1688 = -_1678;
    float _1690 = fma(_1668, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1688);
    float _1692 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1694 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1696 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1686);
    float _1698 = -_1684;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1690);
    float _1702 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1704 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1696);
    float _1706 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1694);
    float _1708 = log2(_1642);
    float _1710 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1702);
    float _1712 = fma(_1700, -0.5, 0.5);
    float _1714 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1706);
    float _1716 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1718 = fma(_1700, 0.5, 0.5);
    float _1720 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1710);
    float _1722 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1714);
    float _1724 = 1.0 / _1704;
    float _1726 = fma(_1718, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1728 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1720);
    float _1730 = -_1556;
    float _1732 = _1540 + _1730;
    float _1734 = _1728;
    float _1736 = _1704;
    if (_1638)
    {
        _1558 = _1722;
    }
    float _1738 = _1558;
    float _1740 = fma(_1718, _1726, -0.212114393711090087890625);
    float _1742 = -_1650;
    float _1744 = _1614 + _1742;
    float _1746 = _1738;
    if (_1638)
    {
        _1544 = _1728;
    }
    float _1748 = _1544;
    float _1750 = sqrt(_1712);
    float _1752 = _1748;
    if (!_1638)
    {
        _1746 = 0.0;
        _1752 = 0.0;
    }
    float _1754 = _1746;
    float _1756 = _1752;
    float _1758 = _1668 + 1.0;
    float _1760 = _1708 * 0.693147182464599609375;
    float _1762 = exp2(_1716);
    float _1764 = _1724 * _1754;
    float _1766 = _1724 * _1756;
    float2 _5037 = float2(_1732, _1744);
    float _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5037, float2(0.0), isnan(_5037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5037, float2(0.0), isnan(_5037)), level(0.0)).x;
    float _1770 = fma(_1718, _1740, 1.570728778839111328125);
    float _1772 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1774 = fma(_1764, 0.5, 0.5);
    float _1776 = fma(_1766, -0.5, 0.5);
    float _1778 = _1750 * 0.636619746685028076171875;
    float3 _5062 = float3(_1774, _1776, _1772);
    float _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5062, float3(0.0), isnan(_5062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5062, float3(0.0), isnan(_5062)), level(0.0)).x;
    float _1782 = -_1668;
    float _1784 = fma(_1762, _1758, _1782);
    float _1786 = -_1770;
    float _1788 = fma(_1778, _1786, 1.0);
    float _1790 = fma(_1784, 0.5, 0.5);
    float3 _5086 = float3(_1774, _1776, _1772);
    float4 _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5086, float3(0.0), isnan(_5086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5086, float3(0.0), isnan(_5086)), level(0.0)).xyzw;
    float _1795 = _1793.x;
    float _1797 = _1793.y;
    float _1799 = _1793.z;
    float _1801 = _1793.w;
    float2 _5102 = float2(_1788, _1790);
    float3 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5102, float2(0.0), isnan(_5102)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5102, float2(0.0), isnan(_5102)), level(0.0)).xyz;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = abs(_1296);
    float _1815 = log2(_1813);
    float _1817 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1819 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1821 = _1296 <= 8000.0;
    bool _1823 = isnan(_1296);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(8000.0);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1817);
    float _1835 = in.m_77.x;
    float _1837 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1839 = exp2(_1819);
    float _1841 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1833);
    float _1843 = _1837 * _1432;
    out.m_79.x = _1284;
    out.m_79.y = _1282;
    out.m_79.z = _1286;
    bool _1845 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1847 = isnan(_1454);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1853 = _1849 || _1851;
    float _1855 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1841);
    float _1857 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _1722;
    out.gl_Position.y = _1728;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1704;
    float _1859 = exp2(_1857);
    float _1861 = -_1839;
    float _1863 = _1861 + 1.0;
    float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1867 = _1855;
    float _1869 = 0.0;
    float _1871 = 0.0;
    if (!_1853)
    {
        _1734 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1873 = _1734;
    float _1875 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = _1855 + _1704;
    float _1881 = _1873;
    float _1883 = _1873;
    if (!_1853)
    {
        _1867 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1885 = _1867;
    float _1887 = fma(_1877, -2.0, 3.0);
    float _1889 = _1877 * _1877;
    float _1891 = _1879 * 0.5;
    float _1893 = _1889 * _1887;
    float _1895 = -_1893;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1893);
    float _1901 = _1897;
    float _1903 = _1885;
    float _1905 = _1885;
    if (!_1638)
    {
        _1901 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1907 = _1901;
    float _1909 = _1831 * _1899;
    out.m_81.z = _1891;
    out.m_81.w = _1704;
    int _1911 = as_type<int>(_1907);
    if (!_1853)
    {
        _1736 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1913 = _1736;
    float _1915 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1917 = _1913;
    float _1919 = _1913;
    if (!_1638)
    {
        float _1921 = _1907 * 5.0;
        _1911 = as_type<int>(_1921);
    }
    int _1923 = _1911;
    float _1925 = as_type<float>(_1923);
    if (!_1638)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5311 = as_type<float>(_1923);
        out.gl_Position.z = _5311;
    }
    if (_1638)
    {
        _1925 = _1843;
    }
    float _1927 = _1925;
    float _1929 = _1927;
    if (!_1638)
    {
        _1929 = 0.0;
    }
    float _1931 = _1929;
    if (!_1853)
    {
        _1869 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1933 = _1869;
    float _1935 = _1933;
    float _1937 = _1933;
    if (!_1853)
    {
        _1871 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1939 = _1871;
    float _1941 = -_1768;
    float _1943 = _1941 + 1.0;
    float _1945 = _1943 * _1915;
    float _1947 = precise::clamp(_1945, 0.0, 1.0);
    float _1949 = _1865 * _1780;
    float _1951 = -_1947;
    float _1953 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1955 = -_1865;
    float _1957 = _1955 + 1.0;
    float _1959 = _1953 * _1835;
    float _1961 = _1959 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1963 = _1801 * _1949;
    out.m_83.x = _1961;
    float _1965 = _1811 * _1949;
    float _1967 = fma(_1807, _1963, _1795);
    float _1969 = fma(_1809, _1963, _1797);
    float _1971 = _1801 * _1957;
    float _1973 = fma(_1801, _1965, _1799);
    float _1975 = _1963;
    float _1977 = _1939;
    float _1979 = _1939;
    if (!_1853)
    {
        _1975 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1981 = _1975;
    out.m_85.x = _1967;
    out.m_85.y = _1969;
    out.m_85.z = _1973;
    out.m_85.w = _1971;
    bool _1983 = !_1853;
    float _1985 = _1981;
    float _1987 = _1981;
    if (!_1983)
    {
        bool _1989 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1991 = isnan(_1454);
        bool _1993 = _1989 || _1991;
        bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1997 = _1993 || _1995;
        if (!_1997)
        {
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2001 = _1454 + _1999;
            float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2005 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2003;
            float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2011 = 1.0 / _2005;
            float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2017 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2019 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2027 = _2025 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2029 = _2001 * _2011;
            float _2031 = precise::clamp(_2029, 0.0, 1.0);
            float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2037 = fma(_2031, _2009, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2039 = fma(_2031, _2035, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2041 = fma(_2031, _2015, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2043 = fma(_2031, _2019, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2045 = fma(_2031, _2023, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2047 = fma(_2031, _2027, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1979 = _2041;
            _1883 = _2045;
            _1937 = _2037;
            _1905 = _2043;
            _1919 = _2039;
            _1987 = _2047;
            _2049 = true;
        }
        else
        {
            bool _2051 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2053 = isnan(_1454);
            bool _2055 = _2051 || _2053;
            bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2059 = _2055 || _2057;
            if (!_2059)
            {
                _1935 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2061 = _1935;
            _1937 = _2061;
            if (!_2059)
            {
                _1977 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2063 = _1977;
            _1979 = _2063;
            if (!_2059)
            {
                _1917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2065 = _1917;
            _1919 = _2065;
            if (!_2059)
            {
                _1903 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2067 = _1903;
            _1905 = _2067;
            if (!_2059)
            {
                _1881 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2069 = _1881;
            _1883 = _2069;
            if (!_2059)
            {
                _1985 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2071 = _1985;
            bool _2073 = !_2059;
            _1987 = _2071;
            if (!_2073)
            {
                bool _2075 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2077 = isnan(_1454);
                bool _2079 = _2075 || _2077;
                bool _2081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2083 = _2079 || _2081;
                if (!_2083)
                {
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2087 = _1454 + _2085;
                    float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2091 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2089;
                    float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2097 = 1.0 / _2091;
                    float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2115 = _2087 * _2097;
                    float _2117 = precise::clamp(_2115, 0.0, 1.0);
                    float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2121 = _2119 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2123 = fma(_2117, _2095, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2125 = fma(_2117, _2121, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2127 = fma(_2117, _2101, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2129 = fma(_2117, _2105, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2131 = fma(_2117, _2109, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2133 = fma(_2117, _2113, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1979 = _2127;
                    _1883 = _2131;
                    _1937 = _2123;
                    _1905 = _2129;
                    _1919 = _2125;
                    _1987 = _2133;
                    _2049 = true;
                }
                else
                {
                    _1979 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1883 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1937 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1905 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1987 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2049 = false;
    float _2135 = _1979;
    float _2137 = _1883;
    float _2139 = _1937;
    float _2141 = _1905;
    float _2143 = _1919;
    float _2145 = _1987;
    float _2147 = fma(_644, -0.5, 0.5);
    float _2149 = precise::clamp(_2147, 0.0, 1.0);
    float _2151 = -_2135;
    float _2153 = _2151 + _2137;
    float _2155 = -_2139;
    float _2157 = _2155 + _2141;
    float _2159 = fma(_2149, _2153, _2135);
    out.m_87.x = 0.0;
    float _2161 = fma(_2149, _2157, _2139);
    float _2163 = -_2143;
    float _2165 = _2163 + _2145;
    float _2167 = _2159 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    bool _2169 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2171 = fma(_2149, _2165, _2143);
    float _2173 = fma(_2161, 0.298911988735198974609375, _2167);
    float _2175 = _1931 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2177 = _1352 > 0.0;
    bool _2179 = isnan(_1352);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(0.0);
    bool _2185 = _2181 || _2183;
    float _2187 = fma(_2171, 0.114477999508380889892578125, _2173);
    out.m_89.x = 0.0;
    float _2189 = -_2187;
    float _2191 = _2161 + _2189;
    out.m_83.w = _2175;
    float _2193 = -_2187;
    float _2195 = _2159 + _2193;
    float _2197 = fma(_2195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2187);
    float _2199 = -_2187;
    float _2201 = _2171 + _2199;
    float _2203 = fma(_2191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2187);
    float _2205 = fma(_2201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2187);
    bool _2207 = !_2169;
    if (!_2207)
    {
        float _2209 = -_1282;
        float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2213 = -_1284;
        float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2217 = -_1286;
        float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2221 = _2211 * _2211;
        float _2223 = fma(_2215, _2215, _2221);
        float _2225 = fma(_2219, _2219, _2223);
        float _2227 = rsqrt(_2225);
        float _2229 = _2211 * _2227;
        float _2231 = _2215 * _2227;
        float _2233 = _2219 * _2227;
        float _2235 = sqrt(_2225);
        float _2237 = -_1460;
        float _2239 = _2237 + _2229;
        float _2241 = -_1456;
        float _2243 = _2241 + _2231;
        float _2245 = -_1458;
        float _2247 = _2245 + _2233;
        float _2249 = _2239 * _2239;
        float _2251 = fma(_2243, _2243, _2249);
        float _2253 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2255 = precise::clamp(_2253, 0.0, 1.0);
        float _2257 = fma(_2247, _2247, _2251);
        float _2259 = _2255 * _2255;
        float _2261 = -_2235;
        float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2265 = _2259 + (-1.0);
        float _2267 = rsqrt(_2257);
        float _2269 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2271 = precise::clamp(_2269, 0.0, 1.0);
        float _2273 = abs(_2271);
        float _2275 = log2(_2273);
        float _2277 = _2239 * _2267;
        float _2279 = _2243 * _2267;
        float _2281 = _2247 * _2267;
        float _2283 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2285 = _644 * _2277;
        float _2287 = _644 * _2229;
        float _2289 = fma(_642, _2279, _2285);
        float _2291 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2293 = fma(_642, _2231, _2287);
        float _2295 = fma(_648, _2281, _2289);
        float _2297 = precise::clamp(_2295, 0.0, 1.0);
        float _2299 = fma(_648, _2233, _2293);
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = exp2(_2291);
        float _2305 = _2297 * _2297;
        float _2307 = fma(_2305, _2265, 1.0);
        float _2309 = -_2229;
        float _2311 = -_2283;
        float _2313 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2311);
        float _2315 = _2307 * _2307;
        float _2317 = -_2233;
        float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2313);
        float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2323 = _2319 + _2321;
        float _2325 = 1.0 / _2315;
        float _2327 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2329 = precise::clamp(_2327, 0.0, 1.0);
        float _2331 = _2303 * _2329;
        float _2333 = _2301 * _2331;
        float _2335 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2337 = _2259 * _2325;
        float _2339 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2341 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2343 = _2333 * _2337;
        out.m_87.x = _2335;
        out.m_87.y = _2339;
        out.m_87.z = _2341;
        float _2345 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2347 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2349 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2345;
        out.m_89.y = _2347;
        out.m_89.z = _2349;
    }
    out.m_91.x = _2203;
    out.m_91.y = _2197;
    out.m_91.z = _2205;
    if (_2185)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2351 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2351;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2049 = false;
    bool _1088 = false;
    bool _774 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _112 = int(_110);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2407 = as_type<float>(_126);
        out.gl_Position.z = _2407;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2471 = as_type<float>(_160);
        out.gl_Position.z = _2471;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = 1.0 / _132;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _136 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _200 = in.m_48.x;
    float _202 = in.m_48.y;
    float _204 = in.m_48.z;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _208 = fma(_206, 10.0, 10.0);
    float _210 = precise::max(_166, 0.949999988079071044921875);
    float _212 = fma(_166, 0.2000000476837158203125, 1.0);
    float _214 = in.m_55.y;
    float _216 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _218 = in.m_59.x;
    float _220 = in.m_59.y;
    float _222 = in.m_59.z;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _226 = _224 != 0;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _230 = _228 != 0;
    float _232 = _216 * _208;
    float _234 = in.m_61.x;
    float _236 = fma(_192, 2.0, -1.0);
    float _238 = fma(_194, 2.0, -1.0);
    float _240 = fma(_196, 2.0, -1.0);
    float _242 = in.m_61.y;
    float _244 = precise::min(_210, 1.0);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = _202 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _252 = 0.0;
    float _254 = _234;
    float _256 = _242;
    if (_226)
    {
        float _258 = in.m_55.x;
        _252 = _258;
    }
    float _260 = _252;
    float _262 = fma(_244, -19.999996185302734375, 19.999996185302734375);
    float _264 = 1.0 / _248;
    float _266 = _202 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _268 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[5].x, _250);
    float _270 = _202 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _272 = _214 > 0.5;
    bool _274 = _272 && _230;
    float _276 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[4].x, _266);
    float _278 = _236 * _212;
    float _280 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[6].x, _270);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = _190 + _282;
    float _286 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].z, _268);
    float _288 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].z, _276);
    float _290 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].z, _280);
    float _292 = -_236;
    float _294 = _292 + _218;
    float _296 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _298 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _300 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _302 = _284 * _264;
    float _304 = -_296;
    float _306 = _304 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _308 = -_298;
    float _310 = _308 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _312 = -_300;
    float _314 = _312 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _316 = _306 * _306;
    bool _318 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_190);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_240;
    float _332 = _330 + _222;
    float _334 = fma(_310, _310, _316);
    bool _336 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_190);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_328;
    float _350 = _348 + 1.0;
    float _352 = fma(_314, _314, _334);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = _346 * _350;
    float _364 = rsqrt(_352);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _366;
    float _370 = fma(_360, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _372 = _260 > 0.5;
    bool _374 = _372 && _226;
    float _376 = _232 * 0.15915493667125701904296875;
    float _378 = fma(_356, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _380 = fma(_368, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = _370 * _362;
    float _384 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _386 = _296 + _384;
    float _388 = _378 * _362;
    float _390 = _380 * _362;
    float _392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _394 = _298 + _392;
    float _396 = _386 * _386;
    float _398 = _376 * 6.283185482025146484375;
    float _400 = sin(_398);
    float _402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _404 = _300 + _402;
    float _406 = _314 * _364;
    float _408 = _306 * _364;
    float _410 = _310 * _364;
    float _412 = fma(_394, _394, _396);
    float _414 = _406 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _416 = _408 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _418 = -_346;
    float _420 = _418 + 1.0;
    float _422 = fma(_404, _404, _412);
    float _424 = -_414;
    float _426 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[10].y, _424);
    float _428 = -_416;
    float _430 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[9].y, _428);
    float _432 = _410 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _434 = _412;
    if (!_226)
    {
        _434 = _234;
    }
    float _436 = _434;
    float _438 = _426 * _426;
    float _440 = rsqrt(_422);
    float _442 = -_432;
    float _444 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[8].y, _442);
    float _446 = fma(_400, 0.150000035762786865234375, 1.0499999523162841796875);
    float _448 = fma(_430, _430, _438);
    float _450 = _436;
    if (_374)
    {
        float _452 = -_234;
        float _454 = _452 + 1.0;
        _254 = _454;
    }
    float _456 = _254;
    float _458 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _388);
    float _460 = _446 * _262;
    float _462 = fma(_444, _444, _448);
    float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_226)
    {
        _450 = _456;
    }
    float _466 = _450;
    float _468 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    if (_274)
    {
        float _470 = -_242;
        float _472 = _470 + 1.0;
        _256 = _472;
    }
    float _474 = _256;
    float _476 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _478 = -_238;
    float _480 = _478 + _220;
    float _482 = _466 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _484 = _474 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _486 = rsqrt(_462);
    float _488 = _386 * _440;
    float _490 = _394 * _440;
    float _492 = _484 * _198;
    float _494 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].y, _468);
    float _496 = -_488;
    float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _386);
    float _500 = -_490;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _394);
    float _504 = _482 * _464;
    float _506 = _498 * _498;
    float _508 = in.m_63.x;
    float _510 = in.m_63.y;
    float _512 = in.m_63.z;
    float _514 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].x, _458);
    float _516 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].z, _476);
    float _518 = fma(_480, _460, _238);
    float _520 = fma(_502, _502, _506);
    float _522 = fma(_294, _460, _278);
    float _524 = _430 * _486;
    float _526 = _444 * _486;
    float _528 = in.m_65.x;
    float _530 = in.m_65.y;
    float _532 = in.m_65.z;
    float _534 = _426 * _486;
    float _536 = _524 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _538 = _518 != 0.0;
    bool _540 = isnan(_518);
    bool _542 = _538 || _540;
    bool _544 = isnan(0.0);
    bool _546 = _542 || _544;
    float _548 = fma(_332, _460, _240);
    out.m_67.x = _504;
    out.m_67.y = _492;
    float _550 = -_536;
    float _552 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[8].y, _550);
    float _554 = _526 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _556 = _534 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _558 = _522 == 0.0;
    bool _560 = !_546;
    bool _562 = _558 && _560;
    float _564 = _404 * _440;
    float _566 = -_554;
    float _568 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[10].y, _566);
    float _570 = -_556;
    float _572 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[9].y, _570);
    bool _574 = _548 == 0.0;
    bool _576 = _574 && _562;
    float _578 = -_564;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _404);
    float _582 = _552 * _552;
    float _584 = _514 * _508;
    float _586 = _494 * _510;
    float _588 = fma(_580, _580, _520);
    float _590 = fma(_568, _568, _582);
    out.m_69.x = _522;
    out.m_69.y = _518;
    out.m_69.z = _548;
    float _592 = _516 * _512;
    float _594 = fma(_572, _572, _590);
    float _596 = sqrt(_588);
    float _598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _522);
    float _600 = _530;
    float _602 = _528;
    float _604 = _532;
    float _606 = _490;
    float _608 = _488;
    if (!_576)
    {
        float _610 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[17].y, _530);
        _600 = _610;
    }
    float _612 = _600;
    if (!_576)
    {
        float _614 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _602 = _614;
    }
    float _616 = _602;
    if (!_576)
    {
        float _618 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[17].y, _532);
        _604 = _618;
    }
    float _620 = _604;
    float _622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _518);
    float _624 = _612 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _626 = _612 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _628 = rsqrt(_594);
    float _630 = _612 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _632 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[8].x, _624);
    float _634 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[9].x, _626);
    float _636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _548);
    float _638 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[10].x, _630);
    float _640 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _642 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[8].z, _632);
    float _644 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[9].z, _634);
    float _646 = _440 * _596;
    float _648 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[10].z, _638);
    float _650 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _654 = _640 * _646;
    float _656 = _552 * _628;
    float _658 = _568 * _628;
    float _660 = _572 * _628;
    float _662 = _650 * _646;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _666 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _668 = _654 * _598;
    float _670 = _662 * _622;
    float _672 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[8].z, _664);
    float _674 = _666 * _646;
    float _676 = _670 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _678 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[10].z, _672);
    float _680 = _670 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _682 = _670 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _684 = _674 * _636;
    float _686 = abs(_678);
    float _688 = -_686;
    float _690 = _688 + 1.0;
    float _692 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[8].x, _676);
    float _694 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[9].x, _680);
    float _696 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].x, _682);
    float _698 = abs(_678);
    float _700 = fma(_698, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _702 = as_type<int>(_690) + (-218103808);
    float _704 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].z, _692);
    float _706 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[9].z, _694);
    float _708 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[10].z, _696);
    bool _710 = uint(_702) >= 1920991232u;
    float _712 = abs(_678);
    float _714 = fma(_712, _700, -0.212114393711090087890625);
    float _716 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = abs(_678);
    float _720 = fma(_718, _714, 1.570728778839111328125);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _728 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _732 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _736 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _740 = _678 < 0.0;
    float _742 = float(_740);
    float _744 = _734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _746 = !_710;
    float _748 = _704;
    float _750 = _646;
    float _772;
    if (!_746)
    {
        int _752 = as_type<int>(_690);
        int _754 = as_type<int>(_596);
        int _756 = as_type<int>(_584);
        int _758 = 4080;
        int _760;
        int _762;
        int _764;
        int _766;
        int _768;
        int _770;
        _104(_752, _754, _756, _758, _760, _762, _764, _766, _768, _770, out.gl_Position, out.gl_PointSize);
        _772 = as_type<float>(_764);
        _774 = true;
    }
    else
    {
        float _776 = rsqrt(_690);
        float _778 = _690 * _776;
        float _780 = _776 * 0.5;
        float _782 = -_778;
        float _784 = 0.0 + _782;
        float _786 = fma(_780, _784, 0.5);
        float _788 = fma(_778, _786, _778);
        float _790 = -_788;
        float _792 = 0.0 + _790;
        float _794 = fma(_788, _792, _690);
        float _796 = fma(_780, _794, _788);
        _772 = _796;
    }
    _774 = false;
    float _798 = _772;
    float _800 = _660 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _802 = _656 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _804 = _720 * _798;
    float _806 = -_800;
    float _808 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[10].z, _806);
    float _810 = _658 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _812 = -_802;
    float _814 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[9].z, _812);
    float _816 = _808 * _808;
    float _818 = -_810;
    float _820 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[8].z, _818);
    float _822 = fma(_814, _814, _816);
    float _824 = _742 * 2.0;
    float _826 = fma(_820, _820, _822);
    float _828 = -_824;
    float _830 = fma(_804, _828, _804);
    float _832 = rsqrt(_826);
    float _834 = fma(_742, 3.1415927410125732421875, _830);
    float _836 = _834 * 0.15915493667125701904296875;
    float _838 = _836 * 6.283185482025146484375;
    float _840 = cos(_838);
    float _842 = _808 * _832;
    float _844 = _814 * _832;
    float _846 = _820 * _832;
    float _848 = _836 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = _842 * _842;
    float _854 = fma(_844, _844, _852);
    float _856 = -_840;
    float _858 = _856 + 1.0;
    float _860 = fma(_846, _846, _854);
    float _862 = rsqrt(_860);
    float _864 = _846 * _862;
    float _866 = _844 * _862;
    float _868 = _842 * _862;
    float _870 = _864 * _850;
    float _872 = _866 * _858;
    float _874 = _866 * _850;
    float _876 = _868 * _858;
    float _878 = _868 * _850;
    float _880 = -_870;
    float _882 = fma(_868, _872, _880);
    float _884 = fma(_866, _872, _840);
    float _886 = fma(_864, _876, _874);
    float _888 = _864 * _864;
    float _890 = _706 * _882;
    float _892 = -_878;
    float _894 = fma(_864, _872, _892);
    float _896 = _706 * _886;
    float _898 = fma(_858, _888, _840);
    float _900 = fma(_704, _884, _890);
    float _902 = fma(_864, _872, _878);
    float _904 = fma(_704, _894, _896);
    float _906 = -_874;
    float _908 = fma(_864, _876, _906);
    float _910 = fma(_708, _902, _900);
    float _912 = fma(_708, _898, _904);
    float _914 = _298 + _910;
    float _916 = _300 + _912;
    float _918 = fma(_868, _876, _840);
    float _920 = fma(_868, _872, _870);
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _924 = _914 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _928 = _916 + _926;
    float _930 = _706 * _918;
    float _932 = _924 * _924;
    float _934 = _928 * _928;
    float _936 = fma(_704, _920, _930);
    float _938 = _932 + _934;
    float _940 = fma(_708, _908, _936);
    float _942 = sqrt(_938);
    float _944 = _296 + _940;
    bool _946 = _942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _948 = _930;
    float _950 = _918;
    float _952 = _940;
    float _954 = _914;
    float _956 = _872;
    if (!_946)
    {
        _948 = _934;
    }
    float _958 = _948;
    float _960 = _958;
    if (!_946)
    {
        _748 = _932;
    }
    float _962 = _748;
    float _964 = _962;
    if (!_946)
    {
        _950 = _916;
    }
    float _966 = _950;
    float _968 = _966;
    if (!_946)
    {
        _952 = _944;
    }
    float _970 = _952;
    bool _972 = !_946;
    float _974 = _970;
    if (!_972)
    {
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _980 = _942 + _978;
        float _982 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = rsqrt(_938);
        float _986 = _980 * _976;
        float _988 = _986 * 0.15915493667125701904296875;
        float _990 = _988 * 6.283185482025146484375;
        float _992 = sin(_990);
        float _994 = _988 * 6.283185482025146484375;
        float _996 = cos(_994);
        float _998 = fma(_992, _982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1000 = _984 * _998;
        float _1002 = _996 + (-1.0);
        float _1004 = _924 * _1000;
        float _1006 = _928 * _1000;
        float _1008 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = _1004 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1012 = _1004 * _1004;
        float _1014 = fma(_944, _996, _1008);
        float _1016 = _1006 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1018 = _1006 * _1006;
        _974 = _1014;
        _964 = _1012;
        _960 = _1018;
        _954 = _1010;
        _968 = _1016;
    }
    float _1020 = _974;
    float _1022 = _964;
    float _1024 = _960;
    float _1026 = _954;
    float _1028 = _968;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1032 = _1020 + _1030;
    out.m_71.x = _728;
    out.m_71.y = _732;
    out.m_71.z = _736;
    float _1034 = fma(_1032, _1032, _1022);
    out.m_73.x = _738;
    out.m_73.y = _744;
    out.m_73.z = _716;
    float _1036 = _1034 + _1024;
    out.m_75.x = _642;
    out.m_75.y = _644;
    out.m_75.z = _648;
    float _1038 = sqrt(_1036);
    bool _1040 = _1038 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1042 = isnan(_1038);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1048 = _1044 || _1046;
    float _1050 = _1034;
    float _1052 = _1032;
    if (!_1048)
    {
        _1050 = 1.0;
    }
    float _1054 = _1050;
    bool _1056 = !_1048;
    float _1058 = _1054;
    if (!_1056)
    {
        bool _1060 = _1038 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1062 = isnan(_1038);
        bool _1064 = _1060 || _1062;
        bool _1066 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1068 = _1064 || _1066;
        if (!_1068)
        {
            float _1070 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1072 = _1038 + _1070;
            float _1074 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1076 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1074;
            float _1078 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1080 = _1078 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1082 = 1.0 / _1076;
            float _1084 = _1072 * _1082;
            float _1086 = fma(_1084, _1080, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1058 = _1086;
            _1088 = true;
        }
        else
        {
            bool _1090 = _1038 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1092 = isnan(_1038);
            bool _1094 = _1090 || _1092;
            bool _1096 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1098 = _1094 || _1096;
            if (!_1098)
            {
                float _1100 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1102 = _1038 + _1100;
                float _1104 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1106 = _1104 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1110 = _1108 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1112 = 1.0 / _1106;
                float _1114 = _1102 * _1112;
                float _1116 = fma(_1114, _1110, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1058 = _1116;
                _1088 = true;
            }
            else
            {
                _1058 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1088 = false;
    float _1118 = _1058;
    float _1120 = -_488;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _1124 = -_490;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _1128 = -_564;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _1132 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1134 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1136 = _1020 + _1134;
    bool _1138 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan(0.5);
    bool _1146 = _1142 || _1144;
    float _1148 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1132);
    float _1150 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1148);
    bool _1154 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan(0.5);
    bool _1162 = _1158 || _1160;
    float _1164 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1166 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1150);
    float _1168 = 1.0 / _1164;
    float _1170 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1166);
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1174 = _1172 + _1164;
    float _1176 = fma(_1136, _1118, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1178 = _1174 * _1168;
    float _1180 = _1178 * 0.5;
    float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1184 = _1026 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1188 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1186);
    float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1192 = _1028 + _1190;
    float _1194 = fma(_1184, _1118, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1196 = -_488;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1176);
    float _1200 = fma(_1192, _1118, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1202 = 1.0 / _1188;
    float _1204 = -_490;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1194);
    float _1208 = _1198;
    float _1210 = _1206;
    float _1212 = _1136;
    float _1214 = _1126;
    if (_1162)
    {
        _606 = 1.0;
    }
    float _1216 = _606;
    float _1218 = -_564;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1222 = _1220;
    float _1224 = _1216;
    if (!_1146)
    {
        float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1228 = _1122 + _1226;
        float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1232 = _1126 + _1230;
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1236 = -_300;
        float _1238 = _1236 + _1200;
        float _1240 = _1228 * _1228;
        float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1244 = _1130 + _1242;
        float _1246 = fma(_1232, _1232, _1240);
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = fma(_1244, _1244, _1246);
        float _1252 = sqrt(_1250);
        float _1254 = 1.0 / _646;
        float _1256 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1258 = precise::min(_1252, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1260 = _1258 * _1234;
        float _1262 = _1260 * _1254;
        float _1264 = -_296;
        float _1266 = _1264 + _1176;
        float _1268 = -_298;
        float _1270 = _1268 + _1194;
        float _1272 = _1256 * _1262;
        float _1274 = _1238 * _1262;
        float _1276 = fma(_1266, _1272, _1122);
        float _1278 = fma(_1270, _1272, _1126);
        float _1280 = fma(_1256, _1274, _1130);
        _1208 = _1276;
        _1210 = _1278;
        _1222 = _1280;
        _608 = _1262;
    }
    float _1282 = _1208;
    float _1284 = _1210;
    float _1286 = _1222;
    float _1288 = _608;
    float _1290 = _1288;
    if (_1162)
    {
        _1212 = 1.0;
    }
    float _1292 = _1212;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1296 = _1202 * _1294;
    float _1298 = _1292;
    if (!_1162)
    {
        float _1300 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1302 = _1300 * 0.15915493667125701904296875;
        float _1304 = _1302 * 6.283185482025146484375;
        float _1306 = cos(_1304);
        float _1308 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1310 = _1308 * 0.15915493667125701904296875;
        float _1312 = _1302 * 6.283185482025146484375;
        float _1314 = sin(_1312);
        float _1316 = 1.0 / _1306;
        float _1318 = _1310 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = _1314 * _1316;
        float _1324 = _1310 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1330 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1328;
        float _1332 = _1320 * _1322;
        float _1334 = 1.0 / _1330;
        float _1336 = 1.0 / _1332;
        float _1338 = _1326 * _1336;
        float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1342 = fma(_1296, _1338, _1340);
        float _1344 = _1342 * _1334;
        float _1346 = precise::clamp(_1344, 0.0, 1.0);
        _750 = _1310;
        _1290 = _1336;
        _1224 = _1346;
    }
    float _1348 = _750;
    float _1350 = _1290;
    float _1352 = _1224;
    float _1354 = _1350;
    float _1356 = _1348;
    if (!_1162)
    {
        float _1358 = in.m_77.w;
        bool _1360 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 1;
        bool _1362 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 2;
        bool _1364 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 3;
        int _1366 = as_type<int>(_1358) << 16;
        int _1368 = as_type<int>(_1358) << 8;
        int _1370 = as_type<int>(_1358) << 24;
        int _1372 = _1366 >> 24;
        int _1374 = _1368 >> 24;
        int _1376 = as_type<int>(_1358) >> 24;
        int _1378 = _1370 >> 24;
        float _1380 = float(_1372);
        float _1382 = float(_1374);
        float _1384 = float(_1376);
        float _1386 = _1380 * 0.0078740157186985015869140625;
        float _1388 = float(_1378);
        float _1390 = _1382 * 0.0078740157186985015869140625;
        float _1392 = _1384 * 0.0078740157186985015869140625;
        float _1394 = precise::min(_1386, 1.0);
        float _1396 = _1388 * 0.0078740157186985015869140625;
        float _1398 = precise::min(_1390, 1.0);
        float _1400 = precise::min(_1392, 1.0);
        float _1402 = precise::min(_1396, 1.0);
        float _1404 = precise::max(_1394, -1.0);
        float _1406 = precise::max(_1398, -1.0);
        float _1408 = precise::max(_1400, -1.0);
        float _1410 = precise::max(_1402, -1.0);
        float _1412 = _1410;
        _1354 = (*spvDescriptorSet0.vp_c15)._m0[660].z;
        _1356 = _1408;
        if (_1360)
        {
            _1412 = _1404;
        }
        float _1414 = _1412;
        float _1416 = _1414;
        if (_1362)
        {
            _1416 = _1406;
        }
        float _1418 = _1416;
        float _1420 = _1418;
        if (_1364)
        {
            _1420 = _1408;
        }
        float _1422 = _1420;
        float _1424 = abs(_1422);
        float _1426 = (-0.0) + _1424;
        _1298 = _1426;
    }
    float _1428 = _1354;
    float _1430 = _1356;
    float _1432 = _1298;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1436 = _1282 + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1440 = _1284 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1444 = _1286 + _1442;
    float _1446 = _1436 * _1436;
    float _1448 = fma(_1440, _1440, _1446);
    float _1450 = fma(_1444, _1444, _1448);
    float _1452 = rsqrt(_1450);
    float _1454 = sqrt(_1450);
    float _1456 = _1440 * _1452;
    float _1458 = _1444 * _1452;
    float _1460 = _1436 * _1452;
    float _1462 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1464 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1466 = _1462 * _1462;
    float _1468 = _1464 * _1464;
    float _1470 = _1466 + _1468;
    float _1472 = sqrt(_1470);
    bool _1474 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = _1472 + _1476;
    float _1480 = _1428;
    float _1482 = _1470;
    float _1484 = _1478;
    float _1486 = _1452;
    float _1488 = _1462;
    if (_1474)
    {
        float _1490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1480 = _1490;
    }
    float _1492 = _1480;
    if (_1474)
    {
        float _1494 = rsqrt(_1470);
        _1482 = _1494;
    }
    float _1496 = _1482;
    if (_1474)
    {
        float _1498 = _1478 * _1492;
        _1484 = _1498;
    }
    float _1500 = _1484;
    if (_1474)
    {
        float _1502 = _1500 * 0.15915493667125701904296875;
        _1052 = _1502;
    }
    float _1504 = _1052;
    float _1506 = _1492;
    if (_1474)
    {
        float _1508 = _1504 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        _1506 = _1510;
    }
    float _1512 = _1506;
    float _1514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1516 = precise::max(0.0, _1514);
    float _1518 = _1430;
    float _1520 = _1516;
    if (_1474)
    {
        float _1522 = _1504 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = -_1460;
    float _1530 = -_1516;
    float _1532 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1530);
    float _1534 = _1532;
    if (_1474)
    {
        float _1536 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1536;
    }
    float _1538 = _1520;
    float _1540 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1542 = _1538;
    float _1544 = _1540;
    if (!_1474)
    {
        _1214 = _1466;
    }
    float _1546 = _1214;
    float _1548 = _1512;
    float _1550 = _1546;
    if (_1474)
    {
        float _1552 = fma(_1512, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1548 = _1552;
    }
    float _1554 = _1548;
    float _1556 = floor(_1540);
    float _1558 = _1556;
    if (_1474)
    {
        float _1560 = _1526 + (-1.0);
        _1542 = _1560;
    }
    float _1562 = _1542;
    float _1564 = _1562;
    if (_1474)
    {
        float _1566 = _1496 * _1554;
        _956 = _1566;
    }
    float _1568 = _956;
    if (_1474)
    {
        float _1570 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1486 = _1570;
    }
    float _1572 = _1486;
    float _1574 = _1572;
    if (_1474)
    {
        float _1576 = _1462 * _1568;
        _1488 = _1576;
    }
    float _1578 = _1488;
    if (!_1474)
    {
        _1564 = _1464;
    }
    float _1580 = _1564;
    float _1582 = _1580;
    if (_1474)
    {
        float _1584 = _1464 * _1568;
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (_1474)
    {
        float _1588 = fma(_1532, _1526, _1572);
        _1534 = _1588;
    }
    float _1590 = _1534;
    float _1592 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1474)
    {
        float _1594 = _1578 * _1578;
        _1550 = _1594;
    }
    float _1596 = _1550;
    if (!_1474)
    {
        _1574 = _1468;
    }
    float _1598 = _1574;
    float _1600 = _1598;
    if (_1474)
    {
        float _1602 = _1586 * _1586;
        _1600 = _1602;
    }
    float _1604 = _1600;
    float _1606 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1592);
    float _1608 = fma(_1590, _1590, _1596);
    float _1610 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1606);
    float _1612 = _1608 + _1604;
    float _1614 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1616 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1618 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1622 = rsqrt(_1612);
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1626 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1628 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1618);
    bool _1630 = _1432 != 0.0;
    bool _1632 = isnan(_1432);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan(0.0);
    bool _1638 = _1634 || _1636;
    float _1640 = -_1624;
    float _1642 = fma(_1640, _1620, 1.0);
    float _1644 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1646 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1626);
    float _1648 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1650 = floor(_1614);
    float _1652 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1644);
    float _1654 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1656 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1652);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1660 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1658);
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1666 = _1622 * _1578;
    float _1668 = _1622 * _1590;
    float _1670 = -_1662;
    float _1672 = _1670 + 1.0;
    float _1674 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1676 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1678 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1680 = abs(_1672);
    float _1682 = log2(_1680);
    float _1684 = _1622 * _1586;
    float _1686 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1676);
    float _1688 = -_1678;
    float _1690 = fma(_1668, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1688);
    float _1692 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1694 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1696 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1686);
    float _1698 = -_1684;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1690);
    float _1702 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1704 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1696);
    float _1706 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1694);
    float _1708 = log2(_1642);
    float _1710 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1702);
    float _1712 = fma(_1700, -0.5, 0.5);
    float _1714 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1706);
    float _1716 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1718 = fma(_1700, 0.5, 0.5);
    float _1720 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1710);
    float _1722 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1714);
    float _1724 = 1.0 / _1704;
    float _1726 = fma(_1718, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1728 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1720);
    float _1730 = -_1556;
    float _1732 = _1540 + _1730;
    float _1734 = _1728;
    float _1736 = _1704;
    if (_1638)
    {
        _1558 = _1722;
    }
    float _1738 = _1558;
    float _1740 = fma(_1718, _1726, -0.212114393711090087890625);
    float _1742 = -_1650;
    float _1744 = _1614 + _1742;
    float _1746 = _1738;
    if (_1638)
    {
        _1544 = _1728;
    }
    float _1748 = _1544;
    float _1750 = sqrt(_1712);
    float _1752 = _1748;
    if (!_1638)
    {
        _1746 = 0.0;
        _1752 = 0.0;
    }
    float _1754 = _1746;
    float _1756 = _1752;
    float _1758 = _1668 + 1.0;
    float _1760 = _1708 * 0.693147182464599609375;
    float _1762 = exp2(_1716);
    float _1764 = _1724 * _1754;
    float _1766 = _1724 * _1756;
    float2 _5037 = float2(_1732, _1744);
    float _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5037, float2(0.0), isnan(_5037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5037, float2(0.0), isnan(_5037)), level(0.0)).x;
    float _1770 = fma(_1718, _1740, 1.570728778839111328125);
    float _1772 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1774 = fma(_1764, 0.5, 0.5);
    float _1776 = fma(_1766, -0.5, 0.5);
    float _1778 = _1750 * 0.636619746685028076171875;
    float3 _5062 = float3(_1774, _1776, _1772);
    float _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5062, float3(0.0), isnan(_5062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5062, float3(0.0), isnan(_5062)), level(0.0)).x;
    float _1782 = -_1668;
    float _1784 = fma(_1762, _1758, _1782);
    float _1786 = -_1770;
    float _1788 = fma(_1778, _1786, 1.0);
    float _1790 = fma(_1784, 0.5, 0.5);
    float3 _5086 = float3(_1774, _1776, _1772);
    float4 _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5086, float3(0.0), isnan(_5086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5086, float3(0.0), isnan(_5086)), level(0.0)).xyzw;
    float _1795 = _1793.x;
    float _1797 = _1793.y;
    float _1799 = _1793.z;
    float _1801 = _1793.w;
    float2 _5102 = float2(_1788, _1790);
    float3 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5102, float2(0.0), isnan(_5102)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5102, float2(0.0), isnan(_5102)), level(0.0)).xyz;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = abs(_1296);
    float _1815 = log2(_1813);
    float _1817 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1819 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1821 = _1296 <= 8000.0;
    bool _1823 = isnan(_1296);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(8000.0);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1817);
    float _1835 = in.m_77.x;
    float _1837 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1839 = exp2(_1819);
    float _1841 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1833);
    float _1843 = _1837 * _1432;
    out.m_79.x = _1284;
    out.m_79.y = _1282;
    out.m_79.z = _1286;
    bool _1845 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1847 = isnan(_1454);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1853 = _1849 || _1851;
    float _1855 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1841);
    float _1857 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _1722;
    out.gl_Position.y = _1728;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1704;
    float _1859 = exp2(_1857);
    float _1861 = -_1839;
    float _1863 = _1861 + 1.0;
    float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1867 = _1855;
    float _1869 = 0.0;
    float _1871 = 0.0;
    if (!_1853)
    {
        _1734 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1873 = _1734;
    float _1875 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = _1855 + _1704;
    float _1881 = _1873;
    float _1883 = _1873;
    if (!_1853)
    {
        _1867 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1885 = _1867;
    float _1887 = fma(_1877, -2.0, 3.0);
    float _1889 = _1877 * _1877;
    float _1891 = _1879 * 0.5;
    float _1893 = _1889 * _1887;
    float _1895 = -_1893;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1893);
    float _1901 = _1897;
    float _1903 = _1885;
    float _1905 = _1885;
    if (!_1638)
    {
        _1901 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1907 = _1901;
    float _1909 = _1831 * _1899;
    out.m_81.z = _1891;
    out.m_81.w = _1704;
    int _1911 = as_type<int>(_1907);
    if (!_1853)
    {
        _1736 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1913 = _1736;
    float _1915 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1917 = _1913;
    float _1919 = _1913;
    if (!_1638)
    {
        float _1921 = _1907 * 5.0;
        _1911 = as_type<int>(_1921);
    }
    int _1923 = _1911;
    float _1925 = as_type<float>(_1923);
    if (!_1638)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5311 = as_type<float>(_1923);
        out.gl_Position.z = _5311;
    }
    if (_1638)
    {
        _1925 = _1843;
    }
    float _1927 = _1925;
    float _1929 = _1927;
    if (!_1638)
    {
        _1929 = 0.0;
    }
    float _1931 = _1929;
    if (!_1853)
    {
        _1869 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1933 = _1869;
    float _1935 = _1933;
    float _1937 = _1933;
    if (!_1853)
    {
        _1871 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1939 = _1871;
    float _1941 = -_1768;
    float _1943 = _1941 + 1.0;
    float _1945 = _1943 * _1915;
    float _1947 = precise::clamp(_1945, 0.0, 1.0);
    float _1949 = _1865 * _1780;
    float _1951 = -_1947;
    float _1953 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1955 = -_1865;
    float _1957 = _1955 + 1.0;
    float _1959 = _1953 * _1835;
    float _1961 = _1959 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1963 = _1801 * _1949;
    out.m_83.x = _1961;
    float _1965 = _1811 * _1949;
    float _1967 = fma(_1807, _1963, _1795);
    float _1969 = fma(_1809, _1963, _1797);
    float _1971 = _1801 * _1957;
    float _1973 = fma(_1801, _1965, _1799);
    float _1975 = _1963;
    float _1977 = _1939;
    float _1979 = _1939;
    if (!_1853)
    {
        _1975 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1981 = _1975;
    out.m_85.x = _1967;
    out.m_85.y = _1969;
    out.m_85.z = _1973;
    out.m_85.w = _1971;
    bool _1983 = !_1853;
    float _1985 = _1981;
    float _1987 = _1981;
    if (!_1983)
    {
        bool _1989 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1991 = isnan(_1454);
        bool _1993 = _1989 || _1991;
        bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1997 = _1993 || _1995;
        if (!_1997)
        {
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2001 = _1454 + _1999;
            float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2005 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2003;
            float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2011 = 1.0 / _2005;
            float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2017 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2019 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2027 = _2025 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2029 = _2001 * _2011;
            float _2031 = precise::clamp(_2029, 0.0, 1.0);
            float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2037 = fma(_2031, _2009, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2039 = fma(_2031, _2035, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2041 = fma(_2031, _2015, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2043 = fma(_2031, _2019, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2045 = fma(_2031, _2023, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2047 = fma(_2031, _2027, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1979 = _2041;
            _1883 = _2045;
            _1937 = _2037;
            _1905 = _2043;
            _1919 = _2039;
            _1987 = _2047;
            _2049 = true;
        }
        else
        {
            bool _2051 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2053 = isnan(_1454);
            bool _2055 = _2051 || _2053;
            bool _2057 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2059 = _2055 || _2057;
            if (!_2059)
            {
                _1935 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2061 = _1935;
            _1937 = _2061;
            if (!_2059)
            {
                _1977 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2063 = _1977;
            _1979 = _2063;
            if (!_2059)
            {
                _1917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2065 = _1917;
            _1919 = _2065;
            if (!_2059)
            {
                _1903 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2067 = _1903;
            _1905 = _2067;
            if (!_2059)
            {
                _1881 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2069 = _1881;
            _1883 = _2069;
            if (!_2059)
            {
                _1985 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2071 = _1985;
            bool _2073 = !_2059;
            _1987 = _2071;
            if (!_2073)
            {
                bool _2075 = _1454 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2077 = isnan(_1454);
                bool _2079 = _2075 || _2077;
                bool _2081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2083 = _2079 || _2081;
                if (!_2083)
                {
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2087 = _1454 + _2085;
                    float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2091 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2089;
                    float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2097 = 1.0 / _2091;
                    float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2115 = _2087 * _2097;
                    float _2117 = precise::clamp(_2115, 0.0, 1.0);
                    float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2121 = _2119 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2123 = fma(_2117, _2095, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2125 = fma(_2117, _2121, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2127 = fma(_2117, _2101, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2129 = fma(_2117, _2105, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2131 = fma(_2117, _2109, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2133 = fma(_2117, _2113, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1979 = _2127;
                    _1883 = _2131;
                    _1937 = _2123;
                    _1905 = _2129;
                    _1919 = _2125;
                    _1987 = _2133;
                    _2049 = true;
                }
                else
                {
                    _1979 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1883 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1937 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1905 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1987 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2049 = false;
    float _2135 = _1979;
    float _2137 = _1883;
    float _2139 = _1937;
    float _2141 = _1905;
    float _2143 = _1919;
    float _2145 = _1987;
    float _2147 = fma(_644, -0.5, 0.5);
    float _2149 = precise::clamp(_2147, 0.0, 1.0);
    float _2151 = -_2135;
    float _2153 = _2151 + _2137;
    float _2155 = -_2139;
    float _2157 = _2155 + _2141;
    float _2159 = fma(_2149, _2153, _2135);
    out.m_87.x = 0.0;
    float _2161 = fma(_2149, _2157, _2139);
    float _2163 = -_2143;
    float _2165 = _2163 + _2145;
    float _2167 = _2159 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    bool _2169 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2171 = fma(_2149, _2165, _2143);
    float _2173 = fma(_2161, 0.298911988735198974609375, _2167);
    float _2175 = _1931 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2177 = _1352 > 0.0;
    bool _2179 = isnan(_1352);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(0.0);
    bool _2185 = _2181 || _2183;
    float _2187 = fma(_2171, 0.114477999508380889892578125, _2173);
    out.m_89.x = 0.0;
    float _2189 = -_2187;
    float _2191 = _2161 + _2189;
    out.m_83.w = _2175;
    float _2193 = -_2187;
    float _2195 = _2159 + _2193;
    float _2197 = fma(_2195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2187);
    float _2199 = -_2187;
    float _2201 = _2171 + _2199;
    float _2203 = fma(_2191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2187);
    float _2205 = fma(_2201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2187);
    bool _2207 = !_2169;
    if (!_2207)
    {
        float _2209 = -_1282;
        float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2213 = -_1284;
        float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2217 = -_1286;
        float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2221 = _2211 * _2211;
        float _2223 = fma(_2215, _2215, _2221);
        float _2225 = fma(_2219, _2219, _2223);
        float _2227 = rsqrt(_2225);
        float _2229 = _2211 * _2227;
        float _2231 = _2215 * _2227;
        float _2233 = _2219 * _2227;
        float _2235 = sqrt(_2225);
        float _2237 = -_1460;
        float _2239 = _2237 + _2229;
        float _2241 = -_1456;
        float _2243 = _2241 + _2231;
        float _2245 = -_1458;
        float _2247 = _2245 + _2233;
        float _2249 = _2239 * _2239;
        float _2251 = fma(_2243, _2243, _2249);
        float _2253 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2255 = precise::clamp(_2253, 0.0, 1.0);
        float _2257 = fma(_2247, _2247, _2251);
        float _2259 = _2255 * _2255;
        float _2261 = -_2235;
        float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2265 = _2259 + (-1.0);
        float _2267 = rsqrt(_2257);
        float _2269 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2271 = precise::clamp(_2269, 0.0, 1.0);
        float _2273 = abs(_2271);
        float _2275 = log2(_2273);
        float _2277 = _2239 * _2267;
        float _2279 = _2243 * _2267;
        float _2281 = _2247 * _2267;
        float _2283 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2285 = _644 * _2277;
        float _2287 = _644 * _2229;
        float _2289 = fma(_642, _2279, _2285);
        float _2291 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2293 = fma(_642, _2231, _2287);
        float _2295 = fma(_648, _2281, _2289);
        float _2297 = precise::clamp(_2295, 0.0, 1.0);
        float _2299 = fma(_648, _2233, _2293);
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = exp2(_2291);
        float _2305 = _2297 * _2297;
        float _2307 = fma(_2305, _2265, 1.0);
        float _2309 = -_2229;
        float _2311 = -_2283;
        float _2313 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2311);
        float _2315 = _2307 * _2307;
        float _2317 = -_2233;
        float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2313);
        float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2323 = _2319 + _2321;
        float _2325 = 1.0 / _2315;
        float _2327 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2329 = precise::clamp(_2327, 0.0, 1.0);
        float _2331 = _2303 * _2329;
        float _2333 = _2301 * _2331;
        float _2335 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2337 = _2259 * _2325;
        float _2339 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2341 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2343 = _2333 * _2337;
        out.m_87.x = _2335;
        out.m_87.y = _2339;
        out.m_87.z = _2341;
        float _2345 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2347 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2349 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2345;
        out.m_89.y = _2347;
        out.m_89.z = _2349;
    }
    out.m_91.x = _2203;
    out.m_91.y = _2197;
    out.m_91.z = _2205;
    if (_2185)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2351 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2351;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

