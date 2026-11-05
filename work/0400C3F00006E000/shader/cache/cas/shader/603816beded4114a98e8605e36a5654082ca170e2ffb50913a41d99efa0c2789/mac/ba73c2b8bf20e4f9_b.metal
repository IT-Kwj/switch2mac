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

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _128 = false;
    bool _126 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _472 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_472, float2(0.0), isnan(_472))).x;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _58;
    float _74 = -_70;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = _70 * _60;
    float _82 = -_70;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _86 = -_70;
    bool _88 = _86 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _90 = !_78;
    int _93 = _90 ? 0 : 1;
    int _95 = 2;
    if (!_78)
    {
        _95 = 1;
    }
    int _97 = _95;
    int _99 = _97;
    if (!_84)
    {
        _99 = _93;
    }
    int _101 = _99;
    int _103 = _101 + 1;
    uint _106 = uint(_103);
    if (!_88)
    {
        _106 = uint(_101);
    }
    uint _108 = _106;
    uint _110 = min(_108, 2u);
    int _112 = int(_110) << 2;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    uint _116 = uint(int(uint(int(_114)) >> uint(2)));
    int _118 = int(_114) & 3;
    float _120 = (*spvDescriptorSet0.fp_c1)._m0[int(_116)][_118];
    bool _122 = as_type<int>(_120) == 416;
    if (!_122)
    {
        bool _124 = as_type<int>(_120) == 688;
        _126 = _124;
        if (!_126)
        {
            _128 = true;
        }
    }
    float _162;
    float _164;
    float _166;
    float _168;
    if (!_126)
    {
        if (!_128)
        {
            float _130 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _132 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _134 = _80 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _136 = _80 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _138 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _130);
            float _140 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _132);
            float _142 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _134);
            float _144 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _136);
            float _146 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _138);
            float _148 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _140);
            float _150 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _142);
            float _152 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _144);
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _162 = _160;
            _164 = _158;
            _166 = _154;
            _168 = _156;
        }
    }
    if ((false || _128) || _126)
    {
        if ((!_128) || _126)
        {
            _126 = false;
            float _170 = _80 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _172 = _80 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _174 = _80 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _176 = _80 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _178 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, _170);
            float _180 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].x, _172);
            float _182 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].x, _174);
            float _184 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].x, _176);
            float _186 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _178);
            float _188 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _180);
            float _190 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _182);
            float _192 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _184);
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _162 = _200;
            _164 = _198;
            _166 = _194;
            _168 = _196;
        }
        if (false || _128)
        {
            _128 = false;
            float _202 = _80 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _204 = _80 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _206 = _80 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _208 = _80 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _210 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].x, _202);
            float _212 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].x, _204);
            float _214 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].x, _206);
            float _216 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].x, _208);
            float _218 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _210);
            float _220 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _212);
            float _222 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _214);
            float _224 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _216);
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _162 = _232;
            _164 = _230;
            _166 = _226;
            _168 = _228;
        }
    }
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float _242 = 1.0 / _234;
    float _244 = float(int(_108));
    float _246 = rint(_244);
    float _248 = precise::max(_246, 0.0);
    uint _250 = uint(_248);
    uint _252 = clamp(_250, 0u, 65535u);
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _256 = _242 * _236;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _242 * _238;
    float _262 = _242 * _240;
    float _264 = _258 * _254;
    float _266 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _268 = fma(_264, 0.5, _260);
    float _270 = _258 * _266;
    float _272 = fma(_264, 1.5, _260);
    float _274 = fma(_264, -0.5, _260);
    float _276 = fma(_264, -1.5, _260);
    float _278 = fma(_270, 1.5, _262);
    float _280 = fma(_270, 0.5, _262);
    float3 _934 = float3(_268, _278, float(int(_252)));
    float3 _938 = select(_934, float3(0.0), isnan(_934));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _938.xy, uint(rint(_938.z)), _258);
    float3 _947 = float3(_274, _278, float(int(_252)));
    float3 _949 = select(_947, float3(0.0), isnan(_947));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _949.xy, uint(rint(_949.z)), _258);
    float3 _958 = float3(_276, _278, float(int(_252)));
    float3 _960 = select(_958, float3(0.0), isnan(_958));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _960.xy, uint(rint(_960.z)), _258);
    float3 _969 = float3(_272, _278, float(int(_252)));
    float3 _971 = select(_969, float3(0.0), isnan(_969));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _971.xy, uint(rint(_971.z)), _258);
    float3 _980 = float3(_272, _280, float(int(_252)));
    float3 _982 = select(_980, float3(0.0), isnan(_980));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _982.xy, uint(rint(_982.z)), _258);
    float3 _991 = float3(_268, _280, float(int(_252)));
    float3 _993 = select(_991, float3(0.0), isnan(_991));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _993.xy, uint(rint(_993.z)), _258);
    float3 _1002 = float3(_274, _280, float(int(_252)));
    float3 _1004 = select(_1002, float3(0.0), isnan(_1002));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1004.xy, uint(rint(_1004.z)), _258);
    float3 _1013 = float3(_276, _280, float(int(_252)));
    float3 _1015 = select(_1013, float3(0.0), isnan(_1013));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1015.xy, uint(rint(_1015.z)), _258);
    float2 _1021 = float2(_52, _54);
    float2 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1021, float2(0.0), isnan(_1021))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1021, float2(0.0), isnan(_1021))).xy;
    float _302 = _300.x;
    float _304 = _300.y;
    float _306 = fma(_270, -1.5, _262);
    float _308 = _288 + _282;
    float _310 = _308 + _284;
    float _312 = _310 + _286;
    float _314 = _312 + _290;
    float _316 = fma(_270, -0.5, _262);
    float _318 = _314 + _292;
    float3 _1057 = float3(_272, _316, float(int(_252)));
    float3 _1059 = select(_1057, float3(0.0), isnan(_1057));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1059.xy, uint(rint(_1059.z)), _258);
    float3 _1068 = float3(_268, _316, float(int(_252)));
    float3 _1070 = select(_1068, float3(0.0), isnan(_1068));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1070.xy, uint(rint(_1070.z)), _258);
    float3 _1079 = float3(_274, _316, float(int(_252)));
    float3 _1081 = select(_1079, float3(0.0), isnan(_1079));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1081.xy, uint(rint(_1081.z)), _258);
    float3 _1090 = float3(_276, _316, float(int(_252)));
    float3 _1092 = select(_1090, float3(0.0), isnan(_1090));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1092.xy, uint(rint(_1092.z)), _258);
    float _328 = _80 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _330 = _80 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _332 = _318 + _294;
    float _334 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].x, _328);
    float _336 = _80 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _338 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].z, _334);
    float _340 = _338 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _342 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].x, _336);
    float _344 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].x, _330);
    float _346 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].z, _342);
    float _348 = 1.0 / _340;
    float _350 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].z, _344);
    float _352 = _346 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _354 = _350 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _356 = fma(_302, 2.0, -1.0);
    float _358 = fma(_304, 2.0, -1.0);
    float _360 = _352 * _348;
    float _362 = _354 * _348;
    float _364 = _332 + _296;
    float _366 = _356 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _368 = _358 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float2 _1184 = float2(_360, _362);
    float2 _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1184, float2(0.0), isnan(_1184))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1184, float2(0.0), isnan(_1184))).xy;
    float _372 = _370.x;
    float _374 = _370.y;
    float _376 = fma(_366, 2.0, _52);
    float _378 = fma(_368, 2.0, _54);
    float3 _1205 = float3(_272, _306, float(int(_252)));
    float3 _1207 = select(_1205, float3(0.0), isnan(_1205));
    float _380 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1207.xy, uint(rint(_1207.z)), _258);
    float3 _1216 = float3(_268, _306, float(int(_252)));
    float3 _1218 = select(_1216, float3(0.0), isnan(_1216));
    float _382 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1218.xy, uint(rint(_1218.z)), _258);
    float3 _1227 = float3(_274, _306, float(int(_252)));
    float3 _1229 = select(_1227, float3(0.0), isnan(_1227));
    float _384 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1229.xy, uint(rint(_1229.z)), _258);
    float3 _1238 = float3(_276, _306, float(int(_252)));
    float3 _1240 = select(_1238, float3(0.0), isnan(_1238));
    float _386 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1240.xy, uint(rint(_1240.z)), _258);
    float2 _1246 = float2(_376, _378);
    float _388 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1246, float2(0.0), isnan(_1246))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1246, float2(0.0), isnan(_1246))).x;
    float _390 = _80 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _392 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].x, _390);
    float _394 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].z, _392);
    float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _398 = precise::min(_396, 1.0);
    float _400 = -_70;
    float _402 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _404 = _400 + _402;
    float _406 = _404 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = _364 + _320;
    float _412 = _410 + _322;
    float _414 = _412 + _324;
    float _416 = _414 + _326;
    float _418 = -_372;
    float _420 = fma(_418, _372, _374);
    float _422 = -_372;
    float _424 = _398 + _422;
    float _426 = fma(_424, _424, _420);
    bool _428 = _424 <= 0.001000000047497451305389404296875;
    float _430 = float(_428);
    float _432 = _416 + _380;
    float _434 = 1.0 / _426;
    float _436 = _432 + _382;
    float _438 = _436 + _384;
    float _440 = -_70;
    float _442 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _444 = _440 + _442;
    float _446 = _420 * _434;
    float _448 = _438 + _386;
    float _450 = _444 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = precise::max(_446, _430);
    float _456 = fma(_448, 0.0625, _408);
    float _458 = precise::min(_454, 1.0);
    float _460 = _458 + _452;
    out.m_45.x = _388;
    out.m_45.y = _456;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _460;
    return out;
}

