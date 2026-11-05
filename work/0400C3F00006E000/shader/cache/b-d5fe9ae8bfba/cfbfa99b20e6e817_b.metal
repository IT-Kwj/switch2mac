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
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_34 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _266 = false;
    bool _264 = false;
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _485 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_485, float2(0.0), isnan(_485)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _502 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_36.x;
    float _70 = in.m_38.y;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _82 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].z, _80);
    float _84 = -_60;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = _66 * _82;
    float _98 = _68 * _82;
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = -_96;
    float _108 = fma(_88, _70, _106);
    float _110 = -_96;
    float _112 = fma(_94, _72, _110);
    float _114 = -_98;
    float _116 = fma(_88, _74, _114);
    float _118 = -_98;
    float _120 = fma(_94, _76, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_82;
    float _128 = _126 + _88;
    float _130 = -_82;
    float _132 = _130 + _94;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = -_104;
    bool _142 = _138 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _144 = fma(_128, _128, _134);
    float _146 = fma(_132, _132, _136);
    float _148 = -_104;
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _152 = !_142;
    uint _155 = uint(_152 ? 0 : 1);
    float _157 = rsqrt(_144);
    float _159 = rsqrt(_146);
    float _161 = _116 * _157;
    float _163 = _128 * _157;
    float _165 = _108 * _157;
    float _167 = _132 * _159;
    float _169 = _112 * _159;
    float _171 = _120 * _159;
    float _173 = _161 * _167;
    float _175 = _163 * _169;
    float _177 = -_173;
    float _179 = fma(_163, _171, _177);
    float _181 = -_175;
    float _183 = fma(_165, _167, _181);
    float _185 = _165 * _171;
    float _187 = _179 * _179;
    float _189 = -_185;
    float _191 = fma(_161, _169, _189);
    float _193 = fma(_183, _183, _187);
    uint _195 = 2u;
    if (!_142)
    {
        _195 = 1u;
    }
    uint _197 = _195;
    uint _199 = _197;
    if (!_150)
    {
        _199 = _155;
    }
    uint _201 = _199;
    float _203 = fma(_191, _191, _193);
    uint _205 = min(_201, 2u);
    float _207 = rsqrt(_203);
    float _209 = _179 * _207;
    float _211 = _183 * _207;
    float _213 = _191 * _207;
    int _216 = int(_205) << 2;
    float _218 = _209 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _220 = uint(int(uint(_216) >> uint(2)));
    uint _222 = uint(int(uint(int(_220)) >> uint(2)));
    int _224 = int(_220) & 3;
    float _226 = (*spvDescriptorSet0.fp_c1)._m0[int(_222)][_224];
    float _228 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[35].x, _218);
    float _230 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[35].z, _228);
    float _232 = abs(_230);
    float _234 = -_232;
    float _236 = _234 + 1.0;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = abs(_238);
    float _242 = log2(_240);
    float _244 = _242 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _246 = exp2(_244);
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _250 = _209 * _248;
    float _252 = _211 * _248;
    float _254 = fma(_213, _248, _104);
    float _256 = fma(_104, _66, _250);
    float _258 = fma(_104, _68, _252);
    bool _260 = as_type<int>(_226) == 1200;
    if (!_260)
    {
        bool _262 = as_type<int>(_226) == 1472;
        _264 = _262;
        if (!_264)
        {
            _266 = true;
        }
    }
    float _300;
    float _302;
    float _304;
    float _306;
    if (!_264)
    {
        if (!_266)
        {
            float _268 = _256 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _270 = _256 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _272 = _256 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _274 = _256 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _276 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].x, _268);
            float _278 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].x, _270);
            float _280 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].x, _272);
            float _282 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].x, _274);
            float _284 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, _276);
            float _286 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[1].z, _278);
            float _288 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[2].z, _280);
            float _290 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[3].z, _282);
            float _292 = _284 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _294 = _286 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _300 = _298;
            _302 = _292;
            _304 = _296;
            _306 = _294;
        }
    }
    if ((false || _266) || _264)
    {
        if ((!_266) || _264)
        {
            _264 = false;
            float _308 = _256 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _310 = _256 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _312 = _256 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _314 = _256 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _316 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[4].x, _308);
            float _318 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[5].x, _310);
            float _320 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[6].x, _312);
            float _322 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[7].x, _314);
            float _324 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[4].z, _316);
            float _326 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[5].z, _318);
            float _328 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[6].z, _320);
            float _330 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[7].z, _322);
            float _332 = _324 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _334 = _326 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _300 = _338;
            _302 = _332;
            _304 = _336;
            _306 = _334;
        }
        if (false || _266)
        {
            _266 = false;
            float _340 = _256 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _342 = _256 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _344 = _256 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _346 = _256 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _348 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[8].x, _340);
            float _350 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[9].x, _342);
            float _352 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[10].x, _344);
            float _354 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[11].x, _346);
            float _356 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[8].z, _348);
            float _358 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[9].z, _350);
            float _360 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[10].z, _352);
            float _362 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[11].z, _354);
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _300 = _370;
            _302 = _364;
            _304 = _368;
            _306 = _366;
        }
    }
    float _372 = _300;
    float _374 = _302;
    float _376 = _304;
    float _378 = _306;
    float _380 = float(int(_201));
    float _382 = 1.0 / _372;
    float _384 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _386 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _388 = rint(_380);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    uint _394 = clamp(_392, 0u, 65535u);
    float _396 = _382 * _374;
    float _398 = _382 * _376;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _382 * _378;
    float _404 = fma(_400, _384, _396);
    float _406 = -_384;
    float _408 = fma(_400, _406, _396);
    float _410 = fma(_400, _386, _402);
    float _412 = -_386;
    float _414 = fma(_400, _412, _402);
    float3 _1153 = float3(_396, _410, float(int(_394)));
    float3 _1157 = select(_1153, float3(0.0), isnan(_1153));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1157.xy, uint(rint(_1157.z)), _400);
    float3 _1166 = float3(_404, _410, float(int(_394)));
    float3 _1168 = select(_1166, float3(0.0), isnan(_1166));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1168.xy, uint(rint(_1168.z)), _400);
    float3 _1177 = float3(_408, _410, float(int(_394)));
    float3 _1179 = select(_1177, float3(0.0), isnan(_1177));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1179.xy, uint(rint(_1179.z)), _400);
    float3 _1188 = float3(_404, _402, float(int(_394)));
    float3 _1190 = select(_1188, float3(0.0), isnan(_1188));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1190.xy, uint(rint(_1190.z)), _400);
    float3 _1199 = float3(_396, _402, float(int(_394)));
    float3 _1201 = select(_1199, float3(0.0), isnan(_1199));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1201.xy, uint(rint(_1201.z)), _400);
    float3 _1210 = float3(_408, _402, float(int(_394)));
    float3 _1212 = select(_1210, float3(0.0), isnan(_1210));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1212.xy, uint(rint(_1212.z)), _400);
    float3 _1221 = float3(_404, _414, float(int(_394)));
    float3 _1223 = select(_1221, float3(0.0), isnan(_1221));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1223.xy, uint(rint(_1223.z)), _400);
    float3 _1232 = float3(_396, _414, float(int(_394)));
    float3 _1234 = select(_1232, float3(0.0), isnan(_1232));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1234.xy, uint(rint(_1234.z)), _400);
    float3 _1243 = float3(_408, _414, float(int(_394)));
    float3 _1245 = select(_1243, float3(0.0), isnan(_1243));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1245.xy, uint(rint(_1245.z)), _400);
    float _434 = -_104;
    float _436 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _438 = _434 + _436;
    float _440 = -_104;
    float _442 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _444 = _440 + _442;
    float _446 = _438 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = _444 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[48].w, _448);
    float _456 = _418 + _416;
    float _458 = _456 + _420;
    float _460 = _458 + _422;
    float _462 = _460 + _424;
    float _464 = _462 + _426;
    float _466 = _464 + _428;
    float _468 = _466 + _430;
    float _470 = _468 + _432;
    float _472 = fma(_470, 0.111111111938953399658203125, _452);
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _472;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _454;
    return out;
}

