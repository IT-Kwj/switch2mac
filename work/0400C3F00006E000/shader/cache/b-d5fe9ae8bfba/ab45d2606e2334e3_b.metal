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
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_34 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _122 = false;
    bool _120 = false;
    float _46 = in.m_34.x;
    float _48 = in.m_34.y;
    float2 _377 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).x;
    float _52 = in.m_36.y;
    float _54 = -_50;
    float _56 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _58 = 1.0 / _56;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = _58 * _60;
    float _64 = _62 * _52;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = -_62;
    bool _74 = _72 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _76 = -_62;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _80 = !_70;
    int _83 = _80 ? 0 : 1;
    int _85 = 2;
    if (!_70)
    {
        _85 = 1;
    }
    int _87 = _85;
    int _89 = _87;
    if (!_74)
    {
        _89 = _83;
    }
    int _91 = _89;
    int _93 = _91 + 1;
    uint _96 = uint(_93);
    if (!_78)
    {
        _96 = uint(_91);
    }
    uint _98 = _96;
    float _100 = in.m_36.x;
    uint _102 = min(_98, 2u);
    int _104 = int(_102) << 2;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    float _114 = _62 * _100;
    bool _116 = as_type<int>(_112) == 416;
    if (!_116)
    {
        bool _118 = as_type<int>(_112) == 688;
        _120 = _118;
        if (!_120)
        {
            _122 = true;
        }
    }
    float _156;
    float _158;
    float _160;
    float _162;
    if (!_120)
    {
        if (!_122)
        {
            float _124 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _126 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _128 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _130 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
            float _134 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
            float _136 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
            float _138 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
            float _146 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _156 = _154;
            _158 = _152;
            _160 = _148;
            _162 = _150;
        }
    }
    if ((false || _122) || _120)
    {
        if ((!_122) || _120)
        {
            _120 = false;
            float _164 = _64 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _166 = _64 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _168 = _64 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _170 = _64 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[4].x, _164);
            float _174 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[5].x, _166);
            float _176 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[6].x, _168);
            float _178 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _176);
            float _186 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _192;
            _160 = _188;
            _162 = _190;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _64 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _198 = _64 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _200 = _64 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _202 = _64 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[8].x, _196);
            float _206 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
            float _208 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[10].x, _200);
            float _210 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _208);
            float _218 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _156 = _226;
            _158 = _224;
            _160 = _220;
            _162 = _222;
        }
    }
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = 1.0 / _228;
    float _238 = float(int(_98));
    float _240 = rint(_238);
    float _242 = precise::max(_240, 0.0);
    uint _244 = uint(_242);
    uint _246 = clamp(_244, 0u, 65535u);
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _250 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _252 = _236 * _230;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _236 * _232;
    float _258 = _236 * _234;
    float _260 = _254 * _248;
    float _262 = _254 * _250;
    float _264 = fma(_260, 0.5, _256);
    float _266 = fma(_262, 1.5, _258);
    float _268 = fma(_260, 1.5, _256);
    float _270 = fma(_260, -0.5, _256);
    float3 _832 = float3(_264, _266, float(int(_246)));
    float3 _836 = select(_832, float3(0.0), isnan(_832));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _836.xy, uint(rint(_836.z)), _254);
    float3 _845 = float3(_268, _266, float(int(_246)));
    float3 _847 = select(_845, float3(0.0), isnan(_845));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _847.xy, uint(rint(_847.z)), _254);
    float _276 = fma(_260, -1.5, _256);
    float3 _860 = float3(_270, _266, float(int(_246)));
    float3 _862 = select(_860, float3(0.0), isnan(_860));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _862.xy, uint(rint(_862.z)), _254);
    float _280 = fma(_262, 0.5, _258);
    float3 _874 = float3(_276, _266, float(int(_246)));
    float3 _876 = select(_874, float3(0.0), isnan(_874));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _876.xy, uint(rint(_876.z)), _254);
    float3 _885 = float3(_268, _280, float(int(_246)));
    float3 _887 = select(_885, float3(0.0), isnan(_885));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _887.xy, uint(rint(_887.z)), _254);
    float3 _896 = float3(_264, _280, float(int(_246)));
    float3 _898 = select(_896, float3(0.0), isnan(_896));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _898.xy, uint(rint(_898.z)), _254);
    float _288 = fma(_262, -0.5, _258);
    float3 _910 = float3(_270, _280, float(int(_246)));
    float3 _912 = select(_910, float3(0.0), isnan(_910));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _912.xy, uint(rint(_912.z)), _254);
    float3 _921 = float3(_276, _280, float(int(_246)));
    float3 _923 = select(_921, float3(0.0), isnan(_921));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _923.xy, uint(rint(_923.z)), _254);
    float3 _932 = float3(_268, _288, float(int(_246)));
    float3 _934 = select(_932, float3(0.0), isnan(_932));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _934.xy, uint(rint(_934.z)), _254);
    float3 _943 = float3(_264, _288, float(int(_246)));
    float3 _945 = select(_943, float3(0.0), isnan(_943));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _945.xy, uint(rint(_945.z)), _254);
    float3 _954 = float3(_270, _288, float(int(_246)));
    float3 _956 = select(_954, float3(0.0), isnan(_954));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _956.xy, uint(rint(_956.z)), _254);
    float _300 = fma(_262, -1.5, _258);
    float3 _968 = float3(_276, _288, float(int(_246)));
    float3 _970 = select(_968, float3(0.0), isnan(_968));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _970.xy, uint(rint(_970.z)), _254);
    float3 _979 = float3(_268, _300, float(int(_246)));
    float3 _981 = select(_979, float3(0.0), isnan(_979));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _981.xy, uint(rint(_981.z)), _254);
    float3 _990 = float3(_264, _300, float(int(_246)));
    float3 _992 = select(_990, float3(0.0), isnan(_990));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _992.xy, uint(rint(_992.z)), _254);
    float3 _1001 = float3(_270, _300, float(int(_246)));
    float3 _1003 = select(_1001, float3(0.0), isnan(_1001));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1003.xy, uint(rint(_1003.z)), _254);
    float3 _1012 = float3(_276, _300, float(int(_246)));
    float3 _1014 = select(_1012, float3(0.0), isnan(_1012));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1014.xy, uint(rint(_1014.z)), _254);
    float _312 = _274 + _272;
    float _314 = _312 + _278;
    float _316 = -_62;
    float _318 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _320 = _316 + _318;
    float _322 = _314 + _282;
    float _324 = -_62;
    float _326 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _328 = _324 + _326;
    float _330 = _320 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _322 + _284;
    float _336 = _328 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _334 + _286;
    float _342 = _338 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _344 = _340 + _290;
    float _346 = _344 + _292;
    float _348 = _346 + _294;
    float _350 = _348 + _296;
    float _352 = _350 + _298;
    float _354 = _352 + _302;
    float _356 = _354 + _304;
    float _358 = _356 + _306;
    float _360 = _358 + _308;
    float _362 = _360 + _310;
    float _364 = fma(_362, 0.0625, _332);
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _364;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _342;
    return out;
}

