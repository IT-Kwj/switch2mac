#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _29* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(0)]];
    float4 m_41 [[attribute(5)]];
    uint4 m_36 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _357 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>(in.m_36.y);
    float _59 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _61 = in.m_39.x;
    float _63 = in.m_39.y;
    float _65 = in.m_39.z;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    float _75 = _69 * _69;
    int _78 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _80 = _78 + as_type<int>(_55);
    int _82 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _84 = _82 + as_type<int>(_57);
    int _86 = _80 * 48;
    int _88 = _84 * 48;
    int _90 = _86 + 16;
    int _92 = _88 + 16;
    int _94 = _88 + 32;
    int _96 = _88 + 48;
    uint _99 = uint(int(uint(_90) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_99)];
    float _101 = as_type<float>(_dmw0.x);
    int _103 = _90 + 4;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    float _107 = as_type<float>(_dmw0.y);
    int _109 = _90 + 8;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    float _113 = as_type<float>(_dmw0.z);
    int _115 = _90 + 12;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    float _119 = as_type<float>(_dmw0.w);
    int _121 = _86 + 32;
    int _123 = _86 + 48;
    uint _125 = uint(int(uint(_92) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_125)];
    float _127 = as_type<float>(_dmw3.x);
    int _129 = _92 + 4;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw3.y);
    int _135 = _92 + 8;
    uint _137 = uint(int(uint(_135) >> uint(2)));
    float _139 = as_type<float>(_dmw3.z);
    int _141 = _92 + 12;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    float _145 = as_type<float>(_dmw3.w);
    uint _147 = uint(int(uint(_94) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_147)];
    float _149 = as_type<float>(_dmw4.x);
    int _151 = _94 + 4;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    float _155 = as_type<float>(_dmw4.y);
    int _157 = _94 + 8;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    float _161 = as_type<float>(_dmw4.z);
    int _163 = _94 + 12;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    float _167 = as_type<float>(_dmw4.w);
    uint _169 = uint(int(uint(_96) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_169)];
    float _171 = as_type<float>(_dmw5.x);
    int _173 = _96 + 4;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    float _177 = as_type<float>(_dmw5.y);
    int _179 = _96 + 8;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    float _183 = as_type<float>(_dmw5.z);
    int _185 = _96 + 12;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    float _189 = as_type<float>(_dmw5.w);
    uint _191 = uint(int(uint(_121) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_191)];
    float _193 = as_type<float>(_dmw1.x);
    int _195 = _121 + 4;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>(_dmw1.y);
    int _201 = _121 + 8;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>(_dmw1.z);
    int _207 = _121 + 12;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>(_dmw1.w);
    uint _213 = uint(int(uint(_123) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_213)];
    float _215 = as_type<float>(_dmw2.x);
    int _217 = _123 + 4;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    float _221 = as_type<float>(_dmw2.y);
    int _223 = _123 + 8;
    uint _225 = uint(int(uint(_223) >> uint(2)));
    float _227 = as_type<float>(_dmw2.z);
    int _229 = _123 + 12;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    float _233 = as_type<float>(_dmw2.w);
    float _235 = fma(_73, _73, _75);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _239 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _237;
    float _241 = fma(_239, _239, _235);
    float _243 = in.m_41.x;
    float _245 = in.m_41.y;
    float _247 = sqrt(_241);
    bool _251 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _253 = isnan(_247);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _259 = _255 || _257;
    float _261 = _107 * _63;
    float _263 = _133 * _63;
    float _265 = _155 * _63;
    float _267 = _177 * _63;
    float _269 = fma(_127, _61, _263);
    float _271 = fma(_149, _61, _265);
    float _273 = _199 * _63;
    float _275 = fma(_171, _61, _267);
    float _277 = _221 * _63;
    float _279 = fma(_101, _61, _261);
    float _281 = fma(_193, _61, _273);
    float _283 = fma(_139, _65, _269);
    float _285 = fma(_215, _61, _277);
    float _287 = fma(_161, _65, _271);
    float _289 = fma(_183, _65, _275);
    float _291 = fma(_113, _65, _279);
    float _293 = fma(_205, _65, _281);
    float _295 = fma(_227, _65, _285);
    float _297 = _145 + _283;
    float _299 = _167 + _287;
    float _301 = _189 + _289;
    float _303 = _119 + _291;
    float _305 = _211 + _293;
    float _307 = _233 + _295;
    float _309 = _297 * _245;
    float _311 = _299 * _245;
    float _313 = _301 * _245;
    float _315 = _193;
    if (!_259)
    {
        _315 = 1.0;
    }
    float _317 = _315;
    float _319 = fma(_303, _243, _309);
    float _321 = fma(_305, _243, _311);
    float _323 = fma(_307, _243, _313);
    bool _325 = !_259;
    float _327 = _317;
    if (!_325)
    {
        bool _329 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _331 = isnan(_247);
        bool _333 = _329 || _331;
        bool _335 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _337 = _333 || _335;
        if (!_337)
        {
            float _339 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _341 = _247 + _339;
            float _343 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _345 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _343;
            float _347 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _349 = _347 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _351 = 1.0 / _345;
            float _353 = _341 * _351;
            float _355 = fma(_353, _349, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _327 = _355;
            _357 = true;
        }
        else
        {
            bool _359 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _361 = isnan(_247);
            bool _363 = _359 || _361;
            bool _365 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _367 = _363 || _365;
            if (!_367)
            {
                float _369 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _371 = _247 + _369;
                float _373 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _375 = _373 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _377 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _379 = _377 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _381 = 1.0 / _375;
                float _383 = _371 * _381;
                float _385 = fma(_383, _379, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _327 = _385;
                _357 = true;
            }
            else
            {
                _327 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _357 = false;
    float _387 = _327;
    float _389 = _387 + (-1.0);
    float _391 = _389 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _393 = _389 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _395 = fma(_321, _387, _391);
    float _397 = _389 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _399 = fma(_319, _387, _393);
    float _401 = _395 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _403 = fma(_323, _387, _397);
    float _405 = _395 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _407 = _395 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[1].x, _401);
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[0].x, _405);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[2].x, _407);
    float _415 = fma(_403, (*spvDescriptorSet0.vp_c7)._m0[1].z, _409);
    float _417 = fma(_403, (*spvDescriptorSet0.vp_c7)._m0[0].z, _411);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c7)._m0[2].z, _413);
    float _421 = _415 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _423 = _417 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _425 = _419 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _427 = _421 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _429 = _421 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _431 = _421 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _433 = fma(_423, (*spvDescriptorSet0.vp_c4)._m0[1].x, _427);
    float _435 = fma(_423, (*spvDescriptorSet0.vp_c4)._m0[0].x, _429);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c4)._m0[2].x, _431);
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c4)._m0[1].z, _433);
    float _441 = fma(_425, (*spvDescriptorSet0.vp_c4)._m0[0].z, _435);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c4)._m0[2].z, _437);
    float _445 = _439 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _447 = _441 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _449 = _443 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _451 = _445 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _453 = _445 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _455 = _445 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _459 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[7].x, _451);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[8].x, _453);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[9].x, _455);
    float _465 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[10].x, _457);
    float _467 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[7].z, _459);
    float _469 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[8].z, _461);
    float _471 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[9].z, _463);
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[10].z, _465);
    float _475 = _467 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _477 = _469 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _479 = _471 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _481 = _473 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _475;
    out.gl_Position.y = _477;
    out.gl_Position.z = _479;
    out.gl_Position.w = _481;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _357 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>(in.m_36.y);
    float _59 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _61 = in.m_39.x;
    float _63 = in.m_39.y;
    float _65 = in.m_39.z;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    float _75 = _69 * _69;
    int _78 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _80 = _78 + as_type<int>(_55);
    int _82 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _84 = _82 + as_type<int>(_57);
    int _86 = _80 * 48;
    int _88 = _84 * 48;
    int _90 = _86 + 16;
    int _92 = _88 + 16;
    int _94 = _88 + 32;
    int _96 = _88 + 48;
    uint _99 = uint(int(uint(_90) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_99)];
    float _101 = as_type<float>(_dmw0.x);
    int _103 = _90 + 4;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    float _107 = as_type<float>(_dmw0.y);
    int _109 = _90 + 8;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    float _113 = as_type<float>(_dmw0.z);
    int _115 = _90 + 12;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    float _119 = as_type<float>(_dmw0.w);
    int _121 = _86 + 32;
    int _123 = _86 + 48;
    uint _125 = uint(int(uint(_92) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_125)];
    float _127 = as_type<float>(_dmw3.x);
    int _129 = _92 + 4;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw3.y);
    int _135 = _92 + 8;
    uint _137 = uint(int(uint(_135) >> uint(2)));
    float _139 = as_type<float>(_dmw3.z);
    int _141 = _92 + 12;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    float _145 = as_type<float>(_dmw3.w);
    uint _147 = uint(int(uint(_94) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_147)];
    float _149 = as_type<float>(_dmw4.x);
    int _151 = _94 + 4;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    float _155 = as_type<float>(_dmw4.y);
    int _157 = _94 + 8;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    float _161 = as_type<float>(_dmw4.z);
    int _163 = _94 + 12;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    float _167 = as_type<float>(_dmw4.w);
    uint _169 = uint(int(uint(_96) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_169)];
    float _171 = as_type<float>(_dmw5.x);
    int _173 = _96 + 4;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    float _177 = as_type<float>(_dmw5.y);
    int _179 = _96 + 8;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    float _183 = as_type<float>(_dmw5.z);
    int _185 = _96 + 12;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    float _189 = as_type<float>(_dmw5.w);
    uint _191 = uint(int(uint(_121) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_191)];
    float _193 = as_type<float>(_dmw1.x);
    int _195 = _121 + 4;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>(_dmw1.y);
    int _201 = _121 + 8;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>(_dmw1.z);
    int _207 = _121 + 12;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>(_dmw1.w);
    uint _213 = uint(int(uint(_123) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_213)];
    float _215 = as_type<float>(_dmw2.x);
    int _217 = _123 + 4;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    float _221 = as_type<float>(_dmw2.y);
    int _223 = _123 + 8;
    uint _225 = uint(int(uint(_223) >> uint(2)));
    float _227 = as_type<float>(_dmw2.z);
    int _229 = _123 + 12;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    float _233 = as_type<float>(_dmw2.w);
    float _235 = fma(_73, _73, _75);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _239 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _237;
    float _241 = fma(_239, _239, _235);
    float _243 = in.m_41.x;
    float _245 = in.m_41.y;
    float _247 = sqrt(_241);
    bool _251 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _253 = isnan(_247);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _259 = _255 || _257;
    float _261 = _107 * _63;
    float _263 = _133 * _63;
    float _265 = _155 * _63;
    float _267 = _177 * _63;
    float _269 = fma(_127, _61, _263);
    float _271 = fma(_149, _61, _265);
    float _273 = _199 * _63;
    float _275 = fma(_171, _61, _267);
    float _277 = _221 * _63;
    float _279 = fma(_101, _61, _261);
    float _281 = fma(_193, _61, _273);
    float _283 = fma(_139, _65, _269);
    float _285 = fma(_215, _61, _277);
    float _287 = fma(_161, _65, _271);
    float _289 = fma(_183, _65, _275);
    float _291 = fma(_113, _65, _279);
    float _293 = fma(_205, _65, _281);
    float _295 = fma(_227, _65, _285);
    float _297 = _145 + _283;
    float _299 = _167 + _287;
    float _301 = _189 + _289;
    float _303 = _119 + _291;
    float _305 = _211 + _293;
    float _307 = _233 + _295;
    float _309 = _297 * _245;
    float _311 = _299 * _245;
    float _313 = _301 * _245;
    float _315 = _193;
    if (!_259)
    {
        _315 = 1.0;
    }
    float _317 = _315;
    float _319 = fma(_303, _243, _309);
    float _321 = fma(_305, _243, _311);
    float _323 = fma(_307, _243, _313);
    bool _325 = !_259;
    float _327 = _317;
    if (!_325)
    {
        bool _329 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _331 = isnan(_247);
        bool _333 = _329 || _331;
        bool _335 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _337 = _333 || _335;
        if (!_337)
        {
            float _339 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _341 = _247 + _339;
            float _343 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _345 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _343;
            float _347 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _349 = _347 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _351 = 1.0 / _345;
            float _353 = _341 * _351;
            float _355 = fma(_353, _349, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _327 = _355;
            _357 = true;
        }
        else
        {
            bool _359 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _361 = isnan(_247);
            bool _363 = _359 || _361;
            bool _365 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _367 = _363 || _365;
            if (!_367)
            {
                float _369 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _371 = _247 + _369;
                float _373 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _375 = _373 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _377 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _379 = _377 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _381 = 1.0 / _375;
                float _383 = _371 * _381;
                float _385 = fma(_383, _379, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _327 = _385;
                _357 = true;
            }
            else
            {
                _327 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _357 = false;
    float _387 = _327;
    float _389 = _387 + (-1.0);
    float _391 = _389 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _393 = _389 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _395 = fma(_321, _387, _391);
    float _397 = _389 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _399 = fma(_319, _387, _393);
    float _401 = _395 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _403 = fma(_323, _387, _397);
    float _405 = _395 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _407 = _395 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[1].x, _401);
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[0].x, _405);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[2].x, _407);
    float _415 = fma(_403, (*spvDescriptorSet0.vp_c7)._m0[1].z, _409);
    float _417 = fma(_403, (*spvDescriptorSet0.vp_c7)._m0[0].z, _411);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c7)._m0[2].z, _413);
    float _421 = _415 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _423 = _417 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _425 = _419 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _427 = _421 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _429 = _421 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _431 = _421 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _433 = fma(_423, (*spvDescriptorSet0.vp_c4)._m0[1].x, _427);
    float _435 = fma(_423, (*spvDescriptorSet0.vp_c4)._m0[0].x, _429);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c4)._m0[2].x, _431);
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c4)._m0[1].z, _433);
    float _441 = fma(_425, (*spvDescriptorSet0.vp_c4)._m0[0].z, _435);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c4)._m0[2].z, _437);
    float _445 = _439 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _447 = _441 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _449 = _443 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _451 = _445 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _453 = _445 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _455 = _445 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _459 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[7].x, _451);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[8].x, _453);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[9].x, _455);
    float _465 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[10].x, _457);
    float _467 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[7].z, _459);
    float _469 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[8].z, _461);
    float _471 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[9].z, _463);
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[10].z, _465);
    float _475 = _467 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _477 = _469 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _479 = _471 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _481 = _473 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _475;
    out.gl_Position.y = _477;
    out.gl_Position.z = _479;
    out.gl_Position.w = _481;
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
    bool _357 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>(in.m_36.y);
    float _59 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _61 = in.m_39.x;
    float _63 = in.m_39.y;
    float _65 = in.m_39.z;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    float _75 = _69 * _69;
    int _78 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _80 = _78 + as_type<int>(_55);
    int _82 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _84 = _82 + as_type<int>(_57);
    int _86 = _80 * 48;
    int _88 = _84 * 48;
    int _90 = _86 + 16;
    int _92 = _88 + 16;
    int _94 = _88 + 32;
    int _96 = _88 + 48;
    uint _99 = uint(int(uint(_90) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_99)];
    float _101 = as_type<float>(_dmw0.x);
    int _103 = _90 + 4;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    float _107 = as_type<float>(_dmw0.y);
    int _109 = _90 + 8;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    float _113 = as_type<float>(_dmw0.z);
    int _115 = _90 + 12;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    float _119 = as_type<float>(_dmw0.w);
    int _121 = _86 + 32;
    int _123 = _86 + 48;
    uint _125 = uint(int(uint(_92) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_125)];
    float _127 = as_type<float>(_dmw3.x);
    int _129 = _92 + 4;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw3.y);
    int _135 = _92 + 8;
    uint _137 = uint(int(uint(_135) >> uint(2)));
    float _139 = as_type<float>(_dmw3.z);
    int _141 = _92 + 12;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    float _145 = as_type<float>(_dmw3.w);
    uint _147 = uint(int(uint(_94) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_147)];
    float _149 = as_type<float>(_dmw4.x);
    int _151 = _94 + 4;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    float _155 = as_type<float>(_dmw4.y);
    int _157 = _94 + 8;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    float _161 = as_type<float>(_dmw4.z);
    int _163 = _94 + 12;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    float _167 = as_type<float>(_dmw4.w);
    uint _169 = uint(int(uint(_96) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_169)];
    float _171 = as_type<float>(_dmw5.x);
    int _173 = _96 + 4;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    float _177 = as_type<float>(_dmw5.y);
    int _179 = _96 + 8;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    float _183 = as_type<float>(_dmw5.z);
    int _185 = _96 + 12;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    float _189 = as_type<float>(_dmw5.w);
    uint _191 = uint(int(uint(_121) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_191)];
    float _193 = as_type<float>(_dmw1.x);
    int _195 = _121 + 4;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>(_dmw1.y);
    int _201 = _121 + 8;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>(_dmw1.z);
    int _207 = _121 + 12;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>(_dmw1.w);
    uint _213 = uint(int(uint(_123) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_213)];
    float _215 = as_type<float>(_dmw2.x);
    int _217 = _123 + 4;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    float _221 = as_type<float>(_dmw2.y);
    int _223 = _123 + 8;
    uint _225 = uint(int(uint(_223) >> uint(2)));
    float _227 = as_type<float>(_dmw2.z);
    int _229 = _123 + 12;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    float _233 = as_type<float>(_dmw2.w);
    float _235 = fma(_73, _73, _75);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _239 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _237;
    float _241 = fma(_239, _239, _235);
    float _243 = in.m_41.x;
    float _245 = in.m_41.y;
    float _247 = sqrt(_241);
    bool _251 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _253 = isnan(_247);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _259 = _255 || _257;
    float _261 = _107 * _63;
    float _263 = _133 * _63;
    float _265 = _155 * _63;
    float _267 = _177 * _63;
    float _269 = fma(_127, _61, _263);
    float _271 = fma(_149, _61, _265);
    float _273 = _199 * _63;
    float _275 = fma(_171, _61, _267);
    float _277 = _221 * _63;
    float _279 = fma(_101, _61, _261);
    float _281 = fma(_193, _61, _273);
    float _283 = fma(_139, _65, _269);
    float _285 = fma(_215, _61, _277);
    float _287 = fma(_161, _65, _271);
    float _289 = fma(_183, _65, _275);
    float _291 = fma(_113, _65, _279);
    float _293 = fma(_205, _65, _281);
    float _295 = fma(_227, _65, _285);
    float _297 = _145 + _283;
    float _299 = _167 + _287;
    float _301 = _189 + _289;
    float _303 = _119 + _291;
    float _305 = _211 + _293;
    float _307 = _233 + _295;
    float _309 = _297 * _245;
    float _311 = _299 * _245;
    float _313 = _301 * _245;
    float _315 = _193;
    if (!_259)
    {
        _315 = 1.0;
    }
    float _317 = _315;
    float _319 = fma(_303, _243, _309);
    float _321 = fma(_305, _243, _311);
    float _323 = fma(_307, _243, _313);
    bool _325 = !_259;
    float _327 = _317;
    if (!_325)
    {
        bool _329 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _331 = isnan(_247);
        bool _333 = _329 || _331;
        bool _335 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _337 = _333 || _335;
        if (!_337)
        {
            float _339 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _341 = _247 + _339;
            float _343 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _345 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _343;
            float _347 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _349 = _347 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _351 = 1.0 / _345;
            float _353 = _341 * _351;
            float _355 = fma(_353, _349, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _327 = _355;
            _357 = true;
        }
        else
        {
            bool _359 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _361 = isnan(_247);
            bool _363 = _359 || _361;
            bool _365 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _367 = _363 || _365;
            if (!_367)
            {
                float _369 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _371 = _247 + _369;
                float _373 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _375 = _373 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _377 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _379 = _377 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _381 = 1.0 / _375;
                float _383 = _371 * _381;
                float _385 = fma(_383, _379, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _327 = _385;
                _357 = true;
            }
            else
            {
                _327 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _357 = false;
    float _387 = _327;
    float _389 = _387 + (-1.0);
    float _391 = _389 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _393 = _389 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _395 = fma(_321, _387, _391);
    float _397 = _389 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _399 = fma(_319, _387, _393);
    float _401 = _395 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _403 = fma(_323, _387, _397);
    float _405 = _395 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _407 = _395 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[1].x, _401);
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[0].x, _405);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[2].x, _407);
    float _415 = fma(_403, (*spvDescriptorSet0.vp_c7)._m0[1].z, _409);
    float _417 = fma(_403, (*spvDescriptorSet0.vp_c7)._m0[0].z, _411);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c7)._m0[2].z, _413);
    float _421 = _415 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _423 = _417 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _425 = _419 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _427 = _421 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _429 = _421 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _431 = _421 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _433 = fma(_423, (*spvDescriptorSet0.vp_c4)._m0[1].x, _427);
    float _435 = fma(_423, (*spvDescriptorSet0.vp_c4)._m0[0].x, _429);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c4)._m0[2].x, _431);
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c4)._m0[1].z, _433);
    float _441 = fma(_425, (*spvDescriptorSet0.vp_c4)._m0[0].z, _435);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c4)._m0[2].z, _437);
    float _445 = _439 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _447 = _441 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _449 = _443 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _451 = _445 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _453 = _445 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _455 = _445 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _459 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[7].x, _451);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[8].x, _453);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[9].x, _455);
    float _465 = fma(_447, (*spvDescriptorSet0.vp_c4)._m0[10].x, _457);
    float _467 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[7].z, _459);
    float _469 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[8].z, _461);
    float _471 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[9].z, _463);
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c4)._m0[10].z, _465);
    float _475 = _467 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _477 = _469 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _479 = _471 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _481 = _473 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _475;
    out.gl_Position.y = _477;
    out.gl_Position.z = _479;
    out.gl_Position.w = _481;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

