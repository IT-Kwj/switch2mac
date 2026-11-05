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
    bool _112 = false;
    bool _110 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _402 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_402, float2(0.0), isnan(_402))).x;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = _64 * _58;
    float _76 = -_64;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _80 = !_72;
    uint _83 = uint(_80 ? 0 : 1);
    uint _85 = 2u;
    if (!_72)
    {
        _85 = 1u;
    }
    uint _87 = _85;
    uint _89 = _87;
    if (!_78)
    {
        _89 = _83;
    }
    uint _91 = _89;
    uint _93 = min(_91, 2u);
    int _96 = int(_93) << 2;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    bool _106 = as_type<int>(_104) == 336;
    if (!_106)
    {
        bool _108 = as_type<int>(_104) == 608;
        _110 = _108;
        if (!_110)
        {
            _112 = true;
        }
    }
    float _146;
    float _148;
    float _150;
    float _152;
    if (!_110)
    {
        if (!_112)
        {
            float _114 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _116 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _118 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _120 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _122 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _114);
            float _124 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _116);
            float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _118);
            float _128 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _120);
            float _130 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _128);
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _146 = _144;
            _148 = _138;
            _150 = _142;
            _152 = _140;
        }
    }
    if ((false || _112) || _110)
    {
        if ((!_112) || _110)
        {
            _110 = false;
            float _154 = _74 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _156 = _74 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _158 = _74 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _160 = _74 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _162 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, _154);
            float _164 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].x, _156);
            float _166 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].x, _158);
            float _168 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
            float _170 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _168);
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _146 = _184;
            _148 = _178;
            _150 = _182;
            _152 = _180;
        }
        if (false || _112)
        {
            _112 = false;
            float _186 = _74 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _188 = _74 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _190 = _74 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _192 = _74 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _194 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].x, _186);
            float _196 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].x, _188);
            float _198 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].x, _190);
            float _200 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].x, _192);
            float _202 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _200);
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _146 = _216;
            _148 = _210;
            _150 = _214;
            _152 = _212;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _74 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _228 = float(int(_91));
    float _230 = 1.0 / _218;
    float _232 = _74 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _234 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _226);
    float _236 = _74 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _238 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _232);
    float _240 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _234);
    float _242 = rint(_228);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _238);
    float _252 = _240 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _254 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _236);
    float _256 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _258 = _250 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _260 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _254);
    float _262 = 1.0 / _252;
    float _264 = _230 * _220;
    float _266 = _230 * _222;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = _260 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _272 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _274 = _230 * _224;
    float _276 = fma(_268, _272, _264);
    float _278 = -_272;
    float _280 = fma(_268, _278, _264);
    float _282 = fma(_268, _256, _274);
    float _284 = -_256;
    float _286 = fma(_268, _284, _274);
    float _288 = _258 * _262;
    float _290 = _270 * _262;
    float3 _901 = float3(_264, _282, float(int(_248)));
    float3 _905 = select(_901, float3(0.0), isnan(_901));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _905.xy, uint(rint(_905.z)), _268);
    float3 _914 = float3(_276, _282, float(int(_248)));
    float3 _916 = select(_914, float3(0.0), isnan(_914));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _916.xy, uint(rint(_916.z)), _268);
    float3 _925 = float3(_280, _282, float(int(_248)));
    float3 _927 = select(_925, float3(0.0), isnan(_925));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _927.xy, uint(rint(_927.z)), _268);
    float3 _936 = float3(_276, _274, float(int(_248)));
    float3 _938 = select(_936, float3(0.0), isnan(_936));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _938.xy, uint(rint(_938.z)), _268);
    float3 _947 = float3(_264, _274, float(int(_248)));
    float3 _949 = select(_947, float3(0.0), isnan(_947));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _949.xy, uint(rint(_949.z)), _268);
    float3 _958 = float3(_280, _274, float(int(_248)));
    float3 _960 = select(_958, float3(0.0), isnan(_958));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _960.xy, uint(rint(_960.z)), _268);
    float2 _966 = float2(_290, _288);
    float2 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_966, float2(0.0), isnan(_966))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_966, float2(0.0), isnan(_966))).xy;
    float _308 = _306.x;
    float _310 = _306.y;
    float3 _981 = float3(_276, _286, float(int(_248)));
    float3 _983 = select(_981, float3(0.0), isnan(_981));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _983.xy, uint(rint(_983.z)), _268);
    float3 _992 = float3(_264, _286, float(int(_248)));
    float3 _994 = select(_992, float3(0.0), isnan(_992));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _994.xy, uint(rint(_994.z)), _268);
    float3 _1003 = float3(_280, _286, float(int(_248)));
    float3 _1005 = select(_1003, float3(0.0), isnan(_1003));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1005.xy, uint(rint(_1005.z)), _268);
    float2 _1011 = float2(_50, _52);
    float _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1011, float2(0.0), isnan(_1011))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1011, float2(0.0), isnan(_1011))).x;
    float _320 = _74 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _322 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _320);
    float _324 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _322);
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _328 = precise::min(_326, 1.0);
    float _330 = -_64;
    float _332 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _334 = _330 + _332;
    float _336 = -_64;
    float _338 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _340 = _336 + _338;
    float _342 = _334 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = _294 + _292;
    float _348 = _346 + _296;
    float _350 = _348 + _298;
    float _352 = _350 + _300;
    float _354 = -_308;
    float _356 = fma(_354, _308, _310);
    float _358 = -_308;
    float _360 = _328 + _358;
    float _362 = _352 + _302;
    float _364 = fma(_360, _360, _356);
    float _366 = _362 + _312;
    bool _368 = _360 <= 0.001000000047497451305389404296875;
    float _370 = float(_368);
    float _372 = 1.0 / _364;
    float _374 = _366 + _314;
    float _376 = _374 + _316;
    float _378 = fma(_376, 0.111111111938953399658203125, _344);
    float _380 = _356 * _372;
    float _382 = _340 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    float _386 = precise::max(_380, _370);
    float _388 = precise::min(_386, 1.0);
    float _390 = _388 + _384;
    out.m_43.x = _318;
    out.m_43.y = _378;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _390;
    return out;
}

