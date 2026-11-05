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
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _126 = false;
    bool _124 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _452 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_452, float2(0.0), isnan(_452))).x;
    float _56 = in.m_40.x;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _56;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_66;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _80 = -_66;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _84 = !_74;
    int _87 = _84 ? 0 : 1;
    int _89 = 2;
    if (!_74)
    {
        _89 = 1;
    }
    int _91 = _89;
    int _93 = _91;
    if (!_78)
    {
        _93 = _87;
    }
    int _95 = _93;
    int _97 = _95 + 1;
    uint _100 = uint(_97);
    if (!_82)
    {
        _100 = uint(_95);
    }
    uint _102 = _100;
    uint _104 = min(_102, 2u);
    int _106 = int(_104) << 2;
    float _108 = in.m_40.y;
    uint _110 = uint(int(uint(_106) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    float _118 = _66 * _108;
    bool _120 = as_type<int>(_116) == 416;
    if (!_120)
    {
        bool _122 = as_type<int>(_116) == 688;
        _124 = _122;
        if (!_124)
        {
            _126 = true;
        }
    }
    float _160;
    float _162;
    float _164;
    float _166;
    if (!_124)
    {
        if (!_126)
        {
            float _128 = _118 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _118 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _118 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _118 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _156;
            _164 = _152;
            _166 = _154;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _118 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _118 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _118 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _118 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _196;
            _164 = _192;
            _166 = _194;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _118 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _118 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _118 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _118 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _228;
            _164 = _224;
            _166 = _226;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = 1.0 / _232;
    float _242 = float(int(_102));
    float _244 = rint(_242);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    uint _250 = clamp(_248, 0u, 65535u);
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _256 = _240 * _234;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _240 * _236;
    float _262 = _240 * _238;
    float _264 = _258 * _252;
    float _266 = _258 * _254;
    float _268 = fma(_264, 0.5, _260);
    float _270 = fma(_266, 0.5, _262);
    float _272 = fma(_266, 1.5, _262);
    float _274 = fma(_264, -0.5, _260);
    float _276 = fma(_264, 1.5, _260);
    float3 _910 = float3(_268, _272, float(int(_250)));
    float3 _914 = select(_910, float3(0.0), isnan(_910));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _914.xy, uint(rint(_914.z)), _258);
    float3 _923 = float3(_274, _272, float(int(_250)));
    float3 _925 = select(_923, float3(0.0), isnan(_923));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _925.xy, uint(rint(_925.z)), _258);
    float3 _934 = float3(_276, _270, float(int(_250)));
    float3 _936 = select(_934, float3(0.0), isnan(_934));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _936.xy, uint(rint(_936.z)), _258);
    float3 _945 = float3(_268, _270, float(int(_250)));
    float3 _947 = select(_945, float3(0.0), isnan(_945));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _947.xy, uint(rint(_947.z)), _258);
    float3 _956 = float3(_274, _270, float(int(_250)));
    float3 _958 = select(_956, float3(0.0), isnan(_956));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _958.xy, uint(rint(_958.z)), _258);
    float _288 = fma(_264, -1.5, _260);
    float _290 = fma(_266, -0.5, _262);
    float3 _974 = float3(_288, _270, float(int(_250)));
    float3 _976 = select(_974, float3(0.0), isnan(_974));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _976.xy, uint(rint(_976.z)), _258);
    float3 _985 = float3(_268, _290, float(int(_250)));
    float3 _987 = select(_985, float3(0.0), isnan(_985));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _987.xy, uint(rint(_987.z)), _258);
    float3 _996 = float3(_288, _272, float(int(_250)));
    float3 _998 = select(_996, float3(0.0), isnan(_996));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _998.xy, uint(rint(_998.z)), _258);
    float3 _1007 = float3(_276, _272, float(int(_250)));
    float3 _1009 = select(_1007, float3(0.0), isnan(_1007));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1009.xy, uint(rint(_1009.z)), _258);
    float3 _1018 = float3(_276, _290, float(int(_250)));
    float3 _1020 = select(_1018, float3(0.0), isnan(_1018));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1020.xy, uint(rint(_1020.z)), _258);
    float3 _1029 = float3(_274, _290, float(int(_250)));
    float3 _1031 = select(_1029, float3(0.0), isnan(_1029));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1031.xy, uint(rint(_1031.z)), _258);
    float3 _1040 = float3(_288, _290, float(int(_250)));
    float3 _1042 = select(_1040, float3(0.0), isnan(_1040));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1042.xy, uint(rint(_1042.z)), _258);
    float _306 = fma(_266, -1.5, _262);
    float _308 = _118 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _310 = _118 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _312 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _308);
    float _314 = _118 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _316 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _310);
    float _318 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _312);
    float _320 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _314);
    float _322 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _316);
    float _324 = _318 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _326 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _320);
    float _328 = _322 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _330 = 1.0 / _324;
    float _332 = _326 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _334 = _332 * _330;
    float _336 = _328 * _330;
    float2 _1116 = float2(_334, _336);
    float2 _340 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1116, float2(0.0), isnan(_1116))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1116, float2(0.0), isnan(_1116))).xy;
    float _342 = _340.x;
    float _344 = _340.y;
    float3 _1131 = float3(_276, _306, float(int(_250)));
    float3 _1133 = select(_1131, float3(0.0), isnan(_1131));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1133.xy, uint(rint(_1133.z)), _258);
    float3 _1142 = float3(_268, _306, float(int(_250)));
    float3 _1144 = select(_1142, float3(0.0), isnan(_1142));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1144.xy, uint(rint(_1144.z)), _258);
    float3 _1153 = float3(_274, _306, float(int(_250)));
    float3 _1155 = select(_1153, float3(0.0), isnan(_1153));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1155.xy, uint(rint(_1155.z)), _258);
    float3 _1164 = float3(_288, _306, float(int(_250)));
    float3 _1166 = select(_1164, float3(0.0), isnan(_1164));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1166.xy, uint(rint(_1166.z)), _258);
    float2 _1172 = float2(_50, _52);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1172, float2(0.0), isnan(_1172))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1172, float2(0.0), isnan(_1172))).x;
    float _356 = _118 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _358 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _356);
    float _360 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _358);
    float _362 = _360 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _364 = precise::min(_362, 1.0);
    float _366 = _298 + _278;
    float _368 = _366 + _280;
    float _370 = _368 + _296;
    float _372 = _370 + _282;
    float _374 = _372 + _284;
    float _376 = _374 + _286;
    float _378 = _376 + _292;
    float _380 = _378 + _300;
    float _382 = _380 + _294;
    float _384 = _382 + _302;
    float _386 = _384 + _304;
    float _388 = -_342;
    float _390 = fma(_388, _342, _344);
    float _392 = -_342;
    float _394 = _364 + _392;
    float _396 = _386 + _346;
    float _398 = fma(_394, _394, _390);
    float _400 = _396 + _348;
    bool _402 = _394 <= 0.001000000047497451305389404296875;
    float _404 = float(_402);
    float _406 = 1.0 / _398;
    float _408 = _400 + _350;
    float _410 = -_66;
    float _412 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _414 = _410 + _412;
    float _416 = _408 + _352;
    float _418 = _414 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _390 * _406;
    float _424 = -_66;
    float _426 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _428 = _424 + _426;
    float _430 = precise::max(_422, _404);
    float _432 = _428 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = precise::min(_430, 1.0);
    float _438 = fma(_416, 0.0625, _434);
    float _440 = _436 + _420;
    out.m_43.x = _354;
    out.m_43.y = _438;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _440;
    return out;
}

