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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _120 = false;
    bool _118 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _408 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_408, float2(0.0), isnan(_408))).x;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = _62 * _56;
    float _74 = -_62;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _78 = -_62;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _82 = !_70;
    int _85 = _82 ? 0 : 1;
    int _87 = 2;
    if (!_70)
    {
        _87 = 1;
    }
    int _89 = _87;
    int _91 = _89;
    if (!_76)
    {
        _91 = _85;
    }
    int _93 = _91;
    int _95 = _93 + 1;
    uint _98 = uint(_95);
    if (!_80)
    {
        _98 = uint(_93);
    }
    uint _100 = _98;
    uint _102 = min(_100, 2u);
    int _104 = int(_102) << 2;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    bool _114 = as_type<int>(_112) == 384;
    if (!_114)
    {
        bool _116 = as_type<int>(_112) == 656;
        _118 = _116;
        if (!_118)
        {
            _120 = true;
        }
    }
    float _154;
    float _156;
    float _158;
    float _160;
    if (!_118)
    {
        if (!_120)
        {
            float _122 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _154 = _152;
            _156 = _146;
            _158 = _150;
            _160 = _148;
        }
    }
    if ((false || _120) || _118)
    {
        if ((!_120) || _118)
        {
            _118 = false;
            float _162 = _72 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _72 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _72 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _154 = _192;
            _156 = _186;
            _158 = _190;
            _160 = _188;
        }
        if (false || _120)
        {
            _120 = false;
            float _194 = _72 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _72 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _72 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _72 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _154 = _224;
            _156 = _218;
            _158 = _222;
            _160 = _220;
        }
    }
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _72 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _236 = float(int(_100));
    float _238 = 1.0 / _226;
    float _240 = _72 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _242 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _234);
    float _244 = _72 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _246 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _240);
    float _248 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _242);
    float _250 = rint(_236);
    float _252 = precise::max(_250, 0.0);
    uint _254 = uint(_252);
    uint _256 = clamp(_254, 0u, 65535u);
    float _258 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _246);
    float _260 = _248 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _262 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _244);
    float _264 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _266 = _258 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _268 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _262);
    float _270 = 1.0 / _260;
    float _272 = _238 * _228;
    float _274 = _238 * _230;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _268 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _280 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _282 = _238 * _232;
    float _284 = fma(_276, _280, _272);
    float _286 = -_280;
    float _288 = fma(_276, _286, _272);
    float _290 = fma(_276, _264, _282);
    float _292 = -_264;
    float _294 = fma(_276, _292, _282);
    float _296 = _266 * _270;
    float _298 = _278 * _270;
    float3 _923 = float3(_272, _290, float(int(_256)));
    float3 _927 = select(_923, float3(0.0), isnan(_923));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _927.xy, uint(rint(_927.z)), _276);
    float3 _936 = float3(_284, _290, float(int(_256)));
    float3 _938 = select(_936, float3(0.0), isnan(_936));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _938.xy, uint(rint(_938.z)), _276);
    float3 _947 = float3(_288, _290, float(int(_256)));
    float3 _949 = select(_947, float3(0.0), isnan(_947));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _949.xy, uint(rint(_949.z)), _276);
    float3 _958 = float3(_284, _282, float(int(_256)));
    float3 _960 = select(_958, float3(0.0), isnan(_958));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _960.xy, uint(rint(_960.z)), _276);
    float3 _969 = float3(_272, _282, float(int(_256)));
    float3 _971 = select(_969, float3(0.0), isnan(_969));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _971.xy, uint(rint(_971.z)), _276);
    float2 _977 = float2(_298, _296);
    float2 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_977, float2(0.0), isnan(_977))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_977, float2(0.0), isnan(_977))).xy;
    float _314 = _312.x;
    float _316 = _312.y;
    float3 _992 = float3(_288, _282, float(int(_256)));
    float3 _994 = select(_992, float3(0.0), isnan(_992));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _994.xy, uint(rint(_994.z)), _276);
    float3 _1003 = float3(_284, _294, float(int(_256)));
    float3 _1005 = select(_1003, float3(0.0), isnan(_1003));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1005.xy, uint(rint(_1005.z)), _276);
    float3 _1014 = float3(_272, _294, float(int(_256)));
    float3 _1016 = select(_1014, float3(0.0), isnan(_1014));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1016.xy, uint(rint(_1016.z)), _276);
    float3 _1025 = float3(_288, _294, float(int(_256)));
    float3 _1027 = select(_1025, float3(0.0), isnan(_1025));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1027.xy, uint(rint(_1027.z)), _276);
    float _326 = _72 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _328 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _326);
    float _330 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _328);
    float _332 = _330 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _334 = precise::min(_332, 1.0);
    float _336 = -_62;
    float _338 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _340 = _336 + _338;
    float _342 = -_62;
    float _344 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _346 = _342 + _344;
    float _348 = _340 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = _302 + _300;
    float _354 = _352 + _304;
    float _356 = -_314;
    float _358 = fma(_356, _314, _316);
    float _360 = -_314;
    float _362 = _334 + _360;
    float _364 = _354 + _306;
    float _366 = fma(_362, _362, _358);
    float _368 = _364 + _308;
    bool _370 = _362 <= 0.001000000047497451305389404296875;
    float _372 = float(_370);
    float _374 = _368 + _318;
    float _376 = 1.0 / _366;
    float _378 = _374 + _320;
    float _380 = _358 * _376;
    float _382 = _378 + _322;
    float _384 = _346 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    float _388 = precise::max(_380, _372);
    float _390 = _382 + _324;
    float _392 = precise::min(_388, 1.0);
    float _394 = fma(_390, 0.111111111938953399658203125, _350);
    float _396 = _392 + _386;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _394;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _396;
    return out;
}

